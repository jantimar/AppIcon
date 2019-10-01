# AppIcon
Small helper project for generate AppIcon and gradient background image, Sketch or Photoshop is better for this, but I am iOS developer 😎 and this is for me more faster and customizable
![Result](https://github.com/jantimar/AppIcon/blob/master/ReadmeAssets/screenshot.png?raw=true)

## Getting Started
Set your app icon in `Assets.xcassets` , modify your colors and ... just run project locally. Your Icons directroy will be print in console in few seconds. f.e.
```
appIcon: file:///Users/.../Library/Developer/CoreSimulator/Devices/315D0E22-B2D6-4043-8BC4-482617277E17/data/Containers/Data/Application/BB6B1730-4B60-416A-8E0A-C28D26BFD7F4/Documents/appIcon.png
bacground: file:///Users/.../Library/Developer/CoreSimulator/Devices/315D0E22-B2D6-4043-8BC4-482617277E17/data/Containers/Data/Application/BB6B1730-4B60-416A-8E0A-C28D26BFD7F4/Documents/bacground.png
```

### App icon
Icon color
```
appIconColor: UIColor = .white
``` 
Icon background color, for set solid color just use array with one color
```
let appIconGradientColors: [UIColor] = [.red, UIColor.red.withAlphaComponent(0.5)]
```
![App icon](https://github.com/jantimar/AppIcon/blob/master/ReadmeAssets/appIcon.png?raw=true)

### Gradient backround
It can be usefull for Launchscreen
```
let backgroundIconGradientColors: [UIColor] = [.blue, UIColor.blue.withAlphaComponent(0.5)]
```
![Backroung](https://github.com/jantimar/AppIcon/blob/master/ReadmeAssets/bacground.png?raw=true)

### Hints
1) Use PDF (vector) icons
2) When you have your Icon, you can use `appicon.sh` or `watchicon.sh` for all your assets 
3) For hex colors you can use f.e. `UIColor(hex: "00FF00")`
