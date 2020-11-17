//
//  GroupsTVC.swift
//  Second_homework_task
//
//  Created by Nihad on 11/1/20.
//

import UIKit

class GroupsTVC: UITableViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    var groups = [VkGroup(title: "iOS Dev", avatarPath: "iOSDev"),
                  VkGroup(title: "TED Talks", avatarPath: "TEDTalks"),
                  VkGroup(title: "Science", avatarPath: "Science")]
    var filteredData = [VkGroup]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filteredData = groups
        searchBar.showsCancelButton = true
        (searchBar.value(forKey: "searchField") as? UITextField)?.clearButtonMode = .never
    }

    
    @IBAction func switchToGlobalGroups(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let globalGroupsTVC = storyboard.instantiateViewController(withIdentifier: "GlobalGroups")
        self.navigationController?.pushViewController(globalGroupsTVC, animated: true)
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as! GroupTableViewCell
        cell.titleLabel.text = filteredData[indexPath.row].title
        cell.avatarImageView.image = UIImage(named: filteredData[indexPath.row].avatarPath)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        self.groups.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
      }
    }
}

extension GroupsTVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        
        if searchText == "" {
            filteredData = groups
            searchBar.endEditing(true)
            tableView.reloadData()
        } else {
            for vkGroup in groups {
                if vkGroup.title.lowercased().contains(searchText.lowercased()) {
                    filteredData.append(vkGroup)
                }
            }
        }
        self.tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        searchBar.text = ""
        filteredData = groups
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        searchBar.text = ""
        filteredData = groups
        tableView.reloadData()
    }
}
