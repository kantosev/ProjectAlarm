//
//  MainViewModel.swift
//  ProjectAlarm
//
//  Created by Антон Кирилюк on 20.01.2023.
//

import Foundation

class MainViewModel: MainViewModelProtocol {
    
    func numberOfItemsInSection() -> Int {
        return 4
    }
    
    func setOfCell(cell: AlarmCell, with indexPath: IndexPath) {
        cell.alarmTitle.text = "07:55"
        cell.alarmSubtitle.text = "Будильник, каждый будний день"
    }
    
}
