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
        //mapping(map: map)
    }
    internal mutating func mapping(map: Map) {
        let dictionary = map.JSON
        for key in dictionary.keys {
            setValue(label: key, value: dictionary[key])
        }
        setValue(label: "oMap", value: dictionary)
        //
        if let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
            let fMan = FileManager.default
            //let data = NSKeyedArchiver.archivedData(withRootObject: dictionary)
            //NSKeyedArchiver.archiveRootObject(dictionary, toFile: path + "alan.plist")
            var data = Data.init()
            let stringAppend = "class Nueva {"+"\n"
                + "var \(getValue(label: dictionary.keys.first!)!)"+"\n}"
            data.append(stringAppend.data(using: String.Encoding.ascii)!)
            print(fMan.createFile(atPath: path + "alan.swift", contents: data, attributes: nil))
            let meKnow = true
        }
    }
    //MARK: Value Trading
    func getValue(label: String) -> Any? {
        return getAssociatedValue(key: label, object: carrier)
    }
    func setValue(label: String, value: Any?) {
        set(associatedValue: value, key: label, object: carrier)
    }
}
