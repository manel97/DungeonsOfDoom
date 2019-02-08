//
//  Shop.swift
//  Practica3
//
//  Created by Manel Sitjar on 21/11/2018.
//  Copyright © 2018 Manel Sitjar. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class Shop: UIViewController , UIPickerViewDataSource
, UIPickerViewDelegate, AVAudioPlayerDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listaItems.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        //creamos item y asignamos el row del pickerview para facilitar la lectura del codigo
        let item:Item = listaItems[row]
        
        //creamos la vista
        let vista:UIView = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 100))
        //creamos la imgview
        let imagenView:UIImageView = UIImageView(frame: CGRect(x: -100, y: 0, width: 100, height: 100))
        imagenView.image = item.img
        //creamos el label del nombre
        let nombre:UILabel = UILabel(frame: CGRect(x: 20, y: -40, width: 300, height: 100))
        nombre.text = "Nombre: \(item.nombre)"
        nombre.textColor = UIColor.white
        //creamos label de los stats que tiene ese item
        let status:UILabel = UILabel(frame: CGRect(x: 20, y: -20, width: 200, height: 100))
        status.text = "Stats: \(item.getItemStats(item: item))"
        status.textColor = UIColor.white
        //creamos el label de las monedas necesarias
        let money:UILabel = UILabel(frame: CGRect(x: 20, y: 0, width: 200, height: 100))
        let moneyStr = String(item.dinero)
        money.text = "Dinero: \(moneyStr)"
        money.textColor = UIColor.white
        
        vista.addSubview(imagenView)
        vista.addSubview(nombre)
        vista.addSubview(status)
        vista.addSubview(money)
        
        return vista
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 150
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
    
    @IBOutlet weak var pvItems: UIPickerView!
    @IBOutlet weak var btnBuy: UIButton!
    @IBOutlet weak var monedas: UILabel!
    var moneySound:AVAudioPlayer?
    var shopSound:AVAudioPlayer?
    
    private func moneySounds(){
        do {
            if let fileURL = Bundle.main.path(forResource: "monedas", ofType: "mp3") {
                moneySound = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL))
            }
        } catch _{
        }
        moneySound?.play()
    }
    private func sonidoTienda(){
        do {
            if let fileURL = Bundle.main.path(forResource: "shopSound", ofType: "mp3") {
                shopSound = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL))
            }
        } catch _{
        }
        shopSound?.play()
    }
    
    @IBAction func buyItem(_ sender: UIButton) {
        
        //creamos variable dentro del metodo para ahorrarnos unas cuantas lineas de código repetido
        let item:Item = listaItems[pvItems.selectedRow(inComponent: 0)]
        let tipo:String = item.tipo
        let statsItemComprando = item.getItemStats(item: item)
        let itemEquipado = listaHeroes[counter].equipo.listaEquip[tipo]
        let statsItemEquipado = itemEquipado?.getItemStats(item: itemEquipado!)
        
        //mientras tienes suficiente dinero para comprar:
        if listaHeroes[counter].money > item.dinero {
            //si tienes un item en la misma posicion del item que pretendes comprar, pero con mas poder:
            if statsItemComprando <= statsItemEquipado! {
                let alert = UIAlertController(title: "Think twice", message: "Cuidado! ya posees un ítem más poderoso!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "No, gracias", style: .cancel, handler: nil))
                self.present(alert, animated: true)
                //en caso de que no:
            } else{
                //updateamos el diccionario del equipo de nuestro heroe con el item que acabamos de comprar, y ademas quitamos el item de la shop y restamos el dinero que ha gastado el heroe al total que tiene.
                listaHeroes[counter].equipo.listaEquip.updateValue(item, forKey: tipo)
                listaItems.remove(at: pvItems.selectedRow(inComponent: 0))
                listaHeroes[counter].money = listaHeroes[counter].money - item.dinero
                monedas.text = "Dinero: \(listaHeroes[counter].money)"
                moneySounds()
            }
        } else{
            //en caso de no tener suficientes monedas:
            let alert = UIAlertController(title: "No tienes suficiente dinero", message: "Vas a tener que derrotar algunos monstruos antes de poder comprar este objeto!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        //para que se recargue el pickerView sin renovar la pantalla
        pvItems.reloadAllComponents()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pvItems.delegate = self
        pvItems.dataSource = self
        monedas.text = "Dinero: \(listaHeroes[counter].money)"
        sonidoTienda()
    }
    
}
