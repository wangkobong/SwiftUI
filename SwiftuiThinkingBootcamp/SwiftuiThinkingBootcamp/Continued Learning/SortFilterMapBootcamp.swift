//
//  SortFilterMapBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2023/01/05.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    init () {
        getUsers()
        filterUser()
    }
    
    func getUsers() {
        let user1 = UserModel(name: "Nick1", points: 5, isVerified: true)
        let user2 = UserModel(name: "Nick2", points: 0, isVerified: false)
        let user3 = UserModel(name: "Nick3", points: 20, isVerified: true)
        let user4 = UserModel(name: nil, points: 50, isVerified: false)
        let user5 = UserModel(name: "Nick5", points: 45, isVerified: true)
        let user6 = UserModel(name: "Nick6", points: 23, isVerified: true)
        let user7 = UserModel(name: "Nick7", points: 88, isVerified: false)
        let user8 = UserModel(name: nil, points: 43, isVerified: false)
        let user9 = UserModel(name: "Nick9", points: 90, isVerified: true)
        let user10 = UserModel(name: "Nick10", points: 29, isVerified: true)
        self.dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7,
            user8,
            user9,
            user10,
        ])
    }
    
    func filterUser() {
        
        
        // sort
        //filteredArray = dataArray.sorted { $0.points < $1.points }
        
        // filter
        //filteredArray = dataArray.filter { $0.points < 50 }
        
        // map
        //        mappedArray = dataArray.map { $0.name ?? "unkown" }
        //        mappedArray = dataArray.compactMap({ user -> String? in
        //            return user.name ?? "unknown"
        //        })
        
        _ = dataArray.sorted { $0.points > $1.points }
        _ = dataArray.filter { $0.isVerified }
        _ = dataArray.compactMap { $0.name }
        
        mappedArray = dataArray.sorted { $0.points > $1.points }.filter { $0.isVerified }.compactMap { $0.name }
        
    }
}

struct SortFilterMapBootcamp: View {
    
    @StateObject var vm = ArrayModificationViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(vm.mappedArray, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
//                ForEach(vm.filteredArray) { user in
//                    VStack(alignment: .leading) {
//                        Text(user.name)
//                            .font(.headline)
//                        HStack {
//                            Text("Points: \(user.points)")
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.blue.cornerRadius(10))
//                    .padding(.horizontal)
//                }
            }
        }
    }
}

struct SortFilterMapBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SortFilterMapBootcamp()
    }
}
