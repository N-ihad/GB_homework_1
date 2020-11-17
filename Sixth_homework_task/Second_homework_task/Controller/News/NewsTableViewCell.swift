//
//  NewsTableViewCell.swift
//  Third_homework_task
//
//  Created by Nihad on 11/17/20.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var posterNameLabel: UILabel!
    
    @IBOutlet weak var postDescriptionTextView: UITextView!
    @IBOutlet weak var postImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
