  //
//  FileManagerBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2023/01/19.
//

import SwiftUI

class localFileManger {
    
    static let shared = localFileManger()
    
    func saveImage(image: UIImage, name: String) {
        
        image.jpegData(compressionQuality: 1.0)
        image.pngData()
    }
}

class FileManagerViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    let imageName: String = "fish"
    init() {
        getImageFromAssetsFolder()
    }
    
    func getImageFromAssetsFolder() {
        image = UIImage(named: imageName)
    }
}

struct FileManagerBootcamp: View {
    
    @StateObject var viewModel = FileManagerViewModel()
    
    var body: some View {
            NavigationView {
                VStack {
                    if let image = viewModel.image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .clipped()
                            .contrast(10)
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Save to FileManger")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(.blue)
                            .cornerRadius(10)
                    }

        
                    Spacer()
                }
                .navigationTitle("File Manager")
            }
            
    }
}

struct FileManagerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        FileManagerBootcamp()
    }
}
