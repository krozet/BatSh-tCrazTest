//
//  QuestionDatabase.swift
//  BatSh!tCrazyTest
//
//  Created by user153091 on 4/30/19.
//  Copyright © 2019 Keawa Rozet. All rights reserved.
//

import Foundation

class QuestionDatabase {
    var totalNumberOfTwoAnswerQuestions = 2
    var twoAnswerQuestions = [TwoAnswerQuestion]()
    let twoAnswerFunctions = [createFlipACointQuestion, createFollowDirectionsQuestion, createRiskTaker, createFollowDirectionsQuestion, createForest, createPirateCaptain, createJar, createCookie, createHideAndSeek, createLateOrEarly, createPlacementOfTrust, createMilkInCereal]
    var rorschachQuestions = [RorschachQuestion]()
    var questionManager: QuestionManager

    init(questionManager: QuestionManager) {
        self.questionManager = questionManager
    }
    public func getTestQuestions() -> (Int, [TwoAnswerQuestion], [RorschachQuestion]) {
        generateRandomTwoAnswerQuestions()

        let numOfQuestions = twoAnswerQuestions.count + rorschachQuestions.count
        return (numOfQuestions, twoAnswerQuestions, rorschachQuestions)
    }

    public func generateRandomTwoAnswerQuestions() {
        var switchValues = [Int](0...twoAnswerFunctions.count-1)
        var count = totalNumberOfTwoAnswerQuestions
        
        while count > 0 {
            let arrayKey = Int(arc4random_uniform(UInt32(switchValues.count)))
            let randomNum = switchValues[arrayKey]
            switchValues.remove(at: arrayKey)
            twoAnswerFunctions[randomNum](self)()

            count -= 1
            /*
            switch (randomNum) {
              case 0:
                createFlipACointQuestion()
              case 1:
                createFollowDirectionsQuestion()
              case 2:
                createRiskTaker()
              case 3:
                createForest()
              case 4:
                createPirateCaptain()
            default:
                break
            }
            */
        }
    }

    public func createFlipACointQuestion() {
        let taQuestion = TwoAnswerQuestion(questionManager: questionManager)

        let questionText = "I flip a coin 99 times and all 99 times it lands heads up. What side wil lland face up on the 100th flip?"
        let buttonNames = ["Q1.Ch1-1(Heads).FQ1-1", "Q1.Ch1-2(Tails).FQ1-2"]
        taQuestion.insertQuestion(questionName: "Q1: Flip A Coin", questionText: questionText, buttonNames: buttonNames)
        taQuestion.insertButton(buttonName: "Q1.Ch1-1(Heads).FQ1-1", buttonText: "Heads", nextResponseName: nil, nextQuestionName: "Q1.Ch1-1(Heads).FQ1-1", isNextAQuestion: true, end: false)
        taQuestion.insertButton(buttonName: "Q1.Ch1-2(Tails).FQ1-2", buttonText: "Tails", nextResponseName: nil, nextQuestionName: "Q1.Ch1-2(Tails).FQ1-2", isNextAQuestion: true, end: false)

        taQuestion.insertQuestion(questionName: "Q1.Ch1-1(Heads).FQ1-1", questionText: "What if I reassured you the coin was fair?", buttonNames: ["Q1.Ch1-1(Heads).FQ1-1(Heads).RE1-1", "Q1.Ch1-1(Heads).FQ1-2(Tails).RE1-2"])
        taQuestion.insertButton(buttonName: "Q1.Ch1-1(Heads).FQ1-1(Heads).RE1-1", buttonText: "Heads", nextResponseName: "Q1.Ch1-1(Heads).FQ1-1(Heads).RE1-1", nextQuestionName: nil, isNextAQuestion: false, end: false)
        taQuestion.insertResponse(responseName: "Q1.Ch1-1(Heads).FQ1-1(Heads).RE1-1", responseText: "Do you really think it is wise to trust what you observe over the laws of probability?", nextQuestionName: nil, end: true)
        taQuestion.insertButton(buttonName: "Q1.Ch1-1(Heads).FQ1-2(Tails).RE1-2", buttonText: "Tails", nextResponseName: "Q1.Ch1-1(Heads).FQ1-2(Tails).RE1-2", nextQuestionName: nil, isNextAQuestion: false, end: false)
        taQuestion.insertResponse(responseName: "Q1.Ch1-1(Heads).FQ1-2(Tails).RE1-2", responseText: "Are you normally this distrusting of others?", nextQuestionName: nil, end: true)

        taQuestion.insertQuestion(questionName: "Q1.Ch1-2(Tails).FQ1-2", questionText: "What if I flip the coin 999 times and all 999 times it lands heads up. What side will land face up on the 1000th flip?", buttonNames: ["Q1.Ch1-2(Tails).FQ1-1(Heads).RE1-3", "Q1.Ch1-2(Tails).FQ1-2(Tails).RE1-4"])
        taQuestion.insertButton(buttonName: "Q1.Ch1-2(Tails).FQ1-1(Heads).RE1-3", buttonText: "Heads", nextResponseName: "Q1.Ch1-2(Tails).FQ1-1(Heads).RE1-3", nextQuestionName: nil, isNextAQuestion: false, end: false)
        taQuestion.insertResponse(responseName: "Q1.Ch1-2(Tails).FQ1-1(Heads).RE1-3", responseText: "Are you normally so easily swayed?", nextQuestionName: nil, end: true)
        taQuestion.insertButton(buttonName: "Q1.Ch1-2(Tails).FQ1-2(Tails).RE1-4", buttonText: "Tails", nextResponseName: "Q1.Ch1-2(Tails).FQ1-2(Tails).RE1-4", nextQuestionName: nil, isNextAQuestion: false, end: false)
        taQuestion.insertResponse(responseName: "Q1.Ch1-2(Tails).FQ1-2(Tails).RE1-4", responseText: "Do you root for the underdog because you see yourself as one?", nextQuestionName: nil, end: true)

        twoAnswerQuestions.append(taQuestion)
    }

