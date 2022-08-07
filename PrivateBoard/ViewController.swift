//
//  ViewController.swift
//  PrivateBoard
//
//  Created by WG Yang on 2022/08/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var kakaoLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    func setupUI() {
        
        //버튼 양쪽 반원 모양으로
        loginButton.clipsToBounds = true
        loginButton.layer.cornerRadius = loginButton.frame.size.height / 2
        
        //카카오로그인버튼 AspectFit
        kakaoLoginButton.imageView?.contentMode = .scaleAspectFit

    }
    

}

