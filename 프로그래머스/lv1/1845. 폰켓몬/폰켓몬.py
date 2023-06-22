"""
전체 수 : N
종류 : M
가져갈 수 있는 최대 수 : N/2 = P

1) M < P -> M
2) M >= P -> P

"""
def solution(nums):
    return min(len(nums)/2, len(set(nums)))