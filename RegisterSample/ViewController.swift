//
//  ViewController.swift
//  RegisterSample
//
//  Created by hoanganh on 4/25/19.
//  Copyright © 2019 hoanganh. All rights reserved.
//

import UIKit

class BaseTableVC: UITableViewController {

    
let defaultsDictric = UserDefaults.standard
    var display: [Place] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return display.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.LableCity?.text = display[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defaultsDictric.set(display[indexPath.row].name, forKey: "distric")
    }

}

class CityTableVC: BaseTableVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        deleteBack()
        display = Repository.shared.cities
        self.tableView.rowHeight = 84
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColorFromRGB(rgbValue: 0xFEEED4, alpha: 1.00)
        let heightForHeaderView : CGFloat = 200
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: heightForHeaderView))
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 25)
        let paragraphStype = NSMutableParagraphStyle()
        paragraphStype.paragraphSpacing = 10
        paragraphStype.alignment = NSTextAlignment.center
        let attributed = [NSAttributedString.Key.font: titleLabel.font, NSAttributedString.Key.paragraphStyle: paragraphStype] as [NSAttributedString.Key : Any]
        let text = NSMutableAttributedString(string: "Where are you living?")
        text.addAttributes(attributed, range: NSRange(location: 0, length: text.length))
        titleLabel.attributedText = text
        tableView.tableHeaderView = titleLabel
    }
    func UIColorFromRGB(rgbValue: UInt, alpha: CGFloat) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
   

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let index = tableView.indexPathForSelectedRow {
            Repository.shared.selectedCity = display[index.row] as! City
            //  lúc bắn sang thì lưu luôn city
            defaultsDictric.set(display[index.row].name, forKey: "city")
        }
    }
    func deleteBack(){
        var i = self.navigationController?.viewControllers
        i!.remove(at: (i?.count)! - 2)
        self.navigationController?.viewControllers = i!
    }
}

class DistrictTableVC: BaseTableVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        display = Repository.shared.selectedDistricts
        self.tableView.rowHeight = 84
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColorFromRGB(rgbValue: 0xFEEED4, alpha: 1.00)
        let heightForHeaderView : CGFloat = 200
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: heightForHeaderView))
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 25)
        let paragraphStype = NSMutableParagraphStyle()
        paragraphStype.paragraphSpacing = 10
        paragraphStype.alignment = NSTextAlignment.center
        let attributed = [NSAttributedString.Key.font: titleLabel.font, NSAttributedString.Key.paragraphStyle: paragraphStype] as [NSAttributedString.Key : Any]
        let text = NSMutableAttributedString(string: "Where are you living?")
        text.addAttributes(attributed, range: NSRange(location: 0, length: text.length))
        titleLabel.attributedText = text
        tableView.tableHeaderView = titleLabel
    }
}


