//
//  ViewController.swift
//  Tic
//
//  Created by Eshwar Ramesh on 19/06/14.
//  Copyright (c) 2014 Eshwar Ramesh. All rights reserved.
//

import UIKit

let COMPUTER_PLAYER = 1
let HUMAN_PLAYER = 2

class ViewController: UIViewController {
    
    var currentPlayer = COMPUTER_PLAYER
    
    @IBOutlet var btn1: UIButton
    @IBOutlet var btn2: UIButton
    @IBOutlet var btn3: UIButton
    @IBOutlet var btn4: UIButton
    @IBOutlet var btn5: UIButton
    @IBOutlet var btn6: UIButton
    @IBOutlet var btn7: UIButton
    @IBOutlet var btn8: UIButton
    @IBOutlet var btn9: UIButton
    @IBOutlet var btnPlayAgain: UIButton
    let board = TrackBoard(dict: [0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        btn1.backgroundColor = UIColor.yellowColor()
        btn2.backgroundColor = UIColor.yellowColor()
        btn3.backgroundColor = UIColor.yellowColor()
        btn4.backgroundColor = UIColor.yellowColor()
        btn5.backgroundColor = UIColor.yellowColor()
        btn6.backgroundColor = UIColor.yellowColor()
        btn7.backgroundColor = UIColor.yellowColor()
        btn8.backgroundColor = UIColor.yellowColor()
        btn9.backgroundColor = UIColor.yellowColor()
        playAgain(btnPlayAgain)
    }
    
    override func viewDidAppear(animated: Bool) {
        
        var winner = board.isThereAWinner()
        if winner == 1 {
            println("Computer wins")
            currentPlayer = COMPUTER_PLAYER
        }
        else if winner == 2 {
            println("Human wins")
            currentPlayer = HUMAN_PLAYER
        }
        
        if currentPlayer == HUMAN_PLAYER {
            println("play your choice")
            // is done playing?
            NSNotificationCenter.defaultCenter().removeObserver(self)
            NSNotificationCenter.defaultCenter().addObserver(self, selector:"userDonePlaying", name: "UserPlayed", object: nil)
        }
        else if currentPlayer == COMPUTER_PLAYER {
            println("Computer's turn")
            NSNotificationCenter.defaultCenter().removeObserver(self)
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "computerDonePlaying", name: "ComputerPlayed", object: nil)
            computerPlayTurn()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func userDonePlaying() {
        var winner = board.isThereAWinner()
        if winner == 0 {
            if board.isGridFilled() {
                println("Game has ended")
            }
            else {
                NSNotificationCenter.defaultCenter().removeObserver(self, name: "UserPlayed", object: nil)
                NSNotificationCenter.defaultCenter().addObserver(self, selector: "computerDonePlaying", name: "ComputerPlayed", object: nil)
                computerPlayTurn()
            }
        }
        else if winner == 1 {
            println("Computer wins")
        }
        else if winner == 2 {
            println("You win")
        }
    }
    
    func computerDonePlaying() {
        var winner = board.isThereAWinner()
        if winner == 0 {
            // wait for user to play
            if board.isGridFilled() {
                println("Game has ended")
            }
            else {
                NSNotificationCenter.defaultCenter().removeObserver(self, name: "ComputerPlayed", object: nil)
                NSNotificationCenter.defaultCenter().addObserver(self, selector: "userDonePlaying", name: "UserPlayed", object: nil)
                playUserTurn()
            }
        }
        else if winner == 1 {
            println("Computer wins")
        }
        else if winner == 2 {
            println("You win")
        }
    }
    
    
    func playUserTurn() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "ComputerPlayed", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "userDonePlaying", name: "UserPlayed", object: nil)
    }
    
