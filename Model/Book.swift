//
//  Book.swift
//  Model
//
//  Created by Богдан Маншилин on 02/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import Foundation

public struct Book: Codable {
    public let annotation: String
    public let authors: String
    public let bookshelvesCount: Int
    public let isCanBeRead: Bool
    public let cover: BookCover
    public let impressionsCount: Int
    public let isInLibrary: Int
    public let isInWishlist: Int
    public let labels: [Label]
    public let language: String
    public let libraryCardUUID: String?
    public let newAuthors: [Author]?
    public let paperPagesCount: Int
    public let quotesCount: Int
    public let readersCount: Int
    public let title: String
    public let topics: [String]?
    public let uuid: String
    public let variantsCount: Int?
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
