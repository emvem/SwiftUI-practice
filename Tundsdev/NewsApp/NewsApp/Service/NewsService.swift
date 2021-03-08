//
//  NewsService.swift
//  NewsApp
//
//  Created by Vadim Em on 09.03.2021.
//

import Foundation
import Combine

protocol NewsService {
    func request(from endpoint: NewsAPI) -> AnyPublisher<NewsResponse, APIError>
}
