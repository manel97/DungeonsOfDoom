//
//  Inventory.swift
//  Practica3
//
//  Created by Manel Sitjar on 27/11/2018.
//  Copyright © 2018 Manel Sitjar. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

var contadorLvl:Int = 0

class Inventory: UIViewController {
    
    
    @IBOutlet weak var imgCasco: UIImageView!
    @IBOutlet weak var lblCasco: UILabel!
    @IBOutlet weak var imgArmor: UIImageView!
    @IBOutlet weak var lblArmor: UILabel!
    @IBOutlet weak var imgBoots: UIImageView!
    @IBOutlet weak var lblBoots: UILabel!
    @IBOutlet weak var imgWep: UIImageView!
    @IBOutlet weak var lblWeapon: UILabel!
    @IBOutlet weak var lblExp: UILabel!
    @IBOutlet weak var lblMoney: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var imgHeroe: UIImageView!
    var invSound:AVAudioPlayer?
    @IBOutlet weak var lblNameHeroe: UILabel!
    var stats = listaHeroes[counter].getHeroeStats(heroe: listaHeroes[counter])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //cada vez que entramos a la pantalla rellenamos el inventario con el heroe correspondiente. Igual con las monedas y la experiencia.
        inventorySound()
        rellenarInventario(heroe: listaHeroes[counter])
        let exp = listaHeroes[counter].exp
        let lvl = (exp/100)+1
        let Strlvl = String(lvl)
        let money = String(listaHeroes[counter].money)
        lblExp.text = "Nivel: \(Strlvl)"
        lblMoney.text = "Dinero: \(money)"
        
        calculoDelNivel(lvl: lvl)
        lblStatus.text = "Tus stats finales son: \(stats)"
    }
    //metodo que uso para rellenar el inventario de cada heroe y ademas para actualizarlo despues de cualquier compra.
    func rellenarInventario(heroe: Heroe){
        let imagHeroe:UIImage = listaHeroes[counter].image
        let nombreHeroe = listaHeroes[counter].name
        let imageArma:UIImage = ((heroe.equipo.listaEquip["Arma"]?.img ?? nil)!)
        let nombreArma = heroe.equipo.listaEquip["Arma"]?.nombre
        let imageCasco:UIImage = ((heroe.equipo.listaEquip["Casco"]?.img ?? nil)!)
        let nombreCasco = heroe.equipo.listaEquip["Casco"]?.nombre
        let imageArmor:UIImage = ((heroe.equipo.listaEquip["Armadura"]?.img ?? nil)!)
        let nombreArmadura = heroe.equipo.listaEquip["Armadura"]?.nombre
        let imageBotas:UIImage = ((heroe.equipo.listaEquip["Botas"]?.img ?? nil)!)
        let nombreBotas = heroe.equipo.listaEquip["Botas"]?.nombre
        imgHeroe.image = imagHeroe
        lblNameHeroe.text = nombreHeroe
        imgWep.image = imageArma
        lblWeapon.text = nombreArma
        imgCasco.image = imageCasco
        lblCasco.text = nombreCasco
        imgArmor.image = imageArmor
        lblArmor.text = nombreArmadura
        imgBoots.image = imageBotas
        lblBoots.text = nombreBotas
    }
    func calculoDelNivel(lvl:Int)  {
       
        
        //esta cadena de ifs es que cada 15 lvls te suman 5 a tus status y por cada 30 lvls 1 a tu hp, para asi poder derrotar a los monstruos mas fuertes con más facilidad
        stats = listaHeroes[counter].getHeroeStats(heroe: listaHeroes[counter])
        if lvl >= 15 && contadorLvl == 0{
            //listaHeroes[counter].hp += 1
            listaHeroes[counter].stats += 5
            stats = listaHeroes[counter].getHeroeStats(heroe: listaHeroes[counter])
            contadorLvl += 1
        }
        if lvl >= 30 && contadorLvl == 1{
            listaHeroes[counter].hp += 1
            listaHeroes[counter].stats += 5
            stats = listaHeroes[counter].getHeroeStats(heroe: listaHeroes[counter])
            contadorLvl += 1
        }
        if lvl >= 45 && contadorLvl == 2{
            //listaHeroes[counter].hp += 1
            listaHeroes[counter].stats += 5
            stats = listaHeroes[counter].getHeroeStats(heroe: listaHeroes[counter])
            contadorLvl += 1
        }
        if lvl >= 60 && contadorLvl == 3{
            listaHeroes[counter].hp += 1
            listaHeroes[counter].stats += 5
            stats = listaHeroes[counter].getHeroeStats(heroe: listaHeroes[counter])
            contadorLvl += 1
        }
        if lvl >= 75 && contadorLvl == 4{
            //listaHeroes[counter].hp += 1
            listaHeroes[counter].stats += 5
            stats = listaHeroes[counter].getHeroeStats(heroe: listaHeroes[counter])
            contadorLvl += 1
        }
        if lvl >= 90 && contadorLvl == 5{
            listaHeroes[counter].hp += 1
            listaHeroes[counter].stats += 5
            stats = listaHeroes[counter].getHeroeStats(heroe: listaHeroes[counter])
            contadorLvl += 1
        }
    }
    
    private func inventorySound(){
        do {
            if let fileURL = Bundle.main.path(forResource: "yes", ofType: "mp3") {
                invSound = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL))
            }
        } catch _{
        }
        invSound?.play()
    }
    
}
