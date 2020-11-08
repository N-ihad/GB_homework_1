//
//  FriendsTVC.swift
//  Second_homework_task
//
//  Created by Nihad on 11/1/20.
//

import UIKit

class FriendsTVC: UITableViewController {
    let friends = [User(name: "Pasha Durov", photosPath: ["image", "image1"], avatarPath: "PashaDurov"),
                   User(name: "Elon Musk", photosPath: ["image2", "image3", "image4", "image5", "image6"], avatarPath: "ElonMusk"),
                   User(name: "Jeff Bezos", photosPath: ["image7"], avatarPath: "JeffBezos")]

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func likeFriend(_ btn: UIButton) {
        friends[btn.tag].isLiked = !friends[btn.tag].isLiked
        btn.isSelected = btn.isSelected ? false : true
    }
    
    @IBAction func addFriendToFavourites(_ btn: UIButton) {
        friends[btn.tag].isFavourite = !friends[btn.tag].isFavourite
        btn.isSelected = btn.isSelected ? false : true
    }
    func adjustingViewsAppearance(cell: FriendsTableViewCell, imgView: UIImageView) {
        imgView.frame = cell.customView.frame
        imgView.bounds = cell.customView.bounds
        cell.customView.addSubview(imgView)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.leadingAnchor.constraint(equalTo: cell.customView.leadingAnchor).isActive = true
        imgView.trailingAnchor.constraint(equalTo: cell.customView.trailingAnchor).isActive = true
        imgView.topAnchor.constraint(equalTo: cell.customView.topAnchor).isActive = true
        imgView.bottomAnchor.constraint(equalTo: cell.customView.bottomAnchor).isActive = true
        
        cell.customView.backgroundColor = UIColor.clear
        cell.customView.layer.shadowColor = UIColor.black.cgColor
        cell.customView.layer.shadowOffset = CGSize(width: 0, height: 3)
        cell.customView.layer.shadowOpacity = 0.7
        cell.customView.layer.shadowRadius = 4.0
        imgView.frame = cell.customView.bounds
        imgView.layer.cornerRadius = imgView.layer.frame.size.width / 2
        imgView.layer.masksToBounds = true
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendsTableViewCell
        let img = UIImage(named: friends[indexPath.row].avatarPath)
        let imgView = UIImageView(image: img!)
        adjustingViewsAppearance(cell: cell, imgView: imgView)
        cell.fullNameLabel.text = friends[indexPath.row].name
        cell.likeButton.tag = indexPath.row
        cell.favouriteButton.tag = indexPath.row
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let friendPhotosVC = storyboard.instantiateViewController(withIdentifier: "FriendPhotos") as! FriendPhotosCollectionVC
        friendPhotosVC.photosPath = friends[indexPath.row].photosPath
        self.navigationController?.pushViewController(friendPhotosVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
}
