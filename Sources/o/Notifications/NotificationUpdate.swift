//
//  NotificationUpdate.swift
//  
//
//  Created by Leif on 3/15/22.
//

#if canImport(UserNotifications)
import UserNotifications

public extension o.notification {
    static func update(
        request: UNNotificationRequest,
        withCompletionHandler completionHandler: ((Error?) -> Void)? = nil
    ) {
        delete(identifiers: [request.identifier])
        post(request: request, withCompletionHandler: completionHandler)
    }
    
    static func update(
        id: String = UUID().uuidString,
        categoryIdentifier: String = UUID().uuidString,
        threadIdentifier: String = UUID().uuidString,
        title: String,
        subtitle: String,
        body: String,
        badge: Int = 0,
        sound: UNNotificationSound = .default,
        attachments: [UNNotificationAttachment] = [],
        trigger: UNNotificationTrigger?,
        withCompletionHandler completionHandler: ((Error?) -> Void)? = nil
    ) {
        delete(identifiers: [id])
        post(
            id: id,
            categoryIdentifier: categoryIdentifier,
            threadIdentifier: threadIdentifier,
            title: title,
            subtitle: subtitle,
            body: body,
            badge: badge,
            sound: sound,
            attachments: attachments,
            trigger: trigger,
            withCompletionHandler: completionHandler
        )
    }
}
#endif
