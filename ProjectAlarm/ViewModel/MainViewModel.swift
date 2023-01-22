//
//  MainViewModel.swift
//  ProjectAlarm
//
//  Created by Антон Кирилюк on 20.01.2023.
//

import Foundation

class MainViewModel: MainViewModelProtocol {
    
//    private var arrayOfAlarm: [DateComponents] = []
    private let userDefaults = UserDefaults.standard
    private let dateManager: DateManagerProtocol? = DateManager()
    
    
    func numberOfItemsInSection() -> Int {
        guard let arrayOfAlarms = userDefaults.array(forKey: "alarms") else { return 0 }
        return arrayOfAlarms.count
        
    }
    
    func setOfCell(cell: AlarmCell, with indexPath: IndexPath) {
        guard let arrayDateOfAlarms = userDefaults.array(forKey: "alarms") as? [Date] else { return }
        guard let date = dateManager?.dateToDateComponents(date: arrayDateOfAlarms[indexPath.row]) else { return }

        guard let hour = date.hour, let minute = date.minute else { return }
        // Добавление нулей в числа, чтобы не отображалось как 0:0
        if (0...9).contains(hour), (0...9).contains(minute) {
            cell.alarmTitle.text = "0" + "\(hour)" + ":" + "0" + "\(minute)"
        } else if (0...9).contains(hour) {
            cell.alarmTitle.text = "0" + "\(hour)" + ":" + "\(minute)"
        } else if (0...9).contains(minute) {
            cell.alarmTitle.text = "\(hour)" + ":" + "0" + "\(minute)"
        } else {
            cell.alarmTitle.text = "\(hour)" + ":" + "\(minute)"
        }
    }
   
    
    func addDateToArrayOfAlarm(dateComponents: DateComponents) {
        guard let alarmDate = dateManager?.dateComponentsToDate(dateComponents: dateComponents) else { return }
        var arrayOfAlarm = userDefaults.array(forKey: "alarms")
        if arrayOfAlarm == nil {
            let alarms = [alarmDate]
            userDefaults.set(alarms, forKey: "alarms")
        } else {
            arrayOfAlarm?.append(alarmDate)
            userDefaults.set(arrayOfAlarm, forKey: "alarms")
        }
    }
    
    

}
