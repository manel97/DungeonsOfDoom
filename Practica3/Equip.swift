//
//  Inventory.swift
//  Practica3
//
//  Created by Manel Sitjar on 14/11/2018.
//  Copyright © 2018 Manel Sitjar. All rights reserved.
//

import Foundation
import UIKit

var equipoGuerrero:[String:Item] = [
    "Casco" : Item(nombre: "casco feo", dinero: 0, atk: 0, def: 4, mgic: 1, luck: 1, tipo: "Casco", img: UIImage.init(named: "helmet1")!),
    "Armadura" : Item(nombre: "armadura cutre", dinero: 0, atk: 0, def: 6, mgic: 2, luck: 1, tipo: "Armadura", img: UIImage.init(named: "armour")!),
    "Botas" : Item(nombre: "botas cutres", dinero: 0, atk: 0, def: 5, mgic: 0, luck: 5, tipo: "Botas", img: UIImage.init(named: "boots")!),
    "Arma" : Item(nombre: "espada cutre", dinero: 0, atk: 5, def: 2, mgic: 2, luck: 1, tipo: "Arma", img: UIImage.init(named: "sword4")!)]

var equipoArquero:[String:Item] = [
    "Casco" : Item(nombre: "casco feo", dinero: 0, atk: 0, def: 4, mgic: 1, luck: 1, tipo: "Casco", img: UIImage.init(named: "helmet1")!),
    "Armadura" : Item(nombre: "armadura cutre", dinero: 0, atk: 0, def: 6, mgic: 2, luck: 1, tipo: "Armadura", img: UIImage.init(named: "armour")!),
    "Botas" : Item(nombre: "botas cutres", dinero: 0, atk: 0, def: 5, mgic: 0, luck: 5, tipo: "Botas", img: UIImage.init(named: "boots")!),
    "Arma" : Item(nombre: "arco cutre", dinero: 0, atk: 5, def: 2, mgic: 2, luck: 1, tipo: "Arma", img: UIImage.init(named: "arrow")!)]

var equipoMago:[String:Item] = [
    "Casco" : Item(nombre: "casco feo", dinero: 0, atk: 0, def: 4, mgic: 1, luck: 1, tipo: "Casco", img: UIImage.init(named: "helmet1")!),
    "Armadura" : Item(nombre: "armadura cutre", dinero: 0, atk: 0, def: 6, mgic: 2, luck: 1, tipo: "Armadura", img: UIImage.init(named: "armour")!),
    "Botas" : Item(nombre: "botas cutres", dinero: 0, atk: 0, def: 5, mgic: 0, luck: 5, tipo: "Botas", img: UIImage.init(named: "boots")!),
    "Arma" : Item(nombre: "cetro cutre", dinero: 0, atk: 0, def: 2, mgic: 8, luck: 1, tipo: "Arma", img: UIImage.init(named: "scepter")!)]

class Equip {
    //esta clase no contiene ningun método porque solo sirve para estructurar la información de la clase heroe
    
    var listaEquip:[String:Item] = [String: Item]()
    
    init(listaEquip:[String: Item]) {
        self.listaEquip = listaEquip
    }
    
}
