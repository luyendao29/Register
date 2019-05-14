//
//  HelloViewController.swift
//  RegisterSample
//
//  Created by hoanganh on 4/26/19.
//  Copyright © 2019 hoanganh. All rights reserved.
//

import UIKit

class HelloViewController: UIViewController {

    @IBOutlet weak var avatar: UIImageView!
    
    @IBOutlet weak var text: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        avatar!.alpha = 0
        text!.alpha = 0
        
        _ = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(delayeAction), userInfo: nil, repeats: false)
    }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        let centImage = avatar.center
        UIView.animate(withDuration: 3, animations:
            {self.avatar!.alpha = 1})
        {
        (finished) in UIView.animate(withDuration: 1, animations:{
            self.text!.center = CGPoint(x: self.view.frame.size.width / 2, y : 150)
            self.text!.alpha = 1})
        }
    }
@objc func delayeAction(){
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let nextViewController = storyboard.instantiateViewController(withIdentifier: "Home") as! CityTableVC
    navigationController?.pushViewController(nextViewController, animated: true)
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
