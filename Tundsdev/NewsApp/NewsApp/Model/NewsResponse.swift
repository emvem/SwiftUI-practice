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
struct Article: Codable, Identifiable {
    let id = UUID()
    let author: String?
    let url: String?
    let source, title: String?
    let articleDescription: String?
    let image: String?
    let date: Date?

    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}

extension Article {
    static var dummyData: Article {
        .init(author: "a", url: nil, source: "source", title: "title", articleDescription: "descr", image: "https://profootballtalk.nbcsports.com/wp-content/uploads/sites/25/2021/03/GettyImages-1288945114-e1615225855847.jpg", date: Date())
    }
}
