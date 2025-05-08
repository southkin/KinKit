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
    func asView<V: View>(isLoading:()->V, isSuccess:(T)->V, isFailure:(Error)->V) -> V {
        switch self {
        case .loading:
            return isLoading()
        case .success(let value):
            return isSuccess(value)
        case .failure(let error):
            return isFailure(error)
        }
    }
}
final class ProcessPublisher<Output> {
    private let subject: CurrentValueSubject<ProcessState<Output>, Never>
    
    init(initialValue: ProcessState<Output> = .loading) {
        self.subject = CurrentValueSubject(initialValue)
    }
    
    var publisher: AnyPublisher<ProcessState<Output>, Never> {
        subject.eraseToAnyPublisher()
    }
    
    func sendLoading() {
        subject.send(.loading)
    }
    
    func sendSuccess(_ value: Output) {
        subject.send(.success(value))
    }
    
    func sendFailure(_ error: Error) {
        subject.send(.failure(error))
    }
    
    var value : ProcessState<Output> {
        subject.value
    }
    
    func asView<T: View>(isLoading:()->T, isSuccess:(Output)->T, isFailure:(Error)->T) -> T {
        return subject.value.asView(isLoading: isLoading, isSuccess: isSuccess, isFailure: isFailure)
    }
}
