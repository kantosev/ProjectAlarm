//
//  AppDelegate.swift
//  ProjectAlarm
//
//  Created by Антон Кирилюк on 20.01.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

   

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { _, _ in
        }
//        let center = UNUserNotificationCenter.current()
//        let content = UNMutableNotificationContent()
//        content.title = "Пробное уведомление"
//        content.body = "Тело уведомления"
//        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "alarmSound.mp3"))
//
//
//        var date = DateComponents()
//        date.hour = 21
//        date.minute = 37
//        date.second = 00
//        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
//        let trigger4 = UNTimeIntervalNotificationTrigger(timeInterval: 6, repeats: false)
//        var date2 = DateComponents()
//        date2.hour = 21
//        date2.minute = 37
//        date2.second = 31
//        let trigger2 = UNCalendarNotificationTrigger(dateMatching: date2, repeats: true)
//        var date3 = DateComponents()
//        date3.hour = 21
//        date3.minute = 38
//        date3.second = 02
//        let trigger3 = UNCalendarNotificationTrigger(dateMatching: date3, repeats: true)
//        let request = UNNotificationRequest(identifier: "heh", content: content, trigger: trigger)
//        let request2 = UNNotificationRequest(identifier: "heh2", content: content, trigger: trigger2)
//        let request3 = UNNotificationRequest(identifier: "heh3", content: content, trigger: trigger3)
//        center.add(request)
//        center.add(request2)
//        center.add(request3)
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

