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
let arrayOfPhotos = [createUIImageView(name: "6"),createUIImageView(name: "alison"),createUIImageView(name: "amy"),
                     createUIImageView(name: "architects"),createUIImageView(name: "chem"),createUIImageView(name: "coal"),
                     createUIImageView(name: "doom"),createUIImageView(name: "gray"),createUIImageView(name: "hacktivist"),
                     createUIImageView(name: "halloats"),createUIImageView(name: "king"),createUIImageView(name: "korn"),
                     createUIImageView(name: "laura"),createUIImageView(name: "marvin"),createUIImageView(name: "mister"),
                     createUIImageView(name: "northlane"),createUIImageView(name: "ohms"),createUIImageView(name: "ppk"),
                     createUIImageView(name: "shokran"),createUIImageView(name: "sinatra")]
struct CustomData {
    
    var image = UIImage()
}

func createUIImageView(name: String) -> UIImageView {
    let imageView = UIImageView()
     imageView.image = UIImage(named: name)
     imageView.translatesAutoresizingMaskIntoConstraints = false
     return imageView
}
let cars = ["BMW"]
struct Photo {
    
    let image: UIImage
    
    static func makeView() -> UIImage {
        UIImage(named: "6")!
    }
}
let photo = Photo.makeView()
let arrayOfPhotoNames = ["6","alison","amy","architects","chem","coal","doom","gray","hacktivist","halloats","king","korn",
                         "laura", "marvin","mister","northlane","ohms","ppk","shokran","sinatra"]
func randomNameArray() -> [String] {
    var setOfNames: Set<String> = []
    repeat {
        if let name = arrayOfPhotoNames.randomElement() {
                    setOfNames.insert(name)
                }
    } while setOfNames.count < 3
    return Array(setOfNames)
}
let arrOfNames = randomNameArray()
let randomNameOne = arrOfNames[0]
let randomNameTwo = arrOfNames[1]
let randomNameThree = arrOfNames[2]
