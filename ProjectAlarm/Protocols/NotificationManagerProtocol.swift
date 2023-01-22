//
//  NotificationManagerProtocol.swift
//  ProjectAlarm
//
//  Created by Антон Кирилюк on 22.01.2023.
//

import Foundation

protocol NotificationManagerProtocol {
    func addNotification(with dateComponents: DateComponents)
    func deleteNotification(with dateComponents: DateComponents)
}
