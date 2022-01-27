import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var dataSource: [TestCollectionViewCellModel] = [
        TestCollectionViewCellModel(imageString: "img1"),
        TestCollectionViewCellModel(imageString: "img2"),
        TestCollectionViewCellModel(imageString: "img3"),
        TestCollectionViewCellModel(imageString: "img4"),
        TestCollectionViewCellModel(imageString: "img5"),
        TestCollectionViewCellModel(imageString: "img6"),
        TestCollectionViewCellModel(imageString: "img7"),
        TestCollectionViewCellModel(imageString: "img8"),
        TestCollectionViewCellModel(imageString: "img9")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "TestCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: TestCollectionViewCell.identifier)
        navigationItem.title = "Мой профиль"
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.title = " "
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Мой профиль"
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TestCollectionViewCell.identifier, for: indexPath) as! TestCollectionViewCell
        cell.setupWith(model: dataSource[indexPath.row])
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemPerRow: CGFloat = 3
        let paddingWidth = 20 * (itemPerRow + 1)
        let widthForItem = (collectionView.frame.width - paddingWidth) / 3.2
        return CGSize(width: widthForItem, height: widthForItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = SecondViewController(nibName: "SecondViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

    

