//
//  QuestionsViewController.swift
//  delete
//
//  Created by yauheni prakapenka on 11.02.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressView: UIProgressView!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multiplyStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!

    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet var rangedSlider: UISlider!

    // MARK: - Private properties
    
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    private var answerChoosen: [Answer] = []
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }
    
    // MARK: - View Controller Lyfecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: - IBActions
    
    @IBAction func singleAnswerButtonTapped(_ sender: UIButton) {
        guard let answerIndex = singleButtons.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswers[answerIndex]
        answerChoosen.append(currentAnswer)
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonTapped() {
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                answerChoosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonTapped() {
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        let currentAnswer = currentAnswers[index]
        answerChoosen.append(currentAnswer)
        nextQuestion()
    }
    
}

// MARK: - Private Methods

extension QuestionsViewController {
    private func updateUI() {
        for stackView in [singleStackView, multiplyStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        
        let currentQuestion = questions[questionIndex]
        
        questionLabel.text = currentQuestion.text
        
        let totalProgress = Float(questionIndex) / Float(questions.count)
        progressView.setProgress(totalProgress, animated: true)
        
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        showCurrentAnswers(for: currentQuestion)
    }
    
    private func showCurrentAnswers(for question: Question) {
        
        let currentAnswers = question.answers
        
        switch question.type {
        case .single:
            showSingleStackView(with: currentAnswers)
        case .multiply:
            showMultipleStackView(with: currentAnswers)
        case .ranged:
            showRangedStackView(with: currentAnswers)
        }
    }
    
    private func showSingleStackView(with answers: [Answer]) {
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
    
    private func showMultipleStackView(with answers: [Answer]) {
        multiplyStackView.isHidden = false
        
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.text
        }
    }
    
    private func showRangedStackView(with answers: [Answer]) {
        rangedStackView.isHidden = false
        
        rangedLabels.first?.text = answers.first?.text
        rangedLabels.last?.text = answers.last?.text
    }
}

// MARK: - Navigattion
extension QuestionsViewController {
    
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultVC = segue.destination as! ResultsViewController
        resultVC.userAnswers = answerChoosen
    }
    
}
