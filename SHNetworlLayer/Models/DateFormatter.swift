//
//  DateFormatter.swift
//  SHNetworlLayer
//
//  Created by shashi on 1/19/19.
//  Copyright © 2019 shashi. All rights reserved.
//

import Foundation
extension DateFormatter {
    static var articleDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }
}
