//
//  ViewController.swift
//  AppIcon
//
//  Created by Jan Timar on 20/10/2018.
//  Copyright © 2018 Jan Timar. All rights reserved.
//

import UIKit

enum AppIconType {
	case image(image: UIImage)
	case text(string: String)
}

final class ViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backgroundView: UIView!
	@IBOutlet weak var iconTextLabel: UILabel!
	
	// MARK: Setup icon and background
	let appIconColor: UIColor = .white
	let appIconGradientColors: [UIColor] = [.red, UIColor.red.withAlphaComponent(0.5)]
	let appIconFont: UIFont = .systemFont(ofSize: 250)

	// For text app icon
//	let appIconType: AppIconType = .text(string: "Ai")
	// For image app icon
	let appIconType: AppIconType = .image(image: #imageLiteral(resourceName: "testAppIcon"))

	let backgroundIconGradientColors: [UIColor] = [.blue, UIColor.blue.withAlphaComponent(0.5)]

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
		setupAppIcon()
		setupBackground()
    }
	
	private func setupAppIcon() {
		iconTextLabel.text = nil
		imageView.image = nil
		
		switch appIconType {
		case .image(let image):
			imageView.tintColor = appIconColor
			imageView.image = image
		case .text(let string):
			iconTextLabel.textColor = appIconColor
			iconTextLabel.font = appIconFont
			iconTextLabel.text = string
		}

		if appIconGradientColors.count == 1, let appIconColor = appIconGradientColors.first {
			contentView.backgroundColor = appIconColor
		} else {
			let gradientLayer = setupGradient(bounds: contentView.bounds, colors: appIconGradientColors)
			contentView.layer.insertSublayer(gradientLayer, at: 0)
		}

		// Save app icon image
		saveImage(from: contentView, name: "appIcon")
	}
	
	private func setupBackground() {
		let gradientLayer = setupGradient(bounds: backgroundView.bounds, colors: backgroundIconGradientColors)
		backgroundView.layer.insertSublayer(gradientLayer, at: 0)

		// Save background image
		saveImage(from: backgroundView, name: "bacground")
	}
	
	private func setupGradient(bounds: CGRect, colors: [UIColor]) -> CAGradientLayer {
		let gradientLayer = CAGradientLayer()
		gradientLayer.frame = bounds // backgroundView.bounds
		gradientLayer.colors = colors.map { $0.cgColor }
		gradientLayer.endPoint = CGPoint(x: 1, y: 1)
		return gradientLayer
	}

	// MARK: - Helpers
	
	private func saveImage(from view: UIView, name: String) {
        let size = view.bounds.size
        UIGraphicsBeginImageContext(size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
		
		guard let data = image?.pngData() else { return }
		let filename = getDocumentsDirectory().appendingPathComponent("\(name).png")
		try? data.write(to: filename)
		print("\(name): \(filename)")
	}

    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

private extension UIColor {
	convenience init(hex: String) {
        // Trim leading '#' if needed
        var cleanedHexString = hex

        if hex.hasPrefix("#") {
            cleanedHexString = String(hex.dropFirst())
        }

        // String -> UInt32
        var rgbValue: UInt32 = 0
        Scanner(string: cleanedHexString).scanHexInt32(&rgbValue)

        // UInt32 -> R,G,B
        let red = CGFloat((rgbValue >> 16) & 0xff) / 255.0
        let green = CGFloat((rgbValue >> 08) & 0xff) / 255.0
        let blue = CGFloat((rgbValue >> 00) & 0xff) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
