//
//  SearchResultsListView.swift
//  MusicStore
//
//  Created by Brian Sipple on 10/4/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI
import MusicStoreKit


struct SearchResultsListView: View {
    let results: [SearchResult]


    var body: some View {
        ForEach(results) { result in
            Text("\(result.trackName ?? "Untitled")")
        }
    }
}

struct SearchResultsListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsListView(results: [
            SearchResult(trackName: "Track 1"),
            SearchResult(trackName: "Track 2"),
            SearchResult(trackName: "Track 3"),
        ])
    }
}
