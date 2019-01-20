//
//  WorkItems.swift
//  SHNetworlLayer
//
//  Created by shashi on 1/20/19.
//  Copyright © 2019 shashi. All rights reserved.
//

import Foundation

typealias WorkItems = [WorkItem]

struct WorkItem: Codable {
    let jobItemID, jobID, rateID: Int?
    let productName, productDescription, category: String?
    let invoicePriceLevel: Int?
    let price: Double?
    let quantity: Int?
    let total: Double?
    let dateCreated: String?
    let addedByUserID: Int?
    let temporaryID: String?
    let message : String?
    enum CodingKeys: String, CodingKey {
        case jobItemID = "JobItemID"
        case jobID = "JobID"
        case rateID = "RateID"
        case productName = "ProductName"
        case productDescription = "ProductDescription"
        case category = "Category"
        case invoicePriceLevel = "InvoicePriceLevel"
        case price = "Price"
        case quantity = "Quantity"
        case total = "Total"
        case dateCreated = "DateCreated"
        case addedByUserID = "AddedByUserID"
        case temporaryID = "TemporaryID"
        case message  = "Message"
    }
}
