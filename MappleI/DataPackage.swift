//
//  DataPackage.swift
//  MappleI
//
//  Created by Bruno Garelli on 5/23/17.
//  Copyright © 2017 Bruce. All rights reserved.
//

//import Foundation
class DataPackage {
    var data: MappleO = MappleO()
    private var name = ""
    init(name: String, config: [FetchConfig]? = nil) {
        self.name = name
    }
    internal func getName() -> String {
        return name
    }
}
