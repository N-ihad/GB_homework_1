//
//  GroupsTVC.swift
//  Second_homework_task
//
//  Created by Nihad on 11/1/20.
//

import UIKit

class GroupsTVC: UITableViewController {
    
    let groups = ["iOS Dev", "TED Talks", "Science"]

    override func viewDidLoad() {
        super.viewDidLoad()

        
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
        return groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath)
        cell.textLabel?.text = groups[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
