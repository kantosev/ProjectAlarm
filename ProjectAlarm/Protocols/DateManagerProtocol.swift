//
//  DateManagerProtocol.swift
//  ProjectAlarm
//
//  Created by Антон Кирилюк on 22.01.2023.
//

import Foundation


protocol DateManagerProtocol {
    func dateComponentsToDate(dateComponents: DateComponents) -> Date
    func dateToDateComponents(date: Date) -> DateComponents
}