    @IBAction func playAgain(sender: AnyObject) {
        btn1.setTitle("", forState: UIControlState.Normal)
        btn2.setTitle("", forState: UIControlState.Normal)
        btn3.setTitle("", forState: UIControlState.Normal)
        btn4.setTitle("", forState: UIControlState.Normal)
        btn5.setTitle("", forState: UIControlState.Normal)
        btn6.setTitle("", forState: UIControlState.Normal)
        btn7.setTitle("", forState: UIControlState.Normal)
        btn8.setTitle("", forState: UIControlState.Normal)
        btn9.setTitle("", forState: UIControlState.Normal)
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
        currentPlayer = board.retrievePreviousGameWinner()
        board.refreshBoard()
        board.resetWinner()
    }
    
    @IBAction func btn1Played(sender: AnyObject) {
        
        var played = playTurn(HUMAN_PLAYER, whichButton: btn1)
        if played == false {
            println("Play again!")
        } else {
            NSNotificationCenter.defaultCenter().postNotificationName("UserPlayed", object: nil)
        }
    }
    
    @IBAction func btn2Played(sender: AnyObject) {
        var played = playTurn(HUMAN_PLAYER, whichButton: btn2)
        if played == false {
            println("Play again!")
        }
        else {
            NSNotificationCenter.defaultCenter().postNotificationName("UserPlayed", object: nil)
        }
    }
    
    @IBAction func btn3Played(sender: AnyObject) {
        
        var played = playTurn(HUMAN_PLAYER, whichButton: btn3)
        if played == false {
            println("Play again!")
        }
        else {
            NSNotificationCenter.defaultCenter().postNotificationName("UserPlayed", object: nil)
        }
    }
    
    @IBAction func btn4Played(sender: AnyObject) {
        var played = playTurn(HUMAN_PLAYER, whichButton: btn4)
        if played == false {
            println("Play again!")
        }
        else {
            NSNotificationCenter.defaultCenter().postNotificationName("UserPlayed", object: nil)
        }
    }
    
    @IBAction func btn5Played(sender: AnyObject) {
        var played = playTurn(HUMAN_PLAYER, whichButton: btn5)
        if played == false {
            println("Play again!")
            
        }
        else {
            NSNotificationCenter.defaultCenter().postNotificationName("UserPlayed", object: nil)
        }
    }
    
    @IBAction func btn6Played(sender: AnyObject) {
        var played = playTurn(HUMAN_PLAYER, whichButton: btn6)
        if played == false {
            println("Play again!")
        }
        else {
            NSNotificationCenter.defaultCenter().postNotificationName("UserPlayed", object: nil)
        }
    }
    
    @IBAction func btn7Played(sender: AnyObject) {
        var played = playTurn(HUMAN_PLAYER, whichButton: btn7)
        if played == false {
            println("Play again!")
        }
        else {
            NSNotificationCenter.defaultCenter().postNotificationName("UserPlayed", object: nil)
        }
    }
    
    @IBAction func btn8Played(sender: AnyObject) {
        var played = playTurn(HUMAN_PLAYER, whichButton: btn8)
        if played == false {
            println("Play again!")
        }
        else {
            NSNotificationCenter.defaultCenter().postNotificationName("UserPlayed", object: nil)
        }
    }
    
    @IBAction func btn9Played(sender: AnyObject) {
        var played = playTurn(HUMAN_PLAYER, whichButton: btn9)
        if played == false {
            println("Play again!")
        }
        else {
            NSNotificationCenter.defaultCenter().postNotificationName("UserPlayed", object: nil)
        }
    }
    
