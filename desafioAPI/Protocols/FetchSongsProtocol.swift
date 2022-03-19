import Foundation

protocol FetchSongsProtocol {
    func fetchAll(_ completion: @escaping (Result<[Song], Error>) -> Void)
}
