//
//  BottomBar.swift
//  Pro
//
//  Created by Sofi on 09.03.2021.
//

import SwiftUI

struct BottomBar:View {
    @State var item = 1
    var body: some View{
        TabView(selection:$item){
            Main().tabItem { VStack{
                Image("Plan")
                Text("Plan")
            } }
            Lessons().tabItem { VStack{
                Image("lessons")
                Text("Lessons")
            } }
        }
    }
}
