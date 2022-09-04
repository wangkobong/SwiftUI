import UIKit
import Combine

print("----- filter -----")
let numbers = (1...20).publisher

numbers.filter { $0 % 2 == 0}
.sink {
    print($0)
}

print("----- removeDuplicates -----")
let words = "apple apple apple fruit apple apple mango watermelon apple".components(separatedBy: " ").publisher

words
    .removeDuplicates() // 연속되는 시퀀스만 중복제거
    .sink{ print($0) }

print("----- compactmap -----")

let strings = ["a", "1.24", "b", "3.45", "6.7"].publisher
    .compactMap {Float($0)} // 언랩핑
    .sink { print($0) }

print("----- ignoreOutput -----")

let numbers2 = (1...5000).publisher

numbers2
    .ignoreOutput() //방출되는 모든 시퀀스를 무시
    .sink(receiveCompletion: { print($0) }, receiveValue: { print($0) })

print("----- first -----")

let numbers3 = (1...9).publisher

numbers3
    .first(where: { $0 % 2 == 0 }) //처음 방출되는 시퀀스만 관찰
    .sink { print($0) }


print("----- last -----")

numbers3
    .last(where: { $0 % 2 == 0 }) //마지막으로 방출되는 시퀀스만 관찰
    .sink { print($0) }

print("----- dropfirst -----")

let numbers4 = (1...10).publisher

numbers4
    .dropFirst(5) //해당 시퀀스 뒤에서부터 방출되는 시퀀스 관찰
    .sink {
        print($0)
    }

print("----- drop (while) -----")

numbers4
    .drop(while: { $0 % 4 != 0 }) //조건이 참인 시퀀스부터 관찰
    .sink {
        print($0)
    }

print("----- drop(untilOutputFrom) -----")

let isReady = PassthroughSubject<Void, Never>()
let taps = PassthroughSubject<Int, Never>()

taps
    .drop(untilOutputFrom: isReady)
    .sink { print($0) }

(1...10).forEach {
    taps.send($0)
    
    if $0 == 3 {
        isReady.send()
    }
}

print("----- prefix -----")

let numbers5 = (1...10).publisher

numbers5.prefix(5) //앞에서부터 해당 숫자만큼 시퀀스 관찰
    .sink { print($0) }

print("----- prefix(while) -----")

numbers5.prefix(while: { $0 < 3 })//조건걸고 앞에서부터
    .sink { print($0) }

print("----- 과제 -----")

let numbers6 = (1...100).publisher

numbers6
    .dropFirst(50)
    .prefix(20)
    .filter { $0 % 2 == 0}
    .sink { print($0) }
