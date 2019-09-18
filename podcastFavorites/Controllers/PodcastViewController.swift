//
//  ViewController.swift
//  podcastFavorites
//
//  Created by Radharani Ribas-Valongo on 9/18/19.
//  Copyright © 2019 Radharani Ribas-Valongo. All rights reserved.
//

import UIKit

class PodcastViewController: UIViewController {

    
    //MARK: -- Outlets
    @IBOutlet weak var podcastSearchBar: UISearchBar!
    @IBOutlet weak var podcastCollectionView: UICollectionView!
    
    
    //MARK: -- Properties
    var podcasts = [PodcastWrapper]() {
        didSet {
            DispatchQueue.main.async {
                self.podcastCollectionView.reloadData()
            }
        }
    }
    
    var searchString: String? {
        didSet {
            self.podcastCollectionView.reloadData()
        }
    }
    //MARK: -- Functions
    
    private func loadData() {
        PodcastAPIClient.shared.getPodcast {
            (result) in DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let podcastFromOnlineAPI):
                    self.podcasts = podcastFromOnlineAPI
                    dump(podcastFromOnlineAPI)
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        podcastCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
}

extension PodcastViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return podcasts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let pc = podcasts[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "podcastCell", for: indexPath) as! PodcastCollectionViewCell
        cell.configureCell(podcast: pc)
        return cell
    }
    
    
}

