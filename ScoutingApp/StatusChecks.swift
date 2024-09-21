//
//  StatusChecks.swift
//  ScoutingApp
//
//  Created by Noam Nachmias on 9/19/24.
//

import Foundation
import Network

struct NetworkConnectionStatus {
    let monitor = NWPathMonitor()
    public func check() -> Bool {
        var isConnected : Bool = false
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                isConnected = true
            }
        }
        return isConnected
    }
}
