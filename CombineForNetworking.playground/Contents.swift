import UIKit
import Combine

struct Post: Codable {
    let title: String
    let body: String
}

let url = "https://jsonplaceholder.typicode.com/posts"

func getPosts() -> AnyPublisher<[Post], Error>{
    
    guard let url = URL(string: url) else { fatalError("Invalid URL") }
    
    return URLSession.shared.dataTaskPublisher(for: url)
        .map { $0.data }
        .decode(type: [Post].self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
}

let cancellable = getPosts()
    .sink { _ in
        
    } receiveValue: { data in
        print(data)
    }


