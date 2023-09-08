count = 0
TARGET = 0

class Node:
    def __init__(self, item, numbers, breakpoint, depth=0):
        self.item = item
        self.left = None
        self.right = None
        self.depth = depth
        self.numbers = numbers
        self.breakpoint = breakpoint
        
    def createMySelf(self):
        global count
        if self.depth >= self.breakpoint:
            global TARGET
            if TARGET == self.item:
                count += 1
                # print(f'I am item: {self.item}, depth: {self.depth}, self.breakpoint: {self.breakpoint}, self.')
            return
        self.left = Node(self.item - self.numbers[self.depth], self.numbers, self.breakpoint, self.depth + 1)
        self.right = Node(self.item + self.numbers[self.depth], self.numbers, self.breakpoint, self.depth + 1)
        self.left.createMySelf()
        self.right.createMySelf()

class BinaryTree():
    def __init__(self):
        self.root = None

def solution(numbers, target):
    # calc_tree = BinaryTree()
    global TARGET
    global count
    count = 0
    TARGET = target
    rootNode = Node(0, numbers, len(numbers), 0)
    rootNode.createMySelf()
    # calc_tree.root = Node(0)
    # flagNode = calc_tree.root
    # for num in numbers:
    #     flagNode.left = -num
    #     flagNode.right = num
    # print(count)
    return count