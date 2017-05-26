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
    static let sessionManager = Alamofire.SessionManager.default
    init() {
        APICall.sessionManager.adapter = MultiAdapterRetrier.init(adaptations: [{ (request: URLRequest) -> URLRequest in
            var urlRequest = request
            urlRequest.setValue("Bearer " /*+ accessToken*/, forHTTPHeaderField: "Authorization")
            return urlRequest
            }])
    }
    func request() {
        /*Alamofire.request("http://localhost:8181/api/v1/highscores").responseArray { (response: DataResponse<[MappleO]>) in
            print(response)
        }*/
        Alamofire.request("http://localhost:8181/api/v1/highscores").responseObject { (response: DataResponse<MappleO>) in
            print(response)
            var mapple = MappleO.init()
            mapple = response.result.value!
            let meKnow = true
        }
    }
}
