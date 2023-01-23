//
//  DateManager.swift
//  ProjectAlarm
//
//  Created by Антон Кирилюк on 22.01.2023.
//

import Foundation


class DateManager: DateManagerProtocol {
    
    private let calendar = Calendar.current
    
    func dateComponentsToDate(dateComponents: DateComponents) -> Date {
        guard let date = calendar.date(from: dateComponents) else { return Date() }
        return date
    }
    func dateToDateComponents(date: Date) -> DateComponents {
        let dateComponents = calendar.dateComponents(in: calendar.timeZone, from: date)
        return dateComponents
    }
    
    
}
