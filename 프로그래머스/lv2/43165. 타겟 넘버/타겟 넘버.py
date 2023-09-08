def solve(numbers, depth, target, result, breakpoint):
    if depth == breakpoint:
        if result == target:
            return 1
        return 0
    return solve(numbers, depth+1, target, result - numbers[depth], breakpoint) + solve(numbers, depth+1, target, result + numbers[depth], breakpoint)
    
    
def solution(numbers, target):
    return solve(numbers, 0, target, 0, len(numbers))