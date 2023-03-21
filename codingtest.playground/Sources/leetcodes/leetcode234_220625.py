def isPalindrome(self, head: Optional[ListNode]) -> bool:
    rev = None

    fast = slow = head

    while fast and fast.next:
        fast = fast.next.next
        rev, rev.next, slow = slow, rev, slow.next
    if fast:
        slow = slow.next

    while slow and rev.val == slow.val:
            rev = rev.next
            slow = slow.next
        return not rev

    

head = [1,2,2,1]
head = [1,2]


'''
# 큐를 이용한 풀이
def isPalindrome(self, head: Optional[ListNode]) -> bool:

    q = []

    node = head
    while node is not None:
        q.append(node.val)
        node = node.next

    while len(q) > 1:
        if q.pop(0) != q.pop():
            return False
    return True
'''
'''
# 데크를 이용한 풀이
import Deque from collections

def isPalindrome(self, head: Optional[ListNode]) -> bool:
    d : Deque = collections.deque()

    node = head

    while node is not None:
        d.append(node.val)
        node = node.next

    while len(d) > 1:
        if d.popleft() != d.pop():
            return False
    return True
'''
    