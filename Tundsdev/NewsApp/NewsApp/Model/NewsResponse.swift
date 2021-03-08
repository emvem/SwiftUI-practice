//
//  NewsResponse.swift
//  NewsApp
//
//  Created by Vadim Em on 09.03.2021.
//

import Foundation

// MARK: - NewsResponse
struct NewsResponse: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let author: String?
    let url: String
    let source, title: String
    let articleDescription: String?
    let image: String?
    let date: Date

    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}
