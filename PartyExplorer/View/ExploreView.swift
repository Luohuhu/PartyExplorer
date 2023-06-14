//
//  ContentView.swift
//  PartyExplorer
//
//  Created by Xianfu Luo on 6/13/23.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var viewModel: ExploreViewModel
    @State private var showSearchView = false
    @State private var searchInput = ""
    init(viewModel: ExploreViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView{
            Text("Parties For You").font(.largeTitle).foregroundColor(Color.purple)
            HStack(alignment: .top) {
                VStack{
                    ForEach(viewModel.appData) { item in
                        if item.id % 2 == 0
                        {
                            if (searchInput=="" || item.name.contains(searchInput)){
                                CardView(data: item).padding(0)
                            }
                        }
                    }
                    
                }.frame(width: UIScreen.main.bounds.width/2)
                VStack{
                    ForEach(viewModel.appData) { item in
                        if item.id % 2 != 0
                        {
                            if (searchInput=="" || item.name.contains(searchInput)){
                                CardView(data: item).padding(0)
                            }
                        }
                    }
                }.frame(width: UIScreen.main.bounds.width/2)
            }.blur(radius: (showSearchView ? 10 : 0))
        }
        .overlay(alignment: .bottomTrailing){
            addButton
        }
        .overlay(alignment: .bottomLeading){
            searchButton
        }
        .overlay(alignment: .center){
            if showSearchView {
                searchView
            }
        }
    }
}

private extension ExploreView {
    var addButton: some View {
        Button{
            viewModel.addOneParty()
        } label: {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .padding()
        }
    }
    var searchView: some View {

        TextField("Search for parties", text: $searchInput)
            .textFieldStyle(PlainTextFieldStyle())
            .foregroundColor(.blue)
            .font(.largeTitle)
            .padding(.horizontal)
               //.background(UIBlurEffect(style: .systemUltraThinMaterial))
            .cornerRadius(15.0)
        
    }
    
    var searchButton: some View{
        Button{
            showSearchView.toggle()
        } label: {
            Image(systemName: "magnifyingglass.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                //.renderingMode(.template)
                .foregroundColor((searchInput=="" ? .blue : .red))
                .padding()
        }
    }
    
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView(viewModel: .init())
    }
}
