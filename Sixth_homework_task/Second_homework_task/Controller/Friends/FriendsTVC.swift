//
//  FriendsTVC.swift
//  Second_homework_task
//
//  Created by Nihad on 11/1/20.
//

import UIKit

class FriendsTVC: UITableViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    let friends = [User(name: "Pasha Durov", photosPath: ["image", "image1"], avatarPath: "PashaDurov"),
                   User(name: "Elon Musk", photosPath: ["image2", "image3", "image4", "image5", "image6"], avatarPath: "ElonMusk"),
                   User(name: "Jeff Bezos", photosPath: ["image7"], avatarPath: "JeffBezos"),
                   User(name: "Vanya Bartalamey", photosPath: ["image7"], avatarPath: "ElonMusk")]
    var filteredData = [User]()
    var firstLastnameLetters = [Character]()
    var dict: [Character: [User]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        firstLastnameLetters = firstLettersFromUsers(users: friends)
        searchBar.showsCancelButton = true
        (searchBar.value(forKey: "searchField") as? UITextField)?.clearButtonMode = .never
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return searchBar.isFirstResponder ? 1 : firstLastnameLetters.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if searchBar.isFirstResponder {
            return "Found"
        }
        return String(firstLastnameLetters[section])
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchBar.isFirstResponder {
            return filteredData.count
        }
        return dict[firstLastnameLetters[section]]!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendsTableViewCell
        cell.delegate = self
        var user: User!
        if searchBar.isFirstResponder {
            user = filteredData[indexPath.row]
        } else {
            user = getUserByIndPath(indPath: indexPath)
        }
        let img = UIImage(named: user.avatarPath)
        let imgView = UIImageView(image: img!)
        adjustingViewsAppearance(cell: cell, imgView: imgView)
        cell.fullNameLabel.text = user.name
        cell.likesCounterLabel.text = String(user.howManyLikes)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let friendPhotosVC = storyboard.instantiateViewController(withIdentifier: "FriendPhotos") as! FriendPhotosCollectionVC
        friendPhotosVC.photosPath = getUserByIndPath(indPath: indexPath).photosPath
        self.navigationController?.pushViewController(friendPhotosVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
}

extension FriendsTVC: MyCellDelegate {
    func didTapLikeButtonInside(cell: FriendsTableViewCell) {
        let indPath = tableView.indexPath(for: cell)
        let user = getUserByIndPath(indPath: indPath!)
        user.isLiked = !user.isLiked
        if user.isLiked {
            user.howManyLikes += 1
            
        } else {
            user.howManyLikes -= 1
        }
        tableView.reloadData()
    }
    
    func didTapFavouriteButtonInside(cell: FriendsTableViewCell) {
        let indPath = tableView.indexPath(for: cell)
        let user = getUserByIndPath(indPath: indPath!)
        user.isFavourite = !user.isFavourite
    }
    
    
}

extension FriendsTVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        
        if searchText == "" {
            filteredData = friends
            searchBar.endEditing(true)
            tableView.reloadData()
        }
        
        for user in friends {
            if user.name.lowercased().contains(searchText.lowercased()) {
                filteredData.append(user)
            }
        }
        
        self.tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        searchBar.text = ""
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        searchBar.text = ""
        tableView.reloadData()
    }
}

extension FriendsTVC {
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
    
    func firstLettersFromUsers(users: [User]) -> [Character] {
        var letters = Set<Character>()
        for user in users {
            let letter = user.name.wordList[1].prefix(1).first!
            dict[letter, default: [User]()].append(user)
            letters.insert(user.name.wordList[1].prefix(1).first!)
            
        }
        var lettersArr = Array(letters)
        lettersArr.sort()
        
        return lettersArr
    }
    
    func getUsersByIndPath(indPath: IndexPath) -> [User] {
        return dict[firstLastnameLetters[indPath.section]]!
    }
    
    func getUserByIndPath(indPath: IndexPath) -> User {
        return dict[firstLastnameLetters[indPath.section]]![indPath.row]
    }
}
