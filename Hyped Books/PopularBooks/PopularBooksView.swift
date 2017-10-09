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
    Presenter: PopularBooksViewPresenterProtocol,
    Cell: UICollectionViewCell,
    Cell: BookInputContaining
{
    fileprivate let presenter: Presenter
    var isAbleLoadMore: Bool = true
    private var zone: Zone = .freeScroll
    
    fileprivate var reuseIdentifier: String {
        return "cell"
    }
    
    init(cell: Cell.Type, presenter: Presenter) {
        self.presenter = presenter
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 350)
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
        presenter.configure(book: cell.input, atIndex: indexPath.row)
        return cell
    }
    
    func loadMoreIfAble() {
        guard isAbleLoadMore else {
            return
        }
        presenter.loadMore()
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let visibleEdge = scrollView.contentOffset.y + view.bounds.height
        let hidden = scrollView.contentSize.height - visibleEdge
        
        if zone.willChange(hiddenSpace: hidden),
            case .load = zone
        {
            loadMoreIfAble()
        }
    }
}

extension PopularBooksCollectionView: PopularBooksViewProtocol {
    func blockLoadMore() {
        isAbleLoadMore = false
    }
    
    func showError(title: String, description: String) {
        let alert = UIAlertController(
            title: title,
            message: description,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func reload() {
        let contentOffset = collectionView?.contentOffset
        collectionView?.reloadData()
        collectionView?.contentOffset = contentOffset ?? .zero
    }
}

fileprivate enum Zone {
    case load, freeScroll
    
    private var loadSpaceRange: ClosedRange<CGFloat> {
        return -1000...300
    }
    
    mutating func willChange(hiddenSpace space: CGFloat) -> Bool {
        switch (self, space) {
        case (.load, loadSpaceRange): return false
        case (.load, _): self = .freeScroll; return true
        case (.freeScroll, loadSpaceRange): self = .load; return true
        case (.freeScroll, _): return false
        }
    }
}
