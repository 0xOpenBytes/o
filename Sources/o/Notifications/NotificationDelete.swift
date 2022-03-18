//
//  NotificationDelete.swift
//  
//
//  Created by Leif on 3/15/22.
//

#if canImport(UserNotifications)
import UserNotifications

public extension o.notification {
    static func deleteDeliveredNotifications(
        identifiers: [String]
    ) {
        board.removeDeliveredNotifications(withIdentifiers: identifiers)
    }
    
    static func deletePendingNotifications(
        identifiers: [String]
    ) {
        board.removePendingNotificationRequests(withIdentifiers: identifiers)
    }
    
    static func delete(
        identifiers: [String]
    ) {
        deleteDeliveredNotifications(identifiers: identifiers)
        deletePendingNotifications(identifiers: identifiers)
    }
}
#endif
