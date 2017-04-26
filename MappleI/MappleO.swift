//
//  MappleO.swift
//  Mapple
//
//  Created by Bruce on 25/4/17.
//  Copyright © 2017 Bruce. All rights reserved.
//
import ObjectMapper
import AssociatedValues
import Foundation
struct MappleO: Mappable {
    private var carrier: NSObject = NSObject.init()
    init() {
        
    }
    init?(map: Map) {
        mapping(map: map)
    }
    internal mutating func mapping(map: Map) {
        let dictionary = map.JSON
        for key in dictionary.keys {
            setValue(label: key, value: dictionary[key])
        }
        setValue(label: "oMap", value: dictionary)
    }
    //MARK: Value Trading
    func getValue(label: String) -> Any? {
        return getAssociatedValue(key: label, object: carrier)
    }
    func setValue(label: String, value: Any?) {
        set(associatedValue: value, key: label, object: carrier)
    }
}
