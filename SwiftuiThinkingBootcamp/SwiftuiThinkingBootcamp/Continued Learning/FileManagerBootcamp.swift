  //
//  FileManagerBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2023/01/19.
//

import SwiftUI

class localFileManger {
    
    static let shared = localFileManger()
    let folderName = "MyApp_Images"
    init() {
        createFolderIfNeeded()
    }
    
    func createFolderIfNeeded() {
        guard
            let path = FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(folderName)
            .path else {
            return
        }
        
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
                print("Success creating folder.")
            } catch let error {
                print("Error creating folder. \(error)")
            }
        }
    }
    
    func deleteFolder() {
        guard
            let path = FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(folderName)
            .path else {
            return
        }
        
        do {
            try FileManager.default.removeItem(atPath: path)
            print("Success deleting folder.")
        } catch let error {
            print("Error deleting folder. \(error)")
        }
    }
    
    func saveImage(image: UIImage, name: String) -> String {
        
        guard
            let data = image.jpegData(compressionQuality: 1.0),
            let path = getPathForImage(name: name) else {
            return "Error getting data."
        }
        
        //let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        let directory2 = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
        //let directory3 = FileManager.default.temporaryDirectory
        
//        let path = directory2?.appendingPathComponent("\(name).jpg")
    
        
        do {
            try data.write(to: path)
            print(path)
            return "Success saving!"
        } catch let error {
            return error.localizedDescription
        }
        
        
        //print(directory)
//        print(directory2)
//        print(path)
        //print(directory3)

    }
    
    func getImage(name: String) -> UIImage? {
        guard
            let path = getPathForImage(name: name)?.path(percentEncoded: true),
            FileManager.default.fileExists(atPath: path) else {
            print("Error getting path.")
            return nil
            
        }
        return UIImage(contentsOfFile: path)
    }
    
    func deleteImage(name: String) -> String {
        guard
            let path = getPathForImage(name: name)?.path,
            FileManager.default.fileExists(atPath: path) else {
            return "Error getting path."
        }
        
        do {
            try FileManager.default.removeItem(atPath: path)
            return "Successfully deleted."
        } catch let error {
            return error.localizedDescription
        }
    }
    
    func getPathForImage(name: String) -> URL? {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .appendingPathComponent("\(name).jpg") else {
            print("Error getting path.")
            return nil
        }
        return path
    }
}

class FileManagerViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    let imageName: String = "fish"
    let manager = localFileManger.shared
    @Published var infoMessage: String = ""
    
    init() {
        //  getImageFromAssetsFolder()
        getImageFromFileManager()
        //print("image: \(image)")
    }
    
    func getImageFromAssetsFolder() {
        image = UIImage(named: imageName)
    }
    
    func getImageFromFileManager() {
        image = manager.getImage(name: imageName)
    }
    
    func saveImage() {
        guard let image = image else { return }
        infoMessage = manager.saveImage(image: image, name: imageName)
    }
    
    func deleteImage() {
        infoMessage = manager.deleteImage(name: imageName)
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
                    
                    HStack {
                        Button {
                            viewModel.saveImage()
                        } label: {
                            Text("Save to FileManger")
                                .foregroundColor(.white)
                                .font(.headline)
                                .padding()
                                .padding(.horizontal)
                                .background(.blue)
                                .cornerRadius(10)
                        }
                        
                        Button {
                            viewModel.deleteImage()
                        } label: {
                            Text("delete From FileManger")
                                .foregroundColor(.white)
                                .font(.headline)
                                .padding()
                                .padding(.horizontal)
                                .background(.red)
                                .cornerRadius(10)
                        }
                    }
                    
                    Text(viewModel.infoMessage)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(.purple)
   
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
