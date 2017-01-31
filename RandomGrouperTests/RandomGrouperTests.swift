//
//  RandomGrouperTests.swift
//  RandomGrouperTests
//
//  Created by Lydia Ho on 1/23/17.
//  Copyright © 2017 lydwho. All rights reserved.
//

import XCTest
@testable import RandomGrouper

class RandomGrouperTests: XCTestCase {
    //MARK: Person Class Tests
    // Confirm that the Person initialization returns a Person object when passed valid parameters
    func testPersonInitializationSucceeds() {
        // Zero rating
        let zeroRatingPerson = Person.init(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingPerson)
        
        // Highest positive rating
        let positiveRatingPerson = Person.init(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingPerson)
    }
    
    // Confirm that the Person initializer returns nil when passed a negative rating or an empty name
    func testPersonInitializationFails() {
        // Negative rating
        let negativeRatingPerson = Person.init(name: "Negative", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingPerson)
        
        // Empty String
        let emptyStringPerson = Person.init(name: "", photo: nil, rating: 0)
        XCTAssertNil(emptyStringPerson)
        
        // Rating exceeds maximum
        let largeRatingPerson = Person.init(name: "Large", photo: nil, rating: 6)
        XCTAssertNil(largeRatingPerson)
    }
    
    

}