    public func createFollowDirectionsQuestion() {
        let taQuestion = TwoAnswerQuestion(questionManager: questionManager)

        taQuestion.insertQuestion(questionName: "Q3: Follow Directions", questionText: "Click Yes.", buttonNames: ["Q3.Ch1-1(Yes).FQ1", "Q3.Ch1-2(No).FQ2"])
        taQuestion.insertButton(buttonName: "Q3.Ch1-1(Yes).FQ1", buttonText: "Yes", nextResponseName: nil, nextQuestionName: "Q3.Ch1-1(Yes).FQ1", isNextAQuestion: true, end: false)
        taQuestion.insertButton(buttonName: "Q3.Ch1-2(No).FQ2", buttonText: "No", nextResponseName: nil, nextQuestionName: "Q3.Ch1-2(No).FQ2", isNextAQuestion: true, end: false)

        taQuestion.insertQuestion(questionName: "Q3.Ch1-1(Yes).FQ1", questionText: "Click No.", buttonNames: ["Q3.Ch1-1(Yes).FQ1-1(Yes).RE1-1", "Q3.Ch1-1(Yes).FQ1-1(No).RE1-2"])
        taQuestion.insertButton(buttonName: "Q3.Ch1-1(Yes).FQ1-1(Yes).RE1-1", buttonText: "Yes", nextResponseName: "Q3.Ch1-1(Yes).FQ1-1(Yes).RE1-1", nextQuestionName: nil, isNextAQuestion: false, end: false)
        taQuestion.insertButton(buttonName: "Q3.Ch1-1(Yes).FQ1-1(No).RE1-2", buttonText: "No", nextResponseName: "Q3.Ch1-1(Yes).FQ1-1(No).RE1-2", nextQuestionName: nil, isNextAQuestion: false, end: false)

        taQuestion.insertQuestion(questionName: "Q3.Ch1-2(No).FQ2", questionText: "Click No.", buttonNames: ["Q3.Ch1-2(No).FQ2-1(Yes).RE1-3", "Q3.Ch1-2(No).FQ2-2(No).RE1-4"])
        taQuestion.insertButton(buttonName: "Q3.Ch1-2(No).FQ2-1(Yes).RE1-3", buttonText: "Yes", nextResponseName: "Q3.Ch1-2(No).FQ2-1(Yes).RE1-3", nextQuestionName: nil, isNextAQuestion: false, end: false)
        taQuestion.insertButton(buttonName: "Q3.Ch1-2(No).FQ2-2(No).RE1-4", buttonText: "No", nextResponseName: "Q3.Ch1-2(No).FQ2-2(No).RE1-4", nextQuestionName: nil, isNextAQuestion: false, end: false)

        taQuestion.insertResponse(responseName: "Q3.Ch1-1(Yes).FQ1-1(Yes).RE1-1", responseText: "Do you pride yourself in your unpredictability?", nextQuestionName: nil, end: true)
        taQuestion.insertResponse(responseName: "Q3.Ch1-1(Yes).FQ1-1(No).RE1-2", responseText: "There are few things as nauseating as pure obedience.", nextQuestionName: nil, end: true)
        taQuestion.insertResponse(responseName: "Q3.Ch1-2(No).FQ2-1(Yes).RE1-3", responseText: "Do you feel strong taking control where you can?", nextQuestionName: nil, end: true)
        taQuestion.insertResponse(responseName: "Q3.Ch1-2(No).FQ2-2(No).RE1-4", responseText: "Do you pride yourself in your unpredictability?", nextQuestionName: nil, end: true)

        twoAnswerQuestions.append(taQuestion)
    }

