//
//  ArticleList.swift
//  PrivateBoard
//
//  Created by WG Yang on 2022/08/08.
//

import Foundation

struct ArticleList : Codable {
    ///성공여부
    let success: Bool
    ///결과코드
    let code: Int32
    ///결과메시지
    let msg: String
    let draw: Int32?
    ///조회 시작 번호
    let start: Int32?
    ///조회할 건수(한 페이지에보여줄갯수)
    let length: Int32?
    ///토탈카운트
    let recordsTotal: Int32?
    ///조회된 건수
    let recordsFiltered: Int32?
    ///조회된 글목록
    let data: [Article]?
    ///검색일
    let searchDate: String?
    let pageNumber,pageSize,offset: Int32?
    let paged, unpaged: Bool?
    
}
