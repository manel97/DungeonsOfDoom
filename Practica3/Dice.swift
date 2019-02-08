//
//  Dice.swift
//  Practica3
//
//  Created by Manel Sitjar on 14/11/2018.
//  Copyright © 2018 Manel Sitjar. All rights reserved.
//

import Foundation
import UIKit

var dicesHeroe:[Dice] = [Dice(valor: 1, img: UIImage(named: "dice1U")!),
Dice(valor: 2, img: UIImage(named: "dice2U")!),
Dice(valor: 3, img: UIImage(named: "dice3U")!),
Dice(valor: 4, img: UIImage(named: "dice4U")!),
Dice(valor: 5, img: UIImage(named: "dice5U")!),
Dice(valor: 6, img: UIImage(named: "dice6U")!),
Dice(valor: 7, img: UIImage(named: "dice7U")!),
Dice(valor: 8, img: UIImage(named: "dice8U")!),
Dice(valor: 9, img: UIImage(named: "dice9U")!),
Dice(valor: 10, img: UIImage(named: "dice10U")!),
Dice(valor: 11, img: UIImage(named: "dice11U")!),
Dice(valor: 12, img: UIImage(named: "dice12U")!)]

var dicesMonster:[Dice] = [Dice(valor: 1, img: UIImage(named: "dice1")!),
                         Dice(valor: 2, img: UIImage(named: "dice2")!),
                         Dice(valor: 3, img: UIImage(named: "dice3")!),
                         Dice(valor: 4, img: UIImage(named: "dice4")!),
                         Dice(valor: 5, img: UIImage(named: "dice5")!),
                         Dice(valor: 6, img: UIImage(named: "dice6")!),
                         Dice(valor: 7, img: UIImage(named: "dice7")!),
                         Dice(valor: 8, img: UIImage(named: "dice8")!),
                         Dice(valor: 9, img: UIImage(named: "dice9")!),
                         Dice(valor: 10, img: UIImage(named: "dice10")!),
                         Dice(valor: 11, img: UIImage(named: "dice11")!),
                         Dice(valor: 12, img: UIImage(named: "dice12")!)]

class Dice{
    //esta clase solo contiene un constructor con una uiimage y un int y solamente lo vamos a usar en la clase de las peleas.
    
    
    var valor:Int = 0
    var img:UIImage = UIImage()
    
    init(valor: Int, img: UIImage) {
        self.valor = valor
        self.img = img
    }
}
