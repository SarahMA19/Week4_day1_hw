# Consecutive Indices
# You are given a list of unique integers, and two integers (a and b).
# Your task is to find out whether or not a and b appear consecutively in the list,
# and return a boolean value (True if a and b are consecutive, False otherwise).
#
# It is guaranteed that a and b are both present in the list.
#
# Example:
# Input
#([1, 6, 9, -3, 4, -78, 0], -3, 4)
# Output:
# True
#
# Input:
# ([3,1,0,19], 19, 0)
# Output:
# True



def confused(list, a, b):
    x = list.index(a) #linear operation
    y = list.index(b) #linear opteration
    print(x)
    print(y)
    if abs(x - y) == 1: #real time/constant 
        return True
    else:
        return False
   

print(confused([1, 6, 9, -3, 4, -78, 0], -3, 4))

#O(n) - linear operation