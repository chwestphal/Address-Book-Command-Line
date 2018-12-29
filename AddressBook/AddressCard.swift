//  Created by Christian Westphal on 28.11.17.
//  Copyright © 2017 Christian Westphal. All rights reserved.
//

import Foundation

class AddressCard: Equatable, Codable {
    
    var first_name = ""
    var surname = ""
    var street = ""
    var zip = 0
    var city = ""
    var hobbies = [String]()
    var friends = [AddressCard]()
    
    init(first_name: String, surname: String, street: String, zip: Int, city: String) {
        self.first_name = first_name
        self.surname = surname
        self.street = street
        self.zip = zip
        self.city = city
    }
    
    func add(hobby: String){
        hobbies.append(hobby)
    }
    
    func remove(hobby: String) {
        if let index = hobbies.index(of: hobby) {
            hobbies.remove(at: index)
        }
    }
    
    func add(friend: AddressCard){
        friends.append(friend)
    }
    
    func remove(friend: AddressCard){
        if let index = friends.index(of: friend) {
            friends.remove(at: index)
        }
    }
    
    static func ==(lhs: AddressCard, rhs: AddressCard) -> Bool {
        return lhs.first_name == rhs.first_name
    }
        
}



