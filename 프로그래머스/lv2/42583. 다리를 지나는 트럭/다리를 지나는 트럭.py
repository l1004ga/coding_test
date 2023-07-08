def solution(bridge_length, weight, truck_weights):

    bridge_on = []
    truck_location = []
    time = 0
    
    while truck_weights or bridge_on :
        
        if truck_weights:
        
            if sum(bridge_on) + truck_weights[0] <= weight:
                bridge_on.append(truck_weights.pop(0)) # 선입선출
                truck_location.append(0)
            
        time += 1
        truck_location = list(map(lambda x:x + 1, truck_location))
        
        #print("시간, 차 현황, 위치", time, bridge_on, truck_location)
        
        if truck_location[0] == bridge_length:
            bridge_on.pop(0)
            truck_location.pop(0)
    
    return time + 1