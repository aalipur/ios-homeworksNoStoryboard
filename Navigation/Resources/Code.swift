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

extension UIView {
    
    static var identifier: String {
        String(describing: self)
    }
}
struct Image {
    
    static let amatory1 = UIImage(named: "6")!, alison = UIImage(named: "alison")!
    static let amy = UIImage(named: "amy")!, architects = UIImage(named: "architects")!
    static let chem = UIImage(named: "chem")!, coal = UIImage(named: "coal")!
    static let amatory2 = UIImage(named: "doom")!, slipknot = UIImage(named: "gray")!
    static let hacktivist = UIImage(named: "hacktivist")!, halloats = UIImage(named: "halloats")!
    static let king = UIImage(named: "king")!, korn = UIImage(named: "korn")!
    static let laura = UIImage(named: "laura")!, marvin = UIImage(named: "marvin")!
    static let mister = UIImage(named: "mister")!, northlane = UIImage(named: "northlane")!
    static let ppk = UIImage(named: "ppk")!, shokran = UIImage(named: "shokran")!
    static let deftones = UIImage(named: "ohms")!, sinatra = UIImage(named: "sinatra")!
}
let arrayOfPhotos = [UIImage(named: "6")!,UIImage(named: "alison")!,UIImage(named: "amy")!,UIImage(named: "architects")!,
                     UIImage(named: "chem")!,UIImage(named: "coal")!,UIImage(named: "doom")!,UIImage(named: "gray")!,
                     UIImage(named: "hacktivist")!,UIImage(named: "halloats")!,UIImage(named: "king")!,UIImage(named: "korn")!,
                     UIImage(named: "laura")!,UIImage(named: "marvin")!,UIImage(named: "mister")!,UIImage(named: "northlane")!,
                     UIImage(named: "ohms")!,UIImage(named: "ppk")!,UIImage(named: "shokran")!,UIImage(named: "sinatra")!]
struct CustomData {
    
    var image = UIImage()
}

