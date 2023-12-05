//
//  ContentView.swift
//  BigRedBook
//
//  Created by Jerry on 2023/12/3.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var selectedTab = 0
    @State private var selectedDiscoverTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                ScrollView{
                    switch selectedDiscoverTab {
                    case 0:
                        // 推荐页面，可以是你的App主页
                        RecommendView()
                    case 1:
                        // 关注页面
                        Text("关注页面内容")
                    default:
                        EmptyView()
                    }
                }
                //.navigationBarItems(trailing: discoverTopTabView)
                .toolbar(content: {
                        discoverTopTabView
                })
                .navigationTitle("大红书")
                .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("发现")
            }
            .tag(0)
            
            PublishView()
                .tabItem {
                    Image(systemName: "plus.circle")
                    Text("发布")
                }
                .tag(1)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("我的")
                }
                .tag(2)
            
                
        }
    }
    
    var discoverTopTabView: some View {
        Picker(selection: $selectedDiscoverTab, label: Text("")) {
            Text("推荐").tag(0)
            Text("关注").tag(1)
        }
        .pickerStyle(SegmentedPickerStyle())
        .frame(width: 120)
    }
}

#Preview {
    ContentView()
}
