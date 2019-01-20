//
//  UserEndPoints.swift
//  SHNetworlLayer
//
//  Created by shashi on 1/20/19.
//  Copyright © 2019 shashi. All rights reserved.
//

import Foundation
import Alamofire
enum JobEndpoints : APIRouteConfiguration{
    
    
    case jobs(token : String)
    case workItems(authToken : String,  jobID : Int)
    case startJob(authToken : String, jobID : Int, noticeID : Int, comments : String )
    case finishJob(authToken : String, jobID : Int, noticeID : Int, comments : String, jobComplete : Bool )
    case digAndRequest(authToken : String, jobID : Int, noticeID : Int, comments : String )
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .jobs , .workItems :
            return .get
        case .startJob, .finishJob, .digAndRequest:
            return .post
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .jobs:
            return "/Options/GetJobs"
        case .workItems:
            return "/Options/GetJobWorkItems"
        case .startJob:
            return "/Options/StartJob"
        case .finishJob:
            return "/Options/FinishJob"
        case .digAndRequest :
            return "/Options/DigAndRequest"
        }
    }
    var queryParams : [URLQueryItem]?{
        switch self {
        case .jobs(let token):
            return  [URLQueryItem(name: "AuthToken", value: token)]
        case .workItems(let authToken, let jobID):
             return  [
                URLQueryItem(name: "AuthToken", value: authToken),
                URLQueryItem(name: "JobID", value: String(jobID))
            ]
        default:
            return nil
        }
        
    }
    
    
    // MARK: - Parameters
    var parameters: Parameters? {
        switch self {
        case .jobs:
            return nil
        case .workItems:
            return nil
        case .startJob(let authToken, let jobID , let noticeID , let comments ):
            return [
                APIParameterKey.authToken : authToken,
                APIParameterKey.jobID : jobID,
                APIParameterKey.noticeId : noticeID,
                APIParameterKey.comments : comments
            ]
        case .finishJob (let authToken, let jobID , let noticeID , let comments, let jobComplete ):
            return [
                APIParameterKey.authToken : authToken,
                APIParameterKey.jobID : jobID,
                APIParameterKey.noticeId : noticeID,
                APIParameterKey.comments : comments,
                APIParameterKey.jobComplete : jobComplete
            ]
        case .digAndRequest (let authToken, let jobID , let noticeID , let comments ):
            return [
                APIParameterKey.authToken : authToken,
                APIParameterKey.jobID : jobID,
                APIParameterKey.noticeId : noticeID,
                APIParameterKey.comments : comments
            ]
        }
    }
    
    struct APIParameterKey {
        static let authToken = "AuthToken"
        static let jobID = "JobID"
        static let noticeId = "NoticeID"
        static let comments = "Comments"
        static let jobComplete = "JobComplete"
        static let items = "Items"
        static let length = "Length"
        static let width = "Width"
        static let depthB = "DepthB"
        static let depthT = "DepthT"
        static let materialTypeID = "MaterialTypeID"
        static let surfaceTypeID = "SurfaceTypeID"
        static let readyForJointing = "ReadyForJointing"
        static let muckawayRequired = "MuckawayRequired"
        static let backfillRequired = "BackfillRequired"
        
        
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try K.ProductionServer.baseURL.asURL()
        let urlWithPathComponents =  url.appendingPathComponent(path)
        var mURLComponent =  URLComponents(url: urlWithPathComponents, resolvingAgainstBaseURL: false)
        
          mURLComponent?.queryItems = queryParams
        var urlRequest = URLRequest(url:(mURLComponent?.url)!)
        
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

