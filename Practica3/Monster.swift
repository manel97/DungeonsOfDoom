//
//  Monster.swift
//  Practica3
//
//  Created by Manel Sitjar on 14/11/2018.
//  Copyright © 2018 Manel Sitjar. All rights reserved.
//

import Foundation
import UIKit

var listaMonstruos:[Monster] = [Monster(nombre:"Árbol humanoide" , atk:15, def:10, hp:2, exp:150, money:100, imagen: UIImage(named: "monster1")! ),
                                Monster(nombre: "Bandido del bosque", atk: 20, def: 25, hp: 3, exp: 300, money: 300, imagen: UIImage(named: "monster13")!),
                                Monster(nombre: "Druida del valle", atk: 10, def: 10, hp: 5, exp: 150, money: 200, imagen: UIImage(named: "monster12")!),
                                Monster(nombre: "Zombie Samurai", atk: 40, def: 20, hp: 2, exp: 400, money: 50, imagen: UIImage(named: "monster15")!),
                                Monster(nombre: "Rata Inmunda", atk: 10, def: 10, hp: 4, exp: 5000, money: 5000, imagen: UIImage(named: "monster3")!),
                                Monster(nombre: "Espadachín ambidiestro", atk: 30, def: 15, hp: 2, exp: 200, money: 350, imagen: UIImage(named: "monster6")!),
                                Monster(nombre: "Masa uniforme", atk: 20, def: 10, hp: 3, exp: 250, money: 150, imagen: UIImage(named: "monster8")!),
                                Monster(nombre: "Pesadilla andante", atk: 20, def: 15, hp: 7, exp: 300, money: 400, imagen: UIImage(named: "monster2")!),
                                Monster(nombre: "Rey del Infierno", atk: 40, def: 40, hp: 7, exp: 1000, money: 1000, imagen: UIImage(named: "monster14")!)
]

class Monster {
    
    var nombre: String = ""
    var atk: Int = 0
    var def: Int = 0
    var hp: Int = 0
    var exp: Int = 0
    var money: Int = 0
    var imagen: UIImage = UIImage()
    
    init(nombre: String, atk:Int, def:Int, hp:Int, exp:Int, money:Int, imagen:UIImage) {
        self.nombre = nombre
        self.atk = atk
        self.def = def
        self.hp = hp
        self.exp = exp
        self.money = money
        self.imagen = imagen
    }
    func getMonsterStatus(monster: Monster) -> Int {
        var finalStats = 0
        finalStats += monster.atk
        finalStats += monster.def
        return finalStats
    }
}
