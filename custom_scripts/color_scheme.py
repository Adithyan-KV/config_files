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

    # parse the output and print out colors
    for key in colors['colors']:
        hex_code = colors['colors'][key]
        print_to_terminal(hex_code)


def print_to_terminal(hex_code):
    reset = '\033[0m'
    hex_value = hex_code.strip('#')
    r, g, b = tuple(int(hex_value[i:i+2], 16) for i in (0, 2, 4))
    escape = get_color_escape(r, g, b, background=False)
    print(f'{escape}{hex_code}███{reset}')


def get_color_escape(r, g, b, background=False):
    return '\033[{};2;{};{};{}m'.format(48 if background else 38, r, g, b)


if __name__ == "__main__":
    main()
