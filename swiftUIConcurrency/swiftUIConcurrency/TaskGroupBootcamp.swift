//
//  TaskGroupBootcamp.swift
//  swiftUIConcurrency
//
//  Created by sungyeon kim on 2022/10/25.
//

import SwiftUI

class TaskGroupBootcampDataManager {
    let url = "https://picsum.photos/300"
    func fetchImagesWithAsyncLet() async throws -> [UIImage] {
        async let fetchImage1 = fetchImage(urlString: url)
        async let fetchImage2 = fetchImage(urlString: url)
        async let fetchImage3 = fetchImage(urlString: url)
        async let fetchImage4 = fetchImage(urlString: url)
        
        let (image1, image2, image3, image4) = await (try fetchImage1, try fetchImage2, try fetchImage3, try fetchImage4)
        return [image1, image2, image3, image4]
    }
    
    func fetchImagesWithTaskGroup() async throws -> [UIImage] {
        return try await withThrowingTaskGroup(of: UIImage?.self) { group in
          
            let url = "https://picsum.photos/300"
            var images: [UIImage] = []
         
            let urlStrings = [
                "https://picsum.photos/300",
                "https://picsum.photos/300",
                "https://picsum.photos/300",
                "https://picsum.photos/300",
                "https://picsum.photos/300",
                "https://picsum.photos/300"
            ]
            images.reserveCapacity(urlStrings.count)
            
            for urlString in urlStrings {
                group.addTask {
                    try? await self.fetchImage(urlString: urlString)
                }
            }
            
            // 루프중 하나의 함수라도 실패하면 무한대기?
            for try await image in group {
                if let image = image {
                    images.append(image)
                }
            }
            
//            group.addTask {
//                try await self.fetchImage(urlString: url)
//            }
//
//            group.addTask {
//                try await self.fetchImage(urlString: url)
//            }
//
//            group.addTask {
//                try await self.fetchImage(urlString: url)
//            }
//
//            group.addTask {
//                try await self.fetchImage(urlString: url)
//            }
            

  
            return images
        }
    }

    func fetchImage(urlString: String) async throws -> UIImage {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url, delegate: nil)
            
            if let image = UIImage(data: data) {
                return image
            } else {
                throw URLError(.badURL)
            }
        } catch  {
            throw error
        }
    }
}

class TaskGroupBootcampViewModel: ObservableObject {
    
    @Published var images: [UIImage] = []
    let manager = TaskGroupBootcampDataManager()
    
    func getImages() async {
        if let images = try? await manager.fetchImagesWithTaskGroup() {
            self.images.append(contentsOf: images)
        }
    }
}

struct TaskGroupBootcamp: View {
    
    @StateObject private var viewModel = TaskGroupBootcampViewModel()
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
 
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.images, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                    }
                }
            }
            .navigationTitle("Task Group 😚")
            .task {
                await viewModel.getImages()
            }
        }
    }
}

struct TaskGroupBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TaskGroupBootcamp()
    }
}
