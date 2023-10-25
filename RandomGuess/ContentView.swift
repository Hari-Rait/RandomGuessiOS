//
//  ContentView.swift
//  RandomGuess
//
//  Created by Hari Rait on 25.10.23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var Guesses: String = ""
    @State private var RandomGuess: [String] = []
    @State private var random = "Brücken Sie den Button"
    
    
    var body: some View {
        
        VStack{
            
            TextField("Gib bitte ein Guess ein", text: $Guesses)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button( action: {
                if !Guesses.isEmpty {
                    RandomGuess.append(Guesses)
                    Guesses = ""
                }
            }) {
                Text("Hinzufügen")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            
            List(RandomGuess, id: \.self) { item in
                Text(item)
            }
            .padding()
            Spacer()
            
            Button ( action: {
                if !RandomGuess.isEmpty {
                     random = RandomGuess.randomElement()!
                }
            }) {
                Text("Zufall generieren")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Text(random)
            
            }
        .padding()
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
