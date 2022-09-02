import UIKit
import Combine

print("----- Timer -----")
let runLoop = RunLoop.main

let subscription = runLoop.schedule(
    after: runLoop.now,
    interval: .seconds(2),
    tolerance: .microseconds(100)) {
        print("Timer fired")
    }

runLoop.schedule(after: .init(Date(timeIntervalSinceNow: 6.0))) {
    subscription.cancel()
    print("cancel")
}

print("----- Timer Class -----")

let subscription2 = Timer.publish(every: 1.0, on: .main, in: .common)
    .autoconnect()
    .scan(0) { counter, _ in
        counter + 1
    }
    .sink {
        print($0)
    }

print("----- Using DispatchQueue -----")
let queue = DispatchQueue.main

let source = PassthroughSubject<Int, Never>()

var counter = 0

let cancellabel = queue.schedule(after: queue.now, interval: .seconds(1)) {
    source.send(counter)
    counter += 1
}

let subscription3 = source.sink {
    print($0, "DispatchQueue")
}


