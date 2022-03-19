//
//  Music.swift
//  desafioAPI
//
//  Created by Rogério Tavares on 19/03/22.
//

import Foundation

struct SongResponse: Codable {
    let resultCount: Int
    let results: [Song]
}

enum TrackExplicitness: String, Codable {
    case cleaned = "cleaned"
    case explicit = "explicit"
}

struct Song: Codable {
    let artistId: Int
    let artistName: String
    let artistViewUrl: String
    let collectionName: String
    let trackName: String
    let artwork: String
    let trackPrice: Double
    let releaseDate: String
    let trackTimeMillis: Int
    let currency: String
    let primaryGenreName: String
    let trackExplicitness: TrackExplicitness
    
    var minutesAndSeconds: String {
        let minutes = trackTimeMillis / 60000
        let seconds = (trackTimeMillis - (minutes * 60000)) / 1000
        return "\(minutes)m \(seconds)s"
    }

    enum CodingKeys: String, CodingKey {
        case artistId
        case artistName
        case artistViewUrl
        case collectionName
        case trackName
        case artwork = "artworkUrl100"
        case trackPrice
        case releaseDate
        case trackTimeMillis
        case currency
        case primaryGenreName
        case trackExplicitness
    }
}
