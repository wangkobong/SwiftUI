//
//  EscapingBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2023/01/15.
//

import SwiftUI

class EscapingViewModel: ObservableObject {
    
    @Published var text: String = "Hello"
    
    func getData() {
        downloadData5 { [weak self] downloadedData in
            self?.text = downloadedData.data
        }
    }
    
    func downloadData() -> String {

        return "New data!"
    }
    
    func downloadData2(completion: (_ data: String) -> Void)  {
        completion("New data!")
    }
    
    func downloadData3(completion: @escaping (_ data: String) -> Void)  {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completion("New data!")
        }
    }
    
    func downloadData4(completion: @escaping (DownloadResult) -> Void)  {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let result = DownloadResult(data: "New data!")
            completion(result)
        }
    }
    
    func downloadData5(completion: @escaping DownloadCompletion)  {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let result = DownloadResult(data: "New data!")
            completion(result)
        }
    }
    
    func doSomething(_ data: String) {
        print(data)
    }
}

struct DownloadResult {
    let data: String
}

typealias DownloadCompletion = (DownloadResult) -> ()

struct EscapingBootcamp: View {
    
    @StateObject var viewModel = EscapingViewModel()
    
    var body: some View {
        Text(viewModel.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.blue)
            .onTapGesture {
                viewModel.getData()
            }
    }
}

struct EscapingBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        EscapingBootcamp()
    }
}
