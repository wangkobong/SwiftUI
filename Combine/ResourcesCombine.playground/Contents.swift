import UIKit
import Combine

//var subscription3: AnyCancellable? = nil

guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { fatalError("Invalid URL") }

let subject = PassthroughSubject<Data, URLError>()

let request = URLSession.shared.dataTaskPublisher(for: url)
    .map(\.data)
    .multicast(subject: subject)

let subscription1 = request.sink(receiveCompletion: { _ in }) { data in
    print("subscription1")
    print(data)
}

let subscription2 = request.sink(receiveCompletion: { _ in }) { data in
    print("subscription2")
    print(data)
}

let subscription3 = request.sink(receiveCompletion: { _ in }, receiveValue: {
    print("subscription3")
    print($0)
})

request.connect()
subject.send(Data())
