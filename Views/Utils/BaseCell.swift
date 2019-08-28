//
//  BaseCell.swift
//  Views
//
//  Created by Anofienam Isioma on 29/10/2018.
//  Copyright © 2018 com.chuck. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    @IBOutlet weak var title: UILabel?
    @IBOutlet weak var img: UIImageView?
    @IBOutlet weak var preview: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
