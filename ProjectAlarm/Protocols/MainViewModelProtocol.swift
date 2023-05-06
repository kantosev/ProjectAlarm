//
//  MainViewModelProtocol.swift
//  ProjectAlarm
//
//  Created by Антон Кирилюк on 20.01.2023.
//

import Foundation


protocol MainViewModelProtocol {
    func numberOfItemsInSection() -> Int
    func setOfCell(cell: AlarmCell, with indexPath: IndexPath)
    func addDateToArrayOfAlarm(dateComponents: DateComponents)
    func addNotification(with index: Int)
    func deleteNotification(with index: Int)
    func editEnabledValueInAlarm(with index: Int, enabled: Bool)
}
