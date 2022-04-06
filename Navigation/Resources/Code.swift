//
//  Code.swift
//  Navigation
//
//  Created by Анатолий Алипур on 26.02.2022.
//

import Foundation
import UIKit

struct Post {
    
    let title: String
}
struct PostModel {
    
    let author: String
    let description: String
    let image: String
    let likes: Int
    let views: Int
    
    static func makeModel() -> [PostModel] {
        var model = [PostModel]()
        model.append(PostModel(author: "Korn", description: "Debut studio album by American nu metal band Korn. It was released on October 11, 1994, through Immortal/Epic Records.", image: "korn", likes: 45, views: 100))
        model.append(PostModel(author: "Hacktivist", description: "Hacktivist are a British rap metal band formed in Milton Keynes, Buckinghamshire, England, in 2011.", image: "hacktivist", likes: 70, views: 99))
        model.append(PostModel(author: "Northlane", description: "Northlane are an Australian metalcore band from Sydney, formed in 2009. ", image: "northlane", likes: 34, views: 50))
        model.append(PostModel(author: "The Korea", description: "«The Korea» (до 2010 года — «Korea») — российская металкор-группа, образованная в 2003 году в Санкт-Петербурге.", image: "vorratokon", likes: 56, views: 78))
        return model
    }
}
