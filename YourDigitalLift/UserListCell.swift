//
//  UserListCell.swift
//  YourDigitalLift
//
//  Created by Mac2 on 06/12/20.
//  Copyright © 2020 Mac2. All rights reserved.
//

import UIKit

class UserListCell: UITableViewCell {
   
    @IBOutlet weak var usersNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
