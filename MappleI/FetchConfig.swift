//
//  FetchConfig.swift
//  MappleI
//
//  Created by Bruno Garelli on 5/23/17.
//  Copyright © 2017 Bruce. All rights reserved.
//
import Alamofire
import AlamofireObjectMapper
//import Foundation
typealias FetchConfigParams = (baseURL: String, tip: [TipValue], params: [String: AnyObject], method: HTTPMethod)
internal struct FetchConfig {
    /*VAR
     */
    private var url:    String = ""
    private var tip:    [TipValue] = []
    private var params: [String: AnyObject] = [:]
    private var method: HTTPMethod = .get
    /*
     */
    internal init(parameters: FetchConfigParams) {
        url = parameters.baseURL
        tip = parameters.tip
        params = parameters.params
        method = parameters.method
    }
    internal func request() {
        APICall.sessionManager.request(constructRequestUrl(), method: method, parameters: params, encoding: JSONEncoding.default, headers: [:])
    }
    private func constructRequestUrl() -> String {
        var result: String = url
        for singleTip in tip {
            var tipAdd: String = singleTip.valueName
            if singleTip.type == .getValue { //retrieve data from a dataPackage
                if let getPackage = DataPicker.shared.getPackage(name: singleTip.valueName) {
                    if let theValue = getPackage.data.getValue(label: singleTip.valueValue) as? String {
                        tipAdd += theValue
                    }
                }
            } else { //fixed value
                tipAdd += singleTip.valueValue
            }
            result += tipAdd
        }
        return result
    }
}
