//
//  HeroesCollectionViewController.swift
//  DragonBall
//
//  Created by Rodrigo Latorre on 13/07/22.
//

import UIKit

private let reuseIdentifier = "cellIdentifier"

class HeroesCollectionViewController: UICollectionViewController {

    var heroes: [Hero] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //network Call
        
        collectionView?.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        let heroesData = NetworkModel.shared
        heroesData.getHeroes { [weak self] heroes, error in
            guard let self = self else {return}
            self.heroes = heroes
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return heroes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
        (cell as? CollectionViewCell)?.set(model: heroes[indexPath.row])
        
        return cell
    }
}

//extension HeroesCollectionViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let width = (collectionView.frame.width / 2) - 6
//        return CGSize(width: width, height: 140.0)
//    }
//}

extension HeroesCollectionViewController: UICollectionViewDelegateFlowLayout {
    
}
