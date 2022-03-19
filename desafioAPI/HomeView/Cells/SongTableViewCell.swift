import UIKit

class SongTableViewCell: UITableViewCell {

    @IBOutlet var imageview: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    static let identifier = "SongTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Public methods
    
    func configure(with model: Song) {
        titleLabel.text = model.collectionName
        descriptionLabel.text = model.trackName
        
        activityIndicator.startAnimating()
        imageView?.downloaded(from: URL(string: model.artwork)!) {
            self.activityIndicator.stopAnimating()
        }
    }
    
}
