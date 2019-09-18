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
    
    func getPodcast(completionHandler: @escaping (Result<[Podcast],AppError>) -> Void ) {
        let urlStr = "https://www.pokemon.com/us/api/pokedex/Alola"
        NetworkHelper.shared.fetchData(urlString: urlStr) { (result) in
            switch result {
            case .failure(let appError):
                completionHandler(.failure(appError))
            case .success(let data):
                do {
                    let data = try JSONDecoder().decode([Podcast].self, from: data)
                    completionHandler(.success(data))
                } catch {
                    completionHandler(.failure(.badJSONError))                }
            }
        }
    }
    
}
