//
//  NotificationDelete.swift
//  
//
//  Created by Leif on 3/15/22.
//

#if canImport(UserNotifications)
import UserNotifications

public extension o.notification {
    /// Delete delivered notifications
    static func deleteDeliveredNotifications(
        identifiers: [String]
    ) {
        board.removeDeliveredNotifications(withIdentifiers: identifiers)
    }
    
    /// Delete pending notifications
    static func deletePendingNotifications(
        identifiers: [String]
    ) {
        board.removePendingNotificationRequests(withIdentifiers: identifiers)
    }
    
    // Delete delivered and pending notifications
    static func delete(
        identifiers: [String]
    ) {
        deleteDeliveredNotifications(identifiers: identifiers)
        deletePendingNotifications(identifiers: identifiers)
    }
}
#endif
