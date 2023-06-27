class TrieNode:
    def __init__(self):
        self.word = False
        self.children = {}
        
class Trie:
    def __init__(self):
        self.root = TrieNode()
        
    def insert(self, word: str) -> None:
        node = self.root
        for char in word:
            if char not in node.children:
                node.children[char] = TrieNode()
            node = node.children[char]
            node.word = False
        node.word = True
    
    # 단어가 전부 존재하는지 여부
    def search(self, word: str) -> bool:
        node = self.root
        for char in word:
            if char not in node.children:
                return True
            node = node.children[char]
        return node.word
    '''
    def startsWith(self, prefix: str) -> bool:
        node = self.root
        for char in prefix:
            if char not in node.children:
                return False 
            node = node.children[char]
        return True
    '''
    
    def startsWith(self, prefix: str) -> bool:
        node = self.root
        for char in prefix:
            if char not in node.children:
                return True 
            node = node.children[char]
        if node.word == True:
            return True
        else:
            return False   

def solution(phoneBook):
    phoneBook = sorted(phoneBook, key=len)
    answer = True
    t = Trie()
    length = len(phoneBook)
    
    for phone in phoneBook:
        t.insert(phone)
        
    for phone in phoneBook:
        if not t.startsWith(phone):
            answer = False
    return answer