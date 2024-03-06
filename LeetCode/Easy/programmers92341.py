import collections
from datetime import datetime
import math
import re

def calc_fees(carDict, fees):
    result = []
    for key in sorted(carDict):
       if carDict[key] <= fees[0]:
           result.append(fees[1])
       else:
           result.append(fees[1] + math.ceil((carDict[key] - fees[0]) / fees[2]) * fees[3])
    return result

def solution(fees, records):
    carDict = collections.defaultdict(int)

    # () -> matching group or capture group
    for r in records:
        (hh, mm, number, func) = re.match('([0-9]{2}):([0-9]{2}) ([0-9]{4}) ([a-zA-Z]{2,4})', r).groups()
        hh = int(hh)
        mm = int(mm)

        total_mm = hh * 60 + mm
        if func == 'IN':
            carDict[number] -= total_mm
        elif func == 'OUT':
            carDict[number] += total_mm
    
    for (k, v) in sorted(carDict.items()):
        if v < 0: # 안나갔으면
            carDict[k] += 23 * 60 + 59

    return calc_fees(carDict, fees)
    




def solution2(fees, records):

    infoDict = {}
    carDict = collections.defaultdict(int)
    
    # () -> matching group or capture group

    for r in records:
        (hh, mm, number, func) = re.match('([0-9]{2}):([0-9]{2}) ([0-9]{4}) ([a-zA-Z]{2,4})', r).groups()
        hh = int(hh)
        mm = int(mm)

        total_mm = hh * 60 + mm

        print(f'{hh}시 {mm}분 {number}차가 {func}하였습니다')
        nr = r.split(" ")

        if nr[2] == "IN": # IN인 경우
            infoDict[nr[1]] = nr[0]
        else: # "OUT"인 경우
            # 취향: int(outtime.split(':')[0]) * 60 + int(outtime.split(':')[1])
            outtime = datetime.strptime(nr[0], "%H:%M")
            intime = datetime.strptime(infoDict[nr[1]], "%H:%M")
            minuite_time = ((outtime - intime).seconds / 60)

            # infoDict[1] = 2 # infoDict.update(1, 2)
            # del infoDict[1] # infoDict.pop(1)

            try:
                infoDict.pop(nr[1])
            except:
                pass
            carDict[nr[1]] = carDict[nr[1]] + minuite_time

    if len(infoDict) >= 1:
        # print(infoDict)
        for key in infoDict:
            outtime = datetime.strptime("23:59", "%H:%M")
            intime = datetime.strptime(infoDict[key], "%H:%M")
            minuite_time = ((outtime - intime).seconds) / 60
            carDict[key] = carDict[key] + minuite_time

    return calc_fees(carDict, fees)

print(solution([180, 5000, 10, 600], ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"]))
