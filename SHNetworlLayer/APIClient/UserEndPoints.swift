//
//  UserEndPoints.swift
//  SHNetworlLayer
//
//  Created by shashi on 1/20/19.
//  Copyright © 2019 shashi. All rights reserved.
//

import Foundation
import Alamofire
enum UserEndPoints : APIRouteConfiguration{
    case login(email:String, password:String)
    case profile(userId : Int)
   
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .profile:
            return .get
        }
    }
    
    
    // MARK: - Path
    var path: String {
        switch self {
        case .login:
            return "/Authentication/Authenticate"
        case .profile(let id):
            return "/user/\(id)"
        }
    }
    
    
    // MARK: - Parameters
    var parameters: Parameters? {
        switch self {
        case .login(let email, let password):
            return [APIParameterKey.userName: email,APIParameterKey.password: password]
        case .profile :
            return nil
        }
    }
    
    
    struct APIParameterKey {
        static let userName = "Username"
        static let password = "Password"
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try K.ProductionServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
    
}
