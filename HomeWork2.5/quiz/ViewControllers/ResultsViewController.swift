//
//  ResultsViewController.swift
//  delete
//
//  Created by yauheni prakapenka on 11.02.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//


/*
 
 Домашнее задание
 
 1. Убрать бэк на экране результата
 2. Передать массив с ответами
 3. Определить часто встрающийся тип животного
 4. Отобразить результат в соотвествии с этим животным
 
 */

import UIKit

class ResultsViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    // MARK: - Public Properties
    
    var userAnswers: [Answer]!
    var animals = ["cat": 0, "dog": 0, "turtle": 0, "rabbit": 0]
    var maxValueInAnimalsUserAnswer = 0
    var animalsWithMaxValue: [String: Int] = [:]
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: true)
        resultLabel.text = ""
        descriptionLabel.text = ""
        getResult()
    }
    
}

// MARK: - Private methods

extension ResultsViewController {
    
    private func getResult() {
        countAnimalsInUserAnswer()
        findMaxValueinUserAnswer()
        sortAnimalsWithMaxValue()
        additionalQuestion()
    }
    
    private func countAnimalsInUserAnswer() {
        
        guard let userAnswers = userAnswers else { return }
        
        for animal in userAnswers {
            if animal.type == AnimalType.cat {
                animals.updateValue(+1, forKey: "cat")
            } else if animal.type == AnimalType.dog {
                animals.updateValue(+1, forKey: "dog")
            } else if animal.type == AnimalType.rabbit {
                animals.updateValue(+1, forKey: "rabbit")
            } else if animal.type == AnimalType.turtle {
                animals.updateValue(+1, forKey: "turtle")
            } else {
                debugPrint("ERROR: unexpected animal type")
            }
        }
        print("animals: \(animals)")
    }
    
    private func findMaxValueinUserAnswer() {
        guard let maxCount = animals.values.max() else { return }
        maxValueInAnimalsUserAnswer = maxCount
        print("maxValue: \(maxValueInAnimalsUserAnswer)")
    }
    
    private func sortAnimalsWithMaxValue() {
        for animal in animals {
            if animal.value == maxValueInAnimalsUserAnswer {
                animalsWithMaxValue[animal.key] = animal.value
            }
        }
        print("sortedAnimals: \(animalsWithMaxValue)")
    }
    
    private func additionalQuestion() {
        
        if animalsWithMaxValue.count > 1 {
            
            let alert = UIAlertController(title: nil, message: "Выбери что-то одно, что у тебя вызвало наибольшую улыбку", preferredStyle: .alert)
            
            for sortedAnimal in animalsWithMaxValue {
                if sortedAnimal.key == "cat" {
                    alert.addAction(UIAlertAction(title: "У меня лапки", style: .default) { [weak self] _ in
                        self?.resultLabel.text = "Вы \(AnimalType.cat.rawValue)"
                        self?.descriptionLabel.text = "\(AnimalType.cat.getDefinition())"
                    })
                } else if sortedAnimal.key == "dog" {
                    alert.addAction(UIAlertAction(title: "Повеляй со мной хвостиком", style: .default) { [weak self] _ in
                        self?.resultLabel.text = "Вы \(AnimalType.dog.rawValue)"
                        self?.descriptionLabel.text = "\(AnimalType.dog.getDefinition())"
                    })
                } else if sortedAnimal.key == "rabbit" {
                    alert.addAction(UIAlertAction(title: "Ушки-колбаски", style: .default) { [weak self] _ in
                        self?.resultLabel.text = "Вы \(AnimalType.rabbit.rawValue)"
                        self?.descriptionLabel.text = "\(AnimalType.rabbit.getDefinition())"
                    })
                } else if sortedAnimal.key == "turtle" {
                    alert.addAction(UIAlertAction(title: "Командир, накину сверху. Только быстрее", style: .default) { [weak self] _ in
                    self?.resultLabel.text = "Вы \(AnimalType.turtle.rawValue)"
                    self?.descriptionLabel.text = "\(AnimalType.turtle.getDefinition())"
                    })
                } else {
                    print("Error: unexpected sorted animal key")
                }
                
            }
            
            present(alert, animated: true, completion: nil)
            
        }  else {
            if animalsWithMaxValue.keys.first == "cat" {
                resultLabel.text = "Вы \(AnimalType.cat.rawValue)"
                descriptionLabel.text = "\(AnimalType.cat.getDefinition())"
            } else if animalsWithMaxValue.keys.first == "dog" {
                resultLabel.text = "Вы \(AnimalType.dog.rawValue)"
                descriptionLabel.text = "\(AnimalType.dog.getDefinition())"
            } else if animalsWithMaxValue.keys.first == "rabbit" {
                resultLabel.text = "Вы \(AnimalType.rabbit.rawValue)"
                descriptionLabel.text = "\(AnimalType.rabbit.getDefinition())"
            } else if animalsWithMaxValue.keys.first == "turtle" {
                resultLabel.text = "Вы \(AnimalType.turtle.rawValue)"
                descriptionLabel.text = "\(AnimalType.turtle.getDefinition())"
            } else {
                print("Error: unexpected sorted animal key")
            }
        }
    }
}
