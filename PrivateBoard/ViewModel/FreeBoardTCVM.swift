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
    
    var contentVM: String { return boardCN ?? "" }
    var nicknameVM: String { return wrterNcnm ?? "글쓴이미상" }
    var dateVM: String { return creatDt ?? "날짜미상"}
    var readCntVM: String { return "조회수 + \(rdcnt ?? 0)"  }
    var commentCntVM: String { return "\(anscnt ?? 0)" }
    var thumbImageVM: String? { return userProfileFilePth }
    
    
}
