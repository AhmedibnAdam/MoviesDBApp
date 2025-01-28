//
//  Coordinator.swift
//  MoviesDB
//
//  Created by Ahmad on 28/01/2025.
//

import SwiftUI

/// Abstract Coordinator Protocol
protocol Coordinator: AnyObject {
    associatedtype ContentView: View
    @MainActor
    func start() -> ContentView

}

/// Coordinator Extension for AnyView Erasure
extension Coordinator {
    @MainActor
    func eraseToAnyView() -> AnyView {
        AnyView(start())
    }
}
