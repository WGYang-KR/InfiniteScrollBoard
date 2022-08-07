//
//  SingleResult.swift
//  PrivateBoard
//
//  Created by WG Yang on 2022/08/07.
//

import Foundation

class SingleResult: Codable{
    let code: Int32 //응답코드 >= 정상, <0 비정상
    var data: String?
    let msg: String //응답 메시지
    let success: Bool //응답 성공 여부
    
    enum CodingKeys: String, CodingKey {
        case code, data, msg, success
    }
}
