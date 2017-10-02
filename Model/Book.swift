//
//  Book.swift
//  Model
//
//  Created by Богдан Маншилин on 02/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import Foundation

public struct Book: Codable {
    let annotation: String
    let authors: String
    let bookshelvesCount: Int
    let isCanBeRead: Bool
    let cover: BookCover
    let impressionsCount: Int
    let isInLibrary: Int
    let isInWishlist: Int
    let labels: [Label]
    let language: String
    let libraryCardUUID: String?
    let newAuthors: [Author]?
    let paperPagesCount: Int
    let quotesCount: Int
    let readersCount: Int
    let title: String
    let topics: [String]?
    let uuid: String
    let variantsCount: Int?
}

extension Book {
    enum CodingKeys: String, CodingKey {
        case
        annotation,
        authors,
        bookshelvesCount = "bookshelves_count",
        isCanBeRead = "can_be_read",
        cover,
        impressionsCount = "impressions_count",
        isInLibrary = "in_library",
        isInWishlist = "in_wishlist",
        labels,
        language,
        libraryCardUUID = "library_card_uuid",
        newAuthors = "new_authors",
        paperPagesCount = "paper_pages",
        quotesCount = "quotes_count",
        readersCount = "readers_count",
        title,
        topics,
        uuid,
        variantsCount = "variants_count"
    }
}
