//
//  Article.swift
//  study02
//
//  Created by 殿谷将人 on 2021/07/26.
//

import Foundation

struct Article: Codable {
    let title: String
    let user: User
    struct User: Codable {
            var name: String
        }
}
