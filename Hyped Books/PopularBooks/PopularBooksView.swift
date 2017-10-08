//
//  PopularBooksView.swift
//  Hyped Books
//
//  Created by Богдан Маншилин on 08/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import UIKit

final class PopularBooksCollectionView<Cell, Presenter>:
    UICollectionViewController
where
    Presenter: PopularBooksCollectionViewDataSource,
    Presenter.Cell == Cell
{
    fileprivate let presenter: Presenter
    
    fileprivate var reuseIdentifier: String {
        return "cell"
    }
    
    init(presenter: Presenter) {
        self.presenter = presenter
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 250)
        layout.sectionInset = .init(top: 40, left: 40, bottom: 40, right: 40)
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView?.register(
            Cell.self,
            forCellWithReuseIdentifier: reuseIdentifier
        )
    }
    
    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
        ) -> Int
    {
        return presenter.itemsCount()
    }
    
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
        ) -> UICollectionViewCell
    {
        let cell = collectionView
            .dequeueReusableCell(
                withReuseIdentifier: reuseIdentifier,
                for: indexPath
            ) as! Cell
        presenter.configure(cell: cell, atIndex: indexPath.row)
        return cell
    }
}
