//
//  APIClient.swift
//  SHNetworlLayer
//
//  Created by shashi on 1/19/19.
//  Copyright © 2019 shashi. All rights reserved.
//

import Foundation

import Alamofire

class SHRestClient{

    
    @discardableResult
    private static func performRequest<T:Decodable>(route:APIRouteConfiguration, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T>)->Void) -> DataRequest {
        return AF.request(route)
            .responseDecodable (decoder: decoder){ (response: DataResponse<T>) in
                print("response = ")
                print(response.result)
                completion(response.result)
        }
    }
    
    
    static func login(email: String, password: String, completion:@escaping (Result<User>)->Void) {
        performRequest(route: UserEndPoints.login(email: email, password: password), completion: completion)
    }
    

    static func getJobs(authToken: String, completion:@escaping (Result<Jobs>)->Void) {
        performRequest(route: JobEndpoints.jobs(token: authToken), completion: completion)
    }
    
    static func getJobWorkItems(authToken: String, jobID : Int, completion:@escaping (Result<WorkItems>)->Void) {
        performRequest(route: JobEndpoints.workItems(authToken: authToken, jobID: jobID), completion: completion)
    }
    
    static func startJob(authToken: String, jobID : Int, noticeID : Int, comments : String, completion:@escaping (Result<User>)->Void) {
        performRequest(route: JobEndpoints.startJob(authToken: authToken, jobID: jobID, noticeID: noticeID, comments: "starting test job"), completion: completion)
    }
    
    
    
}

struct K {
    struct ProductionServer {
        static let baseURL = "https://dev-options-api.depotnet.co.uk/"
    }
    
   
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
