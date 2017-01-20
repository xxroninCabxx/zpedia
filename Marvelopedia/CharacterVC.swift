//
//  CharacterVC.swift
//  Marvelopedia
//
//  Created by Cory Billeaud on 12/4/16.
//  Copyright © 2016 Cory. All rights reserved.
//

import UIKit

final class CharacterVC: UIViewController {
    
    @IBOutlet weak var characterImg: UIImageView!
    @IBOutlet weak var characterNameLbl: MMName!
    @IBOutlet weak var realNameLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var hairLbl: UILabel!
    @IBOutlet weak var eyesLbl: UILabel!
    @IBOutlet weak var identityLbl: UILabel!
    @IBOutlet weak var aliasesLbl: UILabel!
    @IBOutlet weak var citizenShipLbl: UILabel!
    @IBOutlet weak var occupationLbl: UILabel!
    @IBOutlet weak var groupsLbl: UILabel!
    @IBOutlet weak var relativesLbl: UILabel!
    @IBOutlet weak var educationLbl: UILabel!
    @IBOutlet weak var paraLbl: UILabel!
    @IBOutlet weak var originLbl: UILabel!
    @IBOutlet weak var firstLbl: UILabel!
    @IBOutlet weak var placeOfBirthLbl: UILabel!
    @IBOutlet weak var powersLbl: UILabel!
    @IBOutlet weak var abilitiesLbl: UILabel!
    @IBOutlet weak var weaponsLbl: UILabel!
    @IBOutlet weak var bioLbl: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    var searchText: String!
    var wikiUrl: String!
    var imgPath: String!
    var name: String!
    
}

extension CharacterVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator.isHidden = false

        print(wikiUrl)
        print(imgPath)
        updateUI()
        updateImg()
    }
}

extension CharacterVC {
    
    func updateUI() {
        self.activityIndicator.startAnimating()
            if let wikiUrlString = URL(string: "\(self.wikiUrl!)") {

            do {

                let detailsInfo = FetchCharacterDetailInfoModel(session: URLSession.shared, wikiUrl: wikiUrlString)
                characterNameLbl.text = self.name
                realNameLbl.text = detailsInfo.realName.isEmpty ? "No Data" :detailsInfo.realName
                heightLbl.text = detailsInfo.height.isEmpty ? "No Data" :detailsInfo.height
                weightLbl.text = detailsInfo.weight.isEmpty ? "No Data" :detailsInfo.weight
                hairLbl.text = detailsInfo.hair.isEmpty ? "No Data" :detailsInfo.hair
                eyesLbl.text = detailsInfo.eyes.isEmpty ? "No Dat" :detailsInfo.eyes
                identityLbl.text = detailsInfo.identity.isEmpty ? "No Data" :detailsInfo.identity
                aliasesLbl.text = detailsInfo.aliases.isEmpty ? "No Data" :detailsInfo.aliases
                citizenShipLbl.text = detailsInfo.citizenShip.isEmpty ? "No Data" :detailsInfo.citizenShip
                occupationLbl.text = detailsInfo.occupation.isEmpty ? "No Data" :detailsInfo.occupation
                groupsLbl.text = detailsInfo.affliations.isEmpty ? "No Data" :detailsInfo.affliations
                relativesLbl.text = detailsInfo.relatives.isEmpty ? "No Data" :detailsInfo.relatives
                originLbl.text = detailsInfo.origin.isEmpty ? "No Data" :detailsInfo.origin
                firstLbl.text = detailsInfo.first.isEmpty ? "No Data" :detailsInfo.first
                powersLbl.text = detailsInfo.powers.isEmpty ? "No Data" :detailsInfo.powers
                abilitiesLbl.text = detailsInfo.abilities.isEmpty ? "No Data" :detailsInfo.abilities
                weaponsLbl.text = detailsInfo.weapons.isEmpty ? "No Data" :detailsInfo.weapons
                bioLbl.text = detailsInfo.bio.isEmpty ? "No Data" :detailsInfo.bio
                paraLbl.text = detailsInfo.para.isEmpty ? "No Data" :detailsInfo.para
                placeOfBirthLbl.text = detailsInfo.placeOfBirth.isEmpty ? "No Data" :detailsInfo.placeOfBirth
                educationLbl.text = detailsInfo.education.isEmpty ? "No Data" :detailsInfo.education
                self.activityIndicator.stopAnimating()
            } catch {
                print("Contents could not loaded")
                performSegue(withIdentifier: "BackToCharactersVC", sender: CharacterVC.self)
            }
        } else {
        }
    }
    
    func updateImg() {
        characterImg.loadImageUsingCacheWithUrlString(self.imgPath)
    }
    
}

