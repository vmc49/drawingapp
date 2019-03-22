//
//  BlueCircleArenaViewController.swift
//  vmc49_p3
//
//  Created by Victor Chen on 3/14/19.
//  Copyright © 2019 Victor Chen. All rights reserved.
//

import UIKit

class BlueCircleArenaViewController: UIViewController {

    var backButton: UIButton!
    var saveButton: UIButton!
    var arenaNameLabel: UILabel!
    var arenaNameTextField: UITextField!
    var arenaName: String!
    weak var delegate: ChangeBlueCircleArenaNameButtonTextDelegate?

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
        
        backButton = UIButton(frame: CGRect(x: 10, y: 50, width: 50, height: 30))
        backButton.setTitle("Back", for: .normal)
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        backButton.setTitleColor(.blue, for: .normal)
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        view.addSubview(backButton)
        
        saveButton = UIButton(frame: CGRect(x: 310, y: 50, width: 50, height: 30))
        saveButton.setTitle("Save", for: .normal)
        saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        saveButton.setTitleColor(.blue, for: .normal)
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        view.addSubview(saveButton)
        
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
        let blueCircleView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        blueCircleView.center = touches.first!.location(in: view)
        blueCircleView.backgroundColor = .blue
        blueCircleView.layer.cornerRadius = 25
        view.addSubview(blueCircleView)
        
    }
    
    @objc func backButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func saveButtonPressed() {
        if let newArenaName = arenaNameTextField.text, newArenaName != "" {
            delegate?.arenaNameChange(to: newArenaName)
        }
        self.dismiss(animated: true, completion: nil)
    }
}
