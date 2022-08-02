//
//  DetailView.swift
//  SwiftUIMemo
//
//  Created by sungyeon kim on 2022/08/02.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var memo: MemoEntity
    
    @EnvironmentObject var manager: CoreDataManager
    
    @State private var showComposer = false
    @State private var showDeleteAlert = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    HStack {
                        Text(memo.content ?? "")
                            .padding()
                        
                        Spacer(minLength: 0)
                    }
                        
                    
                    Text(memo.insertDate ?? .now, style: .date)
                        .padding()
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
        }
        
        .navigationTitle("메모 보기")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button {
                    showDeleteAlert = true
                } label: {
                    Image(systemName: "trash")
                }
                .foregroundColor(.red)
                .alert("삭제 확인", isPresented: $showDeleteAlert) {
                    Button(role: .destructive) {
                        manager.delete(memo: memo)
                        dismiss()
                    } label: {
                        Text("삭제")
                    }

                } message: {
                    Text("메모를 삭제할까요?")
                }

                
                Button {
                    showComposer = true
                } label: {
                    Image(systemName: "square.and.pencil")
                }

            }
        }
        .sheet(isPresented: $showComposer) {
            ComposeView(memo: memo)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(memo: MemoEntity(context: CoreDataManager.shared.mainContext))
                .environmentObject(CoreDataManager.shared)
        }
    }
}
