//
//  Item.swift
//  Practica3
//
//  Created by Manel Sitjar on 21/11/2018.
//  Copyright © 2018 Manel Sitjar. All rights reserved.
//

import Foundation
import UIKit

var listaItems:[Item] = [Item(nombre: "Espada de madera", dinero: 70, atk: 6, def: 0, mgic: 2, luck: 1, tipo: "Arma", img: UIImage.init(named: "sword4")!),
                         Item(nombre: "Casco de bruja", dinero: 70, atk: 0, def: 6, mgic: 1, luck: 0, tipo: "Casco", img: UIImage.init(named: "helmet3")!),
                         Item(nombre: "Arco de Legolas", dinero: 350, atk: 15, def: 0, mgic: 10, luck: 0, tipo: "Arma", img: UIImage.init(named: "arrow3")!),
                         Item(nombre: "Espada afilada", dinero: 215, atk: 17, def: 0, mgic: 2, luck: 1, tipo: "Arma", img: UIImage.init(named: "sword3")!),
                         Item(nombre: "Yelmo de gladiador", dinero: 105, atk: 0, def: 15, mgic: 2, luck: 0, tipo: "Casco", img: UIImage.init(named: "helmet2")!),
                         Item(nombre: "Botas voladoras", dinero: 140, atk: 0, def: 7, mgic: 2, luck: 2, tipo: "Botas", img: UIImage.init(named: "boots2")!),
                         Item(nombre: "Camiseta H&M", dinero: 160, atk: 0, def: 13, mgic: 1, luck: 1, tipo: "Armadura", img: UIImage.init(named: "armour3")!),
                         Item(nombre: "Armadura potente", dinero: 185, atk: 0, def: 16, mgic: 1, luck: 0, tipo: "Armadura", img: UIImage.init(named: "armour2")!),
                         Item(nombre: "Cetro de Batalla", dinero: 220, atk: 4, def: 0, mgic: 18, luck: 1, tipo: "Arma", img: UIImage.init(named: "scepter2")!),
                         Item(nombre: "Casco de la inquisición", dinero: 135, atk: 0, def: 16, mgic: 2, luck: 1, tipo: "Casco", img: UIImage.init(named: "helmet1")!),
                         Item(nombre: "Cetro de Merlín", dinero: 270, atk: 3, def: 2, mgic: 20, luck: 0, tipo: "Arma", img: UIImage.init(named: "magic")!),
                         Item(nombre: "Espada del inframundo", dinero: 260, atk: 17, def: 2, mgic: 7, luck: 1, tipo: "Arma", img: UIImage.init(named: "sword2")!)
]

class Item {
    
    //Un ítem cuesta un dinero y se compone de diferentes propiedades: Ataque (ATQ), Defensa (DEF), Magia (MAG), Suerte (LCK).
    //cada item tendra una variable "tipo" que sera distinto en cada item
    //solo existen "Casco", "Armadura", "Botas", y "Arma".
    //en mi aplicación no he incluido ni escudos, ni anillos, ni capas, porque he considerado que no he dado abasto.
    
    var nombre: String = ""
    var dinero: Int = 0
    var atk: Int = 0
    var def: Int = 0
    var mgic: Int = 0
    var luck: Int = 0
    var tipo: String = ""
    var img: UIImage = UIImage()
    
    init(nombre:String, dinero: Int, atk: Int, def: Int, mgic: Int, luck: Int,tipo: String , img:UIImage ) {
        self.nombre = nombre
        self.dinero = dinero
        self.atk = atk
        self.def = def
        self.mgic = mgic
        self.luck = luck
        self.tipo = tipo
        self.img = img
    }
    func getItemStats(item: Item) -> Int {
        //funcion que te devuelve los stats que aporta un item para varias funcionalidades.
        //como por ejemplo saber el poder de un item que vas a comprar, etc.
        var finalStat = 0
        finalStat += item.atk
        finalStat += item.def
        finalStat += item.luck
        finalStat += item.mgic        
        return finalStat
    }
}
