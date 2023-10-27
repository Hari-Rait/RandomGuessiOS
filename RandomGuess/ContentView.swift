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
    @State private var random = ""
   
    
    var body: some View {
        
        VStack{
            
            TextField("Gib bitte ein Guess ein", text: $Guesses)
                .textFieldStyle(.roundedBorder)
                .padding()
                .submitLabel(.done)
            
            HStack{
                Button( action: {
                    if !Guesses.isEmpty {
                        RandomGuess.append(Guesses)
                        Guesses = ""
                    }
                }) {
                    Text("Hinzufügen")
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                .shadow(color: .blue, radius: 15, y: 5)
                .padding()
                
                Button ( action: {
                    if !RandomGuess.isEmpty {
                        random = RandomGuess.randomElement()!
                    }
                }) {
                    Text("Zufall generieren")
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                .shadow(color: .red, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
            List{
                ForEach(RandomGuess, id: \.self) { item in
                    Text(item)
                }
                .onDelete(perform: removeRows)
            }
            .padding()
            Spacer()
            
            Button ( action: {
                if !RandomGuess.isEmpty {
                    RandomGuess.removeAll()
                    random = ""
                }
            }) {
                Text("Alle Eingaben Löschen")
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Text(random)
                .font(.largeTitle)
            
        }
        .padding()
    }
    
    func removeRows(at offsets: IndexSet) {
        RandomGuess.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
