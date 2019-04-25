//
//  LoginVC.swift
//  paginationDemo
//
//  Created by Shailesh on 25/04/19.
//  Copyright © 2019 Shailesh. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onClickedGoButton(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        self.navigationController?.pushViewController(vc, animated: true)
        UserDefaults.standard.set(true, forKey: "loginUser")
    }
    
}
