//
//  DataSingleton.swift
//  Shooting Archery
//
//  Created by Antoine Danois on 13/12/2015.
//  Copyright © 2015 iutbmteprow. All rights reserved.
//

import Foundation

class DataSingleton{
    
    var nbJoueur = 0
    var nomJoueurUn = ""
    var nomJoueurDeux = ""
    var nomJoueurTrois = ""
    var nomJoueurQuatre = ""
    
    
    class func sharedInstance() -> DataSingleton!{
        struct Static{
            static var instance: DataSingleton? = nil
            static var onceToken: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.onceToken){
            Static.instance = self.init()
    
        }
        
        return Static.instance!
        
    }
    
    required init(){
        
    }
    
    func getNbJoueur() -> Int{
        return nbJoueur
    }
    
    func setNbJoueur(nb : Int){
        nbJoueur = nb
    }
    
    func getNomJoueurUn() -> String{
        return nomJoueurUn
    }
    
    func setNomJoueurUn(nomJUn : String){
        nomJoueurUn = nomJUn
    }
    
    func getNomJoueurDeux() -> String{
        return nomJoueurDeux
    }
    
    func setNomJoueurDeux(nomJDeux : String){
        nomJoueurDeux = nomJDeux
    }
    
    func getNomJoueurTrois() -> String{
        return nomJoueurTrois
    }
    
    func setNomJoueurTrois(nomJTrois : String){
        nomJoueurTrois = nomJTrois
    }
    
    func getNomJoueurQuatre() -> String{
        return nomJoueurQuatre
    }
    
    func setNomJoueurQuatre(nomJQuatre : String){
        nomJoueurQuatre = nomJQuatre
    }
    
    
    
}