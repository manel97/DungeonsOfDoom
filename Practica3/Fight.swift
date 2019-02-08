//
//  Fight.swift
//  Practica3
//
//  Created by Manel Sitjar on 05/12/2018.
//  Copyright © 2018 Manel Sitjar. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

var nuevoNum = 0
var nuevoNumHeroe = 0

class Fight : UIViewController , UIPickerViewDataSource
, UIPickerViewDelegate, AVAudioPlayerDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        let monster:Monster = listaMonstruos[selectedMonster]
        let statusFinalesMonstruo = monster.getMonsterStatus(monster: monster)
        
        let heroe:Heroe = listaHeroes[counter]
        let statusFinalesHeroe = heroe.getHeroeStats(heroe: heroe)
        
        //uso los tags de los picker views para saber con cual estoy tratando:
        if pickerView.tag == 1{
            //en funcion de los stats que tenga un heroe tendra más o menos dados:
            //máximo he diseñado que sean 6, y mínimo seran 1 (aunque con los heroes que
            //he creado es imposible que tengan 1 dado.
            if statusFinalesMonstruo <= 15{
                return 1
            } else if statusFinalesMonstruo <= 30{
                return 2
            } else if statusFinalesMonstruo <= 45{
                return 3
            } else if statusFinalesMonstruo <= 60{
                return 4
            }else if statusFinalesMonstruo <= 75{
                return 5
            } else{
                return 6
            }
        } else if pickerView.tag == 2{
            //con los monstruos igual
            if statusFinalesHeroe <= 15{
                return 1
            } else if statusFinalesHeroe <= 30{
                return 2
            } else if statusFinalesHeroe <= 45{
                return 3
            } else if statusFinalesHeroe <= 60{
                return 4
            } else if statusFinalesHeroe <= 75{
                return 5
            } else{
                return 6
            }
        }
        //se que esto esta mal y que no debería haber un return fuera pero si lo hacia solo con un if - else me fallaba y de cualquier forma es imposible que salga de ese if - else if porque solo hay 2 picker views.
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return dicesHeroe.count
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        //creamos la vista
        let vista = UIView(frame: CGRect(x: 0, y: -15, width: 50, height: 100))
        
        if pickerView.tag == 1{
            //creamos imageview para meterle las imagenes de los dados.
            let imageView:UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 100))
            imageView.image = dicesMonster[row].img
            vista.addSubview(imageView)
                return vista
        } else{
            //creamos imageview para meterle las imagenes de los dados.
            let imageView:UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 100))
            imageView.image = dicesHeroe[row].img
            vista.addSubview(imageView)
                return vista
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
   
    
    
    @IBOutlet weak var imgMonster: UIImageView!
    @IBOutlet weak var imgHeroe: UIImageView!
    @IBOutlet weak var btnAttack: UIButton!
    @IBOutlet weak var pvMonsterDice: UIPickerView!
    @IBOutlet weak var pvHeroeDice: UIPickerView!
    @IBOutlet weak var lblAtaqueJugador: UILabel!
    @IBOutlet weak var lblAtaqueMonstruo: UILabel!
    @IBOutlet weak var vidasMonster: UIImageView!
    @IBOutlet weak var vidasHeroe: UIImageView!
    @IBOutlet weak var btnvolver: UIButton!
    @IBOutlet weak var btnEmpezardeNuevo: UIButton!
    var monsterHit:AVAudioPlayer?
    var heroeHit:AVAudioPlayer?
    var deadHeroe:AVAudioPlayer?
    var deadMonster:AVAudioPlayer?
    var musicaPelea:AVAudioPlayer?
    
    private func soundMonsterAttack(){
        do {
            if let fileURL = Bundle.main.path(forResource: "ataqueMonstruo", ofType: "mp3") {
                monsterHit = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL))
            }
        } catch _{
        }
        monsterHit?.play()
    }
    
    private func soundHeroeAttack(){
        do {
            if let fileURL = Bundle.main.path(forResource: "heroeStrike", ofType: "mp3") {
                heroeHit = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL))
            }
        } catch _{
        }
        heroeHit?.play()
    }
    private func soundMonsterDead(){
        do {
            if let fileURL = Bundle.main.path(forResource: "deadMonster", ofType: "mp3") {
                deadMonster = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL))
            }
        } catch _{
        }
        deadMonster?.play()
    }
    private func soundHeroeDead(){
        do {
            if let fileURL = Bundle.main.path(forResource: "deadHeroe", ofType: "mp3") {
                deadHeroe = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL))
            }
        } catch _{
        }
        deadHeroe?.play()
    }
    private func fightMusic(){
        do {
            if let fileURL = Bundle.main.path(forResource: "musicaFight", ofType: "mp3") {
                musicaPelea = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL))
            }
        } catch _{
        }
        musicaPelea?.play()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fightMusic()
        nuevoNum = listaMonstruos[selectedMonster].hp
        nuevoNumHeroe = listaHeroes[counter].hp
        pvMonsterDice.delegate = self
        pvMonsterDice.dataSource = self
        pvHeroeDice.delegate = self
        pvHeroeDice.dataSource = self
        btnvolver.isHidden = true
        btnAttack.isHidden = false
        btnEmpezardeNuevo.isHidden = true
        cargarHeroe(heroe: listaHeroes[counter])
        cargarMonstruo(monster: listaMonstruos[selectedMonster])
        lblAtaqueJugador.text = ""
        lblAtaqueMonstruo.text = ""
        imprimirVidaMonster(num: listaMonstruos[selectedMonster].hp)
        imprimirVidaHeroe(num: listaHeroes[counter].hp)
        
    }
    func cargarMonstruo(monster:Monster){
        //funcion para poner la imagen del monstruo seleccionado en la pantalla de lucha.
        imgMonster.image = monster.imagen
    }
    func cargarHeroe(heroe:Heroe){
        //lo mismo pero con el heroe
        imgHeroe.image = heroe.image
    }
    //metodo para imprimir corazones que recibe un numero de vidas como parametro
    func imprimirVidaMonster(num: Int){
        let view = vidasMonster
        var x = -20
        let y = 50
        
        for _ in 0...num - 1 {
            let imageView:UIImageView = UIImageView(frame: CGRect(x: x, y: y, width: 30, height: 30))
            imageView.image = UIImage(named: "heart")
            view!.addSubview(imageView)
            x += 25
        }
    }
    //metodo para imprimir corazones que recibe un numero de vidas como parametro
    func imprimirVidaHeroe(num: Int){
        let view = vidasHeroe
        var x = -20
        let y = 30
        
        for _ in 0...num - 1 {
            let imageView:UIImageView = UIImageView(frame: CGRect(x: x, y: y, width: 30, height: 30))
            imageView.image = UIImage(named: "heart")
            view!.addSubview(imageView)
            x += 25
        }
    }
    
    @IBAction func Atacar(_ sender: UIButton) {
        
        //en esta variable guardo el total de los dados sumados que saca el jugador
        var ataqueJugador = 0
        //en esta variable guardo el total de los dados sumados que saca el monstruo
        var ataqueMonstruo = 0
        
        //bucle que te anima los componentes del pv del heroe y te suma los valores
        //que sacan los dados de ataque, el de abajo igual con los monstruos
        for i in 0..<numberOfComponents(in: pvHeroeDice){
            let randomNumber = Int.random(in: 0..<dicesHeroe.count)
            pvHeroeDice.selectRow(randomNumber, inComponent: i, animated: true)
            ataqueJugador += randomNumber + 1
            lblAtaqueJugador.text = "Ataque: \(String(ataqueJugador))"
        }
        for i in 0..<numberOfComponents(in: pvMonsterDice){
            let randomNumber = Int.random(in: 0..<dicesMonster.count)
            pvMonsterDice.selectRow(randomNumber, inComponent: i, animated: true)
            ataqueMonstruo += randomNumber + 1
            lblAtaqueMonstruo.text = "Ataque: \(String(ataqueMonstruo))"
        }
        
        //si golpea el usuario
        if ataqueJugador > ataqueMonstruo {
            //restamos 1 a una variable que le ha sido asignada la vida del monstruo
            //al entrar en esta pantalla.
            nuevoNum -= 1
            //mientras el monstruo tenga mas de 0 de vida:
            if nuevoNum != 0{
                //si gana el heroe pero aun no ha muerto el monstruo ponemos sonido de su ataque
                soundHeroeAttack()
                //quitamos los corazones que habiamos imprimido
                for view in self.vidasMonster.subviews{
                    view.removeFromSuperview()
                }
                //los volvemos a imprimir pero esta vez con 1 menos.
                imprimirVidaMonster(num: nuevoNum)
            } else{
                //ya no le quedan vidas el monstruo asi que ponemos su sonido de muerte
                soundMonsterDead()
                //si tiene 0 vidas:
                for view in self.vidasMonster.subviews{
                    view.removeFromSuperview()
                }
                //sumamos exp y monedas al heroe
                //y mostramos alert de victoria
                ganaHeroe()
            }
        //si golpea el monstruo
        } else if ataqueMonstruo > ataqueJugador {
            //le resto 1 para luego imprimir el mismo numero de corazones - 1.
            nuevoNumHeroe -= 1
            if nuevoNumHeroe != 0{
                //si gana el monstruo pero aun no ha muerto el heroe ponemos sonido de su ataque
                soundMonsterAttack()
                //quito los corazones que había antes
                for view in self.vidasHeroe.subviews{
                    view.removeFromSuperview()
                }
                //meto los nuevos (el mismo metodo con parametro vidaHeroe.hp -1
                imprimirVidaHeroe(num: nuevoNumHeroe)
            } else{
                //ya no le quedan vidas al heroe asi que ponemos su sonido de muerte critica
                soundHeroeDead()
                for view in self.vidasHeroe.subviews{
                    view.removeFromSuperview()
                }
                nuevoNumHeroe = listaHeroes[counter].hp
                ganaMonstruo()
            }
        }
        
    }
    //estas 2 funciones las he creado para quitar un poco de codigo de la funcion pelear
    func ganaHeroe()  {
        musicaPelea?.stop()
        listaHeroes[counter].exp += listaMonstruos[selectedMonster].exp
        listaHeroes[counter].money += listaMonstruos[selectedMonster].money
        nuevoNum = listaMonstruos[selectedMonster].hp
        let alert = UIAlertController(title: "Has derrotado a \(listaMonstruos[selectedMonster].nombre)", message: "Has conseguido eliminar al bicho y te has llevado \(listaMonstruos[selectedMonster].exp) experiencia y \(listaMonstruos[selectedMonster].money) monedas.. Muy bien!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true)
        btnvolver.isHidden = false
        btnAttack.isHidden = true
    }
    
    func ganaMonstruo() {
        musicaPelea?.stop()
        let alert = UIAlertController(title: "\(listaMonstruos[selectedMonster].nombre) te ha derrotado", message: "El monstruo ha sido mas fuerte que tu.. ahora vas a tener que volver a empezar el juego!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true)
        btnAttack.isHidden = true
        //vuelvo a definir los heroes para perder el proceso de exp, monedas y items aconseguidos.
        btnEmpezardeNuevo.isHidden = false
        borrarProgresoHeroe()
        //hago lo mismo con los items de la shop, porque sino al volver a empezar
        //se perderan los items que compraste.
        resetearShop()
    }
    func borrarProgresoHeroe(){
        listaHeroes.removeAll()
        let heroe1 = Heroe(hp: 4, name: "King Arthur", exp: 0, money: 300, equipo: Equip(listaEquip: equipoGuerrero), stats: 5, image: UIImage.init(named: "heroe1")!)
        let heroe2 = Heroe(hp: 3, name: "Joana d'Arc", exp: 0, money: 300, equipo: Equip(listaEquip: equipoArquero), stats: 10, image: UIImage.init(named: "heroe2")!)
        let heroe3 = Heroe(hp: 2, name: "High Wizard Heisenberg", exp: 0, money: 250, equipo: Equip.init(listaEquip: equipoMago), stats: 15, image: UIImage(named: "heroe3")!)
        //los meto de nuevo en el array de Heroes
        listaHeroes.append(heroe1)
        listaHeroes.append(heroe2)
        listaHeroes.append(heroe3)
    }
    func resetearShop() {
        listaItems.removeAll()
        let item1 = Item(nombre: "Espada de Madera", dinero: 70, atk: 6, def: 2, mgic: 2, luck: 1, tipo: "Arma", img: UIImage.init(named: "sword4")!)
        let item2 = Item(nombre: "Casco de Bruja", dinero: 70, atk: 0, def: 6, mgic: 1, luck: 0, tipo: "Casco", img: UIImage.init(named: "helmet3")!)
        let item3 = Item(nombre: "Arco de Legolas", dinero: 350, atk: 15, def: 0, mgic: 10, luck: 0, tipo: "Arma", img: UIImage.init(named: "arrow2")!)
        let item4 = Item(nombre: "Espada Afilada", dinero: 215, atk: 17, def: 0, mgic: 2, luck: 1, tipo: "Arma", img: UIImage.init(named: "sword3")!)
        let item5 = Item(nombre: "Yelmo de gladiador", dinero: 105, atk: 0, def: 15, mgic: 2, luck: 0, tipo: "Casco", img: UIImage.init(named: "helmet2")!)
        let item6 = Item(nombre: "Botas voladoras", dinero: 140, atk: 0, def: 7, mgic: 2, luck: 2, tipo: "Botas", img: UIImage.init(named: "boots2")!)
        let item7 = Item(nombre: "Camiseta H&M", dinero: 160, atk: 0, def: 13, mgic: 1, luck: 1, tipo: "Armadura", img: UIImage.init(named: "armour3")!)
        let item8 = Item(nombre: "Armadura potente", dinero: 185, atk: 0, def: 16, mgic: 1, luck: 0, tipo: "Armadura", img: UIImage.init(named: "armour2")!)
        let item9 = Item(nombre: "Cetro de Batalla", dinero: 220, atk: 4, def: 0, mgic: 18, luck: 1, tipo: "Arma", img: UIImage.init(named: "scepter2")!)
        let item10 = Item(nombre: "Casco de la inquisición", dinero: 135, atk: 0, def: 16, mgic: 2, luck: 1, tipo: "Casco", img: UIImage.init(named: "helmet1")!)
        let item11 = Item(nombre: "Cetro de Merlín", dinero: 270, atk: 3, def: 2, mgic: 20, luck: 0, tipo: "Arma", img: UIImage.init(named: "magic")!)
        let item12 = Item(nombre: "Espada del inframundo", dinero: 260, atk: 17, def: 2, mgic: 7, luck: 1, tipo: "Arma", img: UIImage.init(named: "sword2")!)
        //let item13
        listaItems.append(item1)
        listaItems.append(item2)
        listaItems.append(item3)
        listaItems.append(item4)
        listaItems.append(item5)
        listaItems.append(item6)
        listaItems.append(item7)
        listaItems.append(item8)
        listaItems.append(item9)
        listaItems.append(item10)
        listaItems.append(item11)
        listaItems.append(item12)
    }
    
}
