//
//  AppStore.swift
//  MusicStore
//
//  Created by Brian Sipple on 10/4/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import Foundation
import Combine


typealias Reducer<State, Mutation> = (inout State, Mutation) -> Void


final class Store<AppState, AppStateAction: StateMutatingAction>: ObservableObject {
    @Published var state: AppState
    
    private let appReducer: Reducer<AppState, AppStateAction.Mutation>
    private var cancellables: Set<AnyCancellable> = []
    
    
    init(
        initialState: AppState,
        appReducer: @escaping Reducer<AppState, AppStateAction.Mutation>
    ) {
        self.state = initialState
        self.appReducer = appReducer
    }
    
    
    func send(_ action: AppStateAction) {
        action
            .mapToMutation()
            .receive(on: DispatchQueue.main)
            .sink { self.appReducer(&self.state, $0) }
            .store(in: &cancellables)
    }
}
