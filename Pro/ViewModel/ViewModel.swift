//
//  ViewModel.swift
//  Pro
//
//  Created by Sofi on 09.03.2021.
//

import Foundation
import SwiftUI
import Alamofire
import SwiftyJSON



class ViewModel: ObservableObject {
    @Published var model:[Model] = []
//    @Published var perehod = 0
    func sigUp(user:String, password:String, email:String) {
        
        let url = "http://gym.areas.su/signup?username=\(user)&email=\(email)&password=\(password)&weight=40&height=170"
        AF.request(url, method: .post).validate().responseJSON {[self] response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                model.append( Model(username: user, email: email, password: password))
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
    }
    func signIn(user:String, password:String, co:((_ resilt:String, _ error:String)-> Void)? = nil) {
        
        let url = "http://gym.areas.su//signin?username=\(user)&password=\(password)"
        AF.request(url, method: .post).validate().responseJSON {[self] response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
//                if json["notice"]["token"].stringValue != ""{
//                    perehod = 1
//                } else if json["notice"]["answer"].stringValue == "Error username or password"{
//                    perehod = 2
//                } else if  json["notice"]["answer"].stringValue == "User is active"{
//                    perehod = 3
//                }
                let token = json["notice"]["token"].stringValue
                let error = json["notice"]["answer"].stringValue
                
                co!(token, error)
                
                print("JSON: \(json)")
            case .failure(let error):
//                let err = JSON(error)
//                let ur = err["error"].stringValue
                co!("", error.localizedDescription)
                print(error)
            }
        }
    }
}
