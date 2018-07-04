import Foundation

typealias SimpleCompletion = () -> Void

func mainThread(_ completion: @escaping SimpleCompletion) {
    DispatchQueue.main.async(execute: completion)
}

func gloabalThread(after: Double, completion: @escaping SimpleCompletion) {
    DispatchQueue.global().asyncAfter(deadline: .now() + after) {
        completion()
    }
}

func fatalErrorCreation(message: String) -> Never {
    fatalError("Can't instantiate \(message)")
}
