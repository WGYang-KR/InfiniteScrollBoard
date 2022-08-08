//
//  FreeBoardTVC.swift
//  PrivateBoard
//
//  Created by WG Yang on 2022/08/08.
//

import UIKit
import Kingfisher

class FreeBoardTC : UITableViewCell{
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var readCntLabel: UILabel!
    @IBOutlet weak var commentCntLabel: UILabel!
    @IBOutlet weak var thumbImageView: UIImageView!
    
    var viewModel: FreeBoardTCVM? {
        didSet {
            bindViewModel()
        }
    }
    
    private func bindViewModel() {
        if let vm = viewModel {
            contentLabel.text = vm.contentVM
            nicknameLabel.text = vm.nicknameVM
            dateLabel.text = vm.dateVM
            readCntLabel.text = vm.readCntVM
            commentCntLabel.text = vm.commentCntVM
            if let imagePath = vm.thumbImageVM {
                thumbImageView.isHidden = false
                let url = URL(string: BaseURL.Image + imagePath)
                thumbImageView.kf.setImage(with: url)
            } else {
                thumbImageView.isHidden = true
            }
        }
    }

}


