//
//  SupprimerUtilisateurViewController.swift
//  Shooting Archery
//
//  Created by Antoine Danois on 06/12/2015.
//  Copyright © 2015 iutbmteprow. All rights reserved.
//

import UIKit

class SupprimerUtilisateurViewController: UIViewController, UIPickerViewDelegate {

    @IBOutlet weak var pickerUtilisateur: UIPickerView!
    
    @IBOutlet weak var buttonSupprimer: UIBarButtonItem!
    
    @IBOutlet weak var buttonRetour: UIBarButtonItem!
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pickerUtilisateur.delegate = self
        
        pickerData = []
        
        let db = SQLiteDB.sharedInstance()
        
        
        
        let dataSelect = db.query("SELECT * FROM utilisateur")
        
        
        for row in dataSelect
        {
            if(row["nom"] as! String != "  "){
                pickerData.append(row["nom"] as! String)
            }
        }


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func retourAjoutUtilisateur(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func supprimerUtilisateur(sender: AnyObject) {
        
        let db = SQLiteDB.sharedInstance()
        
        let selectedNom = pickerData[pickerUtilisateur.selectedRowInComponent(0)]
        
        let query = "DELETE FROM utilisateur WHERE nom='" + selectedNom + "'"
        
        let data = db.query(query)

        
        dismissViewControllerAnimated(true, completion: nil)

        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

}
