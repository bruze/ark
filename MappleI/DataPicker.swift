//
//  DataPicker.swift
//  MappleI
//
//  Created by Bruno Garelli on 5/23/17.
//  Copyright © 2017 Bruce. All rights reserved.
//

//import Foundation
class DataPicker {
    static var shared: DataPicker = {
        return DataPicker.init()
    }()
    private var packages: [String: DataPackage] = ["default": DataPackage(name: "default")]
    private init() {
        DispatchOnce().perform{
            print("Data Picker Created")
        }
    }
    internal func addPackage(name: String, config: [FetchConfig]?) {
        guard !packages.keys.contains(name) else {
            print("DPicker: There's another package with that name")
            return
        }
        let aNewPackage = DataPackage.init(name: name, config: config)
        packages[name] = aNewPackage
    }
    internal func getPackage(name: String) -> DataPackage? {
        return packages[name]
    }
}
