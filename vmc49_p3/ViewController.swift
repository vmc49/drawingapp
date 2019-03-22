//
//  ViewController.swift
//  vmc49_p3
//
//  Created by Victor Chen on 3/14/19.
//  Copyright © 2019 Victor Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var redSquareArenaButton: UIButton!
    var blueCircleArenaButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "Drawing Arena"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        
        redSquareArenaButton = UIButton()
        redSquareArenaButton.translatesAutoresizingMaskIntoConstraints = false
        redSquareArenaButton.setTitle("Red Square Arena", for: .normal)
        redSquareArenaButton.setTitleColor(.red, for: .normal)
        redSquareArenaButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        redSquareArenaButton.addTarget(self, action: #selector(redSquareArenaButtonPressed), for: .touchUpInside)
        view.addSubview(redSquareArenaButton)
        
        blueCircleArenaButton = UIButton()
        blueCircleArenaButton.translatesAutoresizingMaskIntoConstraints = false
        blueCircleArenaButton.setTitle("Blue Circle Arena", for: .normal)
        blueCircleArenaButton.setTitleColor(.blue, for: .normal)
        blueCircleArenaButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        blueCircleArenaButton.addTarget(self, action: #selector(blueCircleButtonPressed), for: .touchUpInside)
        view.addSubview(blueCircleArenaButton)
        
        setUpConstraints()
    }

    func setUpConstraints() {
        NSLayoutConstraint.activate([
            redSquareArenaButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redSquareArenaButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            redSquareArenaButton.widthAnchor.constraint(equalToConstant: 200),
            redSquareArenaButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        NSLayoutConstraint.activate([
            blueCircleArenaButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            blueCircleArenaButton.topAnchor.constraint(equalTo: redSquareArenaButton.bottomAnchor, constant: 20),
            blueCircleArenaButton.widthAnchor.constraint(equalToConstant: 200),
            blueCircleArenaButton.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    @objc func redSquareArenaButtonPressed() {
        let arenaController = RedSquareArenaViewController(arenaName: redSquareArenaButton.title(for: .normal)!)
        arenaController.delegate = self
        navigationController?.pushViewController(arenaController, animated: true)
    }
    
    @objc func blueCircleButtonPressed() {
        let arenaController = BlueCircleArenaViewController(arenaName: blueCircleArenaButton.title(for: .normal)!)
        arenaController.delegate = self
        present(arenaController, animated: true, completion: nil)
    }
}

protocol ChangeRedSquareArenaNameButtonTextDelegate: class {
    func arenaNameChanged(to newName: String)
}

extension ViewController: ChangeRedSquareArenaNameButtonTextDelegate {
    func arenaNameChanged(to newName: String) {
        redSquareArenaButton.setTitle(newName, for: .normal)
    }
}
    
protocol ChangeBlueCircleArenaNameButtonTextDelegate: class {
    func arenaNameChange(to newName: String)
}

extension ViewController: ChangeBlueCircleArenaNameButtonTextDelegate {
    func arenaNameChange(to newName: String) {
        blueCircleArenaButton.setTitle(newName, for: .normal)
    }
}

