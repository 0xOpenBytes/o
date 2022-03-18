//
//  NotificationGet.swift
//  
//
//  Created by Leif on 3/15/22.
//

#if canImport(UserNotifications)
import UserNotifications

public extension o.notification {
    /// Get pending notifications
    static func getPendingNotification(
        completionHandler: @escaping ([UNNotificationRequest]) -> Void
    ) {
        center.getPendingNotificationRequests(completionHandler: completionHandler)
    }
    
    /// Get delivered notifications
    static func getDeliveredNotifications(
        completionHandler: @escaping ([UNNotification]) -> Void
    ) {
        center.getDeliveredNotifications(completionHandler: completionHandler)
    }
}
#endif
