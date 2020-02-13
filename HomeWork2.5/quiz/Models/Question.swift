//
//  Question.swift
//  delete
//
//  Created by yauheni prakapenka on 08.02.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

struct Question {
    var text: String
    var type: RsponseType
    var answers: [Answer]
}

extension Question {
    static func getQuestions() -> [Question] {
        return [
            Question(
                text: "Какую пищу вы предпочитаете?",
                type: .single,
                answers: [
                    Answer(text: "Стейк", type: .dog),
                    Answer(text: "Рыба", type: .cat),
                    Answer(text: "Морковь", type: .rabbit),
                    Answer(text: "Кукураза", type: .turtle)
                ]
            ),
            Question(
                text: "Что вам нравится больше?",
                type: .multiply,
                answers: [
                    Answer(text: "Плавать", type: .dog),
                    Answer(text: "Спать", type: .cat),
                    Answer(text: "Обниматься", type: .rabbit),
                    Answer(text: "Есть", type: .turtle)
                ]
            ),
            Question(
                text: "Любите ли вы поездки на машине?",
                type: .ranged,
                answers: [
                    Answer(text: "Ненавижу", type: .cat),
                    Answer(text: "", type: .rabbit),
                    Answer(text: "", type: .turtle),
                    Answer(text: "Обожаю", type: .dog)
                ]
            )
        ]
    }
}
