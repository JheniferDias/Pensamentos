//
//  QuotesViewController.swift
//  Pensamentos
//
//  Created by Jhenifer Dias on 06/11/22.
//

import Foundation
import UIKit

class QuotesViewControllers: UIViewController {
    
    //MARK: - @IBOutlets
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var quotesLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var constraintTop: NSLayoutConstraint!
    
    //MARK: - Variables and Constants
    let quotesManager = QuotesManager()
    var timer: Timer?
    let config = Configuration.shared
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "Refresh"), object: nil, queue: nil) { (notification) in
            self.formatView()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        formatView()
        
    }
    
    //MARK: - Functions and Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        prepareQuote()
    }
    
    func formatView(){
        view.backgroundColor = config.colorScheme == 0 ? .white : UIColor(red: 156.0/255.0, green: 68.0/255.0, blue: 15.0/255.0, alpha: 1.0)
        quotesLabel.textColor = config.colorScheme == 0 ? .black : .white
        authorLabel.textColor = config.colorScheme == 0 ? UIColor(red: 192/255.0, green: 96/255.0, blue: 49.0/255.0, alpha: 1.0) : .yellow
        
        prepareQuote()
    }
    
    func prepareQuote(){
        
        timer?.invalidate()
        if config.autorefresh {
            timer = Timer.scheduledTimer(withTimeInterval: config.timeInterval, repeats: true) { (timer) in
                self.showRandomQuote()
            }
        }
        showRandomQuote()
    }
    
    
    func showRandomQuote(){
        let quote = quotesManager.getRandomQuote()
        quotesLabel.text = quote.quote
        authorLabel.text = quote.author
        photoImageView.image = UIImage(named: quote.image)
        backgroundImageView.image = photoImageView.image
        
        quotesLabel.alpha = 0
        authorLabel.alpha = 0
        photoImageView.alpha = 0
        backgroundImageView.alpha = 0
        constraintTop.constant = 50
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 2.5) {
            self.quotesLabel.alpha = 1.0
            self.authorLabel.alpha = 1.0
            self.photoImageView.alpha = 1.0
            self.backgroundImageView.alpha = 0.25
            self.constraintTop.constant = 10
            self.view.layoutIfNeeded()
        }
        
        
    }
}
