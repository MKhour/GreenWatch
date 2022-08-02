//
//  LandingViewModel.swift
//  GreenWatch
//
//  Created by Madelyn Khoury on 7/19/22.
//  Copyright 2022 Madelyn Khoury.

import Foundation

class LandingViewModel: ObservableObject {
    
    @Published var articles: [NewsArticle]?
    
    init() {
//        Task {
//           await start()
//        }
    }
    
    func start() async {
        do {
            articles = try await NewsDataSource.shared.fetchArticles(for: "climate change OR environment OR nature")
            if Task.isCancelled { return }
        } catch {
            if Task.isCancelled { return }
        }
    }
}
