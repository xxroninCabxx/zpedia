//
//  FetchCharacterDetailInfoModel.swift
//  Marvelopedia
//
//  Created by Cory Billeaud on 1/7/17.
//  Copyright © 2017 Cory. All rights reserved.
//

protocol URLSessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {}

import UIKit
import Foundation
import SwiftSoup

class FetchCharacterDetailInfoModel {
    
    private let session: URLSessionProtocol
    private var details: String!
    private var wikiUrl: URL!
    
    private var _name: String!
    private var _realName: String!
    private var _height: String!
    private var _weight: String!
    private var _hair: String!
    private var _eyes: String!
    private var _aliases: String!
    private var _identity: String!
    private var _placeOfBirth: String!
    private var _citizenShip: String!
    private var _occupation: String!
    private var _relatives: String!
    private var _affliations: String!
    private var _education: String!
    private var _powers: String!
    private var _abilities: String!
    private var _weapons: String!
    private var _bio: String!
    private var _para: String!
    private var _origin: String!
    private var _first: String!
    
    var name: String {
        if _name == nil { _name = "" }
        return _name }
    
    var realName: String {
        if _realName == nil { _realName = "" }
        return _realName }
    
    var height: String {
        if _height == nil { _height = "" }
        return _height }
    
    var weight: String {
        if _weight == nil { _weight = "" }
        return _weight }
    
    var hair: String {
        if _hair == nil { _hair = "" }
        return _hair }
    
    var eyes: String {
        if _eyes == nil { _eyes = "" }
        return _eyes }
    
    var aliases: String {
        if _aliases == nil { _aliases = "" }
        return _aliases }
    
    var identity: String {
        if _identity == nil { _identity = "" }
        return _identity }
    
    var placeOfBirth: String {
        if _placeOfBirth == nil { _placeOfBirth = "" }
        return _placeOfBirth }
    
    var origin: String {
        if _origin == nil { _origin = "" }
        return _origin }
    
    var first: String {
        if _first == nil { _first = "" }
        return _first }
    
    var citizenShip: String {
        if _citizenShip == nil { _citizenShip = "" }
        return _citizenShip }
    
    var  occupation: String {
        if _occupation == nil { _occupation = "" }
        return _occupation }
    
    var relatives: String {
        if _relatives == nil { _relatives = "" }
        return _relatives }
    
    var affliations: String {
        if _affliations == nil { _affliations = "" }
        return _affliations }
    
    var education: String {
        if _education == nil { _education = "" }
        return _education }
    
    var powers: String {
        if _powers == nil { _powers = "" }
        return _powers }
    
    var abilities: String {
        if _abilities == nil { _abilities = "" }
        return _abilities }
    
    var weapons: String {
        if _weapons == nil { _weapons = "" }
        return _weapons }
    
    var para: String {
        if _para == nil { _para = "" }
        return _para }
    
    var bio: String {
        if _bio == nil { _bio = "" }
        return _bio }
    
