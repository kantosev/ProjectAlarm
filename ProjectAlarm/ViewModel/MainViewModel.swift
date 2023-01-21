//
//  MainViewModel.swift
//  ProjectAlarm
//
//  Created by Антон Кирилюк on 20.01.2023.
//

import Foundation

class MainViewModel: MainViewModelProtocol {
    
    private var arrayOfAlarm: [DateComponents] = []
    
    
    func numberOfItemsInSection() -> Int {
        return arrayOfAlarm.count
        
    }
    
    func setOfCell(cell: AlarmCell, with indexPath: IndexPath) {
        let date = arrayOfAlarm[indexPath.row]
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
    func addDateToArratOfAlarm(date: DateComponents) {
        arrayOfAlarm.append(date)
    }
    
    

}
