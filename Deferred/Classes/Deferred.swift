
public func async(_ q: DispatchQueue = DispatchQueue.global(), block: @escaping () -> Void) {
    q.async(execute: block)
}

fileprivate enum Box<E> {
    case waiting
    case fulfilled(E)
}

public class Deferred<T> {

    private let semafore = DispatchSemaphore(value: 0)
    private var status = Box<T>.waiting

    public var value: T {
        get {
            if case .fulfilled(let v) = status {return v}
            fatalError("value not found!")
        }
        set {
            status = .fulfilled(newValue)
            semafore.signal()
        }
    }

    public init() {}

    public func await() -> Deferred<T> {
        assert(!Thread.isMainThread, "`await` shouldn't be called in the main thread.")
        semafore.wait()
        return self
    }
}
