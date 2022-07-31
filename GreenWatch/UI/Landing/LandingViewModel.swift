//
//  LandingViewModel.swift
//  GreenWatch
//
//  Created by Madelyn Khoury on 7/19/22.
//  Copyright 2022 Madelyn Khoury.

import Foundation

class LandingViewModel: ObservableObject {
    
    @Published var articles: [NewsArticle]?
    
    init() {}
    
    func start() async {
        do {
            articles = try await NewsDataSource.shared.fetchArticles(for: "climatechange")
            if Task.isCancelled { return }
        } catch {
            if Task.isCancelled { return }
        }
    }
}
