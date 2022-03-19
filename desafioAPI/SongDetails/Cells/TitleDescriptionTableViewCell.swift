//
//  TitleDescriptionTableViewCell.swift
//  desafioAPI
//
//  Created by SP12442 on 19/03/22.
//

import UIKit

class TitleDescriptionTableViewCell: UITableViewCell {
    
    static let identifier = "TitleDescriptionTableViewCell"
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with model: SongDetailRow) {
        titleLabel.text = model.title
        descriptionLabel.text = model.description
    }
    
}
