//
//  UserDetailsController.swift
//  YourDigitalLift
//
//  Created by Mac2 on 06/12/20.
//  Copyright © 2020 Mac2. All rights reserved.
//

import UIKit

class UserDetailsController: UIViewController {
    
    var user : User? = nil
    
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var companyNameLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = user {
            emailLbl.text = user.email
            phoneLbl.text = user.phone
            companyNameLbl.text = user.company.name
        }
        
        
        
    }
    
}
