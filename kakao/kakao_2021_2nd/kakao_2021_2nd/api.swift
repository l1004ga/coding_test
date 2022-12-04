//
//  api.swift
//  kakao_2021_2nd
//
//  Created by danny.ho_2PC on 2022/09/25.
//

import Foundation

class API {
    /*
     <request>
     curl -X POST {BASE_URL}/start \
          -H 'X-Auth-Token: {X_AUTH_TOKEN}' \
          -H 'Content-Type: application/json' \
          -d '{
              "problem": 1
          }'
     
     <response>
     {
       "auth_key": "1fd74321-d314-4885-b5ae-3e72126e75cc",
       "problem": 1,
       "time": 0
     }
     */
    
    
    //01. URL에서 데이터를 불러오기 위한 기본 값(문제 지문에서 가져와야 함)
    let XAuthToken: String
    let url: String
    
    //01-1.초기화(main.swift에서 값을 받아온다)
    init(XAuthTokenOut: String, urlOut: String) {
        XAuthToken = XAuthTokenOut
        url = urlOut
    }
    
    //02. StartAPI 메소드 생성
    func start(problem:Int) -> StartDTO {                //메소드 반환값(result)이 StartDTO 타입이다.
        let semaphore = DispatchSemaphore(value: 0)                //스위프트 내부적으로 wait()와 signal()의 동작 프로세스
        var result : StartDTO = StartDTO(auth_key:"", problem:0, time: 0)        //response로 받아온 값이 JSON 형식이기 때문에 StartDTO를 통한 디코딩값 저장
        let url = URL(string: "\(self.url)/start")!            //API class에 선언된 기본 url을 기준으로 request 조건을 맞추기 위해 /start 경로 추가
        
        //타겟 url로 보낼 request 작성
        var request = URLRequest(url: url)          //Request를 보내기 위한 header, body를 포함한 구조체를 정의하고 request 인스턴스 생성
        request.httpMethod = "POST"          //Request 통신 방식으로 요구조건인 "POST" 지정
        //request 헤더에 들어가야 하는 값(value) 지정
        request.setValue(self.XAuthToken, forHTTPHeaderField: "X-Auth-Token")       //Request 전송 방식으로 요구조건인 "POST" 지정
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //request 바디에 들어가야 하는 값(value) 지정
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: ["problem": problem])     //JSON 형식으로 파싱 필요
        } catch {
            print(error.localizedDescription)         //실패 시 에러 확인
            return result           //error 발생 시 아래 URLSession~끝까지 코드가 실행되지 않도록 return해서 메소드를 끝내야 한다
        }
        URLSession.shared.dataTask(with: request) { (data,response,error) in
            let status = (response as! HTTPURLResponse).statusCode
            if status != 200 {
                print("status is not 200, data= \(String(describing: String(data: data!, encoding: .utf8)))")
                semaphore.signal()
                return
            }
            do {
                result = try JSONDecoder().decode(StartDTO.self, from: data!)
            } catch {
                print("json decoder error, data=\(data!)")
            }
            semaphore.signal()
        }.resume()
        semaphore.wait()
        return result
    }
}
