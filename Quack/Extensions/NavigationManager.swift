//
//  NavigationManager.swift
//  Quack
//
//  Created by 차차 on 1/30/25.
//

import Foundation
import Combine

enum Destination: Hashable {
    case signUpView
    case tabBarView
}

final class Coordinator<T: Hashable>: ObservableObject {
    @Published var paths: [T] = []
    
    func push(_ path: T) {
        paths.append(path)
    }
    
    func pop() {
        paths.removeLast()
    }
    
    func pop(to: T) {
        guard let found = paths.firstIndex(where: { $0 == to }) else {
            return
        }
        
        let numToPop = (found..<paths.endIndex).count - 1
        paths.removeLast(numToPop)
    }
    
    func popToRoot() {
        paths.removeAll()
    }
}

