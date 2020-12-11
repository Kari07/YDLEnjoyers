//
//  ViewController.swift
//  SingletonDesignPattern
//
//  Created by Mac2 on 11/12/20.
//  Copyright © 2020 Mac2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        let newUser = Users.user
        newUser.name = "qeqqr"
        newUser.phn = 2323322
        
        print(newUser.name)
        print(newUser.phn)
    }

    
}

