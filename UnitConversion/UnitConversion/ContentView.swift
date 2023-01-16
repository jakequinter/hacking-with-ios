//
//  ContentView.swift
//  UnitConversion
//
//  Created by Jake Quinter on 1/16/23.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var isFocused: Bool
    @State private var temperature = 0.0
    @State private var startingUnit = "°F"
    @State private var endingUnit = "°C"
    
    let units = ["°F", "°C", "°K"]
    
    var fahrenheit: Double {
        if startingUnit == "°F" {
            return temperature
        } else if startingUnit == "°C" {
            return (temperature * 9/5) + 32
        } else {
            return (temperature - 273.15) * 9/5 + 32
        }
    }
    
    var celsius: Double {
        (fahrenheit - 32) * 5/9
    }
    
    var kelvin: Double {
        (fahrenheit - 32) * 5/9 + 273.15
    }
    
    var result: Double {
        if startingUnit == endingUnit {
            return temperature
        } else if endingUnit == "°F" {
            return fahrenheit
        } else if endingUnit == "°C" {
            return celsius
        } else {
            return kelvin
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section("Starting unit") {
                    TextField("Temperature", value: $temperature, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                }
                
                Section("Conversion") {
                    Picker("From", selection: $startingUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    Picker("To", selection: $endingUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Result") {
                    Text("\(result, specifier: "%.2f")\(endingUnit)")
                }
            }
            .navigationTitle("Unit Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        isFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
