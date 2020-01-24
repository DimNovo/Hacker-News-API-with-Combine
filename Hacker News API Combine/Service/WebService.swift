//
//  WebService.swift
//  Hacker News API Combine
//
//  Created by Dmitry Novosyolov on 24/01/2020.
//  Copyright © 2020 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    var urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        guard
            urlString != nil,
            let url = URL(string: urlString!) else { fatalError("Invalid URL!")}
        let request = URLRequest(url: url)
        let webView = WKWebView()
        webView.load(request)
        return webView
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
