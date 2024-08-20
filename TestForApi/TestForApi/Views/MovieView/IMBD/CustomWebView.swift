//
//  WebPageForIMBD.swift
//  TestForApi
//
//  Created by Habibur Rahman on 9/8/24.
//

import SwiftUI
import WebKit

struct CustomWebView: View {
    let url: URL
    
    var body: some View {
        VStack {
            WebView(url: url)
        }
    }
}

struct WebView: UIViewRepresentable {
    let url  : URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}


#Preview {
    CustomWebView(url: URL(string: "https://www.google.com/")!)
}
