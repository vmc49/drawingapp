//
//  RedSquareArenaViewController.swift
//  vmc49_p3
//
//  Created by Victor Chen on 3/14/19.
//  Copyright © 2019 Victor Chen. All rights reserved.
//

import UIKit

class RedSquareArenaViewController: UIViewController {
    
    var arenaNameLabel: UILabel!
    var arenaNameTextField: UITextField!
    weak var delegate: ChangeRedSquareArenaNameButtonTextDelegate?
    var arenaName: String
    
    init(arenaName: String) {
        self.arenaName = arenaName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonPressed))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveButtonPressed))
        
        arenaNameLabel = UILabel(frame: CGRect(x: 50, y: 100, width: 150, height: 30))
        arenaNameLabel.text = "Arena Name: "
        arenaNameLabel.textColor = .black
        arenaNameLabel.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(arenaNameLabel)
        
        arenaNameTextField = UITextField(frame: CGRect(x: 180, y: 100, width: 200, height:30))
        arenaNameTextField.textColor = .black
        arenaNameTextField.text = arenaName
        arenaNameTextField.font = UIFont.systemFont(ofSize: 20)
        arenaNameTextField.layer.borderColor = UIColor.gray.cgColor
        arenaNameTextField.layer.borderWidth = 1
        arenaNameTextField.layer.cornerRadius = 5
        view.addSubview(arenaNameTextField)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let redSquareView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        redSquareView.center = touches.first!.location(in: view)
        redSquareView.backgroundColor = .red
        view.addSubview(redSquareView)
    }
    
    @objc func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func saveButtonPressed() {
        if let newArenaName = arenaNameTextField.text, newArenaName != "" {
            delegate?.arenaNameChanged(to: newArenaName)
        }
        navigationController?.popViewController(animated: true)
    }
}