    public func createRiskTaker() {
      let taQuestion = TwoAnswerQuestion(questionManager: questionManager)

      taQuestion.insertQuestion(questionName: "Q8: Risk Taker", questionText: "Do you consider yourself a risk taker?", buttonNames: ["Q8.Ch1-1(Yes)", "Q8.Ch1-2(No)"])
      taQuestion.insertButton(buttonName: "Q8.Ch1-1(Yes)", buttonText: "Yes", nextResponseName: nil, nextQuestionName: nil, isNextAQuestion: false, end: true)
      taQuestion.insertButton(buttonName: "Q8.Ch1-2(No)", buttonText: "No", nextResponseName: nil, nextQuestionName: nil, isNextAQuestion: false, end: true)

      twoAnswerQuestions.append(taQuestion)
    }

    public func createForest() {
      let taQuestion = TwoAnswerQuestion(questionManager: questionManager)

      taQuestion.insertQuestion(questionName: "Q4: Forest", questionText: "You are traveling to Town B in serach of riches and stop to rest at Town A.\n\nThree people tell you the road to Town B is full of ravenous man-eating unicorns and you will surely perish if you travel on the road.\n\nDo you believe there are ravenous man-eating unicorns on the road to Town B?", buttonNames: ["Q4.Ch1-1(Yes).RE1-1", "Q4.Ch1-2(No).FQ1"])
      taQuestion.insertButton(buttonName: "Q4.Ch1-1(Yes).RE1-1", buttonText: "Yes", nextResponseName: "Q4.Ch1-1(Yes).RE1-1", nextQuestionName: nil, isNextAQuestion: false, end: false)
      taQuestion.insertButton(buttonName: "Q4.Ch1-2(No).FQ1", buttonText: "No", nextResponseName: nil, nextQuestionName: "Q4.Ch1-2(No).FQ1", isNextAQuestion: true, end: false)

      taQuestion.insertResponse(responseName: "Q4.Ch1-1(Yes).RE1-1", responseText: "Must be exhausting being so afraid and gullable all the time.", nextQuestionName: nil, end: true)

      taQuestion.insertQuestion(questionName: "Q4.Ch1-2(No).FQ1", questionText: "Now the entire town tells you there are ravenous man-eating unicorns on the road to Town B.\n\nDo you travel on the road to Town B in search of riches? Or do you turn around and go home empty-handed?", buttonNames: ["Q4.Ch1-2(No).FQ1-1(Travel to Town B).RE2-1", "Q4.Ch1-2(No).FQ1-2(Return Home).RE2-2"])
      taQuestion.insertButton(buttonName: "Q4.Ch1-2(No).FQ1-1(Travel to Town B).RE2-1", buttonText: "Travel to Town", nextResponseName: "Q4.Ch1-2(No).FQ1-1(Travel to Town B).RE2-1", nextQuestionName: nil, isNextAQuestion: false, end: false)
      taQuestion.insertButton(buttonName: "Q4.Ch1-2(No).FQ1-2(Return Home).RE2-2", buttonText: "Return Home", nextResponseName: nil, nextQuestionName: "Q4.Ch1-2(No).FQ1-2(Return Home).RE2-2", isNextAQuestion: true, end: false)

      taQuestion.insertResponse(responseName: "Q4.Ch1-2(No).FQ1-1(Travel to Town B).RE2-1", responseText: "You might not believe in ravenous man-eating unicorns, but have you considered something truly dangerous could be lurking on the road to Town B?\n\nWould you earnestly gamble with your life as easily as flipping a coin?", nextQuestionName: nil, end: true)
      taQuestion.insertResponse(responseName: "Q4.Ch1-2(No).FQ1-2(Return Home).RE2-2", responseText: "You might not believe in ravenous man-eating unicorns, but you have enough sense to know something dangerous could be lurking on the road to Town B.\n\nOr perhaps your fear got the better of you again. How often do you stand in your own way of success?", nextQuestionName: nil, end: true)

      twoAnswerQuestions.append(taQuestion)
    }

