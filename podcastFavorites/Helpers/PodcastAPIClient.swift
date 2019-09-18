//
//  PodcastAPIClient.swift
//  podcastFavorites
//
//  Created by Radharani Ribas-Valongo on 9/18/19.
//  Copyright © 2019 Radharani Ribas-Valongo. All rights reserved.
//

import Foundation

class PodcastAPIClient {
    private init() {}
    static let shared = PodcastAPIClient()
    
    func getPodcast(completionHandler: @escaping (Result<[PodcastWrapper],AppError>) -> Void ) {
        let urlStr = "https://itunes.apple.com/search?media=podcast&limit=10&term=swift"
        NetworkHelper.shared.fetchData(urlString: urlStr) { (result) in
            switch result {
            case .failure(let appError):
                completionHandler(.failure(appError))
            case .success(let data):
                do {
                    let data = try JSONDecoder().decode(Podcast.self, from: data)
                    completionHandler(.success(data.results))
                } catch {
                    completionHandler(.failure(.badJSONError))                }
            }
        }
    }
    
}
