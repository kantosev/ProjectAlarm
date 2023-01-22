//
//  NotificationManager.swift
//  ProjectAlarm
//
//  Created by Антон Кирилюк on 22.01.2023.
//

import Foundation
import UserNotifications

class NotificationManager: NotificationManagerProtocol {
    private let center = UNUserNotificationCenter.current()
    
    func addNotification(with dateComponents: DateComponents) {
        let identifier = getIdentifier(from: dateComponents)
        let content = UNMutableNotificationContent()
        content.title = "Будильник"
        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "alarmSound.mp3"))
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        center.add(request)
      
    }
    func deleteNotification(with dateComponents: DateComponents) {
        let identifier = getIdentifier(from: dateComponents)
        center.removePendingNotificationRequests(withIdentifiers: [identifier])
    }
    
    private func getIdentifier(from dateComponents: DateComponents) -> String {
        guard let hour = dateComponents.hour, let minute = dateComponents.minute else { return "" }
        let firstPath = "\(hour)"
        let twoPath = "\(minute)"
        return firstPath + twoPath
    }
}



