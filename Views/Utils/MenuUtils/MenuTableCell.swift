//
//  MenuTableCell.swift
//  
//
//  Created by Anofienam Isioma on 24/10/2018.
//

import UIKit

class MenuTableCell: UITableViewCell {
    
    @IBOutlet weak var leftIcon: UIImageView!
    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var notificationIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
