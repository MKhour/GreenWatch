//
//  GovernmentViewModel.swift
//  GreenWatch
//
//  Created by Madelyn Khoury on 7/19/22.
//  Copyright 2022 Madelyn Khoury.

import Foundation

class GovernmentViewModel: ObservableObject {
    
    @Published var articles: [NewsArticle]?
    
    init() {}
    
    func start() async {
        do {
            articles = try await OfficialsDataSource.shared.fetchOfficials(for: "110 stadium road, charlottesville va, 22903")
            // articles?.append(contentsOf: try await NewsDataSource.shared.fetchArticles(for: "jimryan"))
            if Task.isCancelled { return }
        } catch {
            if Task.isCancelled { return }
        }
        
        
        do {
            articles = try await NewsDataSource.shared.fetchArticles(for: "(glenn AND youngkin) OR (youngkin AND virginia) OR (youngkin AND governor)")
            // articles?.append(contentsOf: try await NewsDataSource.shared.fetchArticles(for: "jimryan"))
            if Task.isCancelled { return }
        } catch {
            if Task.isCancelled { return }
        }
    }
}
