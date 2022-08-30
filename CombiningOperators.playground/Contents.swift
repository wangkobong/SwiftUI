import UIKit
import Combine

print("----- prepend -----") // 뒤에 추가됨

let numbers = (1...5).publisher
let publisher = (500...510).publisher

numbers
    .prepend(101, 102)
    .prepend(-1, -2)
    .prepend([45, 67])
    .prepend(publisher2)
    .sink {
        print($0)
    }

print("----- append -----") // 앞에 추가됨
let numbers2 = (1...10).publisher
let publisher2 = (100...110).publisher

numbers2
    .append(11, 12)
    .append(13, 14)
    .append(publisher2)
    .sink {
        print($0)
    }

print("----- switchToLatest -----")
let publisher3 = PassthroughSubject<String, Never>()
let publisher4 = PassthroughSubject<String, Never>()

let publishers = PassthroughSubject<PassthroughSubject<String, Never>, Never>()

publishers
    .switchToLatest()
    .sink { print($0) }

publishers.send(publisher3)

publisher3.send("Publisher 1 - Value 1")
publisher3.send("Publisher 1 - Value 2")

publishers.send(publisher4)
publisher4.send("Publisher 2 - Value 1")

publisher3.send("Publisher 1 - Value 3")

print("----- switchToLatest example -----")

let images = ["houston", "denver", "seattle"]
var index = 0


func getImage() -> AnyPublisher<UIImage?, Never> {
    
    return Future<UIImage?, Never> { promise in
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 3.0) {
            promise(.success(UIImage(named: images[index])))
        }
    }
    .print()
    .map { $0 }
    .receive(on: RunLoop.main)
    .eraseToAnyPublisher()
}

let taps = PassthroughSubject<Void, Never>()

let subscription = taps.map { _ in getImage() }
    .switchToLatest()
    .sink {
        print($0)
    }

//houston
taps.send()

//denver
DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
    index += 1
    taps.send()
}

// seattle
DispatchQueue.main.asyncAfter(deadline: .now() + 5.5) {
    index += 1
    taps.send()
}

print("----- merge -----")

let publisher11 = PassthroughSubject<Int, Never>()
let publisher22 = PassthroughSubject<Int, Never>()

publisher11.merge(with: publisher22)
    .sink { print($0) }

publisher11.send(10)
publisher11.send(11)

publisher22.send(12)
publisher22.send(13)


print("----- combineLatest -----")

let publisher33 = PassthroughSubject<Int, Never>()
let publisher44 = PassthroughSubject<String, Never>()

publisher33.combineLatest(publisher44)
    .sink { print("P1: \($0), P2: \($1)") }

publisher33.send(1)
publisher33.send(2)

publisher44.send("A")
publisher44.send("B")

print("----- zip -----")

let publisher55 = PassthroughSubject<Int, Never>()
let publisher66 = PassthroughSubject<String, Never>()

publisher55.zip(publisher66) // combineLatest와는 다르게 최신시퀀스를 기다리지 않는다.
    .sink { print("P1: \($0), P2: \($1)") }

publisher55.send(1)
publisher55.send(2)

publisher66.send("A")
publisher66.send("B")
publisher66.send("C")
