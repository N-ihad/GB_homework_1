//
//  User.swift
//  Second_homework_task
//
//  Created by Nihad on 11/2/20.
//

import Foundation

class User {
    var name: String
    var photosPath: [String]
    var avatarPath: String
    var isLiked = false
    var isFavourite = false
    var howManyLikes = 0
    
    init(name: String, photosPath: [String], avatarPath: String) {
        self.name = name
        self.photosPath = photosPath
        self.avatarPath = avatarPath
    }
}


extension String {
    var wordList: [String] {
        return components(separatedBy: CharacterSet.alphanumerics.inverted).filter { !$0.isEmpty }
    }
}
