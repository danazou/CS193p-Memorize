//
//  MemoryGameTheme.swift
//  Memorize
//
//  Created by Dana Zou on 22/10/2022.
//

import Foundation

struct MemoryGameTheme {
    
    struct Theme{
        let name: String
        let emoji: Array<String>
        let numberOfPairOfCards: Int
        let color: String
        
        init(name: String, emoji: Array<String>, numberOfPairOfCards: Int, color: String) {
            self.name = name
            self.emoji = emoji
            self.numberOfPairOfCards = numberOfPairOfCards
            self.color = color
        }
    }
    
    // below themes should live in ViewModel
    let halloween = Theme(name: "Halloween", emoji: ["ð", "ðŧ", "ðŽ", "ðïļ","ð§", "ðĶ", "ð§", "ðļïļ", "ð·ïļ" ], numberOfPairOfCards: 4, color: "orange")

    let gardening = Theme(name: "Gardening", emoji: ["ðŠī", "ð", "ð", "ðĨŽ", "ð―", "ðŦ", "ð ", "ðū", "ðŧ", "ðą", "ð§âðū", "ð", "ðĨ", "ðĨĶ"], numberOfPairOfCards: 7, color: "green")
    
    let animals = Theme(name: "Animals", emoji: ["ðķ", "ðą", "ð­", "ðđ", "ð°", "ðĶ", "ðŧ", "ðž", "ðŧââïļ", "ðĻ", "ðŊ", "ðĶ", "ðŪ", "ð·", "ðļ", "ðĩ", "ð", "ð§", "ðĶ", "ðĶ", "ðĶ", "ð", "ðģ", "ð"], numberOfPairOfCards: 5, color: "pink")
    
    let weather = Theme(name: "Weather", emoji: ["ð", "ð", "ðĪ", "âïļ", "ðĨ", "âïļ", "ðĶ", "ð§", "â", "ðĐ", "ðĻ", "âïļ", "ðŽ", "âïļ", "ðŦ", "âïļ", "ðŠ", "âĄïļ", "ð", "ð", "ð", "ð", "ð", "ð"], numberOfPairOfCards: 8, color: "yellow")
    
    let fruits = Theme(name: "Fruits", emoji: ["ð","ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ðĨ", "ðĨ­", "ðĨĨ", "ðŦ"], numberOfPairOfCards: 6, color: "lime")
    
    let food = Theme(name: "Food", emoji: ["ðĨ", "ðē", "ð", "ð", "ðĪ", "ðĨ", "ðĶ", "ðĨ", "ðŠ", "ðĨĻ", "ðĨŪ", "ðĒ", "ðĨ", "ðŦ", "ðŦ", "ðĶŠ", "ð", "ð", "ðĨŠ", "ðĨ§"], numberOfPairOfCards: 3, color: "purple")
    
    
}
