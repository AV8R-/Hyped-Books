//
//  NSAttributedString+HTML.swift
//  Hyped Books
//
//  Created by Богдан Маншилин on 09/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import Foundation

extension NSAttributedString {
    
    internal convenience init?(html: String) {
        guard let data = html.data(
            using: String.Encoding.utf16,
            allowLossyConversion: false
            ) else
        {
            return nil
        }
        
        guard let attributedString = try? NSMutableAttributedString(
            data: data,
            options: [
                .documentType: NSAttributedString.DocumentType.html            ],
            documentAttributes: nil
            ) else
        {
            return nil
        }
        
        self.init(attributedString: attributedString)
    }
}
