//
//  Sig.swift
//  Pro
//
//  Created by Sofi on 09.03.2021.
//

import SwiftUI


//struct Transition:View {
//    @State var transition = 1
//    var body: some View{
//        if transition == 1{
//            SignIn( transition: $transition)
//        } else  if transition == 2{
//            Main()
//        }
//    }
//}
struct SignIn: View {
    @State var username = ""
    @State var password = ""
    @State var errorAlert = false
    @State var message = ""
    @Binding var transition:Int
    @StateObject var model = ViewModel()
    
    var body: some View {
        ZStack{
            VStack{
                TextField("Email", text: $username)
                TextField("Password", text: $password)
                Button(action: {
                    if username != "" && password != "" {
                        model.signIn(user: "\(username)", password: "\(password)"){ token, error in
                            
                            if token == "" {
                                errorAlert.toggle()
                                message = error
                            } else{
                                transition = 2
                            }
                        }
//
                    }
                }, label: {
                    Text("SignIn").font(.custom("", size: 40))
                }).alert(isPresented: $errorAlert, content: {
                    Alert(title: Text("Error"), message: Text("\(message)"), dismissButton: .default(Text("Ok")))
                })
                
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct Sig_Previews: PreviewProvider {
    static var previews: some View {
        SignIn( transition: .constant(1))
    }
}



struct Main:View {
    var body: some View{
        ZStack{
            Color.red
        }
    }
}
