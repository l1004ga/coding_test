class Tree:
    def __init__(self, value, left = None, right = None, upper = None, id = None):
        self.value = value
        self.left = left
        self.right = right
        self.upper = upper
        self.id = id
    def __str__(self):
        return f'id: {self.id}, val: {self.value}'

def buildTree(num, links):
    trees = [Tree(v, id=i) for (i, v) in enumerate(num)]
    for (i, v) in enumerate(links):
        if v[0] >= 0:
            trees[i].left = trees[v[0]]
            trees[v[0]].upper = trees[i]
        if v[1] >= 0:
            trees[i].right = trees[v[1]]
            trees[v[1]].upper = trees[i]
    head = trees[0]
    while True:
        if head.upper == None:
            break
        head = head.upper
    return head

class SizeK:
    def __init__(self, size, k):
        self.size = size
        self.k = k
    
    def __str__(self):
        return f'(size: {self.size}, k: {self.k})'
    def __repr__(self) -> str:
        return self.__str__()

MAX = 100000000
def getK(tree, maxSize) -> SizeK:
    left = SizeK(0, 0)
    right = SizeK(0, 0)

    if tree.left:
        left = getK(tree.left, maxSize)
    if tree.right:
        right = getK(tree.right, maxSize)

    if tree.left and tree.right and tree.value + left.size + right.size <= maxSize:
        return SizeK(tree.value + left.size + right.size, left.k + right.k - 1)

    if tree.left and tree.right and tree.value + left.size <= maxSize and tree.value + right.size <= maxSize:
        if left.size < right.size:
            return SizeK(tree.value + left.size, left.k + right.k)
        else:
            return SizeK(tree.value + right.size, left.k + right.k)

    if tree.left and tree.value + left.size <= maxSize:
        return SizeK(tree.value + left.size, left.k + right.k)

    if tree.right and tree.value + right.size <= maxSize:
        return SizeK(tree.value + right.size, left.k + right.k)

    if tree.value <= maxSize:
        return SizeK(tree.value, left.k + right.k + 1)

    raise Exception('What The Hell?')

# left == 9, left_k.k == 4
# target == 2
# right == 27, right_k.k == 1

def search(head, left, right, target):
    #print(f'run search left: {left} right: {right} target: {target}')
    left_k = getK(head, left)
    right_k = getK(head, right)
    #print(left_k)
    #print(right_k)

    if left + 1 == right and left_k.k != target and right_k.k == target:
        return right

    if left_k.k == target:
        return left
    if right_k.k <= target:
        mid = (left + right)//2 if (left + right) % 2 == 0 else (left + right)//2 + 1
        mid_k = getK(head, mid)
        if mid_k.k <= target:
            #print(f'search left, mid: {left} {mid} {target}')
            return search(head, left, mid, target)
        if mid_k.k > target:
            # print(f'search mid, right: {mid} {right} {target}')
            return search(head, mid, right, target)
    raise Exception('What??')

def solution(k, num, links):
    head = buildTree(num, links)
    return search(head, max(num), sum(num) + 1, k)

# print(solution(3, [12, 30, 1, 8, 8, 6, 20, 7, 5, 10, 4, 1], [[-1, -1], [-1, -1], [-1, -1], [-1, -1], [8, 5], [2, 10], [3, 0], [6, 1], [11, -1], [7, 4], [-1, -1], [-1, -1]]) == 40)
print(solution(1, [6, 9, 7, 5], [[-1, -1], [-1, -1], [-1, 0], [2, 1]]) == 27)
print(solution(2, [6, 9, 7, 5], [[-1, -1], [-1, -1], [-1, 0], [2, 1]]) == 14)
print(solution(4, [6, 9, 7, 5], [[-1, -1], [-1, -1], [-1, 0], [2, 1]]) == 9)
