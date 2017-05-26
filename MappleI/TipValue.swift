//
//  TipValue.swift
//  MappleI
//
//  Created by Bruno Garelli on 5/26/17.
//  Copyright © 2017 Bruce. All rights reserved.
//
import Alamofire
import Foundation
struct TipValue {
    enum TipType {
        case gotValue
        case getValue
    }
    var type: TipType = .gotValue
    var valueName: String = ""
    var valueValue: String = ""
}
