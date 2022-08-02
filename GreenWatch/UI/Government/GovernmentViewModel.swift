//
//  GovernmentViewModel.swift
//  GreenWatch
//
//  Created by Madelyn Khoury on 7/19/22.
//  Copyright 2022 Madelyn Khoury.

import Foundation

class GovernmentViewModel: ObservableObject {
    
    @Published var articles: [NewsArticle]?
    @Published var officials: [Official]?
    var address: String? = "110 Stadium road, charlottesville va, 22903"
    
    init() {
        DispatchQueue.main.async {
            Task {
                await self.start()
            }
        }
    }
    
    func start() async {
        do {
            officials = try await OfficialsDataSource.shared.fetchOfficials(for: address ?? "")
            if Task.isCancelled { return }
        } catch {
            if Task.isCancelled { return }
        }
        
        guard let officials = officials else {
            return
        }
        
        do {
            articles = []
            for official in officials {
                articles?.append(contentsOf: try await NewsDataSource.shared.fetchArticles(for: "\(official.name)"))
            }
            if Task.isCancelled { return }
        } catch {
            if Task.isCancelled { return }
        }
    }
    
}
