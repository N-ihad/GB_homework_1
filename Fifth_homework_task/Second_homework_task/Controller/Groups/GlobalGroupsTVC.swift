//
//  GlobalGroupsTVC.swift
//  Second_homework_task
//
//  Created by Nihad on 11/1/20.
//

import UIKit

class GlobalGroupsTVC: UITableViewController {
    
    let globalGroups = [VkGroup(title: "KFC", avatarPath: "KFC"),
                        VkGroup(title: "Sport", avatarPath: "Sport"),
                        VkGroup(title: "Humour", avatarPath: "Humour"),
                        VkGroup(title: "Travelling", avatarPath: "Travelling"),
                        VkGroup(title: "Books", avatarPath: "Books")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return globalGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GlobalGroupCell", for: indexPath) as! GroupTableViewCell
        cell.titleLabel.text = globalGroups[indexPath.row].title
        cell.avatarImageView.image = UIImage(named: globalGroups[indexPath.row].avatarPath)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
