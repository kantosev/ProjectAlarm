//
//  AlarmModel.swift
//  ProjectAlarm
//
//  Created by Антон Кирилюк on 23.01.2023.
//

import Foundation


struct AlarmModel: Codable {
    var id: String
    var dateComponents: DateComponents
    var enabled: Bool = true
}




