import collections
from datetime import datetime
import math

def calc_fees(carDict, fees):

    result = []
    for key in sorted(carDict):
       if carDict[key] <= fees[0]:
           result.append(fees[1])
       else:
           result.append(fees[1] + math.ceil((carDict[key] - fees[0]) / fees[2]) * fees[3])
    return result


def solution(fees, records):

    infoDict = {}
    carDict = collections.defaultdict(int)

    for r in records:
        nr = r.split(" ")
        if nr[2] == "IN": # IN인 경우
            infoDict[nr[1]] = nr[0]
        else: # "OUT"인 경우
            outtime = datetime.strptime(nr[0], "%H:%M")
            intime = datetime.strptime(infoDict[nr[1]], "%H:%M")
            minuite_time = ((outtime - intime).seconds / 60)
            infoDict.pop(nr[1])
            carDict[nr[1]] = carDict[nr[1]] + minuite_time

    if len(infoDict) >= 1:
        # print(infoDict)
        for key in infoDict:
            outtime = datetime.strptime("23:59", "%H:%M")
            intime = datetime.strptime(infoDict[key], "%H:%M")
            minuite_time = ((outtime - intime).seconds) / 60
            carDict[key] = carDict[key] + minuite_time

    return calc_fees(carDict, fees)