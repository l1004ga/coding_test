//
//  dto.swift
//  kakao_2021_2nd
//
//  Created by danny.ho_2PC on 2022/09/25.
//

import Foundation

struct StartDTO : Codable {
    // DTO(Data Transfer Object)
    // 순수한 데이터 객체만 가진다 = 멤버함수 X, 멤버변수만 가지는 클래스
    
    let auth_key : String
    let problem : Int
    let time : Int
}
