id_list = ["muzi", "frodo", "apeach", "neo"]
report = ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"]


dictionary = dict.fromkeys(id_list) 
evr = []
result = []
count = 0
k = 2


for i in id_list:
    all_set = set()
    for j in report:
        evr = j.split()
        if i == evr[1]:
            a = dictionary[i]
            if a == None:
                all_set.add(evr[0])
            else:
                all_set = a
                all_set.add(evr[0])
            dictionary[i] = all_set

for key, value in dictionary.items():
    if value is not None:
        if len(value) < k:
            dictionary[key] = None

for i in id_list:
    sum = 0
    for key, value in dictionary.items():
        value = dictionary[key]
        if value is not None:
            value = list(value)
            if i in value:
                sum += 1
    result.insert(count,sum)
    count += 1      

print(result)


# for i in id_list:
#     value = dictionary[i]
#     sum = 0
#     if value is not None:
#         value = list(value)