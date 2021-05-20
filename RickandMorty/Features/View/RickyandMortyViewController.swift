import UIKit

class RickyandMortyViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let rickandMortyCollectionView: RickandMortyCollecionView = RickandMortyCollecionView()
    private let rickandMortyService: RickandMortyServiceProtocol = ModelService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service()
        initDelegate()
        title = "Rick and Morty"
    }
    
//MARK: Init Functions
    
    private func initDelegate() {
        collectionView.delegate = rickandMortyCollectionView
        collectionView.dataSource = rickandMortyCollectionView
        rickandMortyCollectionView.delegate = self
    }
    
    private func service() {
        rickandMortyService.fethAllPosts { [weak self] (models) in
            self?.rickandMortyCollectionView.update(items: models)
            self?.collectionView.reloadData()
        } onFail: { (data) in
            print(data ?? "")
        }
    }
}

//MARK:  Extensions

extension RickyandMortyViewController: RickandMortyCollectionViewOutput {
    func onSelected(item: CharactersModels) {
        print(item.gender ?? "")
    }
}
