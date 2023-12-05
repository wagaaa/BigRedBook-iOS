//
//  ProfileView.swift
//  BigRedBook
//
//  Created by Jerry on 2023/12/3.
//

import SwiftUI

struct ProfileView: View {
    @State private var isUserLoggedIn = false
    @State private var isLoginSheetPresented = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("个人信息")) {
                    if isUserLoggedIn {
                        NavigationLink(destination: AccountSettingsView()) {
                            ProfileRow()
                        }
                    } else {
                        Button(action: {
                            isLoginSheetPresented.toggle()
                        }) {
                            ProfileRow()
                        }
                        .sheet(isPresented: $isLoginSheetPresented) {
                            LoginView(isUserLoggedIn: $isUserLoggedIn)
                        }
                    }
                }
                
                // 其他部分不变...
                
                
                
                Section(header: Text("设置")) {
                    NavigationLink(destination: Text("通知设置")) {
                        Text("通知设置")
                    }
                }
                
                Section(header: Text("关于 App")) {
                    NavigationLink(destination: Text("关于我们")) {
                        Text("关于我们")
                    }
                    NavigationLink(destination: Text("版本信息")) {
                        Text("版本信息")
                    }
                }
                .navigationTitle("我的")
            }
        }
    }
}
struct ProfileRow: View {
    var body: some View {
        HStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.trailing, 10)

            VStack(alignment: .leading) {
                Text("昵称: YourNickname")
                    .font(.headline)
                Text("ID: YourUserID")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct AccountSettingsView: View {
    var body: some View {
        Text("账号设置页面")
            .navigationTitle("账号设置")
    }
}

struct LoginView: View {
    @Binding var isUserLoggedIn: Bool

    var body: some View {
        // 实现你的登录界面，这里只是一个示例
        VStack {
            Text("登录页面")
            Button("登录") {
                isUserLoggedIn.toggle()
            }
        }
        .padding()
    }
}

#Preview{
    ProfileView()
}
