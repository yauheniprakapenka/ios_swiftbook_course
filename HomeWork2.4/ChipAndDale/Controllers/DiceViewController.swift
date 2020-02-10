//
//  DiceViewController.swift
//  ChipAndDale
//
//  Created by yauheni prakapenka on 10.02.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import UIKit

class DiceViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet var leftDiceImageView: UIImageView!
    @IBOutlet var rightDiceImageView: UIImageView!
    @IBOutlet var chipLeftDiceImageView: UIImageView!
    @IBOutlet var chipRightImageView: UIImageView!
    @IBOutlet var daleLeftImageView: UIImageView!
    @IBOutlet var daleRightImageView: UIImageView!
    
    @IBOutlet var dropButton: UIButton!
    
    // MARK: - Private Properties
    
    private let dices = [#imageLiteral(resourceName: "dice1"), #imageLiteral(resourceName: "dice2"), #imageLiteral(resourceName: "dice3"), #imageLiteral(resourceName: "dice4"), #imageLiteral(resourceName: "dice5"), #imageLiteral(resourceName: "dice6")]
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dropButton.layer.cornerRadius = 12
    }
    
    // MARK: - IBActions
    
    @IBAction func dropDicesButtonTapped(_ sender: Any) {
        
        let diceImageViews = [leftDiceImageView, rightDiceImageView, chipLeftDiceImageView, chipRightImageView, daleLeftImageView, daleRightImageView]
        
        for diceImageView in diceImageViews {
            diceImageView?.image = dices[Int.random(in: 0...dices.count - 1)]
        }
        
    }
    
}
