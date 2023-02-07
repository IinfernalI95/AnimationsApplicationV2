//
//  ViewController.swift
//  TestOMG
//
//  Created by Artur on 29.01.2023.
//

import Spring

class ViewController: UIViewController {

    private var animateCount: Int = 0
    
    var massAnimation: [Spring.AnimationPreset] {
        return Spring.AnimationPreset.allCases
    }
    
    private lazy var button: SpringButton = {
        let btn = SpringButton()
        btn.backgroundColor = .lightGray
        btn.setTitle("\(massAnimation[animateCount])", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 15 //где это правильно выставлять??? и почему 15 =_=
        btn.addTarget(self, action: #selector(springAnimationButtonPressed), for: .touchUpInside)
        
        return btn
    }()
    
    private lazy var animateView: SpringView = {
        let vc = SpringView()
        vc.backgroundColor = .black
        vc.translatesAutoresizingMaskIntoConstraints = false
        vc.layer.cornerRadius = 15 //где это правильно выставлять??? и почему 15 =_=
        
        return vc
    }()
    
    private lazy var animateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Please START"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //в этот момент контроллер еще не создан на сколько понял
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    //загружает вью - создает вью для вью контроллера
    override func loadView() {
        super.loadView()
    }
    
//    enum Animations2 {
//
//        case up
//        case down
//        case left
//        case right
//        case upFlash(duration: UpFlash)
//
//        var duration: String {
//            switch self {
//            case .up: return "1.5"
//            case .down: return "1.5"
//            case .left: return "1"
//            case .right: return "1"
//            case .upFlash(let duration):
//                switch duration {
//                case .up: return "1.5"
//                case.flash: return "5"
//                }
//            }
//        }
//    }
//
//    enum UpFlash {
//        case up
//        case flash
//    }
    
    // Срабатывает после загрузки View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "FirstVC"
        printMessage()
        initView()
//        var upDur = Animations2.up.duration
//        var rDur = Animations2.right.duration
//        print()
//        print("Up.dur - \(upDur)    ----------  Right.dur - \(rDur)")
//        var allCas = Animations2.allCases
//        print(allCas[1].rawValue)
//        var flashDur = Animations2.upFlash(duration: .flash)
//        print("Flash.dur - \(flashDur)")
//        print()
    }
    
    private func initView() {
        view.addSubview(button)
        view.addSubview(animateView)
        animateView.addSubview(animateLabel)
    }
    
    @IBAction func springAnimationButtonPressed(_ sender: SpringButton) {
        if animateCount >= massAnimation.count - 1 {
            animateCount = 0
        } else {
            animateCount += 1
        }
        animateButton(sender)
        animateSpringView(animateCount)
    }
    
    private func animateButton(_ button: SpringButton) {
        button.animation = "shake"
        button.curve = Spring.AnimationCurve.easeIn.rawValue
        button.duration = 1
        button.animate()
        button.setTitle(massAnimation[animateCount].rawValue, for: .normal)
        //print(type(of: massAnimation[1].rawValue))
    }
    
    private func animateSpringView(_ count: Int) {
        let fixCount = animateCount == 0 ? massAnimation.count - 1 : animateCount - 1
        animateView.animation = massAnimation[fixCount].rawValue
        animateView.curve = Spring.AnimationCurve.easeIn.rawValue
        animateView.duration = 1
        animateView.animate()
        animateLabel.text = "animation - \(massAnimation[fixCount])"
        if animateCount >= massAnimation.count { animateCount = 0 }
    }
    
//    @objc func swapToSecondView(){
//        let secondVC = SecondViewController()
//        present(secondVC, animated: true)
//    }
    
//    // Срабатывает перед появленем вью на экране
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        printMessage()
        let randomRed = Int.random(in: 0...255)
        let randomGreen = Int.random(in: 0...255)
        let randomBlue = Int.random(in: 0...255)
        let color = UIColor(red: CGFloat(randomRed) / 255,
                            green: CGFloat(randomGreen) / 255,
                            blue: CGFloat(randomBlue) / 255,
                            alpha: 0.6)
        view.backgroundColor = color
    }

    // Вызывается при расстановке констрейнтов
    override func updateViewConstraints() {
        printMessage()
        super.updateViewConstraints()
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200),
            button.heightAnchor.constraint(equalToConstant: 30),
            button.widthAnchor.constraint(equalToConstant: 120),
            animateView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            animateView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -120),
            animateView.heightAnchor.constraint(equalToConstant: 260),
            animateView.widthAnchor.constraint(equalToConstant: 260),
            animateLabel.centerXAnchor.constraint(equalTo: animateView.centerXAnchor, constant: 0),
            animateLabel.centerYAnchor.constraint(equalTo: animateView.centerYAnchor, constant: 0),
            animateLabel.heightAnchor.constraint(equalToConstant: 30),
            animateLabel.widthAnchor.constraint(equalTo: animateView.widthAnchor),
            animateLabel.leftAnchor.constraint(equalTo: animateView.leftAnchor, constant: 20)
        ])
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

extension UIViewController {
    func printMessage(function: String = #function) {
        print("\(title ?? ""): \(function)")
    }
}

