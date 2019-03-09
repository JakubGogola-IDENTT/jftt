import matcher
import checker


def main():
    n = int(input('n: '))
    sigma = set()

    for i in range(0, n):
        ch = input()[:1]
        sigma.add(ch)

    print(sigma)

    text = str(input('text: '))
    checker.check_input(sigma, text)
    print(text, '\n********************')

    n = int(input('n: '))
    for i in range(0, n):
        pattern = str(input('pattern: '))
        checker.check_input(sigma, pattern)
        print(pattern)

        delta = matcher.compute_transition_function(pattern, sigma)
        matcher.finite_automation_matcher(text, delta, len(pattern))
        print('**********')


if __name__ == "__main__":
    main()
