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
        board.getPendingNotificationRequests(completionHandler: completionHandler)
    }
    
    /// Get delivered notifications
    static func getDeliveredNotifications(
        completionHandler: @escaping ([UNNotification]) -> Void
    ) {
        board.getDeliveredNotifications(completionHandler: completionHandler)
    }
}
#endif
