//
//  PodcastCollectionViewCell.swift
//  podcastFavorites
//
//  Created by Radharani Ribas-Valongo on 9/18/19.
//  Copyright © 2019 Radharani Ribas-Valongo. All rights reserved.
//

import UIKit

class PodcastCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var trackNameLabel: UILabel!
    
    func configureCell(podcast: PodcastWrapper) {
        self.backgroundColor = #colorLiteral(red: 0.7448362586, green: 0.5330961045, blue: 0.7874304366, alpha: 1)
        self.artistNameLabel.text = podcast.artistName
        self.trackNameLabel.text = podcast.trackName
    }
    
    
}
