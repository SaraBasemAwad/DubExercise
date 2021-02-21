//
//  Coordinator.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import Foundation

class Coordinator {
    var childCoordinators: [Coordinator] = []
    
    func childCompleted(coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }
    
    func childStarted(coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
}
