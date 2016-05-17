//: Playground - noun: a place where people can play

import Cocoa
import RxSwift
import RxCocoa

let emptySequence = Observable<Int>.empty()

emptySequence.subscribe {
    (event: RxSwift.Event<Int>) -> Void in
        print(event)
}

//: ### just
print("--- just ---")

_ = Observable.just("Boxue").subscribe({
    (event: RxSwift.Event<String>) -> Void in
        print(event)
})

//: ### of
print("--- of ---")

_ = Observable.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9).subscribe {
    (event: RxSwift.Event<Int>) -> Void in
        print(event)
}

//: ### error
print("--- error ---")

let err = NSError(domain: "Test", code: -1, userInfo: nil)
_ = Observable<Int>.error(err).subscribe {
    (event: RxSwift.Event<Int>) -> Void in
        print(event)
}

//: ### create
print("--- create ---")
func myJust(event: Int) -> Observable<Int> {
    return Observable.create { observer in
        if event % 2 == 0 {
            observer.on(.Next(event))
            observer.on(.Completed)
        }
        else {
            let err = NSError(domain: "Not an even number", code: 401, userInfo: nil)
            observer.on(.Error(err))
        }
        
        return NopDisposable.instance
    }
}

myJust(10).subscribe { print($0) }
myJust(5).subscribe { print($0) }

//: ### generate
print("--- generate ---")
_ = Observable.generate(initialState: 0, condition: { $0 < 10 }, iterate: { $0 + 1 })
    .subscribe { print($0) }

//: ### deferred
print("--- deferred ---")
let deferredSequence = Observable<Int>.deferred {
    print("Generating")
    
    return Observable.generate(initialState: 0, condition: { $0 < 3 }, iterate: { $0 + 1 })
}

_ = deferredSequence.subscribe { print($0) }
_ = deferredSequence.subscribe { print($0) }
























