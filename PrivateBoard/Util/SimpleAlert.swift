//
//  SimpleAlert.swift
//  PrivateBoard
//
//  Created by WG Yang on 2022/08/07.
//

import UIKit

class SimpleAlert{
    
    static func alert(_ viewController: UIViewController?, _ title: String, _ msg: String, _ handler: ((UIAlertAction) -> Swift.Void)?) {
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "확인", style: .default, handler: handler)
        alertController.addAction(defaultAction)
        viewController?.present(alertController, animated: true, completion: nil)
    }

}
