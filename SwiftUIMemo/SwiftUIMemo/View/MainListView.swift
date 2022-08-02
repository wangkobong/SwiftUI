//
//  MainListView.swift
//  SwiftUIMemo
//
//  Created by sungyeon kim on 2022/08/01.
//

import SwiftUI

struct MainListView: View {
    @EnvironmentObject var manager: CoreDataManager
    
    @State private var showComposer: Bool = false
    @State private var keyword = ""
    @State private var sortByDateDesc = true
    
    // 뷰안에서 선언해야함
    @FetchRequest(sortDescriptors: [SortDescriptor(\MemoEntity.insertDate, order: .reverse)])
    var memoList: FetchedResults<MemoEntity>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(memoList) { memo in
                    NavigationLink {
                        DetailView(memo: memo)
                    } label: {
                        MemoCell(memo: memo)
                    }
                }
                .onDelete(perform: delete)
            }
            .listStyle(.plain)
            .navigationTitle("내 메모")
            .toolbar {
                HStack {
                    Button {
                        showComposer = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                    // 정렬기능
                    Button {
                        sortByDateDesc.toggle()
                    } label: {
                        Image(systemName: "arrow.up.arrow.down")
                    }

                }
            }
            .sheet(isPresented: $showComposer) {
                ComposeView()
            }
            // 검색기능 구현
            .searchable(text: $keyword, prompt: "내용을 검색합니다")
            .onChange(of: keyword) { newValue in
                if newValue.isEmpty {
                    memoList.nsPredicate = nil
                } else {
                    memoList.nsPredicate = NSPredicate(format: "content CONTAINS[c] %@", newValue)
                }
            }
            
            // 정렬기능
            .onChange(of: sortByDateDesc) { desc in
                if desc {
                    memoList.sortDescriptors = [
                        SortDescriptor(\.insertDate, order: .reverse)
                    ]
                } else {
                    memoList.sortDescriptors = [
                        SortDescriptor(\.insertDate, order: .forward)
                    ]
                }
            }
            
        }
      
    }
    
    func delete(set: IndexSet) {
        for index in set {
            manager.delete(memo: memoList[index])
        }
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(CoreDataManager.shared)
            .environment(\.managedObjectContext, CoreDataManager.shared.mainContext)
    }
}

