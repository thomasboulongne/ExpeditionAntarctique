//
//  MoralTabViewController.swift
//  expedition
//
//  Created by J.C Gigonnet on 12/05/2016.
//  Copyright © 2016 KLCT. All rights reserved.
//

import UIKit

class MoralTabViewController: UIViewController {
    
    @IBOutlet weak var centerProfilePictureImageView: UIImageView!
    @IBOutlet weak var leftProfilePictureImageView: UIImageView!
    @IBOutlet weak var rightProfilePictureImageView: UIImageView!
    @IBOutlet weak var hungerLabel: UILabel!
    @IBOutlet weak var droughtLabel: UILabel!
    @IBOutlet weak var moralLabel: UILabel!
    @IBOutlet weak var teamSpiritLabel: UILabel!
    @IBOutlet weak var hungerGauge: DrawGauge!
    @IBOutlet weak var droughtGauge: DrawGauge!
    @IBOutlet weak var moralGauge: DrawGauge!
    @IBOutlet weak var teamSpiritGauge: DrawGauge!
    @IBOutlet var leftImageViewTapGesture: UITapGestureRecognizer!
    let guillaume = Character(name: "Guillaume")
    let camille = Character(name: "Camille")
    weak var currentCharacter: Character?
    
    var isSelected: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guillaume.hunger = 20.0
        guillaume.moral = 40.0
        
        camille.hunger = 80.0
        camille.moral = 35.0
        camille.teamSpirit = 5.0
        
        currentCharacter = guillaume
        print(currentCharacter?.name)
        
        setGaugesValues(currentCharacter!)
        
        print(hungerGauge.gaugeValue)
        
        centerProfilePictureImageView.layer.cornerRadius = centerProfilePictureImageView.frame.size.width / 2
        centerProfilePictureImageView.clipsToBounds = true
        centerProfilePictureImageView.layer.borderWidth = 4.0
        centerProfilePictureImageView.layer.borderColor = nunatakBlack.CGColor
        leftProfilePictureImageView.layer.cornerRadius = leftProfilePictureImageView.frame.size.width / 2
        leftProfilePictureImageView.clipsToBounds = true
        leftProfilePictureImageView.layer.borderWidth = 2.0
        leftProfilePictureImageView.layer.borderColor = nunatakBlack.CGColor
        rightProfilePictureImageView.layer.cornerRadius = rightProfilePictureImageView.frame.size.width / 2
        rightProfilePictureImageView.clipsToBounds = true
        rightProfilePictureImageView.layer.borderWidth = 2.0
        rightProfilePictureImageView.layer.borderColor = nunatakBlack.CGColor
        
        hungerLabel.textColor = nunatakBlackAlpha
        droughtLabel.textColor = nunatakBlackAlpha
        moralLabel.textColor = nunatakBlackAlpha
        teamSpiritLabel.textColor = nunatakBlackAlpha
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func leftImageViewTap(sender: UITapGestureRecognizer) {
        currentCharacter = camille
        print(currentCharacter?.name)
        setGaugesValues(currentCharacter!)
        print(hungerGauge.gaugeValue)
    }
    
    func setGaugesValues(currentCharacter : Character) {
        hungerGauge.gaugeValue = currentCharacter.hunger
        hungerGauge.color = hungerGauge.setNewColor(CGFloat(hungerGauge.gaugeValue))
        droughtGauge.gaugeValue = currentCharacter.drought
        droughtGauge.color = droughtGauge.setNewColor(CGFloat(droughtGauge.gaugeValue))
        moralGauge.gaugeValue = currentCharacter.moral
        moralGauge.color = moralGauge.setNewColor(CGFloat(moralGauge.gaugeValue))
        teamSpiritGauge.gaugeValue = currentCharacter.teamSpirit
        teamSpiritGauge.color = teamSpiritGauge.setNewColor(CGFloat(teamSpiritGauge.gaugeValue))
    }
    
    
}
