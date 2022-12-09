//
//  ContentView.swift
//  CustomTabBar
//
//  Created by yuki.tanaka on 2022/12/09.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().isHidden = true
    }
    @State var currentTab: Tab = .home
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $currentTab) {
                Text("ホーム")
                    .applyBG()
                    .tag(Tab.home)
                Text("検索")
                    .applyBG()
                    .tag(Tab.search)
                Text("ランキング")
                    .applyBG()
                    .tag(Tab.ranking)
                Text("ブック")
                    .applyBG()
                    .tag(Tab.book)
                Text("設定")
                    .applyBG()
                    .tag(Tab.setting)
            }
            CustomTabBar(currentTab: $currentTab)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func applyBG() -> some View {
        self.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Color(.lightGray)
                    .ignoresSafeArea()
            }
    }
}
