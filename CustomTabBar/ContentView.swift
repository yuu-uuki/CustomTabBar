//
//  ContentView.swift
//  CustomTabBar
//
//  Created by yuki.tanaka on 2022/12/09.
//

import SwiftUI

struct ContentView: View {
    init() {
        // デフォルトのTabBarは使用しないので隠しておく
        UITabBar.appearance().isHidden = true
    }
    @State var currentTab: Tab = .home
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $currentTab) {
                Text("ホーム")
                    .tag(Tab.home)
                Text("検索")
                    .tag(Tab.search)
                Text("ランキング")
                    .tag(Tab.ranking)
                Text("ブック")
                    .tag(Tab.book)
                Text("設定")
                    .tag(Tab.setting)
            }
            Divider()
            CustomTabBar(currentTab: $currentTab)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
