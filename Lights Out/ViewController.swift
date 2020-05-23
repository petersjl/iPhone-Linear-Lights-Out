//
//  ViewController.swift
//  Lights Out
//
//  Created by CSSE Department on 4/13/20.
//  Copyright © 2020 CSSE Department. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var gameBoardButtons: [UIButton]!
    @IBOutlet weak var gameNavBar: UINavigationBar!
    @IBOutlet weak var gameStateLabel: UILabel!
    
    var game = LinearLightsOutGame()
    
    let offImage = UIImage(named: "light_off.png")
    let onImage = UIImage(named: "light_on.png")
    
    @IBAction func pressedNewGame(_ sender: Any) {
        game = LinearLightsOutGame()
        updateView()
    }
    
    @IBAction func pressedGameButton(_ sender: Any) {
        let button = sender as! UIButton
        game.pressedLightAtIndex(button.tag)
        updateView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        gameNavBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 34)]
        updateView()
    }
    
    func updateView(){
        // Update the game state label
        var str = ""
        if game.numMoves == 0{
            str = "Turn all the lights off!"
        }else {
            if !game.gameWon {
                str = "You have taken \(game.numMoves) \(game.numMoves == 1 ? "move" : "moves")."
            }else{
                str = "You won in \(game.numMoves) \(game.numMoves == 1 ? "move" : "moves")!"
            }
        }
        gameStateLabel.text = str
        gameNavBar.topItem?.title = str
        
        // Update the Buttons
        for button in gameBoardButtons{
            if game.lightStates[button.tag]{
                button.setImage(onImage,for: .normal)
            }else{
                button.setImage(offImage,for: .normal)
            }
        }
    }


}

