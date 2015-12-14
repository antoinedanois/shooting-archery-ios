//
//  ChoixCibleController.swift
//  Shooting Archery
//
//  Created by Antoine Danois on 30/11/2015.
//  Copyright © 2015 iutbmteprow. All rights reserved.
//

import UIKit

class ChoixCibleController: UIViewController {

    
    
    
    @IBOutlet weak var labelJoueurUn: UILabel!
    @IBOutlet weak var buttonRetour: UIBarButtonItem!
    
    
    var joueurUn = ""
    var joueurDeux = ""
    var joueurTrois = ""
    var joueurQuatre = ""
    var nbJoueur = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let data = DataSingleton.sharedInstance()
        let db = SQLiteDB.sharedInstance()
        
        nbJoueur = data.getNbJoueur()
        joueurUn = data.getNomJoueurUn()
        print(nbJoueur)
        
        
        
            var reponse = db.query("SELECT * FROM utilisateur WHERE nom='" + joueurUn + "'")
            let row = reponse[0]
            
            let nom = row["nom"] as! String
            
            let prenom = row["prenom"] as! String
            
            labelJoueurUn.text = "Bonjour " + prenom + " " + nom

        
        
        
        
        
        
        

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func buttonRetour(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
