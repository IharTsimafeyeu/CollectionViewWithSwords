//
//  SecondViewController.swift
//  HW TMS 15A
//
//  Created by Игорь Тимофеев on 10.11.21.
//

import UIKit

final class SecondViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let dataSource: [TestCollectionViewCellModel] = [
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
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "TestCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: TestCollectionViewCell.identifier)
        navigationItem.title = "Публикации"
        
    }
    
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension SecondViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TestCollectionViewCell.identifier, for: indexPath) as! TestCollectionViewCell
        cell.setupWith(model: dataSource[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemPerRow: CGFloat = 1
        let paddingWidth = 20 * (itemPerRow + 1)
        let widthForItem = (collectionView.frame.width - paddingWidth) / itemPerRow
        return CGSize(width: widthForItem, height: widthForItem + 70)
    }
}

//MARK: - TestCollectionViewCellDelegate
extension SecondViewController: TestCollectionViewCellDelegate {
    func likeOrDislike(photoName: String) {
        dataSource.first(where: { $0.photoName == photoName })?.isLiked.toggle()
        collectionView.reloadData()
    }
    
    func commentAction(photoName: String) {
        let alert = UIAlertController(title: "Комментарий", message: "", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Введите ваш комментарий"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
        })
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { [weak self] _ in
            guard let comment = alert.textFields?.first?.text else { return }
            self?.dataSource.first(where: { $0.photoName == photoName })?.commentString = comment
            self?.collectionView.reloadData()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func shareAction() {
        
    }
    
}


