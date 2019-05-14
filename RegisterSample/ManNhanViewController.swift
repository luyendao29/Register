//
//  ManNhanViewController.swift
//  RegisterSample
//
//  Created by hoanganh on 5/2/19.
//  Copyright © 2019 hoanganh. All rights reserved.
//

import UIKit

class ManNhanViewController: UIViewController {
    
    @IBOutlet weak var lbname: UILabel!
    
    @IBOutlet weak var lbcity: UILabel!
    
    @IBOutlet weak var lbgioitinh: UILabel!
    
    @IBOutlet weak var lbtuoi: UILabel!
    
    @IBOutlet weak var txtthanhpho: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()

    }
    func configure(){
         if let name =  UserDefaults.standard.string(forKey: "name"),
        let  thanhpho = UserDefaults.standard.string(forKey: "distric"),
            let gioitinh = UserDefaults.standard.string(forKey: "gender"),
            let city = UserDefaults.standard.string(forKey: "city"),
            let tuoi = UserDefaults.standard.string(forKey: "age"){
            
             lbname.text = name
            lbcity.text = thanhpho
            lbgioitinh.text = gioitinh
            lbtuoi.text = tuoi
            txtthanhpho.text = city
        }
        
    }
    


}
