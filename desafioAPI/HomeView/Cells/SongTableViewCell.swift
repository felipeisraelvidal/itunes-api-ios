//
//  TableViewCell.swift
//  desafioAPI
//
//  Created by Rogério Tavares on 19/03/22.
//

import UIKit

class SongTableViewCell: UITableViewCell {

    @IBOutlet var imageview: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    static let identifier = "SongTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with model: Song) {
        
    }
}
