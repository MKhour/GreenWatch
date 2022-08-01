//
//  WebView.swift
//  GreenWatch
//
//  Created by Madelyn Khoury on 7/31/22.
//  This file comes directly from https://www.appcoda.com/swiftui-wkwebview/
//

import SwiftUI
import WebKit
 
struct WebView: UIViewRepresentable {
 
    var url: URL
 
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
