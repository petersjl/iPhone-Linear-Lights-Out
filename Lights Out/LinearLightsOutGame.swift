//
//  LinearLightsOutGame.swift
//  Lights Out
//
//  Created by CSSE Department on 4/13/20.
//  Copyright © 2020 CSSE Department. All rights reserved.
//

class LinearLightsOutGame : CustomStringConvertible{
    
    
    var numLights : Int
    var lightStates : [Bool]
    var gameWon : Bool
    var numMoves : Int
    
    //Default init to 13
    init(){
        numLights = 13
        lightStates = [Bool](repeating: false, count: numLights)
        gameWon = false
        numMoves = 0
        randomize()
        numMoves = 0
    }
    
    //Number init for any number of lights
    init(numLights : Int){
        self.numLights = numLights
        lightStates = [Bool](repeating: false, count: numLights)
        numMoves = 0
        gameWon = false
        randomize()
        numMoves = 0
    }
    
    //Creates a string to print
    var description :String {
        get {
            var str = "Lights: "
            for i in 0..<numLights - 1{
                str += lightStates[i] == false ? "0" : "1"
            }
            str += lightStates[numLights - 1] == false ? "0" : "1"
            str += " Moves: \(numMoves)"
            return str
        }
    }
    
    //Change the button pressed and the two around it
    func pressedLightAtIndex(_ index : Int) -> Bool{
        //If it's already won do nothing
        if gameWon {
            return true
        }
        //If it's not the far left, change the left
        lightStates[index] = !lightStates[index]
        if index != 0 {
            lightStates[index - 1] = !lightStates[index - 1]
        }
        //If it's not the far right, change the right
        if index < numLights - 1 {
            lightStates[index + 1] = !lightStates[index + 1]
        }
        numMoves += 1
        //Check to see if it's been won
        if !lightStates.contains(true){
            gameWon = true
            return true
        }
        return false
    }
    
    //Randomizes game by pressing a random number of buttons
    //Pressing buttons ensures game is winnable
    func randomize(){
        let num = Int.random(in: 3...10) //Pick a random amout of presses
        for _ in 0...num{
            if pressedLightAtIndex(Int.random(in: 0..<numLights)){ //Press a random button
                gameWon = false
            }
        }
        //If the game is won, randomize again
        if !lightStates.contains(true){
            randomize()
        }
    }
    
}
