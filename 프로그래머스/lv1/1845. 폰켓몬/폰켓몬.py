"""
전체 수 : N
종류 : M
가져갈 수 있는 최대 수 : N/2 = P

1) M < P -> M
2) M >= P -> P

"""
def solution(nums):
    
    number_Dictionary = {}
    monster_type = 0
    moster_max = len(nums) / 2
    
    for i in nums:
        if i not in number_Dictionary:
            number_Dictionary[i] = 1
            monster_type += 1
            
    if monster_type < moster_max:
        return monster_type
    elif monster_type >= moster_max:
        return moster_max