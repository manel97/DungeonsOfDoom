//
//  ViewController.swift
//  Practica3
//
//  Created by Manel Sitjar on 14/11/2018.
//  Copyright © 2018 Manel Sitjar. All rights reserved.
//

import UIKit


//variables contador para saber siempre en que heroe/monstruo estamos trabajando
var counter:Int = 0
var selectedMonster: Int = 0












class ViewController: UIViewController {

    
    
    
    @IBOutlet weak var btnHeroe1: UIButton!
    @IBOutlet weak var recuadro1: UIImageView!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var btnHeroe2: UIButton!
    @IBOutlet weak var recuadro2: UIImageView!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var btnHeroe3: UIButton!
    @IBOutlet weak var recuadro3: UIImageView!
    @IBOutlet weak var lbl3: UILabel!
    
    @IBAction func selectHeroe(_ sender: UIButton) {
        //un metodo simple para guardar en la variable "counter" la posicion del array de heroes en la que estamos trabajando.
        if sender.tag == 1 {
            counter = 0
        } else if sender.tag == 2{
            counter = 1
        } else if sender.tag == 3{
            counter = 2
        }
        self.performSegue(withIdentifier: "primerCambio", sender: self)
    }
    
    func imprimirVidaHeroe(view:UIView, heroe:Heroe){
        //funcion que sirve para poner tantos corazones como vidas (hp) tenga el heroe que le pases como parametro.
        
        let numVidas = heroe.hp
        var x = +45
        let y = 30
        
        for _ in 0...numVidas - 1 {
            let imageView:UIImageView = UIImageView(frame: CGRect(x: x, y: y, width: 30, height: 30))
            imageView.image = UIImage(named: "heart")
            view.addSubview(imageView)
            x += 25
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()       
        
        btnHeroe1.setBackgroundImage(listaHeroes[0].image, for: .normal)
        imprimirVidaHeroe(view: recuadro1, heroe: listaHeroes[0])
        lbl1.text = "Ataque: \(listaHeroes[0].getHeroeStats(heroe: listaHeroes[0]))"
        
        btnHeroe2.setBackgroundImage(listaHeroes[1].image, for: .normal)
        imprimirVidaHeroe(view: recuadro2, heroe: listaHeroes[1])
        lbl2.text = "Ataque: \(listaHeroes[1].getHeroeStats(heroe: listaHeroes[1]))"
        
        btnHeroe3.setBackgroundImage(listaHeroes[2].image, for: .normal)
        imprimirVidaHeroe(view: recuadro3, heroe: listaHeroes[2])
        lbl3.text = "Ataque: \(listaHeroes[2].getHeroeStats(heroe: listaHeroes[2]))"
        
    }
}