    public func createPirateCaptain() {
      let taQuestion = TwoAnswerQuestion(questionManager: questionManager)

      taQuestion.insertQuestion(questionName: "Q5: Pirate Captain", questionText: "You are the captain of a well-sized pirate ship. Three ships of similar size to yours approach and demand your immediate surrender.\n\nIf you surrender, they will only kill you and spare your crew.", buttonNames: ["Q5.Ch1-1(Surrender)", "Q5.Ch1-2(Don't Surrender)"])
      taQuestion.insertButton(buttonName: "Q5.Ch1-1(Surrender)", buttonText: "Surrender", nextResponseName: "Q5.Ch1-1(Surrender)", nextQuestionName: nil, isNextAQuestion: false, end: false)
      taQuestion.insertButton(buttonName: "Q5.Ch1-2(Don't Surrender)", buttonText: "Don't Surrender", nextResponseName: nil, nextQuestionName: "Q5.Ch1-2(Don't Surrender)", isNextAQuestion: true, end: false)

      taQuestion.insertResponse(responseName: "Q5.Ch1-1(Surrender)", responseText: "While you had intended on dying a Martyr, your crew instead mocks you for being a coward.\n\nYou die listening to your fellow crew members boo you and cheer your death.\n\nAre you so certain the right choice is always the best choice?", nextQuestionName: nil, end: true)
      taQuestion.insertResponse(responseName: "Q5.Ch1-2(Don't Surrender)", responseText: "Your crew was tired of following you into battles they couldn't hope to win.\n\nSo they staged a mutany, took control of the ship, and offered your head to save their own.\n\nDo the lives of others mean so little to you when compared against your own?", nextQuestionName: nil, end: true)

      twoAnswerQuestions.append(taQuestion)
    }

