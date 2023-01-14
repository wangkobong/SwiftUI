//
//  WeakSelfBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2023/01/13.
//

import SwiftUI

struct WeakSelfBootcamp: View {
    
    @AppStorage("count") var count: Int?
    
    var body: some View {
        NavigationView {
            NavigationLink("Navigate", destination: WeakSelfSecondScreen())
                .navigationTitle("Screen 1")
        }
        .overlay (
                Text("\(count ?? 0)")
                    .font(.largeTitle)
                    .padding()
                    .background(Color.green.cornerRadius(10))
                , alignment: .topTrailing
        )
        
    }
}

struct WeakSelfSecondScreen: View {
    
    @StateObject var viewModel = WeakSelfSecondScreenViewModel()
    
    
    var body: some View {
        Text("Second View")
            .font(.largeTitle)
            .foregroundColor(.red)
        
        if let data = viewModel.data {
            Text(data)
        }
    }
}

class WeakSelfSecondScreenViewModel: ObservableObject {

    @Published var data: String? = nil
    
    init() {
        print("INIT NOW")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount + 1, forKey: "count")
        getData()
    }
    
    deinit {
        print("DEINIT!!!")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount - 1, forKey: "count")
    }
    
    func getData() {
        data = "NEW DATA!!"
    }
}

struct WeakSelfBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        WeakSelfBootcamp()
    }
}
