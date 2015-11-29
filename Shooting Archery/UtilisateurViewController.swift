//
//  UtilisateurViewController.swift
//  Shooting Archery
//
//  Created by Antoine Danois on 12/11/2015.
//  Copyright © 2015 iutbmteprow. All rights reserved.
//

import UIKit

class UtilisateurViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var textFieldNom: UITextField!
    @IBOutlet weak var textFieldPrenom: UITextField!
    
    @IBOutlet weak var buttonAjouterUtilisateur: UIBarButtonItem!
    
    @IBOutlet weak var picherCategorieUtilisateur: UIPickerView!
    
    @IBOutlet weak var labelCategorie: UILabel!
    var pickerData: [String] = [String]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.picherCategorieUtilisateur.delegate = self
        
        pickerData = ["Poussin","Benjamin","Junior","Minime", "Cadet", "Junior", "Senior", "Vétéran", "Super-Vétéran"]


        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }*/
    
    @IBAction func ButtonRetourMenuPrincipal(sender: UIBarButtonItem) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func actionButtonAjouterUtilisateur(sender: AnyObject) {
        labelCategorie.text = textFieldNom.text
        
    }
    
    
    
    

    
    

}
