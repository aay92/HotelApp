//
//  CollectionViewBilder.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 24.12.2023.
//

import UIKit

class CollectionViews {
     static func collectionViewOne() -> UICollectionView {
        let flowLayout = CarouselFlowLayout()
        let collectionViewOne = UICollectionView(frame: CGRect(x: 106, y: 313, width: 1708, height: 300), collectionViewLayout: flowLayout)
        return collectionViewOne
    }
}
