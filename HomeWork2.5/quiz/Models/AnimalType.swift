//
//  AnimalType.swift
//  delete
//
//  Created by yauheni prakapenka on 08.02.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

enum AnimalType: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐇"
    case turtle = "🐌"
    
    func getDefinition() -> String {
        switch self {
        case .dog:
            return "Вам нравится быть с друзями"
        case .cat:
            return "Вы сами себе на уме"
        case .rabbit:
            return "Вам нравится мягкое"
        case .turtle:
            return "Ваша сила - в мудрости"
        }
    }
}
