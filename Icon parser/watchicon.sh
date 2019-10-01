#!/bin/sh
base=$1
convert "$base" -resize '48x48'     -unsharp 1x4 "Icon-48-24@2x.png"
convert "$base" -resize '55x55'     -unsharp 1x4 "Icon-55-27.5@2x.png"
convert "$base" -resize '58x58'     -unsharp 1x4 "Icon-58-29@2x.png"
convert "$base" -resize '87x87'     -unsharp 1x4 "Icon-87-29@3x.png"
convert "$base" -resize '80x80'     -unsharp 1x4 "Icon-80-40@2x.png"
convert "$base" -resize '88x88'     -unsharp 1x4 "Icon-88-44@2x.png"
convert "$base" -resize '100x100'   -unsharp 1x4 "Icon-100-50@2x.png"
convert "$base" -resize '172x172'   -unsharp 1x4 "Icon-172-86@2x.png"
convert "$base" -resize '196x196'   -unsharp 1x4 "Icon-196-98@2x.png"
convert "$base" -resize '216x216'   -unsharp 1x4 "Icon-216-108@2x.png"

convert "$base" -resize '1024x1024' -unsharp 1x4 "Icon-1024.png"
