//
//  ViewController.swift
//  ticktac_new
//
//  Created by Bekzat on 13/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    var player = 1
    
    var turnCount = 0
    
    var arrayBoard = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    var winArray = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func game(_ sender: UIButton) {
        print(sender.tag)
        
        let boardIndex = sender.tag - 1
        if arrayBoard[boardIndex] != 0 {
            return
        }
        
        arrayBoard[boardIndex] = player
        
        if player == 1 {
            sender.setBackgroundImage(UIImage(named: "xred"), for: .normal)
            player = 2 //when 1st player did mark, we turn to 2nd player
        } else {
            sender.setBackgroundImage(UIImage(named: "o"), for: .normal)
            player = 1
        }
        
        for win in winArray {
            if arrayBoard[win[0]] == arrayBoard[win[1]] && arrayBoard[win[1]] == arrayBoard[win[2]] && arrayBoard[win[2]] == 1 {
                print("X win")
                
                let alert = UIAlertController(title: "X win", message: "X, you are the Winner!", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { UIAlertAction in
                    self.clearBoard()
                }))
                
                
                present(alert, animated: true)
            } else if arrayBoard[win[0]] == arrayBoard[win[1]] && arrayBoard[win[1]] == arrayBoard[win[2]] && arrayBoard[win[2]] == 2 {
                print("O win")
                
                let alert = UIAlertController(title: "O win", message: "O, you are the Winner!", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { UIAlertAction in
                    self.clearBoard()
                }))
                
                
                
                present(alert, animated: true)
            }
            
           
        }
        
        if !arrayBoard.contains(0) {
            print("No winner")
            
            let alert = UIAlertController(title: "No winner!", message: "No winner", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok!", style: .default, handler: {UIAlertAction in
                self.clearBoard()
            }))
            
            present(alert, animated: true)
        }
     
    }
    
    func clearBoard(){
        for i in 0...8 {
            let button = view.viewWithTag(i+1) as! UIButton
            button.setBackgroundImage(nil, for: .normal) //nil обнуляет картинку
            
            arrayBoard[i] = 0
        }
        player = 1
    }
}
            
        
                
      

