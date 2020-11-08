//
//  FriendsTableViewCell.swift
//  Third_homework_task
//
//  Created by Nihad on 11/2/20.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    @IBOutlet weak var customView: CustomView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var favouriteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }    
}
