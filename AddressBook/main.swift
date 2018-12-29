//  Created by Christian Westphal on 28.11.17.
//  Copyright © 2017 Christian Westphal. All rights reserved.
//

import Foundation

    // Please insert your path here
let url =  "."

    func printCard(card: AddressCard) {
        var properties = [Any]()
        print("+------------------------------------")
        properties = [card.first_name, card.surname, card.street, card.zip, card.city]
        for index in properties {
            print(index)
        }
        print("Hobbys: ")
        for hobby in card.hobbies {
            print(hobby)
        }
        print("Friends: ")
        for friend in card.friends {
            print(friend.surname)
        }
        print("+------------------------------------")
    }

var book = AddressBook()

if let book = AddressBook.addressBook(fromFile: url) {
        var exitMainWhileLoop = false
        while !exitMainWhileLoop {
            print("(I)nsert, (S)earch, (L)ist, (Q)uit?")
            if let input = readLine() {
                
                switch input {
                    
                case "i" , "I":
                    let card = AddressCard.init(first_name: "", surname: "", street: "", zip: 0 , city: "")
                    
                    print("Insert your first name:");
                    if let first_name = readLine() {
                        card.first_name = first_name
                    }
                    print("Insert your surname:")
                    if let surname = readLine() {
                        card.surname = surname
                    }
                    print("Insert your street:")
                    if let street = readLine() {
                        card.street = street
                    }
                    print("Insert your zip code:")
                    if let zip = readLine(), let zipCode = Int(zip) {
                        card.zip = zipCode
                    }
                    print("Insert your city:")
                    if let city = readLine() {
                        card.city = city
                    }
                    print("Insert a hobby:")
                    if let hobby = readLine() {
                        card.add(hobby: hobby)
                    }
                    print("Insert a second hobby:")
                    if let hobby = readLine() {
                        card.add(hobby: hobby)
                    }
            
                    book.add(card: card)
                    book.sortBySurname()
                    book.save(toFile: url)
                    
                case "l", "L":
                        for card in book.addressCards{
                            printCard(card: card)
                        }
                    
                case "s", "S":
                    var exitSubWhileLoop = false
                    print("Type in the surname: ")
                    if let input = readLine() {
                        if let surname = book.searchBySurname(surname: input) {
                            printCard(card: surname)
                        
                        while !exitSubWhileLoop {
                            print("(A)dd friend, (D)elete or (B)ack?")
                            if let input = readLine() {
                                
                                switch input {
                                    
                                case "a" , "A":
                                    print("Type in surname of friend you want to add to this card: ")
                                    if let input = readLine() {
                                        if let cardToAddFriend = book.searchBySurname(surname: input) {
                                            surname.add(friend: cardToAddFriend)
                                            book.save(toFile: url)
                                            }
                                    }
                                    
                                case "d" , "D":
                                    print("Type in surname of card you want to delete: ")
                                    if let input = readLine() {
                                        if let cardToBeRemoved = book.searchBySurname(surname: input) {
                                            book.remove(card: cardToBeRemoved)
                                            book.save(toFile: url)
                                        }
                                    }
                                
                                case "b" , "B":
                                    exitSubWhileLoop = true
                                
                                default :
                                    print("This is not a valid character!")
                                    
                                }
                            }
                        }
                    }
                }
                    
                case "q" , "Q":
                    exitMainWhileLoop = true
                    
                default :
                    print("This is not a valid character!")
                }
            }
        }
    }


