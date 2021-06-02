//
// ContentView.swift
// ICS4U-Unit2-08-Swift
//
// Created by Marcus A. Mosley on 2021-06-02
// Copyright (C) 2021 Marcus A. Mosley. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var abike: Bike = Bike("Navy Blue", 40)
    @State private var atruck: Truck = Truck("L0NGHAU1", "Pearl White", 180)
    @State private var text: String = ""

    var body: some View {
        VStack {
            Button("Enter", action: {

                text += "How many wheels are on each vehicle?"
                text += "\n\nThe Bike has \(String(abike.getWheels())) wheels."
                text += "\nThe Truck has \(String(atruck.getWheels())) wheels."

                text += "\n\nSpeed up by 20 on the Bike and 60 on the Truck."
                abike.accelerate(20)
                atruck.accelerate(60)
                text += "\n\nThe current speed on the Bike is: "
                text += "\(String(abike.getSpeed())) (\(String(abike.getCadence())) RPM)"
                text += "\nThe current speed on the Truck is: \(String(atruck.getSpeed()))"

                text += "\n\nApply the Brake on the Bike with value 5."
                    + " Provide Air on the Truck with value 13."
                abike.applyBrake(5)
                atruck.provideAir(13)
                text += "\n\nThe new speed on the Bike is: "
                text += "\(String(abike.getSpeed())) (\(String(abike.getCadence())) RPM)"
                text += "\nThe new speed on the Truck is: \(String(atruck.getSpeed()))"

                text += "\n\nPaint the Bike Ruby Red, and the Truck Chrome."
                abike.setColour("Ruby Red")
                atruck.setColour("Chrome")
                text += "\n\nThe new colour of the Bike is: \(abike.getColour())"
                text += "\nThe new colour of the Bike is: \(atruck.getColour())"

                text += "\n\nRing the Bike's Bell."
                text += "\(abike.ringBell())"

                text += "\n\nDone"
            })
            .padding()
            Text("\(text)")
        }
    }
}

class Vehicle {
    private var colour: String
    private var wheelNo: Int
    private var maxSpeed: Int
    private var speed: Int
    init(_ startColour: String, _ startWheelNo: Int, _ startMaxSpeed: Int) {
        colour = startColour
        wheelNo = startWheelNo
        maxSpeed = startMaxSpeed
        speed = 0
    }

    // Getters

    func getColour() -> String {
        return self.colour
    }

    func getWheels() -> Int {
        return self.wheelNo
    }

    func getMaxSpeed() -> Int {
        return self.maxSpeed
    }

    func getSpeed() -> Int {
        return self.speed
    }

    // Setters

    func setColour(_ newColour: String) {
        self.colour = newColour
    }

    // Methods

    // Increases Current Speed
    func accelerate(_ increment: Int) {
        self.speed += increment
    }

    // Decreases Current Speed
    func applyBrake(_ decrement: Int) {
        self.speed -= decrement
    }

    // Outputs the array
    func printVehicleInfo() -> String {
        var text: String = ""

        text += "\nColour: \(colour)"
        text += "\nMax. Speed: \(String(maxSpeed))"
        text += "\nCurrent Speed: \(String(speed))"

        return text
    }
}

class Bike: Vehicle {
    private var cadence: Double = 0
    init(_ startColour: String, _ startMaxSpeed: Int) {
        super.init(startColour, 2, startMaxSpeed)
    }

    // Getters

    func getCadence() -> Double {
        cadence = Double(super.getSpeed()) * 0.621371 / (27.56 * Double.pi * 60.0 / 63360.0)
        return self.cadence
    }

    // Methods

    // Rings the Bike's Bell
    func ringBell() -> String {
        var text: String = ""
        text += "\nRing! Ring!"
        return text
    }
}

class Truck: Vehicle {
    private var plateNo: String
    init(_ startPlateNo: String, _ startColour: String, _ startMaxSpeed: Int) {
        self.plateNo = startPlateNo
        super.init(startColour, 18, startMaxSpeed)
    }

    // Getters

    func getPlateNo() -> String {
        return self.plateNo
    }

    // Setters

    func setPlateNo(_ newPlateNo: String) {
        self.plateNo = newPlateNo
    }

    // Methods

    // Applies the truck's air brakes
    func provideAir(_ amountOfAir: Int) {
        super.applyBrake(amountOfAir)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
