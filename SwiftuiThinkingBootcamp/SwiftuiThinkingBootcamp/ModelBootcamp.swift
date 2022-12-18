//
//  ModelBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2022/12/18.
//

import SwiftUI

struct User: Identifiable {
    var id: String = UUID().uuidString
    let displayName: String
    let userName: String
    let followerCount: Int
    let isVerified: Bool
}

struct ModelBootcamp: View {

    @State var users: [User] = [
        User(displayName: "nick123", userName: "Nick", followerCount: 100, isVerified: true),
        User(displayName: "emily44", userName: "Emily", followerCount: 200, isVerified: false),
        User(displayName: "samantha1", userName: "Samantha", followerCount: 300, isVerified: false),
        User(displayName: "kobong", userName: "Chris", followerCount: 400, isVerified: true),
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users) { user in
                    HStack(spacing: 15.0) {
                        Circle()
                            .frame(width: 35, height: 35)
                        VStack(alignment: .leading) {
                            Text(user.userName)
                                .font(.headline)
                            Text("@\(user.displayName)")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        Spacer()
                        
                        if user.isVerified {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.blue)
                        }
   
                        VStack {
                            Text("\(user.followerCount)")
                                .font(.headline)
                            Text("Followers")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                    }
                    .padding(.vertical, 10)
                }
                
//                ForEach(users, id: \.self) { user in
//                    HStack(spacing: 15.0) {
//                        Circle()
//                            .frame(width: 35, height: 35)
//                        VStack {
//                            Text(user.userName)
//                            Text(user.displayName)
//                            Text("\(user.followerCount)")
//                        }
//                    }
//                    .padding(.vertical, 10)
//                }
            }
            .navigationTitle("Users")
        }
    }
}

struct ModelBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ModelBootcamp()
    }
}
