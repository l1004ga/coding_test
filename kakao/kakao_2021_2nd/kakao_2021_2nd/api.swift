//
//  api.swift
//  kakao_2021_2nd
//
//  Created by danny.ho_2PC on 2022/09/25.
//

import Foundation

class API {
    let XAuthToken: String
    let url: String
    
    init(XAuthToken: String, url: String) {
        self.XAuthToken = XAuthToken
        self.url = url
    }
    
    func start(problem:Int) -> StartDTO {
        let semaphore = DispatchSemaphore(value: 0)
        var result : StartDTO = StartDTO(auth_key:"", problem:0, time: 0)
        let url = URL(string: "\(self.url)/start")!
        /*
         X-Auth-Token: {X-Auth-Token}
         Content-Type: application/json
         */
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue(self.XAuthToken, forHTTPHeaderField: "X-Auth-Token")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: ["problem": problem])
        } catch {
            print("직렬화 실패")
            return result
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
