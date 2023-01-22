//
//  NotificationManager.swift
//  ProjectAlarm
//
//  Created by Антон Кирилюк on 22.01.2023.
//

import Foundation
import UserNotifications

class NotificationManager {
    let center = UNUserNotificationCenter.current()
    
    func addNotification(with dateComponents: DateComponents) {
        let content = UNMutableNotificationContent()
        content.title = "Будильник"
        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "alarmSound.mp3"))
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(identifier: "alarm", content: content, trigger: trigger)
        center.add(request)
    }
    
}


