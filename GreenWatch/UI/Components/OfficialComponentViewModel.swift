//
//  OfficialComponentViewModel.swift
//  GreenWatch
//
//  Created by Madelyn Khoury on 8/1/22.
//

import Foundation
import UIKit


class OfficialComponentViewModel: ObservableObject {
    
    var official: Official
    
    public init(official: Official) {
        self.official = official
    }
    
    
    func email() {
        guard let url = URL(string: "mailto:\(official.emails?[0])") else { return }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    func call() {
        guard let url = URL(string: "tel://\(official.phones?[0])") else { return }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
