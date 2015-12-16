//
//  ChoixCibleController.swift
//  Shooting Archery
//
//  Created by Antoine Danois on 30/11/2015.
//  Copyright © 2015 iutbmteprow. All rights reserved.
//

import UIKit

class ChoixCibleController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    
    
    @IBOutlet weak var labelJoueurUn: UILabel!
    @IBOutlet weak var buttonRetour: UIBarButtonItem!
    
    @IBOutlet weak var pickerTailleCible: UIPickerView!
    @IBOutlet weak var pickerCondition: UIPickerView!
    
    var pickerDataCondition: [String] = [String]()
    var pickerDataTaille: [String] = [String]()
    
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
        
        self.pickerCondition.delegate = self
        self.pickerTailleCible.delegate = self
        
        pickerCondition.tag = 1
        pickerTailleCible.tag = 2
        
        
        pickerDataCondition = ["Compétition", "Entrainement"]
        pickerDataTaille = ["40", "60"]
        
        
        var reponse = db.query("SELECT * FROM utilisateur WHERE nom='" + joueurUn + "'")
        
        let row = reponse[0]
            
        let nom = row["nom"] as! String
            
        let prenom = row["prenom"] as! String
            
        labelJoueurUn.text = "Bonjour" + prenom + "" + nom


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
    
    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pickerDataCondition.count
        
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        
        if(pickerView.tag == pickerCondition.tag){
            return pickerDataCondition[row]
        }else if(pickerView.tag == pickerTailleCible.tag){
            return pickerDataTaille[row]
        }else{
            return "rien"
        }
    }
}
