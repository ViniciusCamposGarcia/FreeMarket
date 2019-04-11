//
//  Date+Extensions.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 07/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation

extension Date {
    
    static func fromFormattedString(_ dateString: String) -> Date? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.locale = Locale(identifier: "pt_BR")
        return dateFormatter.date(from: dateString)
    }
}
