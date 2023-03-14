//
//  ViewController.swift
//  WeatherApp
//
//  Created by Dávid Mikuláš on 06/03/2023.
//

import UIKit

class HomeController: UIViewController {

    private let viewModel = HomeViewModel()

    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var NameLabel: UILabel!
    
    @IBOutlet weak var pocitLabel: UILabel!
    
    @IBOutlet weak var minLabel: UILabel!
    
    @IBOutlet weak var maxLabel: UILabel!
    
    @IBOutlet weak var tlakLabel: UILabel!
    
    @IBOutlet weak var vlhkostLabel: UILabel!
    
    @IBOutlet weak var fotkaPocasie: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchWeather{ [weak self] in
            DispatchQueue.main.async {
                self?.setupUI()
            }
        }
    }
    
    private func setupUI() {
        setupHeader()
        setupSubHeader()
    }
    
    private func setupHeader() {
        tempLabel.text = viewModel.temperatureS
        NameLabel.text = viewModel.nameS
        
    }
    
    private func setupSubHeader() {
        pocitLabel.text = viewModel.pocitS
        maxLabel.text = viewModel.maxS
        minLabel.text = viewModel.minS
        tlakLabel.text = viewModel.tlakS
        vlhkostLabel.text = viewModel.vlhkostS
    }
}

