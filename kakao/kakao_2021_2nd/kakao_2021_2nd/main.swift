//
//  main.swift
//  kakao_2021_2nd
//
//  Created by l1004ga on 2022/09/25.
//

import Foundation

let api = API(XAuthTokenOut: "64a873fee40b1104d52adda4a963d61c", urlOut: "https://kox947ka1a.execute-api.ap-northeast-2.amazonaws.com/prod/users")

let startdto = api.start(problem: 1)
startdto.problem
