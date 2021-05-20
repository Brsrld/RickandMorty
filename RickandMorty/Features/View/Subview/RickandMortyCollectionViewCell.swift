import UIKit
import Kingfisher

class RickandMortyCollectionViewCell: UICollectionViewCell {
    
//MARK: UI Components
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameIcon: UIImageView!
    @IBOutlet weak var statusIcon: UIImageView!
    @IBOutlet weak var speciesIcon: UIImageView!
    @IBOutlet weak var genderIcon: UIImageView!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius  = 10
        imageView.layer.cornerRadius = layer.cornerRadius
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 1, height: 1)
    }
    
//MARK: UI Functions
    
    func configure (with name: String, with status: String, with species: String, with gender: String,with image:URL) {
        nameLabel.text = name
        statusLabel.text = status
        speciesLabel.text = species
        genderLabel.text = gender
        imageView.kf.setImage(with: image)
        nameIcon.image = #imageLiteral(resourceName: "id-card")
        statusIcon.image = #imageLiteral(resourceName: "lifeline-hand-drawn-status-line")
        speciesIcon.image = #imageLiteral(resourceName: "alien")
        genderIcon.image = #imageLiteral(resourceName: "equality")
    }
}

