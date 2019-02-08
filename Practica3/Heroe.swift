//
//  Heroe.swift
//  Practica3
//
//  Created by Manel Sitjar on 14/11/2018.
//  Copyright © 2018 Manel Sitjar. All rights reserved.
//

import Foundation
import UIKit

var heroe1 = Heroe(hp: 4, name: "King Arthur", exp: 0, money: 300, equipo: Equip(listaEquip: equipoGuerrero), stats: 5, image: UIImage.init(named: "heroe1")!)
var heroe2 = Heroe(hp: 3, name: "Joana d'Arc", exp: 0, money: 300, equipo: Equip(listaEquip: equipoArquero), stats: 10, image: UIImage.init(named: "heroe2")!)
var heroe3 = Heroe(hp: 2, name: "High Wizard Heisenberg", exp: 0, money: 250, equipo: Equip.init(listaEquip: equipoMago), stats: 15, image: UIImage(named: "heroe3")!)

var listaHeroes:[Heroe] = [heroe1, heroe2, heroe3]

class Heroe {
    //en mi aplicación, los heroes solo tienen un "stat" llamado stats que es la suma de todos los stats, ya que en mi opinión era más sencillo de programar y da el mismo resultado.
    
    var hp: Int = 0
    var name: String = ""
    var exp: Int = 0
    var money: Int = 0
    var equipo: Equip
    var stats: Int = 0
    var image: UIImage = UIImage()
    
    init(hp: Int, name: String, exp: Int, money: Int, equipo: Equip, stats: Int, image: UIImage) {
        self.hp = hp
        self.name = name
        self.exp = exp
        self.money = money
        self.equipo = equipo
        self.stats = stats
        self.image = image
    }
    func getHeroeStats(heroe: Heroe) -> Int {
        var stats: Int = 0
        //le sumamos los stats innatos del heroe
        stats += heroe.stats
        //le sumamos los stats que vienen del casco
        stats += (heroe.equipo.listaEquip["Casco"]?.atk)!
        stats += (heroe.equipo.listaEquip["Casco"]?.def)!
        stats += (heroe.equipo.listaEquip["Casco"]?.luck)!
        stats += (heroe.equipo.listaEquip["Casco"]?.mgic)!
        //ahora los de la armadura..
        stats += (heroe.equipo.listaEquip["Armadura"]?.atk)!
        stats += (heroe.equipo.listaEquip["Armadura"]?.def)!
        stats += (heroe.equipo.listaEquip["Armadura"]?.luck)!
        stats += (heroe.equipo.listaEquip["Armadura"]?.mgic)!
        //botas
        stats += (heroe.equipo.listaEquip["Botas"]?.atk)!
        stats += (heroe.equipo.listaEquip["Botas"]?.def)!
        stats += (heroe.equipo.listaEquip["Botas"]?.luck)!
        stats += (heroe.equipo.listaEquip["Botas"]?.mgic)!
        //arma :)
        stats += (heroe.equipo.listaEquip["Arma"]?.atk)!
        stats += (heroe.equipo.listaEquip["Arma"]?.def)!
        stats += (heroe.equipo.listaEquip["Arma"]?.luck)!
        stats += (heroe.equipo.listaEquip["Arma"]?.mgic)!
        
        //y finalmente retornamos los stats que tendra el heroe
        return stats
    }
}
