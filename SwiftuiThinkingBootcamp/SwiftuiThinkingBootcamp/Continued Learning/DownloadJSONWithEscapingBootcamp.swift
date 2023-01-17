//
//  DownloadJSONWithEscapingBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2023/01/16.
//

import SwiftUI

//struct PostModel: Identifiable, Codable  {
//    let userId: Int
//    let id: Int
//    let title: String
//    let body: String
//}
 
class DownloadWithEscapingViewModel: ObservableObject {
    
    @Published var posts: [PostModel] = []
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        downloadData(fromURL: url) { returnedData in
            if let data = returnedData {
                guard let newPosts = try? JSONDecoder().decode([PostModel].self, from: data) else { return }
                
                DispatchQueue.main.async { [weak self] in
                    self?.posts = newPosts
                }
            } else {
                print("NO DATA RETURN")
            }
        }
    }
    
    func downloadData(fromURL url: URL, completion: @escaping (_ data: Data?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let data = data,
                error == nil,
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300  else {
                print("Error downloading data.")
                completion(nil)
                return
            }
            
            completion(data)
        }
        .resume()
    }
    
}

struct DownloadJSONWithEscapingBootcamp: View {
    
    @StateObject var viewModel = DownloadWithEscapingViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct DownloadJSONWithEscapingBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DownloadJSONWithEscapingBootcamp()
    }
}
