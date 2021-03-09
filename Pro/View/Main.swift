//
//  Msin.swift
//  Pro
//
//  Created by Sofi on 09.03.2021.
//

import SwiftUI




struct Main: View {
    @State var offsetCustom: CGFloat =  180
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.clear)
                .background(LinearGradient(gradient: Gradient(colors: [Color("l"), Color("t")]), startPoint: .leading, endPoint: .trailing))
            ZStack{
                RoundedRectangle(cornerRadius: 49).frame(width: 345, height: 659, alignment: .center)
                    .foregroundColor(.white)
                HStack(spacing:offsetCustom == 180 ? 80 : 120){
                    VStack{
                        Text("0")
                        Text("Training")
                    }
                    VStack{
                        Text("0")
                        Text("Kcal")
                    }

                    VStack{
                        Text("0")
                        Text("Minutes")
                    }

                }.offset( y: offsetCustom == 180 ? -260 : -370)
            }.offset( y: 10).foregroundColor(offsetCustom == 180 ? Color("te") : .white).font(.custom("ND Astroneer", size: offsetCustom == 180 ? 16 : 18))
            VStack{
                Text("Home Gym").font(.custom("ND Astroneer", size: 24)).foregroundColor(.white).offset(x: offsetCustom == 180 ? 0 : -135, y: offsetCustom == 180 ? 0:-30)
                Spacer()
            }.offset( y: 70)
            ZStack(alignment:.top){
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width, height: 800, alignment: .center)
                VStack{
                    ZStack{
                        Image("hand")
                        Text("Hands").font(.custom("ND Astroneer", size: 18)).foregroundColor(Color("te")).offset(x: -120, y: 45)
                    }
                    ZStack{
                        Image("sp")
                        Text("Spine").font(.custom("ND Astroneer", size: 18)).foregroundColor(Color("te")).offset(x: -120, y: 45)
                    }
                    ZStack{
                        Image("torso")
                        Text("Torso").font(.custom("ND Astroneer", size: 18)).foregroundColor(Color("te")).offset(x: -120, y: 45)
                    }
                    ZStack{
                        Image("leg")
                        Text("Legs").font(.custom("ND Astroneer", size: 18)).foregroundColor(Color("te")).offset(x: -120, y: 45)
                    }
                    
                }
            }.offset( y: offsetCustom).animation(.linear).gesture(DragGesture()
                                                                    .onEnded({ (value) in
                                                                      if  value.translation.height <= 50{
                                                                            offsetCustom = 70
                                                                        
                                                                        }
                                                                        if -value.translation.height <= 50{
                                                                            offsetCustom = 180
                                                                        }
                                                                    })
            )
            
        }.edgesIgnoringSafeArea(.all)
    }
}

struct Msin_Previews: PreviewProvider {
    static var previews: some View {
        BottomBar()
    }
}