    init(session: URLSessionProtocol, wikiUrl: URL) {
        self.session = session
        self.wikiUrl = wikiUrl
        
        let dataTask = self.session.dataTask(with: wikiUrl) { data, response, error in
         
            guard error == nil else {
                print("Error: \(error)")
                return }
            
            guard let data = data else {
                print("Error: did not receive data")
                return }
            
            guard let response = response else {
                return }
        }
        
        do {
            
            if let html = try? String(contentsOf: wikiUrl, encoding: .utf8) {
                
                let doc: Document = try SwiftSoup.parse(html)
                print(doc)
                
                // Character Name Text
                let realNameEl: Element! = try doc.select("p:contains(real name)").first()
                if realNameEl == nil {
                    self._realName = "Various or Unknown"
                } else {
                    let realNameString: String = try! realNameEl.text()
                    let realNameIndex = realNameString.index(realNameString.startIndex, offsetBy: 9)
                    let realName = realNameString.substring(from: realNameIndex)
                    self._realName = realName
                    print("Real Name: \(realName)")
                }
               
                // Character Height
                let heightEl: Element! = try! doc.select("p:contains(Height)").first()
                if heightEl == nil {
                    self._height = "No  Data"
                } else {
                    let heightString: String = try! heightEl.text()
                    let heightIndex = heightString.index(heightString.startIndex, offsetBy: 6)
                    let height = heightString.substring(from: heightIndex)
                    self._height = height
                    print("Height: \(height)")
                }
                
                // Character Weight
                let weightEl: Element! = try! doc.select("p:contains(Weight)").first()
                if weightEl == nil {
                    self._weight = "No Data"
                } else {
                    let weightString: String = try! weightEl.text()
                    let weightIndex = weightString.index(weightString.startIndex, offsetBy: 6)
                    let weight = weightString.substring(from: weightIndex)
                    self._weight = weight
                    print("Weight: \(weight)")
                }
                
                // Character Eyes
                let eyesEl: Element! = try! doc.select("p:contains(Eyes)").first()
                if eyesEl == nil {
                    self._eyes = "No  Data"
                } else {
                    let eyesString: String = try! eyesEl.text()
                    let eyesIndex = eyesString.index(eyesString.startIndex, offsetBy: 4)
                    let eyes = eyesString.substring(from: eyesIndex)
                    self._eyes = eyes
                    print("Eyes: \(eyes)")
                }
                
                // Character Hair
                let hairEl: Element! = try! doc.select("p:contains(Hair)").first()
                if hairEl == nil {
                    self._hair = "No  Data"
                } else {
                    let hairString: String = try! hairEl.text()
                    let hairIndex = hairString.index(hairString.startIndex, offsetBy: 4)
                    let hair = hairString.substring(from: hairIndex)
                    self._hair = hair
                    print("Hair: \(hair)")
                }
                
                // Character Aliases
                let aliasEl: Element! = try doc.select("p:contains(aliases)").first()
                let formerEl: Element! = try doc.getElementById("team-formermembers")
                if aliasEl == nil && formerEl == nil {
                    self._aliases = "No  Data"
                } else if aliasEl != nil {
                    let aliasesString: String = try! aliasEl.text()
                    let aliasesIndex = aliasesString.index(aliasesString.startIndex, offsetBy: 7)
                    let aliases = aliasesString.substring(from: aliasesIndex)
                    self._aliases = aliases
                    print("Aliases \(aliases)")
                } else if formerEl != nil {
                    let formerString: String = try! formerEl.text()
                    self._aliases = formerString
                }
                
                // Character Identity
                let identityEl: Element! = try doc.select("p:contains(identity)").first()
                let memberEl: Element! = try doc.getElementById("currentmembers")
                if identityEl == nil && memberEl == nil {
                    self._identity = "No  Data"
                } else if identityEl != nil {
                    let identityString: String = try! identityEl.text()
                    let identityIndex = identityString.index(identityString.startIndex, offsetBy: 8)
                    let identity = identityString.substring(from: identityIndex)
                    self._identity = identity
                    print("Identity: \(identity)")
                } else if memberEl != nil {
                    let memberString: String = try! memberEl.text()
                    self._identity = memberString
                }
                
                // Character Place of Birth
                let pobEl: Element! = try doc.select("p:contains(place of birth)").first()
                if pobEl == nil {
                    self._placeOfBirth = "No  Data"
                } else {
                    let pobString: String = try! pobEl.text()
                    let pobIndex = pobString.index(pobString.startIndex, offsetBy: 14)
                    let placeOfBirth = pobString.substring(from: pobIndex)
                    self._placeOfBirth = placeOfBirth
                    print("Place of Birth: \(placeOfBirth)")
                }
                
                // Character Citizenship
                let citizenEl: Element! = try doc.select("p:contains(citizenship)").first()
                if citizenEl == nil {
                    self._citizenShip = "No  Data"
                } else {
                    let citizenshipString: String = try! citizenEl.text()
                    let citizenIndex = citizenshipString.index(citizenshipString.startIndex, offsetBy: 11)
                    let citizenShip = citizenshipString.substring(from: citizenIndex)
                    self._citizenShip = citizenShip
                    print("Citizenship: \(citizenShip)")
                }
                
                // Origin
                let originEl: Element! = try doc.select("p:contains(origin)").first()
                if originEl == nil {
                    self._origin = "No  Data"
                } else {
                    let originString: String = try! originEl.text()
                    let originIndex = originString.index(originString.startIndex, offsetBy: 6)
                    let origin = originString.substring(from: originIndex)
                    self._origin = origin
                    print("Origin: \(origin)")
                }
                
                // First Appearance
                let firstEl: Element! = try doc.select("p:contains(First Appearance)").first()
                if firstEl == nil {
                    self._first = "No  Data"
                } else {
                    let firstString: String = try! firstEl.text()
                    let firstIndex = firstString.index(firstString.startIndex, offsetBy: 17)
                    let first = firstString.substring(from: firstIndex)
                    self._first = first
                    print("First Appearance: \(first)")
                }
                
                // Character Occupation
                let occupationEl: Element! = try! doc.getElementById("char-occupation")
                if occupationEl == nil {
                    self._occupation = "No  Data"
                } else {
                    let occupationString: String = try! occupationEl.text()
                    let occupationIndex = occupationString.index(occupationString.startIndex, offsetBy: 10)
                    let occupation = occupationString.substring(from: occupationIndex)
                    self._occupation = occupation
                    print("Occupation: \(occupation)")
                }
                
                // Character Relatives
                let relativesEl: Element! = try! doc.getElementById("char-relatives")
                if relativesEl == nil {
                    self._relatives = "No  Data"
                } else {
                    let relativesString: String = try! relativesEl.text()
                    let relativesIndex = relativesString.index(relativesString.startIndex, offsetBy: 15)
                    let relatives = relativesString.substring(from: relativesIndex)
                    self._relatives = relatives
                    print("Relatives: \(relatives)")
                }
                
                // Character Affliations
                let affliEl: Element! = try! doc.getElementById("char-affiliation")
                if affliEl == nil {
                    self._affliations = "No  Data"
                } else {
                    let affliationsString: String = try! affliEl.text()
                    let affliationsIndex = affliationsString.index(affliationsString.startIndex, offsetBy: 17)
                    let affliations = affliationsString.substring(from: affliationsIndex)
                    self._affliations = affliations
                    print("Affliations: \(affliations)")
                }
                
                // Character Education
                let educationEl: Element! = try! doc.getElementById("char-education")
                if educationEl == nil {
                    self._education = "No  Data"
                } else {
                    let educationString: String = try! educationEl.text()
                    let educationIndex = educationString.index(educationString.startIndex, offsetBy: 9)
                    let education = educationString.substring(from: educationIndex)
                    self._education = education
                    print("Education: \(education)")
                }
                
                // Character Powers
                let powerEl: Element! = try! doc.getElementById("char-powers")
                if powerEl == nil {
                    self._powers = "No  Data"
                } else {
                    let powersString: String = try! powerEl.text()
                    let powersIndex = powersString.index(powersString.startIndex, offsetBy: 6)
                    let powers = powersString.substring(from: powersIndex)
                    self._powers = powers
                    print("Power: \(powers)")
                }
                
                // Character Abilities
                let abilitiesEl: Element! = try! doc.getElementById("char-abilities")
                if abilitiesEl == nil {
                    self._abilities = "No  Data"
                } else {
                    let abilitiesString: String = try! abilitiesEl.text()
                    let abilitiesIndex = abilitiesString.index(abilitiesString.startIndex, offsetBy: 9)
                    let abilities = abilitiesString.substring(from: abilitiesIndex)
                    self._abilities = abilities
                    print("Abilities: \(abilities)")
                }
                
                // Paraphernalia
                let paraEl: Element! = try! doc.getElementById("char-paraphernalia")
                if paraEl == nil {
                    self._para = "Known None"
                } else {
                    let paraString: String = try! paraEl.text()
                    let paraIndex = paraString.index(paraString.startIndex, offsetBy: 13)
                    let para = paraString.substring(from: paraIndex)
                    self._para = para
                    print("Paraphenalia: \(para)")
                }
                
                // Character Weapons
                let weaponsEl: Element! = try! doc.getElementById("char-weapons")
                if weaponsEl == nil {
                    self._weapons = "No  Data"
                } else {
                    let weaponsString: String = try! weaponsEl.text()
                    let weaponsIndex = weaponsString.index(weaponsString.startIndex, offsetBy: 7)
                    let weapons = weaponsString.substring(from: weaponsIndex)
                    self._weapons = weapons
                    print("Weapons: \(weapons)")
                }
                
                // Character Bio Text
                let bioEl: Element! = try! doc.getElementById("biobody")
                if bioEl == nil {
                    self._bio = "No  Bio  Available"
                } else {
                    let bio: String = try! bioEl.text()
                    self._bio = bio
                }

            }
            
        } catch Exception.Error(let type, let message) {
            print("Exception: \(Exception.Error)")
        } catch {
            print("Message: ")
        }
        dataTask.resume()
    }
    
}


