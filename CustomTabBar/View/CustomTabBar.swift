//
//  CustomTabBar.swift
//  CustomTabBar
//
//  Created by yuki.tanaka on 2022/12/09.
//

import SwiftUI

struct CustomTabBar: View {

    @Binding var currentTab: Tab

    var body: some View {
        GeometryReader { proxy in
            /// HStackの横幅
            let width = proxy.size.width

            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            currentTab = tab
                        }
                    } label: {
                        Image(systemName: tab.rawValue)
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ? .black : .gray)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .background(alignment: .leading) {
                Circle()
                    .fill(.orange)
                    .frame(width: 25, height: 25)
                    .offset(x: 20) // ◯の初期x座標
                    .offset(x: indicatorOffset(width: width)) // ◯の移動x座標
            }
        }
        .frame(height: 30)
        .padding(.bottom, 10)
        .padding([.horizontal, .top])
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension CustomTabBar {
    func indicatorOffset(width: CGFloat) -> CGFloat {
        let index = CGFloat(getIndex())
        if index == 0{
            return 0
        }
        /// Tabアイテムの横幅
        let buttonWidth = width / CGFloat(Tab.allCases.count)

        return index * buttonWidth
    }
    func getIndex() -> Int {
        switch currentTab {
        case .home:
            return 0
        case .search:
            return 1
        case .ranking:
            return 2
        case .book:
            return 3
        case .setting:
            return 4
        }
    }
}
