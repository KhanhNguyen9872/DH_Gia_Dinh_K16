def c(i,j,k):
    if i < j:
        if j < k:
            i = j
        else:
            j = k
    else:
        if j > k:
            j = i
        else:
            i = k
    return [i,j,k]

print("a. ", c(3,5,7))
print("b. ", c(3,7,5))
print("c. ", c(5,3,7))
print("d. ", c(5,7,3))
print("e. ", c(7,3,5))
print("f. ", c(7,5,3))