//
//  ViewController.swift
//  SHNetworlLayer
//
//  Created by shashi on 1/19/19.
//  Copyright © 2019 shashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func doLoingAction(_ sender: Any) {
        // Test Login request
        self.doLogin()
    }
    
    @IBAction func loadArticlesAction(_ sender: Any) {
        // Test getArticles request
      // self.getJobs()
        //self.getWorkItems()
        self.startJob()
    }
    
    func doLogin() {
        SHRestClient.login(email: "apptestoperative", password: "cheese") { result in
            switch result {
            case .success(let user):
                print("_____________________________")
                print(user)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
    
    func getJobs(){
        
        SHRestClient.getJobs(authToken: "860460f5-e222-4b29-89ff-c44b324b8742") { (result) in
            switch result {
            case .success(let jobs):
                print("_____________________________")
                print(jobs)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    
    }
    func getWorkItems(){
        
        SHRestClient.getJobWorkItems(authToken: "860460f5-e222-4b29-89ff-c44b324b8742", jobID: 1) { (result) in
            switch result {
            case .success(let workItems):
                print("_____________________________")
                print(workItems)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
    func startJob(){
        
        SHRestClient.startJob(
        authToken: "860460f5-e222-4b29-89ff-c44b324b8742",
        jobID: 0,
        noticeID: 1,
        comments: "Starting test job") { (result) in
            switch result {
            case .success(let josStatus):
                print("_____________________________")
                print(josStatus)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
}

