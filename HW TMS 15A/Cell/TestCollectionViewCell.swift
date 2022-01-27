import UIKit

protocol TestCollectionViewCellDelegate: AnyObject {
    func likeOrDislike(photoName: String)
    func commentAction(photoName: String)
    func shareAction()
}

final class TestCollectionViewCellModel {
    let photoImage: UIImage?
    let photoName: String
    var isLiked: Bool
    var commentString: String?
    
    init(imageString: String, commentString: String? = nil) {
        photoName = imageString
        isLiked = false
        photoImage = UIImage(named: imageString)
        
        self.commentString = commentString
        
    }
}

final class TestCollectionViewCell: UICollectionViewCell {
    static let identifier = "kTestCollectionViewCell"
    @IBOutlet weak var setupWithPhoto: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentLabel: UILabel!
    
    private var isLiked: Bool = false
    private var photoName = ""
    
    weak var delegate: TestCollectionViewCellDelegate?
    
    func setupWith(model: TestCollectionViewCellModel) {
        photoName = model.photoName
        setupWithPhoto.image = model.photoImage
        isLiked = model.isLiked
        
        commentLabel.text = model.commentString
        
        let buttonLikeImage = UIImage(systemName: isLiked ? "heart.fill" : "heart")
        likeButton.setImage(buttonLikeImage, for: .normal)
    }
}
// MARK: - Buttons
extension TestCollectionViewCell {
    @IBAction func likeButtonAction(_ sender: Any) {
        delegate?.likeOrDislike(photoName: photoName)
    }
    
    @IBAction func commentAction(_ sender: Any) {
        delegate?.commentAction(photoName: photoName)
    }
    
    @IBAction func shateAction(_ sender: Any) {
        delegate?.shareAction()
    }
}
