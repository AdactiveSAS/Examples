//
//  ViewController.swift
//  BasicDemoSwift
//
//  Created by Reynes Martial on 01/02/2016.
//  Copyright © 2016 adactive. All rights reserved.
//

import UIKit
import Foundation


class MapViewController: UIViewController, ADSumMapViewControllerDelegate {
    
    var is3D = true
    var adSumMapViewController: ADSumMapViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btm = UIBarButtonItem.init(title: "2D Mode", style: .plain, target: self, action: #selector(Modehandler));
        self.navigationItem.rightBarButtonItem = btm;
        
        self.adSumMapViewController = ADSumMapViewController(frame:CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        
        let refreshData = false;
        
        // if withExData = false
        // sdk does not download supplementary data
        // mobile adsum maps does not need supplementary data to function.
        self.adSumMapViewController.forceUpdate(withExData: refreshData);
        self.adSumMapViewController.delegate = self
        self.adSumMapViewController.view.backgroundColor = .white
        self.view.backgroundColor = .white
        self.view.addSubview(self.adSumMapViewController.view)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        //demonstrates lifecycle management
        //resumeRenderer will skip if the map has not been initialised.
        self.adSumMapViewController.resumeRenderer();
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        //pause when the view leaves the screen.
        self.adSumMapViewController.pauseRenderer();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func dataDidFinishUpdating(_ adSumViewController: Any!) {
        if(self.adSumMapViewController.isMapDataAvailable()) {
            self.adSumMapViewController.start()
        }
    }
    
    func dataDidFinishUpdating(_ adSumViewController: Any!, withError error: Error!) {
        if(self.adSumMapViewController .isMapDataAvailable()) {
            self.adSumMapViewController.start()
        } else {
            let alert = UIAlertController(title: "Update finished with errors", message: nil, preferredStyle: UIAlertControllerStyle.alert)
            let yesButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(yesButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func mapDidFinishLoading(_ adSumViewController: Any!) {
        print("mapDidFinishLoading")
        self.adSumMapViewController.setCameraMode(ObjectiveBridge().get_CameraMode_FULL());

    }

    
    func onPOIClicked(_ poiIds: [Any]!, placeId: Int, adSumViewController: Any!)
    {
        self.adSumMapViewController.unLightAll()
        self.adSumMapViewController.center(onPlace: placeId)
        self.adSumMapViewController.highLightPlace(placeId, color: .green)
    }
    
    @objc func Modehandler() {
        
        if is3D {
            is3D = false
            let btm = UIBarButtonItem.init(title: "3D Mode", style: .plain, target: self, action: #selector(Modehandler))
            self.navigationItem.rightBarButtonItem = btm
            self.adSumMapViewController.setCameraMode(ObjectiveBridge().get_CameraMode_ORTHO())
            
        } else {
            is3D = true
            let btm = UIBarButtonItem.init(title: "2D Mode", style: .plain, target: self, action: #selector(Modehandler))
            self.navigationItem.rightBarButtonItem = btm
            self.adSumMapViewController.setCameraMode(ObjectiveBridge().get_CameraMode_FULL())
            
        }
    }


}
