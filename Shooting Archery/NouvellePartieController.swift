//
//  NouvellePartieController.swift
//  Shooting Archery
//
//  Created by Antoine Danois on 29/11/2015.
//  Copyright © 2015 iutbmteprow. All rights reserved.
//

import UIKit

class NouvellePartieController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var buttonSave: UIButton!
    @IBOutlet weak var buttonContinuer: UIBarButtonItem!
    @IBOutlet weak var sliderNbJoueur: UISlider!
    @IBOutlet weak var buttonCancel: UIBarButtonItem!
    @IBOutlet weak var labelNbJoueur: UILabel!
    @IBOutlet weak var labelJoueur1: UILabel!
    @IBOutlet weak var labelJoueur2: UILabel!
    @IBOutlet weak var labelJoueur3: UILabel!
    @IBOutlet weak var labelJoueur4: UILabel!
    @IBOutlet weak var picketJoueur1: UIPickerView!
    @IBOutlet weak var picketJoueur2: UIPickerView!
    @IBOutlet weak var picketJoueur3: UIPickerView!
    @IBOutlet weak var picketJoueur4: UIPickerView!
    
    var valueSlider = 0
    
    let data = DataSingleton.sharedInstance()
    
    
    
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picketJoueur1.delegate = self
        picketJoueur2.delegate = self
        picketJoueur3.delegate = self
        picketJoueur4.delegate = self
        
        picketJoueur1.tag = 1
        picketJoueur2.tag = 2
        picketJoueur3.tag = 3
        picketJoueur4.tag = 4
        
        pickerData = []

        
        labelJoueur2.hidden = true;
        picketJoueur2.hidden = true;
        
        labelJoueur3.hidden = true;
        picketJoueur3.hidden = true;
        
        labelJoueur4.hidden = true;
        picketJoueur4.hidden = true;
        
        // Do any additional setup after loading the view.
        
        
        let db = SQLiteDB.sharedInstance()

        
        
        let dataSelect = db.query("SELECT * FROM utilisateur")
        
        
        for row in dataSelect
        {
            print(row["nom"] as! String)
            if(row["nom"] as! String != "  "){
                pickerData.append(row["nom"] as! String)
            }
        }
        
        
    
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
        
        
        
        if(pickerView == picketJoueur1){
            return pickerData[row]
        }else if(pickerView.tag == 2){
            return pickerData[row]
        }else if(pickerView.tag == 3){
            return pickerData[row]
        }else if(pickerView.tag == 4){
            return pickerData[row]
        }else{
            return "rien"
        }
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func buttonCancelMenu(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func sliderValueChanger(sender: AnyObject) {
        self.labelNbJoueur.text = "\(Int(round(sliderNbJoueur.value)))"
        valueSlider = Int(round(sliderNbJoueur.value))
        
        labelJoueur2.hidden = true;
        picketJoueur2.hidden = true;
        
        labelJoueur3.hidden = true;
        picketJoueur3.hidden = true;
        
        labelJoueur4.hidden = true;
        picketJoueur4.hidden = true;
        
        
                
        switch(valueSlider){
            
        case 1:
            
            
            break
            
        case 2:
            
            labelJoueur2.hidden = false;
            picketJoueur2.hidden = false;
            
            break
            
        case 3:
            
            labelJoueur2.hidden = false;
            picketJoueur2.hidden = false;
            
            labelJoueur3.hidden = false;
            picketJoueur3.hidden = false;
            
            break
            
        case 4:
            
            labelJoueur2.hidden = false;
            picketJoueur2.hidden = false;
            
            labelJoueur3.hidden = false;
            picketJoueur3.hidden = false;
            
            labelJoueur4.hidden = false;
            picketJoueur4.hidden = false;
            
            break
            
        default:
            break
            
        }
        
        
    }
    
    @IBAction func sauvegarderButton(sender: AnyObject) {
        data.setNbJoueur(valueSlider)
        
        print("prout")
        
        let selectedNomJoueur1 = pickerData[picketJoueur1.selectedRowInComponent(0)]
        let selectedNomJoueur2 = pickerData[picketJoueur2.selectedRowInComponent(0)]
        let selectedNomJoueur3 = pickerData[picketJoueur3.selectedRowInComponent(0)]
        let selectedNomJoueur4 = pickerData[picketJoueur4.selectedRowInComponent(0)]
        
        
        if(valueSlider == 1){
            
            data.setNomJoueurUn(selectedNomJoueur1)
        }else if(valueSlider == 2){
            data.setNomJoueurUn(selectedNomJoueur1)
            data.setNomJoueurDeux(selectedNomJoueur2)
        }else if(valueSlider == 3){
            data.setNomJoueurUn(selectedNomJoueur1)
            data.setNomJoueurDeux(selectedNomJoueur2)
            data.setNomJoueurTrois(selectedNomJoueur3)
        }else if(valueSlider == 4){
            data.setNomJoueurUn(selectedNomJoueur1)
            data.setNomJoueurDeux(selectedNomJoueur2)
            data.setNomJoueurTrois(selectedNomJoueur3)
            data.setNomJoueurQuatre(selectedNomJoueur4)
        }
        
        
        
    }
    
    
    
    
    
    
    
}
