//
//  BaseCoordinator.swift
//  MoviesDB
//
//  Created by Ahmad on 28/01/2025.
//

import SwiftUI

@MainActor
class BaseCoordinator<Destination: View>: Coordinator {
    private let viewBuilder: () -> Destination

    init(viewBuilder: @escaping () -> Destination) {
        self.viewBuilder = viewBuilder
    }

    func start() -> Destination {
        viewBuilder()
    }
}