    func computerPlayTurn() {
        println("Not much thinking for computer turn")
        // get random number from 0 - 8
        let randomPlay = Int(arc4random_uniform(9))
        var btnPlayed:UIButton?
        switch randomPlay {
        case 0:
            btnPlayed = btn1
            break;
        case 1:
            btnPlayed = btn2
            break;
        case 2:
            btnPlayed = btn3
            break;
        case 3:
            btnPlayed = btn4
            break;
        case 4:
            btnPlayed = btn5
            break;
        case 5:
            btnPlayed = btn6
            break;
        case 6:
            btnPlayed = btn7
            break;
        case 7:
            btnPlayed = btn8
            break;
        case 8:
            btnPlayed = btn9
            break;
        default:
            
            break;
        }
        
        var played = playTurn(COMPUTER_PLAYER, whichButton: btnPlayed!)
        if played == false {
            println("computer should play again")
            computerPlayTurn()
        }
        else {
            NSNotificationCenter.defaultCenter().postNotificationName("ComputerPlayed", object: nil)
        }
    }
    
    func playTurn(whichPlayer:Int, whichButton:UIButton) -> Bool{
        
        var pos:Int?
        if whichButton == btn1 {
            pos = 0
        }
        else if whichButton == btn2 {
            pos = 1
        }
        else if whichButton == btn3 {
            pos = 2
        }
        else if whichButton == btn4 {
            pos = 3
        }
        else if whichButton == btn5 {
            pos = 4
        }
        else if whichButton == btn6 {
            pos = 5
        }
        else if whichButton == btn7 {
            pos = 6
        }
        else if whichButton == btn8 {
            pos = 7
        }
        else if whichButton == btn9 {
            pos = 8
        }
        
        if board.isPositionAlreadyPlayed(pos) {
            println("Position already played")
            return false;
        }
        
        switch (whichButton) {
        case btn1:
            var str:String?
            if whichPlayer == 1 {
                str = "X"
            }
            else {
                str = "O"
            }
            btn1.setTitle(str, forState: UIControlState.Normal)
            board.markBoardModel(0, player: whichPlayer)
            break;
        case btn2:
            var str:String?
            if whichPlayer == 1 {
                str = "X"
            }
            else {
                str = "O"
            }
            btn2.setTitle(str, forState: UIControlState.Normal)
            board.markBoardModel(1, player: whichPlayer)
            break;
        case btn3:
            var str:String?
            if whichPlayer == 1 {
                str = "X"
            }
            else {
                str = "O"
            }
            btn3.setTitle(str, forState: UIControlState.Normal)
            board.markBoardModel(2, player: whichPlayer)
            break;
        case btn4:
            var str:String?
            if whichPlayer == 1 {
                str = "X"
            }
            else {
                str = "O"
            }
            btn4.setTitle(str, forState: UIControlState.Normal)
            board.markBoardModel(3, player: whichPlayer)
            break;
        case btn5:
            var str:String?
            if whichPlayer == 1 {
                str = "X"
            }
            else {
                str = "O"
            }
            btn5.setTitle(str, forState: UIControlState.Normal)
            board.markBoardModel(4, player: whichPlayer)
            break;
        case btn6:
            var str:String?
            if whichPlayer == 1 {
                str = "X"
            }
            else {
                str = "O"
            }
            btn6.setTitle(str, forState: UIControlState.Normal)
            board.markBoardModel(5, player: whichPlayer)
            break;
        case btn7:
            var str:String?
            if whichPlayer == 1 {
                str = "X"
            }
            else {
                str = "O"
            }
            btn7.setTitle(str, forState: UIControlState.Normal)
            board.markBoardModel(6, player: whichPlayer)
            break;
        case btn8:
            var str:String?
            if whichPlayer == 1 {
                str = "X"
            }
            else {
                str = "O"
            }
            btn8.setTitle(str, forState: UIControlState.Normal)
            board.markBoardModel(7, player: whichPlayer)
            break;
        case btn9:
            var str:String?
            if whichPlayer == 1 {
                str = "X"
            }
            else {
                str = "O"
            }
            btn9.setTitle(str, forState: UIControlState.Normal)
            board.markBoardModel(8, player: whichPlayer)
            break;
        default:
            println("Nothing played")
        }
        
        var playerWin = board.isThereAWinner()
        return true;
    }
}

