def solution(phone_book):
    items = set()
    for phone in phone_book:
        items.add(phone)
    for phone in phone_book:
        tmp = ""
        for char in phone:
            tmp += char
            if tmp == phone:
                break
            if tmp in items:
                return False
    return True