    public func createTrain() {
      let taQuestion = TwoAnswerQuestion(questionManager: questionManager)

      taQuestion.insertQuestion(questionName: "Q7: Train", questionText: "In the distance, you spot a runaway train hurtling down the tracks towards five workers who cannot hear it coming. Even if they do spot it, they won’t be able to move out of the way in time.\n\nYou glance down and see a lever connected to the tracks. You realise that if you pull the lever, the train will be diverted down a second set of tracks away from the five unsuspecting workers, and instead towards only one unsuspecting worker.\n\nThere's no time for anything else, what do you do?", buttonNames: ["Q7.Ch1-1(Pull the lever).FQ1-1", "Q7.Ch1-2(Do not pull the lever).FQ1-2"])
      taQuestion.insertButton(buttonName: "Q7.Ch1-1(Pull the lever).FQ1-1", buttonText: "Pull the lever", nextResponseName: "Q7.Ch1-1(Pull the lever).FQ1-1", nextQuestionName: nil, isNextAQuestion: false, end: false)
      taQuestion.insertButton(buttonName: "Q7.Ch1-2(Do not pull the lever).FQ1-2", buttonText: "Do not pull the lever", nextResponseName: nil, nextQuestionName: "Q7.Ch1-2(Do not pull the lever).FQ1-2", isNextAQuestion: true, end: false)

      taQuestion.insertQuestion(questionName: "Q7.Ch1-1(Pull the lever).FQ1-2", questionText: "Instead of five workers on the first set of tracks, there are now five innocent children playing.\n\nOn the second set of tracks there is a convicted criminal doing community service as part of his sentence.\n\nDo you pull the lever to spare the five children and send the train down the second set of tracks towards the convicted criminal?", buttonNames: ["Q7.Ch1-1(Pull the lever).FQ1-1", "Q7.Ch1-1(Do not pull the lever).FQ1-1(Do not pull the lever).FQ2-1"])
      taQuestion.insertButton(buttonName: "Q7.Ch1-1(Pull the lever).FQ1-1", buttonText: "Pull the lever", nextResponseName: nil, nextQuestionName: "Q7.Ch1-1(Pull the lever).FQ1-1", isNextAQuestion: true, end: false)
      taQuestion.insertButton(buttonName: "Q7.Ch1-1(Do not pull the lever).FQ1-1(Do not pull the lever).FQ2-1", buttonText: "Do not pull the lever", nextResponseName: nil, nextQuestionName: "Q7.Ch1-1(Do not pull the lever).FQ1-1(Do not pull the lever).FQ2-1", isNextAQuestion: true, end: false)

      taQuestion.insertQuestion(questionName: "Q7.Ch1-1(Pull the lever).FQ1-1", questionText: "Let's change the question a bit.\n\nYou are standing on a bridge above the train tracks. You can see the runaway train hurtling towards the five unsuspecting workers, but there’s no lever to divert it.\n\nHowever, there is a large man standing next to you on the bridge. You’re confident that his bulk would stop the train in its tracks.\n\nDo you push the man on to the tracks, sacrificing him in order to stop the tram and thereby saving five others?", buttonNames: ["Q7.Ch1-1(Pull the lever).FQ1-1(Push the man).FQ2-1", "Q7.Ch1-1(Pull the lever).FQ1-1(Do not push the man).RE2-1"])
      taQuestion.insertButton(buttonName: "Q7.Ch1-1(Pull the lever).FQ1-1(Push the man).FQ2-1", buttonText: "Push the man", nextResponseName: nil, nextQuestionName: "Q7.Ch1-1(Pull the lever).FQ1-1(Push the man).FQ2-1", isNextAQuestion: true, end: false)
      taQuestion.insertButton(buttonName: "Q7.Ch1-1(Pull the lever).FQ1-1(Do not push the man).RE2-1", buttonText: "Do not push the man", nextResponseName: "Q7.Ch1-1(Pull the lever).FQ1-1(Do not push the man).RE2-1", nextQuestionName: nil, isNextAQuestion: false, end: false)

      taQuestion.insertQuestion(questionName: "Q7.Ch1-1(Pull the lever).FQ1-1(Push the man).FQ2-1", questionText: "One final variation.\n\nYou are a doctor and you have five patients who all need transplants in order to live. Two each require one lung, another two each require a kidney, and the fifth needs a heart.\n\nIn the next ward is another individual recovering from a broken leg. But other than their knitting bones, they’re perfectly healthy. \n\nSo, would you kill the healthy patient and harvest their organs to save five others at no risk to yourself being caught?", buttonNames: ["Q7.Ch1-1(Pull the lever).FQ1-1(Push the man).FQ2-1", "Q7.Ch1-1(Pull the lever).FQ1-1(Do not push the man).RE2-1"])
      taQuestion.insertButton(buttonName: "Q7.Ch1-1(Pull the lever).FQ1-1(Push the man).FQ2-1", buttonText: "Kill the healthy patient", nextResponseName: "Q7.Ch1-1(Pull the lever).FQ1-1(Push the man).FQ2-1(Kill the healthy patient).RE1-1", nextQuestionName: nil, isNextAQuestion: false, end: false)
      taQuestion.insertButton(buttonName: "Q7.Ch1-1(Pull the lever).FQ1-1(Do not push the man).RE2-1", buttonText: "Do not kill the healthy patient", nextResponseName: "Q7.Ch1-1(Pull the lever).FQ1-1(Do not push the man).FQ2-2(Do not kill the healthy patient).RE1-2", nextQuestionName: nil, isNextAQuestion: false, end: false)

      // add rest of responses

      twoAnswerQuestions.append(taQuestion)
    }

    public func createHideAndSeek() {
      let taQuestion = TwoAnswerQuestion(questionManager: questionManager)

      taQuestion.insertQuestion(questionName: "Q9: Hide and Seek", questionText: "When playing Hide-and-Seek are you better at hiding or seeking?", buttonNames: ["Q9.Ch1-1(Hiding)", "Q9.Ch1-2(Seeking)"])
      taQuestion.insertButton(buttonName: "Q9.Ch1-1(Hiding)", buttonText: "Hiding", nextResponseName: nil, nextQuestionName: nil, isNextAQuestion: false, end: true)
      taQuestion.insertButton(buttonName: "Q9.Ch1-2(Seeking)", buttonText: "Seeking", nextResponseName: nil, nextQuestionName: nil, isNextAQuestion: false, end: true)

      twoAnswerQuestions.append(taQuestion)
    }

