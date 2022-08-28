import UIKit
import Combine

var greeting = "Hello, playground"

print("----- collect 연산자 -----")
let stringArr = ["A", "B", "C", "D", "F"]
    .publisher
    .collect(2) //개별 항복을 수집하고 배열로 변환, 숫자를 전달하면 해당 숫자만큼 배열의 개수를 정함
    .sink {
        print($0)
    }

print("----- map 연산자 -----")

let formatter = NumberFormatter()
formatter.numberStyle = .spellOut

[123, 45, 67].publisher
    .map {
        formatter.string(from: NSNumber(integerLiteral: $0)) ?? ""
    }
    .sink {
        print($0)
    }

print("----- map keypath 연산자 -----")

struct Point {
    let x: Int
    let y: Int
}

let publisher = PassthroughSubject<Point, Never>()

publisher.map(\.x, \.y)
    .sink { x, y in
        print("x is \(x) and y is \(y)")
    }

publisher.send(Point(x: 12, y: 5))

print("----- flatmap 연산자 -----")

struct School {
    let name: String
    let noOfStudents: CurrentValueSubject<Int, Never>
    
    init(name: String, noOfStudents: Int) {
        self.name = name
        self.noOfStudents = CurrentValueSubject(noOfStudents)
    }
}

let citySchool = School(name: "Fountain Head School", noOfStudents: 100)

let school = CurrentValueSubject<School, Never>(citySchool)

school
    .flatMap { $0.noOfStudents } //
    .sink {
        print($0)
    }

let townSchool = School(name: "Town Head School", noOfStudents: 45)

school.value = townSchool
citySchool.noOfStudents.value += 1
townSchool.noOfStudents.value += 10

print("----- replace nil 연산자 -----")

["A", "B", nil, "C", "D", "F"].publisher
    .replaceNil(with: "*")
    .compactMap{ $0 }
    .collect()
    .sink {
        print($0)
    }


print("----- replace empty 연산자 -----")

let empty = Empty<Int, Never>()

empty
    .replaceEmpty(with: 1)
    .sink(receiveCompletion: { print($0) }, receiveValue: { print($0) })

print("----- scan 연산자 -----")

let publisher2 = (1...10).publisher

publisher2.scan([]) { numbers, value -> [Int] in
    return numbers + [value]
}
.sink {
    print($0)
}

let test = [1] + [2]
print(test)
