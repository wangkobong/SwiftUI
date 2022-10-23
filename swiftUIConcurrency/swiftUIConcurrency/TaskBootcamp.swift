//
//  TaskBootcamp.swift
//  swiftUIConcurrency
//
//  Created by sungyeon kim on 2022/10/23.
//

import SwiftUI

class TaskBootcampViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var image2: UIImage? = nil

    
    func fetchImage() async {
        do {
            guard let url = URL(string: "https://picsum.photos/200") else { return }
            let (data, _) = try await URLSession.shared.data(from: url, delegate: nil)
            self.image = UIImage(data: data)
        
        } catch  {
            print(error.localizedDescription)
        }
    }
    
    func fetchImage2() async {
        do {
            guard let url = URL(string: "https://picsum.photos/200") else { return }
            let (data, _) = try await URLSession.shared.data(from: url, delegate: nil)
            self.image2 = UIImage(data: data)
        
        } catch  {
            print(error.localizedDescription)
        }
    }
}

struct TaskBootcamp: View {
    
    @StateObject private var viewModel = TaskBootcampViewModel()
    
    var body: some View {
        VStack(spacing: 40) {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            
            if let image2 = viewModel.image2 {
                Image(uiImage: image2)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
        }
        .onAppear {
            
//            Task {
//                print(Thread.current)
//                print(Task.currentPriority)
//                await viewModel.fetchImage()
//            }
//            Task {
//                print(Thread.current)
//                print(Task.currentPriority)
//                await viewModel.fetchImage2()
//            }
            Task(priority: .low) {
                print("LOW: \(Thread.current): \(Task.currentPriority)")
            }
            
            Task(priority: .medium) {
                print("medium: \(Thread.current): \(Task.currentPriority)")
            }
            
            Task(priority: .high) {
                print("high: \(Thread.current): \(Task.currentPriority)")
            }
            
            Task(priority: .background) {
                print("background: \(Thread.current): \(Task.currentPriority)")
            }
            
            Task(priority: .utility) {
                print("utility: \(Thread.current): \(Task.currentPriority)")
            }
            
            Task(priority: .userInitiated) {
                print("userInitiated: \(Thread.current): \(Task.currentPriority)")
            }
        }
    }
}

struct TaskBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TaskBootcamp()
    }
}
