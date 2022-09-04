import UIKit
import Combine

//let publisher = (1...20).publisher
//
//publisher
//    .print("Debugging")
//    .sink { print($0) }
//

guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { fatalError() }

let request = URLSession.shared.dataTaskPublisher(for: url)

let test = request.handleEvents(receiveSubscription: { _ in
    print("Subscription received")
}, receiveOutput: { _ in
    print("Received Output")
}, receiveCompletion: { _ in
    print("Received completion")
}, receiveCancel: {
    print("Received cancel")
}, receiveRequest: { _ in
    print("Received request")
}).sink(receiveCompletion: {print($0)}) { data, response in
    print(data)
}

