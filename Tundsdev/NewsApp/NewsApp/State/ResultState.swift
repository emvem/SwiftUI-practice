//
//  ResultState.swift
//  NewsApp
//
//  Created by Vadim Em on 09.03.2021.
//

import Foundation

enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
