//
//  Dungeon.swift
//  Practica3
//
//  Created by Manel Sitjar on 14/11/2018.
//  Copyright © 2018 Manel Sitjar. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class Dungeon: UIViewController , UIPickerViewDataSource
, UIPickerViewDelegate, AVAudioPlayerDelegate  {
    
    
    @IBOutlet weak var PvMonsters: UIPickerView!
    @IBOutlet weak var btnFight: UIButton!
    var evilLaughter:AVAudioPlayer?
    var dungSound:AVAudioPlayer?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listaMonstruos.count
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        //creamos la vista que guardara cada fila
        let vista:UIView = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 100))
        //creamos el imageview
        let imagenView:UIImageView = UIImageView(frame: CGRect(x: -100, y: 0, width: 100, height: 100))
        imagenView.image = listaMonstruos[row].imagen
        //creamos el label del nombre
        let nombre:UILabel = UILabel(frame: CGRect(x: 20, y: -20, width: 350, height: 100))
        nombre.text = "Nombre: \(listaMonstruos[row].nombre)"
        nombre.textColor = UIColor.white
        //creamos el label de la exp
        let exp:UILabel = UILabel(frame: CGRect(x: 20, y: +0, width: 200, height: 100))
        let expStr = String(listaMonstruos[row].exp)
        exp.text = "Experiencia: \(expStr)"
        exp.textColor = UIColor.white
        //creamos el label de las monedas recibidas
        let money:UILabel = UILabel(frame: CGRect(x: 20, y: +20, width: 200, height: 100))
        let moneyStr = String(listaMonstruos[row].money)
        money.text = "Dinero: \(moneyStr)"
        money.textColor = UIColor.white
        
        let corazones:UILabel = UILabel(frame: CGRect(x: 20, y: +40, width: 200, height: 100))
        let corazonesStr = String(listaMonstruos[row].hp)
        corazones.text = "Vidas: \(corazonesStr)"
        corazones.textColor = UIColor.white
        
        vista.addSubview(imagenView)
        vista.addSubview(nombre)
        vista.addSubview(exp)
        vista.addSubview(money)
        vista.addSubview(corazones)
        return vista
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 150
    }
    
    private func travisLaughter(){
        do {
            if let fileURL = Bundle.main.path(forResource: "travisLaugh", ofType: "mp3") {
                evilLaughter = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL))
            }
        } catch _{
        }
        evilLaughter?.play()
    }
    private func dungeonSound(){
        do {
            if let fileURL = Bundle.main.path(forResource: "dungSound", ofType: "mp3") {
                dungSound = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL))
            }
        } catch _{
        }
        dungSound?.play()
    }
    
    @IBAction func Pelear(_ sender: UIButton) {
        //función asociada al boton "Fight" que te lleva directamente a la pantalla de pelea con el heroe seleccionado en la pantalla 1 y el monstruo que hayas elegido en esta pantalla. (selectedMonster) es una variable donde guardamos la posicion del array de monstruos que has seleccionado para pelear.
        selectedMonster = PvMonsters.selectedRow(inComponent: 0)
        if selectedMonster == 8 {
            travisLaughter()
        } else{
            
        }
        self.performSegue(withIdentifier: "fightSegue", sender: self)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dungeonSound()
        PvMonsters.delegate = self
        PvMonsters.dataSource = self
        
    }
}
