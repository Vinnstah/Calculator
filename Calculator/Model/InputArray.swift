//
//  ButtonsArray.swift
//  Calculator
//
//  Created by Viktor Jansson on 2022-02-20.
//

import Foundation
import SwiftUI

struct InputArray {
    
    let elements: [Input] =
    [
        Input.instruction(.stateChange(.clear)),
        Input.instruction(.operand(.negate)),
        Input.instruction(.operand(.percent)),
        Input.instruction(.operand(.divide)),
        Input.digit(.seven),
        Input.digit(.eight),
        Input.digit(.nine),
        Input.instruction(.operand(.multiply)),
        Input.digit(.four),
        Input.digit(.five),
        Input.digit(.six),
        Input.instruction(.operand(.minus)),
        Input.digit(.one),
        Input.digit(.two),
        Input.digit(.three),
        Input.instruction(.operand(.plus)),
        Input.instruction(.stateChange(.saveNumber)),
        Input.digit(.zero),
        Input.instruction(.stateChange(.comma)),
        Input.instruction(.operand(.equal))
    ]
    }

