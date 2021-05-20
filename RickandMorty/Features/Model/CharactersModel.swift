import Foundation

struct CharactersModels: Codable {
    let name: String?
    let gender: String?
    let status: String?
    let species: String?
    let image: URL?
}

struct Result: Codable {
    let results: [CharactersModels]
}
