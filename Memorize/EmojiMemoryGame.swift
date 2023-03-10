//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Dana Zou on 16/10/2022.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject{ // our ViewModel, which is always a class; behave like an ObservableObject so it will publish changes
    typealias Card = MemoryGame<String>.Card
    
    init(){
        theme = themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(of: theme)
    }
 
    var theme: Theme
    
    static func createMemoryGame(of theme: Theme) -> MemoryGame<String> {
        /*
         Function that creates a MemoryGame<String> and initialises it by defining a) numberOfPairOfCards and b) cardContent
         
         Input: theme
         Output: MemoryGame of type String with x pairs of cards, each pair of card has a unique emoji
         */
        var numberOfPairOfCards = theme.numberOfPairOfCards
        if numberOfPairOfCards > theme.emojis.count {
            numberOfPairOfCards = theme.emojis.count
        }
        
        let emojisUsedInGame = theme.emojis.shuffled()
        
        return MemoryGame<String> (numberOfPairOfCards: numberOfPairOfCards, emojiGameScore: 0) { pairIndex in
            emojisUsedInGame[pairIndex]
        }
    }
    
    private let themes: Array<Theme> = [
        Theme(name: "Halloween", emojis: ["ð", "ðŧ", "ðŽ", "ðïļ","ð§", "ðĶ", "ð§", "ðļïļ", "ð·ïļ" ], numberOfPairOfCards: 4, color: "orange"),
        Theme(name: "Gardening", emojis: ["ðŠī", "ð", "ð", "ðĨŽ", "ð―", "ðŦ", "ð ", "ðū", "ðŧ", "ðą", "ð§âðū", "ð", "ðĨ", "ðĨĶ"], numberOfPairOfCards: 7, color: "green"),
        Theme(name: "Animals", emojis: ["ðķ", "ðą", "ð­", "ðđ", "ð°", "ðĶ", "ðŧ", "ðž", "ðŧââïļ", "ðĻ", "ðŊ", "ðĶ", "ðŪ", "ð·", "ðļ", "ðĩ", "ð", "ð§", "ðĶ", "ðĶ", "ðĶ", "ð", "ðģ", "ð"], numberOfPairOfCards: 5, color: "pink"),
        Theme(name: "Weather", emojis: ["ð", "ð", "ðĪ", "âïļ", "ðĨ", "âïļ", "ðĶ", "ð§", "â", "ðĐ", "ðĻ", "âïļ", "ðŽ", "âïļ", "ðŦ", "âïļ", "ðŠ", "âĄïļ", "ð", "ð", "ð", "ð", "ð", "ð"], numberOfPairOfCards: 8, color: "yellow"),
        Theme(name: "Fruits", emojis: ["ð","ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ðĨ", "ðĨ­", "ðĨĨ", "ðŦ"], numberOfPairOfCards: 6, color: "lime"),
        Theme(name: "Food", emojis: ["ðĨ", "ðē", "ð", "ð", "ðĪ", "ðĨ", "ðĶ", "ðĨ", "ðŠ", "ðĨĻ", "ðĨŪ", "ðĒ", "ðĨ", "ðŦ", "ðŦ", "ðĶŠ", "ð", "ð", "ðĨŠ", "ðĨ§"], numberOfPairOfCards: 3, color: "purple")
    ]
       
    @Published private var model: MemoryGame<String>
    // private var means the View cannot see or change model, @Published so ViewModel will publish a change whenever model changes
    
    var cards: Array<Card> {
        // as model is private, in order for View to access the cards in the game, we need to create a var that returns an array of cards
        model.cards // returns an array of cards in the MemoryGame
    }
    
    var currentScore: Int {
        model.score
    }
    
    var color: Color? = nil
    
    func determineThemeColor (themeColor: String) -> Color {
        switch themeColor {
        case "orange": return Color.orange
        case "blue": return Color.blue
        case "green": return Color.green
        case "pink": return Color.pink
        case "yellow": return Color.yellow
        case "purple": return Color.purple
        case "lime": return Color(red: 138/255, green: 229/255, blue: 118/255)
        default: return Color.gray
        }
    }
        
    // MARK: - Intent(s)
        /* "Mark: -" creates a bookmark section in the top nav bar
         Here we will create a function that registers user intent. In memorygame, the only user intent is to choose a card, i.e. translate a tap gesture -> choosing a card
         */
    
    func choose (_ card : Card) { // define external and internal label
        model.choose(card)
    }
    
    func newGame() {
        theme = themes.randomElement()!
        color = determineThemeColor(themeColor: theme.color)
        model = EmojiMemoryGame.createMemoryGame(of: theme)
    }
    
    func shuffle() {
        model.shuffle()
    }
}
