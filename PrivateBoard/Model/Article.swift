//
//  Article.swift
//  PrivateBoard
//
//  Created by WG Yang on 2022/08/08.
//

import Foundation

struct Article : Codable {
    
    ///글번호
    let boardInfoSeqNo: Int32?
    ///게시글 제목
    let boardSj: String?
    ///게시글 내용
    let boardCN: String?
    ///조회수
    let rdcnt:Int32?
    ///댓글수
    let anscnt: Int32?
    ///작성일
    let creatDt: String? //작성일
    ///작성자 닉네임
    let wrterNcnm: String? //작성자 닉네임
    ///프로필 이미지 주소
    let userProfileFilePth: String?
   
}
