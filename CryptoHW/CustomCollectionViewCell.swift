//
//  CustomCollectionViewCell.swift
//  CryptoHW
//
//  Created by GLaDOS on 8.06.2022.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    // UI Elements
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // UI Ops
        setupUI()
    }
    
    private func setupUI(){
        // Cell border setup
        self.layer.cornerRadius = 5
        self.layer.borderWidth  = 1.0
        self.layer.borderColor  = UIColor.red.cgColor
    }

}
