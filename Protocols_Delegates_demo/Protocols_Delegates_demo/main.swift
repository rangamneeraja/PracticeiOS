//
//  main.swift
//  Protocols_Delegates_demo
//
//  Created by Rexel_Neeraja on 16/06/21.
//

import Foundation

protocol AdvanceLifeSupportDelegate {
    func performCPR()
}

class EmergencyCallHandller {
    var delegate : AdvanceLifeSupportDelegate?
    
    func assessSituation() {
        print("can you tell me what happend?")
    }
    
    func medicalEmergency() {
        delegate?.performCPR()
    }
}

struct Paramedic : AdvanceLifeSupportDelegate {
    
    init(handler: EmergencyCallHandller) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("do chest compressions, 30 seconds")
    }
}

class Doctor : AdvanceLifeSupportDelegate {
    
    init(handler: EmergencyCallHandller) {
        handler.delegate = self
    }
    func performCPR() {
        print("do chest compressions, 30 seconds")
    }
}

class Surgeon: Doctor {
    override func performCPR() {
        super.performCPR()
        print("sings")
    }
    func useElectricDrill(){
        print("drills")
    }
}

let emila = EmergencyCallHandller()
let neeraja = Paramedic(handler: emila)

emila.assessSituation()
emila.medicalEmergency()
