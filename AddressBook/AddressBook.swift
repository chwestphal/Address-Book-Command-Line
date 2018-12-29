//  Created by Christian Westphal on 28.11.17.
//  Copyright © 2017 Christian Westphal. All rights reserved.
//

import Foundation

class AddressBook: Codable {
   
    var addressCards = [AddressCard]()
    
    func add(card: AddressCard){
        addressCards.append(card)
    }
    
    func remove(card: AddressCard){
        if let index = addressCards.index(of: card) {
            addressCards.remove(at: index)
        }
        for addressCard in addressCards{
            if let index = addressCard.friends.index(of: card) {
                addressCard.friends.remove(at: index)
            }
        }
    }
    
    func sortBySurname(){
        addressCards.sort { $0.surname < $1.surname }
    }
    
    func searchBySurname(surname: String) -> AddressCard? {
        for addressCard in addressCards {
            if surname == addressCard.surname {
                return addressCard
            }
        }
        return nil
    }
   
    func save(toFile path: String) {
        let url = URL(fileURLWithPath: path)
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(self.addressCards) {
            try? data.write(to: url)
        }
    }
    
    class func addressBook(fromFile path: String) -> AddressBook? {
        let url = URL(fileURLWithPath: path)
        let decoder = JSONDecoder()
        if let data = try? Data(contentsOf: url) {
            if let addressCards = try? decoder.decode([AddressCard].self, from: data) {
                let addressBook = AddressBook()
                for card in addressCards{
                    addressBook.add(card: card)
                }
                return addressBook
            }
        }
        return AddressBook()
    }
    
}
