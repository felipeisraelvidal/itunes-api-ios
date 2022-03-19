import Foundation

enum FetchSongsError: Error {
    case invalidURL
}

class FetchSongsService: FetchSongsProtocol {
    
    func fetchAll(_ completion: @escaping (Result<[Song], Error>) -> Void) {
        guard let url = URL(string: "https://itunes.apple.com/search?media=music&term=eminem") else {
            completion(.failure(FetchSongsError.invalidURL))
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                return
            }
            
            do {
                let songs = try JSONDecoder().decode(SongResponse.self, from: data)
                completion(.success(songs.results))
            } catch {
                completion(.failure(error))
            }
        }
        
        dataTask.resume()
    }
    
}
