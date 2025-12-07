//
//  ContentView.swift
//  LetsConvert
//
//  Created by ER on 25/07/24.
//

import SwiftUI

struct ContentView: View {
    let Lengths = ["M","KM","feet","yards","miles"]
    @State private var selctedInputLength = ""
    @State private var selctedOutputLength = ""
    @State private var enteredValue = 0.0
    var result : String {
        switch selctedInputLength {
        case "M":
            return convertMeterToOutput(of: selctedOutputLength, for: enteredValue)
        case "KM":
            return convertKilometerToOutput(of: selctedOutputLength, for: enteredValue)
        case "feet":
            return convertFeetToOutput(of: selctedOutputLength, for: enteredValue)
        case "yards":
            return convertYardToOutput(of: selctedOutputLength, for: enteredValue)
        case "miles":
            return convertMilesToOutput(of: selctedOutputLength, for: enteredValue)
        default :
            return "0"
        }
    }
    var body: some View {
        NavigationStack{
        Form{
            Section("Select input Unit") {
                Picker("Select Input Length", selection: $selctedInputLength) {
                    ForEach(Lengths, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            }
            Section("Select Output Unit") {
                Picker("Select Output Length", selection: $selctedOutputLength) {
                    ForEach(Lengths, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Enter your value here") {
                TextField("Enter your value here", value: $enteredValue, format: .number)
            }
            
            Section("Result:-") {
                Text(result)
            }
        }
        .navigationTitle("LetsConvert")
    }
    }
    func convertMeterToOutput(of type: String, for value : Double)->String {
        switch type {
        case "KM" :
            return String(value / 1000)
        case "feet" :
            return String(value * 3.28084)
        case "yards" :
            return String(value * 1.09361)
        case "miles" :
            return String(value * 0.000621371)
        default : return String(value)
        }
    }
    func convertKilometerToOutput(of type: String, for value : Double)->String {
        switch type {
        case "M" :
            return String(value * 1000)
        case "feet" :
            return String(value * 3280.84)
        case "yards" :
            return String(value * 1093.61)
        case "miles" :
            return String(value * 0.621371)
        default : return String(value)
        }
    }
    func convertFeetToOutput(of type: String, for value : Double)->String {
        switch type {
        case "M" :
            return String(value * 0.3048)
        case "KM" :
            return String(value * 0.0003048)
        case "yards" :
            return String(value / 3)
        case "miles" :
            return String(value * 0.000189394)
        default : return String(value)
        }
    }
    func convertYardToOutput(of type: String, for value : Double)->String {
        switch type {
        case "M" :
            return String(value * 0.9144)
        case "KM" :
            return String(value * 0.0009144)
        case "feet" :
            return String(value * 3)
        case "miles" :
            return String(value * 0.000568182)
        default : return String(value)
        }
    }
    func convertMilesToOutput(of type: String, for value : Double)->String {
        switch type {
        case "M" :
            return String(value * 1609.34)
        case "KM" :
            return String(value * 1.60934)
        case "feet" :
            return String(value * 5280)
        case "yards" :
            return String(value * 1760)
        default : return String(value)
        }
    }
}

#Preview {
    ContentView()
}
