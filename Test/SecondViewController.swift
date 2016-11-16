//
//  SecondViewController.swift
//  Test
//
//  Created by Shashank Acharya on 15/11/16.
//  Copyright © 2016 Shashank Acharya. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var dismissButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "closeKeyboard")
            view.addGestureRecognizer(tap)
    }
    func closeKeyboard() {
        view.endEditing(true)
    }
    @IBAction func dismissSecondVC(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
