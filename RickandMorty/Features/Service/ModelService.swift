import Foundation
import Alamofire

protocol RickandMortyServiceProtocol {
    func fethAllPosts(onSuccess: @escaping ([CharactersModels]) -> Void, onFail: @escaping (String?) -> Void)
}

//MARK: Get Datas

struct ModelService: RickandMortyServiceProtocol {
    func fethAllPosts(onSuccess: @escaping ([CharactersModels]) -> Void, onFail: @escaping (String?) -> Void) {
        AF.request(RickandMortyPath.POSTS.withBaseUrl(), method: .get).validate().responseDecodable(of: Result.self) { (response) in
            guard let items = response.value else {
                onFail(response.debugDescription)
                return
            }
            onSuccess(items.results)
        }
    }
}

enum RickandMortyPath: String {
    case POSTS = "/character"
}

//MARK: Extensions

extension RickandMortyPath {

    func withBaseUrl() -> String {
        return "https://rickandmortyapi.com/api\(self.rawValue)"
    }
}

