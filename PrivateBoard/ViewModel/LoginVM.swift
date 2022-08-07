//
//  LoginVM.swift
//  PrivateBoard
//
//  Created by WG Yang on 2022/08/07.
//

import Foundation
import UIKit

class LoginVM {

    private var APIService = YHAPIService.shared
    private var user: User!
    
    var userId: String {
        return user.userId
    }
    var userPassword: String {
        return user.password
    }
    
    typealias loginCallBackType = (_ status:Bool, _ message:String) -> Void
    private var loginCallback:loginCallBackType?
    
    
    //MARK: - 로그인 실행.
    func loginWith(_ userID:String, andPassword password:String) {
        
        let route = YHAPIRoute.signIn(userLoginId: userID, userLoginPassword: password)

        APIService.requestJSON(route: route) { [weak self] ( decodedData: SingleResult? , responseSuccess) in
            guard let self = self else { return }
            
            if responseSuccess {
                if let decodedData = decodedData, decodedData.success {
                    //로그인 정보 저장
                    self.user = User(userId: userID, password: password)
                    self.loginCallback?(true, "로그인에 성공하였습니다.")
                }
                else {
                    self.loginCallback?(false, "올바른 아이디/비밀번호를 입력하세요.")
                }
                
            } else {
                self.loginCallback?(false, "통신 장애")
            }
        }
        
    }
    
    //MARK: - 로그인 완료
    ///로그인 통신 후 실행될 함수 지정
    func loginCompletionHandler(callBack: @escaping loginCallBackType) {
        self.loginCallback = callBack
    }
    
    struct User {
        var userId: String
        var password: String
    }
}

