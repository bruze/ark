//
//  MultiAdapterRetrier.swift
//  MappleI
//
//  Created by Bruno Garelli on 5/24/17.
//  Copyright © 2017 Bruce. All rights reserved.
//
import Foundation
import Alamofire
import p2_OAuth2
class MultiAdapterRetrier: RequestAdapter {
    private let adaptations: [(URLRequest) -> URLRequest]

    init(adaptations: [(URLRequest)->URLRequest]) {
        //self.accessToken = accessToken
        self.adaptations = adaptations
    }
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        /*var urlRequest = urlRequest
        urlRequest.setValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization")
        return urlRequest*/
        var finalRequest = urlRequest
        for adaptation in adaptations {
            finalRequest = adaptation(finalRequest)
        }
        return finalRequest
    }
}
class OAuth2RetryHandler: RequestRetrier, RequestAdapter {
    
    let loader: OAuth2DataLoader
    
    init(oauth2: OAuth2) {
        loader = OAuth2DataLoader(oauth2: oauth2)
    }
    
    /// Intercept 401 and do an OAuth2 authorization.
    public func should(_ manager: SessionManager, retry request: Request, with error: Error, completion: @escaping RequestRetryCompletion) {
        if let response = request.task?.response as? HTTPURLResponse, 401 == response.statusCode, let req = request.request {
            var dataRequest = OAuth2DataRequest(request: req, callback: { _ in })
            dataRequest.context = completion
            loader.enqueue(request: dataRequest)
            loader.attemptToAuthorize() { authParams, error in
                self.loader.dequeueAndApply() { req in
                    if let comp = req.context as? RequestRetryCompletion {
                        comp(nil != authParams, 0.0)
                    }
                }
            }
        }
        else {
            completion(false, 0.0)   // not a 401, not our problem
        }
    }
    
    /// Sign the request with the access token.
    public func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        guard nil != loader.oauth2.accessToken else {
            return urlRequest
        }
        return try urlRequest.signed(with: loader.oauth2)   // "try" added in 3.0.2
    }
}
