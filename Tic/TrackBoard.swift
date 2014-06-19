//
//  TrackBoard.swift
//  Tic
//
//  Created by Eshwar Ramesh on 19/06/14.
//  Copyright (c) 2014 Eshwar Ramesh. All rights reserved.
//

import Foundation

class TrackBoard {
    var boardDict = Dictionary<Int, Int>()
    var winner = 1;
    init(dict:Dictionary<Int, Int>) {
        boardDict = dict;
    }
    
    func refreshBoard() {
        boardDict = Dictionary<Int, Int>()
        boardDict = [0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0]
    }
    
    func resetWinner() {
        winner = 0
    }
    
    func retrievePreviousGameWinner() -> Int {
        return winner;
    }
    
    func markBoardModel(pos:Int, player:Int) {
        // this is going to mark the board with player number 
        boardDict[pos] = player
    }
    
    func isGridFilled() -> Bool {
        var gridFilled = true
        for (key, value) in boardDict {
            if value == 1 || value == 2 {
                continue
            }
            gridFilled = false
        }
        return gridFilled
    }
    
    func isThereAWinner() -> Int? {
        if boardDict[0] == boardDict[1] && boardDict[1] == boardDict[2] {
            return boardDict[0]
        }
        else if boardDict[3] == boardDict[4] && boardDict[4] == boardDict[5] {
            return boardDict[3]
        }
        else if boardDict[6] == boardDict[7] && boardDict[7] == boardDict[8] {
            return boardDict[6]
        }
        else if boardDict[0] == boardDict[3] && boardDict[3] == boardDict[6] {
            return boardDict[0]
        }
        else if boardDict[1] == boardDict[4] && boardDict[4] == boardDict[7] {
            return boardDict[1]
        }
        else if boardDict[2] == boardDict[5] && boardDict[5] == boardDict[8] {
            return boardDict[2]
        }
        else if boardDict[0] == boardDict[4] && boardDict[4] == boardDict[8] {
            return boardDict[0]
        }
        else if boardDict[2] == boardDict[4] && boardDict[4] == boardDict[6] {
            return boardDict[2]
        }
        return 0
    }
    
    func isPositionAlreadyPlayed(pos:Int?) -> Bool {
        if let p = pos {
            if boardDict[p] == 1 || boardDict[p] == 2 {
                return true
            }
        }
        return false
    }
}