//
//  Transition.swift
//  Pro
//
//  Created by Sofi on 09.03.2021.
//

import SwiftUI

struct Transition:View {
    @State var transition = 1
    var body: some View{
        if transition == 1{
            SignIn( transition: $transition)
        } else  if transition == 2{
            BottomBar()
        }
    }
}
