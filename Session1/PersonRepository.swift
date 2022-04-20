//
//  PersonRepository.swift
//  Session1
//
//  Created by PC1 on 11.04.22.
//

import Foundation


// Singleton pattern


class SingleStruct{
  static let shared: SingleStruct = SingleStruct()
  private var count = 0
  
  private init(){
  }

  func inc(){
    count += 1
  }

  func dec(){
    count -= 1
  }

  func getCount() -> Int{
    self.count
  }
  
  func add(_ par1: Int ){
      self.count += par1
  }

  
}


// Builder pattern


class Person{
  var name: String
  var surname: String
  var age: Int
  var gender: Gender

  init(
    name: String,
    surname: String,
    age: Int,
    gender: Gender
  ){
    self.name = name
    self.surname = surname
    self.age = age
    self.gender = gender
  }

  init(){
    name = ""
    surname = ""
    age = 0
    gender = .male
  }

  class Builder{
    private let person: Person = Person()
    func build() -> Person{
      self.person
    }

    func setName(_ name: String) -> Builder{
      self.person.name = name
      return self
    }
    
    func setSurname(_ surname: String) -> Builder{
      self.person.surname = surname
      return self
    }
    
    func setAge(_ age: Int) -> Builder{
      self.person.age = age
      return self
    }

    func setGender(_ gender: Gender) -> Builder{
      self.person.gender = gender
      return self
    }
    
  }
}

enum Gender{
  case male, female
}


// Factory pattern
class PersonFactory{
  var name: String
  var surname: String
  var age: Int
  var gender: Gender

  private init(){
    self.name = ""
    self.surname = ""
    self.age = 0
    self.gender = .male
  }

  static func build(_ name: String,_ surname: String) -> PersonFactory{
    let person = PersonFactory()
    person.name = name
    person.surname = surname
    return person
  }
}

