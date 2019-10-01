#!/bin/sh
base=$1
convert "$base" -resize '167x167'   -unsharp 1x4 "Icon-iPad-83.5@2x.png"
convert "$base" -resize '29x29'     -unsharp 1x4 "Icon-29-29@1x.png"
convert "$base" -resize '58x58'     -unsharp 1x4 "Icon-58-29@2x.png"
convert "$base" -resize '58x58'     -unsharp 1x4 "Icon-58-29@2x.png"
convert "$base" -resize '87x87'     -unsharp 1x4 "Icon-87-29@3x.png"
convert "$base" -resize '40x40'     -unsharp 1x4 "Icon-40-40@1x.png"
convert "$base" -resize '80x80'     -unsharp 1x4 "Icon-80-40@2x.png"
convert "$base" -resize '120x120'   -unsharp 1x4 "Icon-120-40@3x.png"
convert "$base" -resize '120x120'   -unsharp 1x4 "Icon-120-60@2x.png"
convert "$base" -resize '180x180'   -unsharp 1x4 "Icon-180-60@3x.png"
convert "$base" -resize '20x20'     -unsharp 1x4 "Icon-20-20@1x.png"
convert "$base" -resize '40x40'     -unsharp 1x4 "Icon-40-20@2x.png"
convert "$base" -resize '60x60'     -unsharp 1x4 "Icon-60-20@3x.png"
convert "$base" -resize '76x76'     -unsharp 1x4 "Icon-76-76@1x.png"
convert "$base" -resize '152x152'   -unsharp 1x4 "Icon-152-76@2x.png"

convert "$base" -resize '1024x1024' -unsharp 1x4 "Icon-1024.png"
