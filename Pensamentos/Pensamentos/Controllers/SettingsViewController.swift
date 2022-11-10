//
//  SettingsViewController.swift
//  Pensamentos
//
//  Created by Jhenifer Dias on 06/11/22.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
    //MARK: - @IBOutlets
    @IBOutlet weak var autoreFreshSwitch: UISwitch!
    @IBOutlet weak var timeIntervalSlider: UISlider!
    @IBOutlet weak var colorSchemeSegmented: UISegmentedControl!
    @IBOutlet weak var timeIntervalLabel: UILabel!
    
    //MARK: - Variables and Constants
    
    let config = Configuration.shared
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "Refresh"), object: nil, queue: nil) { (notification) in
            self.formatedView()
        }
        
    }
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            formatedView()
        }
        
    //MARK: - @IBActions
        
    
    @IBAction func changeAutoreFresh(_ sender: UISwitch) {
        config.autorefresh = sender.isOn
    }
    
    @IBAction func changeTimeInterval(_ sender: UISlider) {
        let value = Double(round(sender.value))
        changeTimeIntervalLabel(with: value)
        config.timeInterval = value
    }
    
    @IBAction func changeColorScheme(_ sender: UISegmentedControl) {
        config.colorScheme = sender.selectedSegmentIndex
    }
    //MARK: - Functions and Methods
    
    func formatedView(){
        autoreFreshSwitch.setOn(config.autorefresh, animated: false)
        timeIntervalSlider.setValue(Float(config.timeInterval), animated: false)
        colorSchemeSegmented.selectedSegmentIndex = config.colorScheme
    }
    
    func changeTimeIntervalLabel(with value: Double){
        timeIntervalLabel.text = "Mudar após \(Int(value)) segundos"
        
    }
}
