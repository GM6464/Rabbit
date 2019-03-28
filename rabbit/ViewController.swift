//
//  ViewController.swift
//  rabbit
//
//  Created by Modi Nuovi on 26/03/2019.
//  Copyright © 2019 GMWare. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var sfondo: UIView!
   
    @IBOutlet weak var inizia: UIButton!
   
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
   
    @IBAction func inizio(_ sender: Any)
    {
        var conigli: [UIButton] = []
        inizia.isHidden=true
        let maxw: Int = Int(sfondo.frame.width)-100
        let maxh: Int = Int(sfondo.frame.height)-100
        for _ in 1...10
       {
        let bottone = UIButton(frame: CGRect(x: Int.random(in: 0 ..< maxw), y: Int.random(in: 0 ..< maxh), width: 100, height: 100))
    
        bottone.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        bottone.setTitle("🐰", for: .normal)
        bottone.titleLabel!.font =  UIFont(name: ".SFUIText", size: 40)
        self.view.addSubview(bottone)
         bottone.isHidden=true
        
        self.view.addSubview(bottone)
        conigli.append(bottone)
        }
        
        var secondi = 1
        
        let inizio = DispatchTime.now()
       
        for i in 0...10
        {
            
            DispatchQueue.main.asyncAfter(deadline: inizio + .seconds(secondi), execute:
                {
                    if i==10
                    {
                        conigli[i-1].isHidden = true
                        self.inizia.isHidden=false
                    }
                    else
                    {
                        if i > 0
                        {
                            conigli[i-1].isHidden = true
                        }
                        conigli[i].isHidden=false
                    }
                    
            })
            secondi = secondi + 3
            
            
            
            
        }
        
       

    
    
   
}

@objc func buttonAction(sender: UIButton!)
{
    sender.isHidden = true
}
    
}

