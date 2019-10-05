//
//  StateMutatingAction.swift
//  MusicStore
//
//  Created by Brian Sipple on 10/4/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import Foundation
import Combine


protocol StateMutatingAction {
    associatedtype Mutation
    
    func mapToMutation() -> AnyPublisher<Mutation, Never>
}
