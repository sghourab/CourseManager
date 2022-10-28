//
//  NotificationViewModel.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-10-26.
//

import FirebaseMessaging
import SwiftUI
import UserNotifications

class NotificationViewModel: ObservableObject {
    @Published var permission: UNAuthorizationStatus?
    @AppStorage("subscribedToAllNotifications") var subscribedToAllNotifications: Bool = false {
        didSet {
            if subscribedToAllNotifications {
                subscribeToAllTopics()
            } else {
                unsubscribeFromAllTopics()
            }
        }
    }
    
    func getNotificationsSettings() {
        UNUserNotificationCenter.current().getNotificationSettings { permission in
            DispatchQueue.main.async {
                self.permission = permission.authorizationStatus
            }
            
            if permission.authorizationStatus == .authorized {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
                if self.subscribedToAllNotifications {
                    self.subscribeToAllTopics()
                } else {
                    self.unsubscribeFromAllTopics()
                }
            } else {
                DispatchQueue.main.async {
                    UIApplication.shared.unregisterForRemoteNotifications()
                    UNUserNotificationCenter.current().removeAllDeliveredNotifications()
                }
                self.unsubscribeFromAllTopics()
            }
        }
    }
    
    private func subscribeToAllTopics() {
        guard permission == .authorized else {
            return
        }
        Messaging.messaging().subscribe(toTopic: "all") { error in
            if let error = error {
                print("Error wile subscribing to all topics", error)
                return
            }
            print("Subscribed to notifications for all topics")
        }
    }
    
    private func unsubscribeFromAllTopics() {
        Messaging.messaging().unsubscribe(fromTopic: "all") { error in
            if let error = error {
                print("Error wile unsubscribing from all topics", error)
                return
            }
            print("Unsubscribed from notifications for all topics")
        }
    }
}
