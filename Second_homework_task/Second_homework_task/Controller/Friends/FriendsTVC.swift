//
//  FriendsTVC.swift
//  Second_homework_task
//
//  Created by Nihad on 11/1/20.
//

import UIKit

class FriendsTVC: UITableViewController {
    let friends = [User(name: "Pasha Durov", photosPath: ["image", "image1"]),
                   User(name: "Elon Musk", photosPath: ["image2", "image3", "image4", "image5", "image6"]),
                   User(name: "Jeff Bezos", photosPath: ["image7"])]

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath)
        cell.textLabel?.text = friends[indexPath.row].name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let friendPhotosVC = storyboard.instantiateViewController(withIdentifier: "FriendPhotos") as! FriendPhotosCollectionVC
        friendPhotosVC.photosPath = friends[indexPath.row].photosPath
        self.navigationController?.pushViewController(friendPhotosVC, animated: true)
    }
    
    
}
