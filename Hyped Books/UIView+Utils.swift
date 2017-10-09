//
//  UIView+Utils.swift
//  Hyped Books
//
//  Created by Богдан Маншилин on 09/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import UIKit

extension UIView {
    enum UIViewLoadingError: Error {
        case notFound
    }
    
    /**
     Загружает и возвращает UIView из Xib
     */
    open class func instantiateFromXib<T: UIView>(_ named: String = String(describing: T.self), bundle: Bundle = Bundle(for: T.self)) throws -> T {
        guard let view = bundle.loadNibNamed(named, owner: nil, options: nil)?.first as? T else {
            throw UIViewLoadingError.notFound
        }
        return view
    }
    
    /**
     Загружает вьюху с кастомным сабклассом из ксибаT
     */
    open func addNib<T : UIView>() throws -> T {
        let view: T = try T.instantiateFromXib()
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        try view.constrainSuperview()
        return view
    }
    
    /// Делает background прозразчным фон для всей иерархии view, начиная с этой.
    open func clearBackgrounds() {
        backgroundColor = UIColor.clear
        clearizeBackgrounds(subviews: subviews)
    }
    
    private func clearizeBackgrounds(subviews: [UIView]) {
        recursive(subviews: subviews) {
            $0.backgroundColor = UIColor.clear
        }
    }
    
    public func recursive(subviews: [UIView], map: (UIView)-> Void) {
        subviews.forEach {
            map($0)
            recursive(subviews: $0.subviews, map: map)
        }
    }
}
