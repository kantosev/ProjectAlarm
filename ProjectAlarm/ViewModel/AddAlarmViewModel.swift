//
//  AddAlarmViewModel.swift
//  ProjectAlarm
//
//  Created by Антон Кирилюк on 22.01.2023.
//

import Foundation

class AddAlarmViewModel: AddAlarmViewModelProtocol {
    
    private let dateManager: DateManagerProtocol = DateManager()
    
    func dateToDateComponents(date: Date) -> DateComponents {
        return dateManager.dateToDateComponents(date: date)
    }
}
