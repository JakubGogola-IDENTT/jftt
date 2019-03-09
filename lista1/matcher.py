# Patterns matcher


def compute_transition_function(pattern, sigma):
    m = len(pattern)
    delta = {}

    for q in range(0, m + 1):
        for a in sigma:

            # The largest k where Pk is suffix of Pq|a
            k = min(m + 1, q + 2)
            k -= 1

            while not str(pattern[0:q] + a).endswith(pattern[0:k]):
                k -= 1

            delta[(q, a)] = k

    return delta


def finite_automation_matcher(text, delta, m):
    n = len(text)
    q = 0

    for i in range(0, n):
        q = delta[(q, text[i])]

        if q == m:
            s = i - m + 1
            print('Pattern occurs with shift', s)
