//
//  ViewController2.swift
//  RegisterSample
//
//  Created by hoanganh on 5/2/19.
//  Copyright © 2019 hoanganh. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    
    @IBOutlet weak var pickerrView: UIPickerView!
    
    @IBOutlet weak var nametextField: UITextField!
    
    
    @IBOutlet  var buttonn: [UIButton]!
    //var dataSouce :[String] = [
    //    "18", "19","20", "21", "22"]
     let dataSouce = Array(0...30)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSouce.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(dataSouce[row])
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            let seletedValue = pickerView.selectedRow(inComponent: 0)
        UserDefaults.standard.set(seletedValue  , forKey: "age")
    }
    
    
    @IBAction func Click(_ sender: UIButton) {
        //UserDefaults.standard.set(sender.currentTitle, forKey: "gender")
        UserDefaults.standard.set(sender.titleLabel?.text, forKey: "gender")
        for i in buttonn{
            i.isSelected = false
        }
        sender.isSelected = true
        
    }
    
    
    @IBAction func Save(_ sender: UIButton) {
        if nametextField.text != "" {
            UserDefaults.standard.set(nametextField.text, forKey: "name")
        }
    }

}
