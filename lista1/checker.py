import sys


def check_input(sigma, text):
    for ch in text:
        if ch not in sigma:
            print('Character', ch, 'from typed text is not in alphabet!', file=sys.stderr)
            exit(1)
