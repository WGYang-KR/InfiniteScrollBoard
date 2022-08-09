//
//  boardVC.swift
//  PrivateBoard
//
//  Created by WG Yang on 2022/08/08.
//

import UIKit

class homeVC: UIViewController {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var freeBoardTableView: FreeBoardTableView!
    
    var curSegmentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        freeBoardTableView.viewDidAppear()
    }
    
    
    func setupUI() {
        
    //segmentedControl 모양
        //투명 배경
        let image = UIImage()
        let size = CGSize(width: 1, height: segmentedControl.intrinsicContentSize.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        image.draw(in: CGRect(origin: .zero, size: size))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        segmentedControl.setBackgroundImage(scaledImage, for: .normal, barMetrics: .default)
        segmentedControl.setDividerImage(scaledImage, forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)



        //선택 안된 레이블
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .regular), NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        //선택된 레이블
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .bold), NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        segmentedControl.selectedSegmentTintColor = .clear
        segmentedControl.backgroundColor = .clear
        segmentedControl.tintColor = .clear
   
    }
    
    @IBAction func segmentedControlDidChange(_ sender: UISegmentedControl) {
       
    }
    

    

}
