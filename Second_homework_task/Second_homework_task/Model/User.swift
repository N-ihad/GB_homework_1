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
    
    init(name: String, photosPath: [String]) {
        self.name = name
        self.photosPath = photosPath
    }
}
