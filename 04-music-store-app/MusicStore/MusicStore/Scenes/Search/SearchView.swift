//
//  SearchView.swift
//  MusicStore
//
//  Created by Brian Sipple on 10/4/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI
import MusicStoreKit


struct SearchView: View {
    @Binding var currentTerm: String
    
    var results: [SearchResult] = []
    var onSearchCommit: () -> Void
    
    
    var body: some View {
        
        VStack {
            VStack {
                Text("Searching iTunes for: \"\(currentTerm)\"")
                    .font(.headline)
                    .lineLimit(nil)
                
                TextField("Enter a Search Term", text: $currentTerm, onCommit: onSearchCommit)
                    .padding()
                
                List {
                    SearchResultsListView(results: results)
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(
            currentTerm: .constant("Mass Effect"),
            results: [
                SearchResult(trackName: "Track 1"),
                SearchResult(trackName: "Track 2"),
                SearchResult(trackName: "Track 3"),
            ],
            onSearchCommit: {}
        )
    }
}
