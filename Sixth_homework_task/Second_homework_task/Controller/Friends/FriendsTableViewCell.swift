//
//  FriendsTableViewCell.swift
//  Third_homework_task
//
//  Created by Nihad on 11/2/20.
//

import UIKit

protocol MyCellDelegate {
    func didTapLikeButtonInside(cell: FriendsTableViewCell)
    func didTapFavouriteButtonInside(cell: FriendsTableViewCell)
}

class FriendsTableViewCell: UITableViewCell {
    @IBOutlet weak var customView: CustomView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var likesCounterLabel: UILabel!
    var delegate: MyCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func addFriendToFavourites(_ btn: UIButton) {
        btn.isSelected = btn.isSelected ? false : true
        delegate?.didTapFavouriteButtonInside(cell: self)
    }
    
    @IBAction func likeFriend(_ btn: UIButton) {
        btn.isSelected = btn.isSelected ? false : true
        delegate?.didTapLikeButtonInside(cell: self)
    }
}
