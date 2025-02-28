//
//  View+ReceiveTimer.swift
//  DQCommon
//
//  Created by dtrognn on 28/2/25.
//

import SwiftUI
import Combine

@available(iOS 13.0, OSX 10.15, *)
typealias TimePublisher = Publishers.Autoconnect<Timer.TimerPublisher>

@available(iOS 13.0, OSX 10.15, *)
extension View {

    func onReceive(timer: TimePublisher?, perform action: @escaping (Timer.TimerPublisher.Output) -> Void) -> some View {
        Group {
            if let timer = timer {
                self.onReceive(timer, perform: { value in
                    action(value)
                })
            } else {
                self
            }
        }
    }
}
