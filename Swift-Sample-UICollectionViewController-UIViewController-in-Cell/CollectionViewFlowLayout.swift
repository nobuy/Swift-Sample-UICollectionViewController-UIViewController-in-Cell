//
//  CollectionViewFlowLayout.swift
//  Swift-Sample-UICollectionViewController-UIViewController-in-Cell
//
//  Created by A10 Lab Inc. 003 on 2018/08/18.
//  Copyright © 2018年 A10 Lab Inc. 003. All rights reserved.
//

import UIKit

class CollectionViewFlowLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()
        sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        estimatedItemSize = CGSize(width: 300, height: 600)
        scrollDirection = .horizontal
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        let currentPage: CGFloat = collectionView!.contentOffset.x / pageWidth

        if (fabs(velocity.x) > 0.2) {
            let nextPage = (velocity.x > 0.0) ? ceil(currentPage) : floor(currentPage)
            return CGPoint(x: nextPage * pageWidth, y: proposedContentOffset.y)
        } else {
            return CGPoint(x: (round(currentPage)) * pageWidth, y: proposedContentOffset.y)
        }

    }

    private var pageWidth: CGFloat {
        return collectionView!.bounds.width - 40 + minimumLineSpacing
    }
}
