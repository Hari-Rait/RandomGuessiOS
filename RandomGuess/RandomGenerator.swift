//
//  RandomGenerator.swift
//  RandomGuess
//
//  Created by Hari Rait on 08.11.23.
//

import SwiftUI

struct RandomGenerator: View {
    
    // For the Popup View
    @State private var showingPopover = false
    
    // String in dem der Guess vom User gespechert wird
    @State private var Guesses: String = ""
    // in dem Array werden die Guesses vom User dann gespeichert
    @State private var RandomGuess: [String] = []
    // nimmt sich ein zufälliges Element aus dem Array und speichert es in der Variable
    @State private var random = ""
    
    // Hellblaue farbe
    let skyBlue = Color(red: 0.4627, green: 0.8392, blue: 1.0)
    
    // Bunte farbe
   
    
    var body: some View {
        NavigationView{
            
            VStack{
                
                Text("Bitte fügen Sie min. 2 Guesses ein")
                    .foregroundStyle(Color.primary)
                
                HStack{
                    
                    Button("Ein Guess Hinzufügen") {
                        showingPopover = true
                    }
                    .foregroundColor(.white)
                    .popover(isPresented: $showingPopover) {
                        VStack {
                            
                            Button("", systemImage: "chevron.compact.down") {
                                showingPopover = false
                            }
                            .foregroundColor(.primary)
                            .padding()
                            .font(.largeTitle)
                            
                            Text("Es werden min. 2 Guesses benötigt")
                                .font(.headline)
                                .multilineTextAlignment(.center)
                                .padding()
                            
                            
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
                    
                }
                
                if RandomGuess.isEmpty {
                    
                    
                } else {
                    
                    List{
                        
                        DisclosureGroup("Alle Eingaben") {
                            ForEach(RandomGuess, id: \.self) { item in
                                Text(item)
                            }
                            .onDelete(perform: removeRows)
                        }
                    }
                    .scrollContentBackground(.hidden)
                    //.background(skyBlue)
                    .cornerRadius(15)
                }
                
                    
                Button ( action: {
                    if !RandomGuess.isEmpty {
                        random = RandomGuess.randomElement()!
                    }
                }) {
                    Text("Zufall generieren")
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [.red, .blue, .green, .yellow, .orange, .indigo, .purple]), startPoint: .leading, endPoint: .trailing))
                        .foregroundColor(.white)
                        .bold()
                        .cornerRadius(10)
                       
                }
                
                //Ein Button zum Löschen der Elemente des Arrays
                Button("Alle Guesses löschen") {
                    removeAllElements()
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.red)
                .cornerRadius(10)
                
                if !RandomGuess.isEmpty {
                    Text(random)
                        .font(.largeTitle)
                }
            }
            .padding()
            .navigationTitle("RandomGuess Generator")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        RandomGuess.remove(atOffsets: offsets)
    }
    
    func removeAllElements() {
        DispatchQueue.main.async {
            RandomGuess.removeAll()
        }
    }
}

#Preview {
    RandomGenerator()
}
