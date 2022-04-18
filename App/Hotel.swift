//
//  Hotel.swift
//  App
//
//  Created by PC1 on 18.04.22.
//

import Foundation

class Hotel {
    var name: String
    var location: String
    var rate: Float
    var reviews: Int
    var price: Int
    var image: String
    var isSaved: Bool
    
    
    init(){
        self.name = ""
        self.location = ""
        self.rate = 0.0
        self.reviews = 0
        self.price = 0
        self.image = ""
        self.isSaved = false
    }
    
    class Builder{
        private let hotel : Hotel = Hotel()
        
        func build() -> Hotel{
            return hotel
        }
        
        func setName(_ name: String) -> Builder {
            self.hotel.name = name
            return self
        }
        
        func setLocation(_ location: String) -> Builder {
            self.hotel.location = location
            return self
        }
        
        func setRate(_ rate: Float) -> Builder {
            self.hotel.rate = rate
            return self
        }
        
        func setReviews(_ reviews: Int) -> Builder {
            self.hotel.reviews = reviews
            return self
        }
        
        func setPrice(_ price: Int) -> Builder {
            self.hotel.price = price
            return self
        }
        
        func setImage(_ image: String) -> Builder {
            self.hotel.image = image
            return self
        }
        
        func setIsSaved(_ isSaved: Bool) -> Builder {
            self.hotel.isSaved = isSaved
            return self
        }
    }
    
}

