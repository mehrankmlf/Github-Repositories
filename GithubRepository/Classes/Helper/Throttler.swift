//
//  Debouncer.swift
//  GithubRepository
//
//  Created by Mehran on 3/27/1401 AP.
//

import Foundation

protocol ThrottlerProtocol {
    var value: String? { get }
    var valueTimestamp: Date? { get }
    var interval: TimeInterval { get set }
    var queue: DispatchQueue { get }
    var callbacks: [(String) -> ()] { get }
    var nilCallback: (() -> (Void))? { get }
    init(interval : TimeInterval, on queue: DispatchQueue)
}

protocol ThrottleBehavierProtocol : ThrottlerProtocol {
    func receive(_ value: String)
    func on(throttled: (@escaping (String) -> ()))
    func emptyValue(closure: @escaping () -> Void)
    func onDispatch()
    func sendValue()
}

public final class Throttler : ThrottleBehavierProtocol {
    var value: String?
    var valueTimestamp: Date? = nil
    var interval: TimeInterval
    var queue: DispatchQueue
    var callbacks: [(String) -> ()] = []
    var nilCallback: (() -> (Void))?
    init(interval: TimeInterval, on queue: DispatchQueue = .main) {
        self.interval = interval
        self.queue = queue
    }
    public func receive(_ value: String) {
        self.value = value
        guard valueTimestamp == nil else { return }
        self.valueTimestamp = Date()
        queue.asyncAfter(deadline: .now() + interval) { [weak self] in
            self?.onDispatch()
        }
    }
    
    public func on(throttled: (@escaping (String) -> ())) {
        self.callbacks.append(throttled)
    }
    
    public func emptyValue(closure: @escaping () -> Void) {
        self.nilCallback = closure
    }
    
     func onDispatch() {
        self.valueTimestamp = nil
        if String.isNilOrEmpty(string: value) {
            self.nilCallback?()
        }else{
            sendValue()
        }
    }
    
     func sendValue() {
        if let value = self.value {
            callbacks.forEach { $0(value) }
        }
    }
}
