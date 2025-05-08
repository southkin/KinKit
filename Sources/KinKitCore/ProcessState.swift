//
//  ProcessState.swift
//  KinKit
//
//  Created by kin on 5/8/25.
//

public enum ProcessState<T> {
    case loading
    case success(T)
    case failure(Error)
}
