//
//  User.swift
//  RandomUser
//
//  Created by David Granger on 7/14/23.
//

import Foundation

struct newUser: Codable, Hashable {
    let name: String
    let uuid: UUID
}
