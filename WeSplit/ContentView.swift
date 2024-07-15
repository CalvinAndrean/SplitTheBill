//
//  ContentView.swift
//  WeSplit
//
//  Created by Calvin Andrean on 14/07/24.
//

import SwiftUI

//struct ContentView: View {
//    let conversionType = ["Meters", "Kilometers", "Feet", "Yard", "Miles"]
//    @State var selectedConversionInput = "Meters"
//    @State var selectedConversionOutput = "Meters"
//    @State var conversionValue = 0.0
//    @FocusState private var focusedConversionValue: Bool
//    
//    func convertingValue(from: String, to: String, value: Double) -> Double {
//        if from == to {
//            return value
//        } else {
//            switch selectedConversionInput {
//            case "Meters":
//                switch selectedConversionOutput {
//                case "Kilometers":
//                    return conversionValue / 1000
//                case "Feet":
//                    return conversionValue * 3.28
//                case "Yard":
//                    return conversionValue * 1.093
//                case "Miles":
//                    return conversionValue * 0.0006
//                default:
//                    return 0
//            }
//            case "Kilometers":
//                switch selectedConversionOutput {
//                case "Meters":
//                    return conversionValue * 1000
//                case "Feet":
//                    return conversionValue * 3280.8399
//                case "Yard":
//                    return conversionValue * 1093.6133
//                case "Miles":
//                    return conversionValue * 0.62137
//                default:
//                    return 0
//                }
//            case "Feet":
//                switch selectedConversionOutput {
//                case "Meters":
//                    return conversionValue * 0.3048
//                case "Kilometers":
//                    return conversionValue * 0.0003048
//                case "Yard":
//                    return conversionValue * 0.3333
//                case "Miles":
//                    return conversionValue * 0.000189
//                default:
//                    return 0
//                }
//            case "Yard":
//                switch selectedConversionOutput {
//                case "Meters":
//                    return conversionValue * 0.9144
//                case "Kilometers":
//                    return conversionValue * 0.0009144
//                case "Feet":
//                    return conversionValue * 3
//                case "Miles":
//                    return conversionValue * 0.000568
//                default:
//                    return 0
//                }
//            case "Miles":
//                switch selectedConversionOutput {
//                case "Meters":
//                    return conversionValue * 1609.344
//                case "Kilometers":
//                    return conversionValue * 1.609344
//                case "Feet":
//                    return conversionValue * 5280
//                case "Yard":
//                    return conversionValue * 1760
//                default:
//                    return 0
//                }
//            default:
//                return 0
//            }
//        }
//    }
//    
//    var body: some View {
//        NavigationStack {
//            Form {
//                Section("Select the input conversion") {
//                    Picker("Convert from", selection: $selectedConversionInput){
//                        ForEach(conversionType, id: \.self){
//                            Text($0)
//                        }
//                    }
//                }
//                
//                Section("Select the output conversion") {
//                    Picker("To", selection: $selectedConversionOutput){
//                        ForEach(conversionType, id: \.self){
//                            Text($0)
//                        }
//                    }
//                }
//                
//                Section("Insert the value") {
//                    TextField("Insert the value to be converted", value: $conversionValue, format: .number)
//                        .keyboardType(.decimalPad)
//                        .focused($focusedConversionValue)
//                }
//                
//                Section("The converted value") {
//                    Text("\(convertingValue(from: selectedConversionInput, to: selectedConversionOutput, value: conversionValue).formatted()) \(selectedConversionOutput)")
//                }
//            }
//            .navigationTitle("Length Conversion App")
//            .toolbar {
//                if focusedConversionValue {
//                    Button("Done"){
//                        focusedConversionValue = false
//                    }
//                }
//            }
//        }
//    }
//}

struct ContentView: View {
    @State var totalBill = 0.0
    @State var totalPeople = 2
    @State var tipPercentage = 10
    @FocusState private var focusedTotalBill: Bool
    
    let tip = [5, 10, 15, 20, 25, 0]
    
    func getSplittedBill(bill: Double, peeps: Int, tip: Int) -> Double{
        return (bill + (bill * Double(tip) / 100)) / Double(peeps)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Total bill") {
                    TextField("Insert your total bill", value: $totalBill, format: .currency(code: Locale.current.currency?.identifier ?? "IDR"))
                }
                
                Section("How many members willing to split"){
                    Picker("Member of", selection: $totalPeople){
                        ForEach(0..<100){
                            Text("\($0) people")
                        }
                    }
                }
                
                Section("Tip percentages"){
                    Picker("Tip Percentage", selection: $tipPercentage){
                        ForEach(tip, id: \.self){
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Each member has to pay"){
                    Text(getSplittedBill(bill: totalBill, peeps: totalPeople, tip: tipPercentage), format: .currency(code: Locale.current.currency?.identifier ?? "IDR"))
                }
            }
            .navigationTitle("WeSplit App")
            .toolbar {
                if focusedTotalBill {
                    Button("Done"){
                        focusedTotalBill = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
