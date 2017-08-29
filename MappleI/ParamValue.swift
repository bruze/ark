//
//  ParamValue.swift
//  MappleI
//
//  Created by Bruno Garelli on 5/27/17.
//  Copyright © 2017 Bruce. All rights reserved.
//
import Alamofire
import Foundation
struct ParamValue {
    enum ParamType {
        case paramGotValue
        case paramGetValue
    }
    var type: ParamType = .paramGotValue
    var valueName: String = ""
    var valueValue: AnyObject = "" as AnyObject
}
