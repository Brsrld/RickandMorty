import Foundation
import UIKit
import Kingfisher

private let reuseIdentifier = "Cell"

//MARK: Protocols

protocol RickandMortyCollectionViewProtocol {
    func update (items: [CharactersModels])
}

protocol RickandMortyCollectionViewOutput: AnyObject {
    func onSelected(item: CharactersModels)
}

//MARK: CollectionView Functions

final class RickandMortyCollecionView: NSObject{
    
    private lazy var items: [CharactersModels] = []
    
    weak var delegate: RickandMortyCollectionViewOutput?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
    
        if let dataCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? RickandMortyCollectionViewCell {
            dataCell.configure(with: items[indexPath.row].name ?? "" , with: items[indexPath.row].status ?? "", with: items[indexPath.row].species ?? "", with: items[indexPath.row].gender ?? "", with: items[indexPath.row].image!)
            cell = dataCell
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - 50
        let height = width / 1.5
        return CGSize(width: width, height: height)
    }
}

//MARK: Extensions

extension RickandMortyCollecionView: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {}
extension RickandMortyCollecionView: RickandMortyCollectionViewProtocol {
    func update (items: [CharactersModels]) {
        self.items = items
    }
}
