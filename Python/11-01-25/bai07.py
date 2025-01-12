import math

x = int(input("Nhập x: "))
n = int(input("Nhập n: "))


def calc(x, n):
    answer = 0
    for i in range(n + 1):
        k = 2 * i + 1
        term = (x**k) / math.factorial(k)
        answer += term
    return round(answer, 2)


print(
    "{space0}3{space1}5{space2}2*{n}+1".format(
        space0="".join(
            [
                " "
                for x in range(
                    15 + (len(str(x)) + 2 if (len(str(x)) > 1) else (len(str(x))))
                )
            ]
        ),
        space1="".join([" " for x in range(6)]),
        space2="".join([" " for x in range(14)]),
        n=n,
    )
)
print(
    "{space0}{x}{space1}{x}{space2}{x}".format(
        x=x,
        n=n,
        space0="".join(
            [
                " "
                for x in range(
                    14 + (len(str(x)) + 1 if (len(str(x)) > 1) else (len(str(x))))
                )
            ]
        ),
        space1="".join([" " for x in range(6)]),
        space2="".join([" " for x in range(14)]),
    ),
)
print(
    "S({x}, {n}) = {x} + ---- + ---- + ... + ------------ = {answer}".format(
        x=x, n=n, answer=calc(x, n)
    )
)
print(
    "{space0}3!{space1}5!{space2}(2*{n}+1)!".format(
        space0="".join(
            [
                " "
                for x in range(
                    15 + (len(str(x)) + 1 if (len(str(x))) > 1 else (len(str(x))))
                )
            ]
        ),
        space1="".join([" " for x in range(5)]),
        space2="".join([" " for x in range(12)]),
        x=x,
        n=n,
    )
)
