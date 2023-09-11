def find(begin, target, used, words, word_length):
    word_queue = []
    word_queue.append(begin)
    step_count = 0 
    
    while word_queue:
        print(word_queue)
        source = word_queue.pop()
        for word in words:
            count = 0 
            for l in range(word_length):
                if source[l] == word[l]:
                    count += 1
            if count == word_length - 1:
                if word == target:
                    step_count += 1
                    return step_count
                
                if word not in word_queue:
                    if word not in used:
                        word_queue.append(word)
                        used.add(word)
        step_count += 1
                
                
                

def solution(begin, target, words):
    
    used = set()
    target_word = target
    word_length = len(begin)
    
    if target not in words:
        return 0
    
    return find(begin, target, used, words, word_length)