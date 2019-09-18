//
//  Podcast.swift
//  podcastFavorites
//
//  Created by Radharani Ribas-Valongo on 9/18/19.
//  Copyright © 2019 Radharani Ribas-Valongo. All rights reserved.
//

import Foundation

struct Podcast: Codable {
    let results: [PodcastWrapper]
}

struct PodcastWrapper: Codable {
    let trackId: Int
    let artistName: String
    let trackName: String
    let artworkUrl60: String
}
