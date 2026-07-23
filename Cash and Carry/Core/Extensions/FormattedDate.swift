//
//  FormattedDate.swift
//  Cash and Carry
//
//  Created by Edil on 20/07/2026.
//

import Foundation

extension String {
    func formattedDate(
        from inputFormat: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ",
        to outputFormat: String = "MMMM dd, yyyy"
    ) -> String {
        
        let inputFormatter = DateFormatter()
        inputFormatter.locale = Locale(identifier: "en_US_POSIX")
        inputFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        inputFormatter.dateFormat = inputFormat
        
        guard let date = inputFormatter.date(from: self) else {
            return self
        }
        
        let outputFormatter = DateFormatter()
        outputFormatter.locale = Locale(identifier: "en_US_POSIX")
        outputFormatter.dateFormat = outputFormat
        
        return outputFormatter.string(from: date)
    }
    
    func formattedDateTime() -> String {
        
        let inputFormatter = DateFormatter()
        inputFormatter.locale = Locale(identifier: "en_US_POSIX")
        inputFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        
        guard let date = inputFormatter.date(from: self) else {
            return self
        }
        
        let outputFormatter = DateFormatter()
        outputFormatter.locale = Locale(identifier: "en_US_POSIX")
        outputFormatter.timeZone = .current
        outputFormatter.dateFormat = "MMM d, yyyy • h:mm a"
        
        return outputFormatter.string(from: date)
    }
}
