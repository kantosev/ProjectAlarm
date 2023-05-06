//
//  MainViewModel.swift
//  ProjectAlarm
//
//  Created by Антон Кирилюк on 20.01.2023.
//

import Foundation
import UIKit

class MainViewModel: MainViewModelProtocol {
    
    private let userDefaults = UserDefaults.standard
    private let dateManager: DateManagerProtocol? = DateManager()
    private let notificationManager: NotificationManagerProtocol = NotificationManager()
    
    
    func numberOfItemsInSection() -> Int {
        guard let arrayOfAlarms = userDefaults.getCodableObject(dataType: [AlarmModel].self, key: "alarms") else { return 0 }
        return arrayOfAlarms.count
        
    }
    
    func setOfCell(cell: AlarmCell, with indexPath: IndexPath) {
        cell.editingAccessoryType = .disclosureIndicator
        guard let arrayDateOfAlarms = userDefaults.getCodableObject(dataType: [AlarmModel].self, key: "alarms") else { return }
        // Включение UISwitch
        let cellSwitch = cell.accessoryView as? UISwitch
        cellSwitch?.isOn = arrayDateOfAlarms[indexPath.row].enabled
        
        let dateComponents = arrayDateOfAlarms[indexPath.row].dateComponents
        guard let hour = dateComponents.hour, let minute = dateComponents.minute else { return }
        
        //         Добавление нулей в числа, чтобы не отображалось как 0:0
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
        
        var arrayOfAlarm = userDefaults.getCodableObject(dataType: [AlarmModel].self, key: "alarms")
        if arrayOfAlarm == nil {
            let alarms = [AlarmModel(id: getIdentifier(from: dateComponents), dateComponents: dateComponents)]
            userDefaults.setCodableObject(alarms, forKey: "alarms")
        } else {
            arrayOfAlarm?.append(AlarmModel(id: getIdentifier(from: dateComponents), dateComponents: dateComponents))
            userDefaults.setCodableObject(arrayOfAlarm, forKey: "alarms")
        }
        let newDateComponents = DateComponents(hour: dateComponents.hour, minute: dateComponents.minute)
        notificationManager.addNotification(with: newDateComponents)
    }
    
    func addNotification(with index: Int) {
        let array = userDefaults.getCodableObject(dataType: [AlarmModel].self, key: "alarms")
        let dateComponents = array?[index].dateComponents
        // оставляю только часы и минуты, потому что со всей информацией почему то не работает
        let newDateComponents = DateComponents(hour: dateComponents?.hour, minute: dateComponents?.minute)
        notificationManager.addNotification(with: newDateComponents)
    }
    func deleteNotification(with index: Int) {
        let array = userDefaults.getCodableObject(dataType: [AlarmModel].self, key: "alarms")
        let dateComponents = array?[index].dateComponents
        let newDateComponents = DateComponents(hour: dateComponents?.hour, minute: dateComponents?.minute)
        notificationManager.deleteNotification(with: newDateComponents)
    }
    
    private func getIdentifier(from dateComponents: DateComponents) -> String {
        let dateIdentifier = Date.now
        guard let hour = dateComponents.hour, let minute = dateComponents.minute else { return "" }
        let firstPath = "\(hour)"
        let twoPath = "\(minute)"
        return firstPath + twoPath + "\(dateIdentifier)"
    }
    
    func editEnabledValueInAlarm(with index: Int, enabled: Bool) {
        var arrayOfAlarm = userDefaults.getCodableObject(dataType: [AlarmModel].self, key: "alarms")
        arrayOfAlarm?[index].enabled = enabled
        userDefaults.setCodableObject(arrayOfAlarm, forKey: "alarms")
    }
    
}
