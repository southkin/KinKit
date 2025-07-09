//
//  ModelContextExtension.swift
//  KinKit
//
//  Created by kin on 7/9/25.
//

@available(iOS 17.0, macOS 14.0, *)
actor ModelActorManager {
    static let shared = ModelActorManager()
    // ObjectIdentifier를 키로 써서 context 참조를 구분
    private var actors: [ObjectIdentifier: GenericModelActor] = [:]

    func getActor(for context: ModelContext) -> GenericModelActor {
        let key = ObjectIdentifier(context)
        if let actor = actors[key] {
            return actor
        }
        // context.container 는 매크로가 붙은 ModelActor가 가지고 있는 modelContainer
        let actor = GenericModelActor(modelContainer: context.modelContainer)
        actors[key] = actor
        return actor
    }
}

@available(iOS 17.0, macOS 14.0, *)
public extension ModelContext {
    func execute<T>(
        _ work: @Sendable @escaping (ModelContext) -> T
    ) async -> T {
        let actor = await ModelActorManager.shared.getActor(for: self)
        return await actor.execute(work)
    }

    func executeThrowing<T>(
        _ work: @Sendable @escaping (ModelContext) throws -> T
    ) async rethrows -> T {
        let actor = await ModelActorManager.shared.getActor(for: self)
        return try await actor.executeThrowing(work)
    }
}

@available(iOS 17.0, macOS 14.0, *)
@ModelActor
public actor GenericModelActor: ModelActor {
    public func execute<T>(
        _ work: @Sendable (ModelContext) -> T
    ) async -> T {
        return work(self.modelContext)
    }

    public func executeThrowing<T>(
        _ work: @Sendable (ModelContext) throws -> T
    ) async rethrows -> T {
        return try work(self.modelContext)
    }
}
