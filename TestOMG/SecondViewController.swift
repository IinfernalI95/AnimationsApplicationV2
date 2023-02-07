//
//  SecondViewController.swift
//  TestOMG
//
//  Created by Artur on 30.01.2023.
//

import UIKit

class SecondViewController: UIViewController {

    override func loadView() {
        super.loadView()
    }
    
    var someProperties: String = "value" {
        //First this
        willSet {
            print("Old value is \(someProperties), new value is \(newValue)")
        }

        //value is set

        //Finaly this
        didSet {
            print("Old value is \(oldValue), new value is \(someProperties)")
        }
    }

    
    // Срабатывает после загрузки View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "SecondVC"
        printMessage()
    }
    
//    // Срабатывает перед появленем вью на экране
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        printMessage()
        view.backgroundColor = .white
    }

    // Вызывается при расстановке констрейнтов
    override func updateViewConstraints() {
        printMessage()
        super.updateViewConstraints()
    }

    // Срабатывает перед тем, как размер вью поменяется под размер экрана
    override func viewWillLayoutSubviews() {
        printMessage()
    }

    // Тут срабатывает Auto Layout

    // Срабатывает после того, как размер вью изменился под размер экрана
    override func viewDidLayoutSubviews() {
        printMessage()
    }

    // Срабатывает после появления вью на экране
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        printMessage()
    }

    // Срабатывает при повороте экрана
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        printMessage()
    }

    // Срабатывает перед тем, как вью закроется
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        printMessage()
    }

    // Срабатывает после закрытия вью
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        printMessage()
    }

    deinit {
        printMessage()
    }
}
