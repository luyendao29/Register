//
//  Repository.swift
//  RegisterSample
//
//  Created by hoanganh on 4/25/19.
//  Copyright © 2019 hoanganh. All rights reserved.
//

import Foundation

typealias Json = Dictionary<String, Any>

class Repository {
    static var shared = Repository()
    
    lazy var cities : [City] = {
        guard let json =  getData(filename: "Cities") else {return []}
        return City.parse(json: json)
    }()
    
    lazy var districts : [District] = {
        guard let json =  getData(filename: "Districts") else {return []}
        return District.parse(json: json)
    }()
    
    var selectedCity : City? {
        didSet {
            guard let city = selectedCity else {return }
           selectedDistricts =  districts.filter{$0.cityCode == city.id}
        }
    }
    
    var selectedDistricts: [District] = []
   
    
}

func getData(filename: String) -> Json?{
    // đường dẫn đến
    var result : Json?
    guard let plistPath = Bundle.main.path(forResource: filename, ofType: "plist") else { return nil}
    // đọc nội dung
    guard let plistData = FileManager.default.contents(atPath: plistPath) else { return  nil}
    
    do {
        // đã lấy về được một cục dữ liệu
        guard let plistDict  = try  PropertyListSerialization.propertyList(from: plistData, options: .mutableContainersAndLeaves, format: nil)  as? Json else { return nil}
        result = plistDict
        print(result)
    } catch  {
        print("Error")
    }
    return result
}
