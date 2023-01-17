//
//  DownloadWithCombine.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2023/01/18.
//

import SwiftUI
import Combine

struct PostModel: Identifiable, Codable  {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class DownloadWithCombineViewModel: ObservableObject {
    
    @Published var posts: [PostModel] = []
    var cancellable = Set<AnyCancellable>()
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        // COMBINE DISCUSSION:
        /*
         1. sign up for monthly subscription for package to be delivered
         2. the company would make the package behind the scene
         3. recieve the package at your front door
         4. make sure the box isn't damaged
         5. open and make sure the item is correct
         6. use the item!!!
         7. cancellable at any time!
        
         1. create the publisher
         2. subscribe publisher on background thread
         3. recieve on main thread
         4. tryMap (check that the data is good)
         5. decode (decode data into PostModels)
         6. sink (put the item into our app)
         7. store (cancel subscription if needed)
         */
        
        URLSession.shared.dataTaskPublisher(for: url)
            //.subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .sink(receiveValue: { [weak self] returnedPost in
                self?.posts = returnedPost
            })
//            .sink { completion in
//                switch completion {
//                case .finished:
//                    print("finished")
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
//            } receiveValue: { [weak self] returnedPost in
//                self?.posts = returnedPost
//            }
            .store(in: &cancellable)
    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}

struct DownloadWithCombine: View {
    
    @StateObject var viewModel = DownloadWithCombineViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.posts) { post in
                VStack(alignment: .leading, spacing: 20) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct DownloadWithCombine_Previews: PreviewProvider {
    static var previews: some View {
        DownloadWithCombine()
    }
}
