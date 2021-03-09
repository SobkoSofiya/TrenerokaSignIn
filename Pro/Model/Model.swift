//
//  Model.swift
//  Pro
//
//  Created by Sofi on 09.03.2021.
//

import Foundation



struct Model:Hashable {
    let username, email, password:String
}


struct ModelLessons:Hashable {
    let category, id, url:String
}
