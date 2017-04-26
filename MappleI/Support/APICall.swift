//
//  APICall.swift
//  Mapple
//
//  Created by Bruce on 25/4/17.
//  Copyright © 2017 Bruce. All rights reserved.
//
import Alamofire
import AlamofireObjectMapper
//import Foundation
struct APICall {
    init() {
        
    }
    func request() {
        Alamofire.request("http://localhost:8181/api/v1/highscores").responseObject { (response: DataResponse<MappleO>) in
            print(response)
        }
    }
}
