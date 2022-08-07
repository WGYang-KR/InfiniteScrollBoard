//
//  YHAPI.swift
//  PrivateBoard
//
//  Created by WG Yang on 2022/08/03.
//

import Foundation




enum YHAPIRoute: RESTAPIRoute{
    
    case signIn(userLoginId: String, userLoginPassword: String)
    
    /**
     length*: 조회할 건수(한 페이지에보여줄갯수),
     boardCn*: 게시글 내용,
     boardSj: 게시글 제목,
     boardTy: (검색조건) 정보게시판 유형,
     creatDEnd: (검색조건)작성일 종료,
     creatDStart: (검색조건)작성일 시작,
     wrterLoginId: (검색조건)작성자 로그인 아이디,
     wrterNcnm: (검색조건) 작성자 닉네임,
     start* integer ($int32) 조회를 시작할 row number(지금 클릭한 페이지)
    */
    case boardList( length: Int32,
                    boardCn: String,
                    boardSj: String?,
                    boardTy: String?,
                    creatDEnd: Date?,
                    creatDStart: Date?,
                    wrterLoginId: String?,
                    wrterNcnm: String?,
                    start: Int32)
    
    
    var path: String {
        switch self {
        case .signIn:
            return "/v1/signIn"
        case .boardList:
            return "/v1/free-boards/Dt"
            
        }
    }
    
    var method: RESTAPIMethod {
        switch self {
        case .signIn:
            return .POST
        case .boardList:
            return .POST
        }
    }
    
    var params: [String : Any]? {
        switch self {
        case let .signIn(userLoginId, userLoginPassword):
            let param: [String : Any] = [
                    "userLoginId": userLoginId,
                    "userLoginPassword": userLoginPassword
            ]
            return param
        case let .boardList(length, boardCn, boardSj, boardTy, creatDEnd, creatDStart, wrterLoginId, wrterNcnm, start):
            
            var creatDEndString: String = ""
            var creatDStartString: String = ""
            if let creatDEnd = creatDEnd {
                creatDEndString = YHAPIDateFormatter.string(date: creatDEnd)
            }
            if let creatDStart = creatDStart {
                creatDStartString = YHAPIDateFormatter.string(date: creatDStart)
            }

            let param: [String: Any] = [
                "length": length,
                "searchObj": [
                    "boardCn": boardCn,
                    "boardSj": boardSj ?? "",
                    "boardTy": boardTy ?? "",
                    "creatDEnd": creatDEndString,
                    "creatDStart": creatDStartString,
                    "wrterLoginId": wrterLoginId ?? "",
                    "wrterNcnm": wrterNcnm ?? ""
                ],
                "start": start
            ]
            return param
        }
    }
  
}
