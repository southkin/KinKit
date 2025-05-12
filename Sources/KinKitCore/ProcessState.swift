//
//  ProcessState.swift
//  KinKit
//
//  Created by kin on 5/8/25.
//

import SwiftUI
import Combine

public enum ProcessState<T> {
    case loading
    case success(T)
    case failure(Error)
    public func asView<V: View>(isLoading:()->V, isSuccess:(T)->V, isFailure:(Error)->V) -> V {
        switch self {
        case .loading:
            return isLoading()
        case .success(let value):
            return isSuccess(value)
        case .failure(let error):
            return isFailure(error)
        }
    }
    var value: T? {
        switch self {
        case .success(let value):
            return value
        default:
            return nil
        }
    }
}
public final class ProcessPublisher<Output> {
    private let subject: CurrentValueSubject<ProcessState<Output>, Never>
    
    public init(initialValue: ProcessState<Output> = .loading) {
        self.subject = CurrentValueSubject(initialValue)
    }
    
    public var publisher: AnyPublisher<ProcessState<Output>, Never> {
        subject.eraseToAnyPublisher()
    }
    public func send(_ value: ProcessState<Output>) {
        subject.send(value)
    }
    public func sendLoading() {
        subject.send(.loading)
    }
    
    public func sendSuccess(_ value: Output) {
        subject.send(.success(value))
    }
    
    public func sendFailure(_ error: Error) {
        subject.send(.failure(error))
    }
    
    public var value : ProcessState<Output> {
        subject.value
    }
    
    public func asView<T: View>(isLoading:()->T, isSuccess:(Output)->T, isFailure:(Error)->T) -> T {
        return subject.value.asView(isLoading: isLoading, isSuccess: isSuccess, isFailure: isFailure)
    }
}
