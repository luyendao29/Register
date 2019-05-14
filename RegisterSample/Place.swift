//
//  Place.swift
//  RegisterSample
//
//  Created by hoanganh on 4/25/19.
//  Copyright © 2019 hoanganh. All rights reserved.
//

import Foundation

class Place {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class City : Place{
    var id: Int
    init(id: Int, name: String) {
        self.id = id
        super.init(name: name)
    }
    
    init?(json: Json) {
        guard let id = json["CityCode"] as? Int else { return nil }
        guard let name = json["Name"] as? String else { return nil }
            self.id = id
            super.init(name: name)
       
    }
    static func parse(json: Json) -> [City] {
        guard let arrayOfDictionary = json["Cities"] as? [Json] else {return []}
        return arrayOfDictionary.map{City(json: $0)!}
    }
}

class District: Place {
    var id: Int
    var cityCode: Int
    init(id: Int, cityCode: Int, name: String) {
        self.id = id
        self.cityCode = cityCode
        super.init(name: name)
    }
    
    init?(json: Json) {
        guard let id = json["DistrictCode"] as? Int else { return nil }
        guard let name = json["Name"] as? String else { return nil }
        guard let cityCode =  json["CityCode"] as? Int else { return nil }
        self.id = id
        self.cityCode = cityCode
        super.init(name: name)
        
    }
    
    static func parse(json: Json) -> [District] {
        guard let arrayOfDictionary = json["Districts"] as? [Json] else {return []}
        return arrayOfDictionary.map{District(json: $0)!}
    }
}