    public func createLateOrEarly() {
      let taQuestion = TwoAnswerQuestion(questionManager: questionManager)

      taQuestion.insertQuestion(questionName: "10: Late or Early", questionText: "Would you rather always be 5 minutes late or 30 minutes early?", buttonNames: ["Q10.Ch1-1(Late)", "Q10.Ch1-2(Early)"])
      taQuestion.insertButton(buttonName: "Q10.Ch1-1(Late)", buttonText: "Late", nextResponseName: nil, nextQuestionName: nil, isNextAQuestion: false, end: true)
      taQuestion.insertButton(buttonName: "Q10.Ch1-2(Early)", buttonText: "Early", nextResponseName: nil, nextQuestionName: nil, isNextAQuestion: false, end: true)

      twoAnswerQuestions.append(taQuestion)
    }

    public func createMilkInCereal() {
      let taQuestion = TwoAnswerQuestion(questionManager: questionManager)

      taQuestion.insertQuestion(questionName: "Q11: Milk in Cereal", questionText: "Milk before or after the cereal?", buttonNames: ["Q11.Ch1-1(Before the cereal)", "Q11.Ch1-2(After the cereal)"])
      taQuestion.insertButton(buttonName: "Q11.Ch1-1(Before the cereal)", buttonText: "Before the cereal", nextResponseName: nil, nextQuestionName: nil, isNextAQuestion: false, end: true)
      taQuestion.insertButton(buttonName: "Q11.Ch1-2(After the cereal)", buttonText: "After the cereal", nextResponseName: nil, nextQuestionName: nil, isNextAQuestion: false, end: true)

      twoAnswerQuestions.append(taQuestion)
    }

    public func createPlacementOfTrust() {
      let taQuestion = TwoAnswerQuestion(questionManager: questionManager)

      taQuestion.insertQuestion(questionName: "Q12: Placement of Trust", questionText: "Do you tend to place your trust more in yourself, or others?", buttonNames: ["Q12.Ch1-1(Yourself)", "Q12.Ch1-2(Other people)"])
      taQuestion.insertButton(buttonName: "Q12.Ch1-1(Yourself)", buttonText: "Yourself", nextResponseName: nil, nextQuestionName: nil, isNextAQuestion: false, end: true)
      taQuestion.insertButton(buttonName: "Q12.Ch1-2(Other people)", buttonText: "Other people", nextResponseName: nil, nextQuestionName: nil, isNextAQuestion: false, end: true)

      twoAnswerQuestions.append(taQuestion)
    }

    public func createJar() {
      let taQuestion = TwoAnswerQuestion(questionManager: questionManager)

      taQuestion.insertQuestion(questionName: "Q14: Jar", questionText: "Do you see the jar of toxic poison as half full or half empty?", buttonNames: ["Q14.Ch1-1(Half full)", "Q14.Ch1-2(Half empty)"])
      taQuestion.insertButton(buttonName: "Q14.Ch1-1(Half full)", buttonText: "Half full", nextResponseName: nil, nextQuestionName: nil, isNextAQuestion: false, end: true)
      taQuestion.insertButton(buttonName: "Q14.Ch1-2(Half empty)", buttonText: "Half empty", nextResponseName: nil, nextQuestionName: nil, isNextAQuestion: false, end: true)

      twoAnswerQuestions.append(taQuestion)
    }

    public func createCookie() {
      let taQuestion = TwoAnswerQuestion(questionManager: questionManager)

      taQuestion.insertQuestion(questionName: "Q16: Cookie", questionText: "Tuesday has finally come: chocolate chip cookie day. You wait patiently in line and take the last chocolate chip cookie.\n\nA kid twice your size taps you on the shoulder and claims you stole his cookie.\n\nHe insists you give it back. What is your first natural instinct?", buttonNames: ["Q16.Ch1-1(Fight)", "Q16.Ch1-2(Flight"])
      taQuestion.insertButton(buttonName: "Q16.Ch1-1(Fight)", buttonText: "Fight", nextResponseName: nil, nextQuestionName: nil, isNextAQuestion: false, end: true)
      taQuestion.insertButton(buttonName: "Q16.Ch1-2(Flight)", buttonText: "Flight", nextResponseName: nil, nextQuestionName: nil, isNextAQuestion: false, end: true)

      twoAnswerQuestions.append(taQuestion)
    }
}
