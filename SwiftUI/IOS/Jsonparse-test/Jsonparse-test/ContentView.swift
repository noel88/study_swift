//
//  ContentView.swift
//  Jsonparse-test
//
//  Created by N on 2020/11/18.
//

import SwiftUI
import Alamofire
import SwiftyJSON

struct ContentView: View {
    
    @ObservedObject var obs = observer()
    
    init() {
        obs = observer()
    }
    
    var body: some View {
        Text(obs.datas.body)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


class observer: ObservableObject {
    
    @Published var datas: datatype = datatype(id: 0, title: "", body: "", userId: 0)
    
    init() {
        AF.request("https://jsonplaceholder.typicode.com/posts/1").responseData { (data) in
            
            let json = try! JSON(data: data.data!)
          
            self.datas = datatype(id: json["id"].intValue, title: json["title"].stringValue, body: json["body"].stringValue, userId: json["userId"].intValue)
        }
    }
    
    
}

struct datatype: Identifiable {
    var id: Int
    var title: String
    var body: String
    var userId: Int
}


