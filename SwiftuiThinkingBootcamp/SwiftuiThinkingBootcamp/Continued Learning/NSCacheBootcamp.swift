//
//  NSCacheBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2023/01/22.
//

import SwiftUI

class CacheManager {
    
    static let shared = CacheManager() // Singleton
    
    private init() {}
    
    var imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100 // 100mb
        return cache
    }()
    
    func add(image: UIImage, name: String) -> String {
        imageCache.setObject(image, forKey: name as NSString)
        return "Added to cache!"
    }
    
    func remove(name: String) -> String {
        imageCache.removeObject(forKey: name as NSString)
        return "removed from cache!"
    }
    
    func get(name: String) -> UIImage? {
        return imageCache.object(forKey: name as NSString)
    }
}

class CacheViewModel: ObservableObject {
    
    @Published var startingImage: UIImage? = nil
    @Published var cachedImage: UIImage? = nil
    @Published var infoMessage: String = ""
    
    let imageName = "fish"
    let manager = CacheManager.shared
    
    init() {
        getImageFromAssetsFolder()
    }
    
    func getImageFromAssetsFolder() {
        startingImage = UIImage(named: imageName)
    }
    
    func saveToCache() {
        guard let image = startingImage else { return }
        infoMessage = manager.add(image: image, name: imageName)
    }
    
    func removeFromCache() {
        infoMessage = manager.remove(name: imageName)
    }
    
    func getFromCache() {
        if let returnedImage = manager.get(name: imageName) {
            cachedImage = returnedImage
            infoMessage = "Got image from cache"
        } else {
            infoMessage = "Image not found in Cache"
        }
        
    }
    
}

struct NSCacheBootcamp: View {
    
    @StateObject var viewModel = CacheViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let image = viewModel.startingImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(10)
                }
                
                Text(viewModel.infoMessage)
                    .font(.headline)
                    .foregroundColor(.purple)

                HStack {
                    
                    Button {
                        viewModel.saveToCache()
                    } label: {
                        Text("Save to cache")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(.blue)
                            .cornerRadius(10)
                    }
                    
                    Button {
                        viewModel.removeFromCache()
                    } label: {
                        Text("delete from cache")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(.red)
                            .cornerRadius(10)
                    }
                    
                    Button {
                        viewModel.getFromCache()
                    } label: {
                        Text("get from cache")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(.green)
                            .cornerRadius(10)
                    }
                }
                
                if let image = viewModel.cachedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(10)
                }

                
                Spacer()
            }
            .navigationTitle("Cache Bootcamp")
        }
    }
}

struct NSCacheBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        NSCacheBootcamp()
    }
}
