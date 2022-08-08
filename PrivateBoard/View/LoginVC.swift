//
//  ViewController.swift
//  PrivateBoard
//
//  Created by WG Yang on 2022/08/02.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var kakaoLoginButton: UIButton!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    var loginVM = LoginVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUI()
    }
    
    func setUI() {
        
        //버튼 양쪽 반원 모양으로
        loginButton.clipsToBounds = true
        loginButton.layer.cornerRadius = loginButton.frame.size.height / 2
        
        //카카오로그인버튼 AspectFit
        kakaoLoginButton.imageView?.contentMode = .scaleAspectFit

    }
    
    func setDelegates() {
        idTextField.delegate = self
        pwTextField.delegate = self
    }
    
    @IBAction func tapLoginButton(_ sender: Any) {

        guard let userId = self.idTextField.text else {
            //안내창 출력
            SimpleAlert.alert(self, "아이디가 비었음", "...", nil)
            return
        }
        guard let password = self.pwTextField.text else {
            //안내창 출력
            SimpleAlert.alert(self, "비밀번호가 비었음", "...", nil)
            return
        }
            
        loginVM.loginCompletionHandler { [weak self] (status, message) in
            guard let self = self else {return}
            if status {
                //다음 화면 이동.
            } else {
                //안내창 출력.
                SimpleAlert.alert(self, "로그인실패", message, nil)
            }
        }
        loginVM.loginWith(userId, andPassword: password)
    }
}


//MARK: - 텍스트필드 키보드
extension LoginVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        idTextField.resignFirstResponder()
        pwTextField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
