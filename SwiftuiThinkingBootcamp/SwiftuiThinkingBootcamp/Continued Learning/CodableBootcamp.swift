//
//  CodableBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by sungyeon kim on 2023/01/15.
//

import SwiftUI

// Codable = Decodable + Encodable

struct CustomerModel: Identifiable, Codable {
    let id: String
    let name: String
    let points: Int
    let isPremium: Bool
    
//    init(id: String, name: String, points: Int, isPremium: Bool) {
//        self.id = id
//        self.name = name
//        self.points = points
//        self.isPremium = isPremium
//    }
//    
//    enum CodingKeys: CodingKey {
//        case id
//        case name
//        case points
//        case isPremium
//    }
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try container.decode(String.self, forKey: .id)
//        self.name = try container.decode(String.self, forKey: .name)
//        self.points = try container.decode(Int.self, forKey: .points)
//        self.isPremium = try container.decode(Bool.self, forKey: .isPremium)
//    }
//    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(self.id, forKey: .id)
//        try container.encode(self.name, forKey: .name)
//        try container.encode(self.points, forKey: .points)
//        try container.encode(self.isPremium, forKey: .isPremium)
//    }
}

class CodableViewModel: ObservableObject {
    
    @Published var customer: CustomerModel? = nil
    
    init() {
        getData()
    }
    
    func getData() {
        
        guard let data = getJSONData() else { return }
        
//        if
//            let localData = try? JSONSerialization.jsonObject(with: data, options: []),
//            let dictionary = localData as? [String:Any] {
//
//            let id = dictionary["id"] as? String
//            let name = dictionary["name"] as? String
//            let points = dictionary["points"] as? Int
//            let isPremium = dictionary["isPremium"] as? Bool
//
//            let newCustomer = CustomerModel(id: id ?? "", name: name ?? "", points: points ?? 0, isPremium: isPremium ?? false)
//            customer = newCustomer
//        }
        
        do {
            self.customer = try JSONDecoder().decode(CustomerModel.self, from: data)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func getJSONData() -> Data? {
        let customer = CustomerModel(id: "111", name: "EMily", points: 100, isPremium: false)
        let jsonData = try? JSONEncoder().encode(customer)
//        let dictionary: [String:Any] = [
//            "id": "12345",
//            "name": "Joe",
//            "points": 5,
//            "isPremium": true,
//        ]
//        let jsonData = try? JSONSerialization.data(withJSONObject: dictionary, options: [])
        return jsonData
    }
    
}

struct CodableBootcamp: View {
    
    @StateObject var viewModel = CodableViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            if let customer = viewModel.customer {
                Text(customer.id)
                Text(customer.name)
                Text("\(customer.points)")
                Text(customer.isPremium.description)
            }
        }
    }
}

struct CodableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CodableBootcamp()
    }
}
