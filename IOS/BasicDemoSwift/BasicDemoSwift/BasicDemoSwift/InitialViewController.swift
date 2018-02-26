//
//  InitialViewController.swift
//  BasicDemoSwift
//
//  Created by iMac-Adactive on 21/2/18.
//  Copyright © 2018 adactive. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    
    var nextTransitionBtn : UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var buttonWidth = 100;
        var buttonHeight = 100;
        
        nextTransitionBtn = UIButton.init(frame: CGRect.init(x: (UIScreen.main.bounds.width - 100)/2.0, y: (UIScreen.main.bounds.height - 100)/2.0, width: 100, height: 100))
        
        nextTransitionBtn!.addTarget(self, action: #selector(self.transitionToMap), for: .touchUpInside)
        nextTransitionBtn!.setTitle("Start Map!", for: .normal)
        nextTransitionBtn!.backgroundColor = .black
        self.view.addSubview(nextTransitionBtn!);
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc
    func transitionToMap(){
        performSegue(withIdentifier: "segueToMap", sender: self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
