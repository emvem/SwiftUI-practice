//
//  HomeView.swift
//  NewsApp
//
//  Created by Vadim Em on 09.03.2021.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = NewsViewModelImpl(service: NewsServiceImpl())
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .failed(let error):
                ErrorView(error: error, handler: viewModel.getArticles)
            case .success(let articles):
                NavigationView {
                    List(articles) {
                        ArticleView(article: $0)
                    }
                    .navigationTitle(Text("News"))
                }
            }
        }.onAppear {
            viewModel.getArticles()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
