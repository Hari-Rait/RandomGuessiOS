//
//  ContentView.swift
//  RandomGuess
//
//  Created by Hari Rait on 25.10.23.
//

import SwiftUI


struct ContentView: View {
    
    // For the Popup View
    @State private var showingPopover = false
    
    // String in dem der Guess vom User gespechert wird
    @State private var Guesses: String = ""
    // in dem Array werden die Guesses vom User dann gespeichert
    @State private var RandomGuess: [String] = []
    // nimmt sich ein zufälliges Element aus dem Array und speichert es in der Variable
    @State private var random = ""
    
    // Spinning Wheel
    let colors: [Color] = []
    
    // Hellblaue farbe
    let skyBlue = Color(red: 0.4627, green: 0.8392, blue: 1.0)
    
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                HStack{
                    
                    Button("Ein Guess Hinzufügen") {
                        showingPopover = true
                    }
                    .popover(isPresented: $showingPopover) {
                        VStack {
                            
                            Text("Für das Guessrad werden mind. 2 Namen benötigt")
                                .font(.headline)
                                .multilineTextAlignment(.center)
                            
                            
                            TextField("Gib bitte dein Guess ein", text: $Guesses)
                                .submitLabel(.done)
                                .foregroundColor(skyBlue)
                                .multilineTextAlignment(.center)
                                .font(.title2)
                                .border(skyBlue)
                                .cornerRadius(8)
                                .padding()
                            
                            Button( action: {
                                if !Guesses.isEmpty {
                                    RandomGuess.append(Guesses)
                                    Guesses = ""
                                }
                            }) {
                                Text("Hinzufügen")
                                    .padding()
                                    .background(skyBlue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            .padding()
                            
                            List{
                                ForEach(RandomGuess, id: \.self) { item in
                                    Text(item)
                                }
                                .onDelete(perform: removeRows)
                            }
                            .padding()
                            Spacer()
                        }
                    }
                    .padding()
                    .background(skyBlue)
                    .cornerRadius(10)
                    
                    
                    
                    Button ( action: {
                        if !RandomGuess.isEmpty {
                            random = RandomGuess.randomElement()!
                        }
                    }) {
                        Text("Zufall generieren")
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                
                Button ( action: {
                    if !RandomGuess.isEmpty {
                        RandomGuess.removeAll()
                        random = ""
                    }
                }) {
                    Text("Alle Eingaben Löschen")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                List{
                    ForEach(RandomGuess, id: \.self) { item in
                        Text(item)
                    }
                    .onDelete(perform: removeRows)
                }
                .padding()
                Spacer()
                
                if RandomGuess.count >= 2 {
                    
                    WheelView(
                        RandomGuess,
                        id: \.self,
                        label: { index in
                            Text (RandomGuess[index])
                                .font (.system(.caption, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor (.white)
                                .scaledToFit()
                        }
                    ) { item in
                        print(item)
                    }
                    .padding()
                } else {
                    hidden()
                }
                
                
                Text(random)
                    .font(.largeTitle)
                
            }
            .padding()
            .navigationTitle("RandomGuess")
            .navigationBarTitleDisplayMode(.inline)
        }
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
