//
//  NetworkMonitor.swift
//  Quack
//
//  Created by 차승훈 on 3/20/25.
//

import Foundation
import Network
import Combine

class NetworkMonitor: ObservableObject {
    @Published private(set) var isConnected = true
    
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")
    
    init() {
        monitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.isConnected = path.status == .satisfied
            }
        }
        monitor.start(queue: queue)
    }
    
    deinit {
        monitor.cancel()
    }
}
