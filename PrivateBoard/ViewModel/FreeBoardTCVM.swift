//
//  FreeBoardTCVM.swift
//  PrivateBoard
//
//  Created by WG Yang on 2022/08/08.
//

import Foundation

protocol FreeBoardTCVM {
    
    var contentVM: String { get }
    var nicknameVM: String { get }
    var dateVM: String { get }
    var readCntVM: String { get }
    var commentCntVM: String { get }
    var thumbImageVM: String? { get }
    
}


extension Article: FreeBoardTCVM {
    
    var contentVM: String { return boardSj ?? "" }
    var nicknameVM: String { return wrterNcnm ?? "글쓴이미상" }
    var dateVM: String {
        if let creatDt = creatDt {
            let splited = creatDt.components(separatedBy: ["-",":"," "])
            let year:String = String(Array(splited[0])[2...3])
            let month: String = splited[1]
            let day: String = splited[2]
            return "\(year).\(month).\(day)"
        } else {
            return "날짜 미상"
        }
    }
    var readCntVM: String { return "조회수 \(rdcnt ?? 0)"  }
    var commentCntVM: String { return "\(anscnt ?? 0)" }
    var thumbImageVM: String? { return userProfileFilePth }
    
    
}
