import UIKit
import Combine

print("----- min & max -----")
let publisher = [1, -45, 3, 45, 100].publisher

publisher
    .min() //가장 작은 시퀀스 관찰
    .sink { print($0) }

publisher
    .max()
    .sink { print($0) }

print("----- first & last -----")

let publisher2 = ["A", "B", "C", "D"].publisher

publisher2
    .first()
    .sink { print($0) }

publisher2
    .first(where: {"Cat".contains($0)})
    .sink { print($0) }

publisher2
    .last()
    .sink { print($0) }

publisher2
    .last(where: {"ABC".contains($0)})
    .sink { print($0) }

print("----- output -----")

let publisher3 = ["A", "B", "C", "D"].publisher

publisher3
    .output(at: 2)
    .sink { print($0) }

print("----- output range -----")

publisher3
    .output(in: (0...2))
    .sink { print($0) }

print("----- count -----")

let publisher4 = ["A", "B", "C", "D"].publisher

let publisher5 = PassthroughSubject<Int, Never>()

publisher4
    .count() //시퀀스 개수를 관출
    .sink { print($0) }

publisher5
    .count()
    .sink { print($0)}

publisher5
    .send(5)
publisher5
    .send(5)
publisher5
    .send(5)
publisher5
    .send(completion: .finished)

print("----- contains -----")

let publisher6 = ["A", "B", "C", "D"].publisher
publisher6
    .contains("C") // Bool값 리턴
    .sink { print($0) }

print("----- allSatisfy -----")

let publisher7 = [1, 2, 3, 4, 5, 6, 7].publisher
publisher7
    .allSatisfy { $0 % 2 == 0 } // 모든 시퀀스가 참이면 true 리턴
    .sink { print($0) }

print("----- reduce -----")
let publisher8 = [1, 2, 3, 4, 5, 6, 7].publisher

publisher8
    .reduce(0) { accumulator, value in
        print("accumulator: \(accumulator) and the value is \(value)")
        return accumulator + value
    }.sink { print($0) }
