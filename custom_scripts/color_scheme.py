# Uses pywal to get a custom color scheme from wallpaper

import pywal
import argparse


def main():
    parser = argparse.ArgumentParser(
        description='Generate color scheme from image using pywal')
    parser.add_argument('path', type=str, help='The path to the image file')

    args = parser.parse_args()
    image = pywal.image.get(args.path)
    colors = pywal.colors.get(image)

    for key in colors['colors']:
        hex_code = colors['colors'][key]
        print(hex_code)


if __name__ == "__main__":
    main()
