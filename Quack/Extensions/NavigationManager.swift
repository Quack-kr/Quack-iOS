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
    case alarmView
}

final class Coordinator<T: Hashable>: ObservableObject {
    @Published var paths: [T] = []
    
    func push(_ path: T) {
        print("before push: ", paths)
        paths.append(path)
        print("after push: ", paths)
    }
    
    func pop() {
        print("before pop: ", paths)
        paths.removeLast()
        print("after pop: ", paths)
    }
    
    func pop(to: T) {
        guard let found = paths.firstIndex(where: { $0 == to }) else {
            return
        }
        
        let numToPop = (found..<paths.endIndex).count - 1
        paths.removeLast(numToPop)
        print(paths)
    }
    
    func popToRoot() {
        paths.removeAll()
    }
}

