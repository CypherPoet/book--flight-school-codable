import SwiftUI
import MusicStoreKit
import CypherPoetCore


struct SearchContainerView: View {
    @EnvironmentObject var store: Store<AppState, AppStateAction>
    @State private var searchTerm: String = "Mass Effect"
    
    
    var body: some View {
        SearchView(
            currentTerm: $searchTerm,
            results: store.state.searchResults,
            onSearchCommit: fetchResults
        )
        .onAppear(perform: fetchResults)
    }
    
    
    private func fetchResults() {
        store.send(.search(term: searchTerm))
    }
}


#if DEBUG
struct SearchContainerView_Previews: PreviewProvider {
    static var previews: some View {
        let appStore = Store<AppState, AppStateAction>(
            initialState: AppState(),
            appReducer: Dependencies.makeAppReducer()
        )
        
        return SearchContainerView()
            .environmentObject(appStore)
    }
}
#endif
