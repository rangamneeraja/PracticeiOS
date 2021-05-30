//
//  ViewController.swift
//  JSONSerialization_and_Decoder
//
//  Created by Rexel_Neeraja on 30/05/21.
//

import UIKit
import Foundation

//      model class to put data into
struct Course {
    let id:Int
    let name:String
    let link:String
    let imageUrl:String
    
//    init it for json serializing
    init(json: [String: Any]) {
       id = json["id"] as? Int ?? -1
        name = json["name"] as? String ?? ""
        link = json["link"] as? String ?? ""
        imageUrl = json["imageUrl"] as? String ?? ""
    }
}

struct Courses: Decodable { //decodable for JSONDecoding
    let id:Int
    let name:String
    let link:String
    let imageUrl:String
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        the url = "https://api.letsbuildthatapp.com/jsondecodable/course"
        
        jsonSerializing()
        jsonDecoding()
        
    }

//    json serializing methods -objective c, swift older versions
    public func jsonSerializing(){

               let jsonUrl = "https://api.letsbuildthatapp.com/jsondecodable/course"
               guard let url = URL(string: jsonUrl) else {return}
               
       //        write dataTask for urlsession
               URLSession.shared.dataTask(with: url) { (data, response, err) in
                   
                   guard let data = data else {return}
       //        parse the json object
                   do{
                       guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any] else {return}
                       
                       let course = Course(json: json)
                       print(course)
                       
                   }catch let jsonErr{
                       print("error")
                   }
               }.resume()
    }
    
//    function for json decoder for swift 4+
    public func jsonDecoding() {
        
        let jsonUrl = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        
        guard let url = URL(string: jsonUrl) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else {return}
            do {
                let courses = try JSONDecoder().decode([Courses].self, from: data)
                print(courses)
            }catch let jsonErr{
                print("error")
            }
            
        }
        
    }
}


