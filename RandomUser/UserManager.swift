//
//  UserManager.swift
//  RandomUser
//
//  Created by David Granger on 7/14/23.
//

import Foundation
import CoreData

class UserManager {
    static let shared = UserManager()
    
    static var allUsers = [User]()
    let didAddUserNotification = Notification.Name("didAddUserNotification")
    private let shared = PersistenceController.shared
    private let context = PersistenceController.shared.viewContext
    
    func retrieveUsers() -> [User]? {
        do {
            let usersArray = try context.fetch(User.fetchRequest())
            return usersArray
        } catch {
            print("Failed to fetch users from CoreData: \(error)")
            return nil
        }
    }
    
    func removeUser(_ user: User) {
        context.delete(user)
        shared.saveContext()
    }
    
    func createUser(_ user: newUser) {
        let createdUser = User(context: context)
        createdUser.name = user.name
        shared.saveContext()
        NotificationCenter.default.post(name: didAddUserNotification, object: nil)
    }
    
}
