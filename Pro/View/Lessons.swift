//
//  Lessons.swift
//  Pro
//
//  Created by Sofi on 09.03.2021.
//

import SwiftUI
import YouTubePlayer
struct Lessons: View {
    @StateObject var model = ViewModel()
    @State var selection = 1
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.clear)
                .background(LinearGradient(gradient: Gradient(colors: [Color("l"), Color("t")]), startPoint: .leading, endPoint: .trailing))
            VStack(spacing:0){
                Text("Lessons").font(.custom("ND Astroneer", size: 24)).foregroundColor(.white).padding(.bottom)
               
                   
                        HStack(spacing:0){
                            Button(action: {
                                selection = 1
                            }, label: {
                                ZStack{
                                    Rectangle().strokeBorder(Color("te") )
                                        .frame(width: UIScreen.main.bounds.width/4, height: 37, alignment: .center).foregroundColor(.clear).background(selection == 1 ? Color("te") : Color.white)
                                    Text("Hands").font(.custom("ND Astroneer", size: 18))
                                        .foregroundColor(selection != 1 ?  Color("te") : .white)
                                }
                            })
                          
                            Button(action: {
                                selection = 2
                            }, label: {
                                ZStack{
                                    Rectangle().strokeBorder(Color("te") )
                                        .frame(width: UIScreen.main.bounds.width/4, height: 37, alignment: .center).foregroundColor(.clear).background(selection == 2 ? Color("te") : Color.white)
                                    Text("Spine").font(.custom("ND Astroneer", size: 18)) .foregroundColor(selection != 2 ?  Color("te") : .white)                            }
                            })
                          
                            Button(action: {
                                selection = 3
                            }, label: {
                                ZStack{
                                    Rectangle().strokeBorder(Color("te") )
                                        .frame(width: UIScreen.main.bounds.width/4, height: 37, alignment: .center).foregroundColor(.clear).background(selection == 3 ? Color("te") : Color.white)
                                    Text("Torso").font(.custom("ND Astroneer", size: 18)) .foregroundColor(selection != 3 ?  Color("te") : .white)
                                }
                            })
                      
                            Button(action: {
                                selection = 4
                            }, label: {
                                ZStack{
                                    Rectangle().strokeBorder(Color("te") )
                                        .frame(width: UIScreen.main.bounds.width/4, height: 37, alignment: .center).foregroundColor(.clear).background(selection == 4 ? Color("te") : Color.white)
                                    Text("Legs").font(.custom("ND Astroneer", size: 18)) .foregroundColor(selection != 4 ?  Color("te") : .white)
                                }
                            })
                      
                        }
                   .frame(width: UIScreen.main.bounds.width, height: 37, alignment: .center)
                TabView(selection:$selection){
                    Hand(lessonModel: $model.modelLessons).tag(1)
                    Spine(lessonModel: $model.modelLessons).tag(2)
                    Torso(lessonModel: $model.modelLessons).tag(3)
                    Legs(lessonModel: $model.modelLessons).tag(4)
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                   
            
                Spacer()
            }.offset( y: 50)
        }.edgesIgnoringSafeArea(.all).onAppear(perform: {
            model.getLessons()
        })
    }
}

struct Lessons_Previews: PreviewProvider {
    static var previews: some View {
        Lessons()
    }
}



struct Hand:View {
    @Binding var lessonModel:[ModelLessons]
    var body: some View{
        ZStack{
            Color.white
            ScrollView{
                VStack(spacing:20){
                    ForEach(lessonModel, id:\.self){ i in
                        if i.category == "hands"{
                            Video(urlString: i.url).frame(width: UIScreen.main.bounds.width-30, height: 300, alignment: .center)
                            
                    }
                       
                    }
                }
            }
        }
    }
}
struct Spine:View {
    @Binding var lessonModel:[ModelLessons]
    var body: some View{
        ZStack{
            Color.white
            ScrollView{
                VStack(spacing:20){
                    ForEach(lessonModel, id:\.self){ i in
                        if i.category == "spine"{
                            Video(urlString: i.url).frame(width: UIScreen.main.bounds.width-30, height: 300, alignment: .center)
                            
                    }
                       
                    }
                }
            }
        }
    }
}
struct Torso:View {
    @Binding var lessonModel:[ModelLessons]
    var body: some View{
        ZStack{
            Color.white
            ScrollView{
                VStack(spacing:20){
                    ForEach(lessonModel, id:\.self){ i in
                        if i.category == "torso"{
                            Video(urlString: i.url).frame(width: UIScreen.main.bounds.width-30, height: 300, alignment: .center)
                            
                    }
                       
                    }
                }
            }
        }
    }
}
struct Legs:View {
    @Binding var lessonModel:[ModelLessons]
    var body: some View{
        ZStack{
            Color.white
            ScrollView{
                VStack(spacing:20){
                    ForEach(lessonModel, id:\.self){ i in
                        if i.category == "legs"{
                            Video(urlString: i.url).frame(width: UIScreen.main.bounds.width-30, height: 300, alignment: .center)
                            
                    }
                       
                    }
                }
            }
        }
    }
}

struct Video:UIViewControllerRepresentable {
    @State var urlString = ""
    func makeUIViewController(context: UIViewControllerRepresentableContext<Video>) ->   UIViewController{
        let controller = UIViewController()
        let url = URL(string: urlString)
        let VideoController = YouTubePlayerView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-30, height: 300))
        VideoController.loadVideoURL(url!)
        controller.view.addSubview(VideoController)
        return controller
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<Video>) {
        
    }
}
