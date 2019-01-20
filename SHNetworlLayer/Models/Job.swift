//
//  Job.swift
//  SHNetworlLayer
//
//  Created by shashi on 1/20/19.
//  Copyright © 2019 shashi. All rights reserved.
//

import Foundation

typealias Jobs = [Job]

struct Job: Codable {
    let tmpid: String!
    let jobID: Int!
    let jobReferenceNumber: String!
    let contractID: Int!
    let contractName: String!
    let jobStatusID: Int!
    let jobStatusName, address: String!
    let workTypeID: Int!
    let workTypeName: String!
    let areaID: Int!
    let areaName, postcode, comments, description: String!
    let agentID: Int!
    let agentName: String!
    let rbd: String!
    let highwayAuthorityID: Int!
    let highwayAuthorityName, jobStartDate, jobEndDate, plannedJointingDate: String!
    let jobCategoryID : Int!
    let jobCategoryName: String!
    let roadTypeID: Int!
    let roadTypeName: String!
    let exchangeID : Int!
    let exchangeName: String!
    let gangID: Int!
    let scheduledStart, scheduledEnd: String!
    let isHotJob, isEmergencyJob: Bool!
    
    enum CodingKeys: String, CodingKey {
        case tmpid
        case jobID = "JobID"
        case jobReferenceNumber = "JobReferenceNumber"
        case contractID = "ContractID"
        case contractName = "ContractName"
        case jobStatusID = "JobStatusID"
        case jobStatusName = "JobStatusName"
        case address = "Address"
        case workTypeID = "WorkTypeID"
        case workTypeName = "WorkTypeName"
        case areaID = "AreaID"
        case areaName = "AreaName"
        case postcode = "Postcode"
        case comments = "Comments"
        case description = "Description"
        case agentID = "AgentID"
        case agentName = "AgentName"
        case rbd = "Rbd"
        case highwayAuthorityID = "HighwayAuthorityID"
        case highwayAuthorityName = "HighwayAuthorityName"
        case jobStartDate = "JobStartDate"
        case jobEndDate = "JobEndDate"
        case plannedJointingDate = "PlannedJointingDate"
        case jobCategoryID = "JobCategoryID"
        case jobCategoryName = "JobCategoryName"
        case roadTypeID = "RoadTypeID"
        case roadTypeName = "RoadTypeName"
        case exchangeID = "ExchangeID"
        case exchangeName = "ExchangeName"
        case gangID = "GangID"
        case scheduledStart = "ScheduledStart"
        case scheduledEnd = "ScheduledEnd"
        case isHotJob = "IsHotJob"
        case isEmergencyJob = "IsEmergencyJob"
    }
}
