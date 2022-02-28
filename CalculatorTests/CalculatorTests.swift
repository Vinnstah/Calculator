import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {

    func test_instruction_equals_add3() {
        let calculator = Calculator._withState(
            value: 3,
            lastBinaryOperator: .addition,
            newOperand: 3
        )
       
        func assertInternalState() {
             XCTAssertEqual(calculator._lastOperand, 3)
//             XCTAssertEqual(calculator._lastBinaryOperator, .addition)
//             XCTAssertTrue(calculator._digits.isEmpty)
        }
        
        assertInternalState()

        XCTAssertEqual(
            calculator.input(.instruction(.operator(.equal))),
            6
        )
        
        assertInternalState()
        
        XCTAssertEqual(
            calculator.input(.instruction(.operator(.equal))),
            9
        )
        
        assertInternalState()
        
        XCTAssertEqual(
            calculator.input(.instruction(.operator(.equal))),
            12
        )
        
        
        XCTAssertEqual(calculator._value, 12)
    }
    
    func test_addition() {
        let calculator = Calculator()
        calculator.input(2)
        calculator.input("+")
        calculator.input(3)
        calculator.input("+")
        XCTAssertEqual(calculator._value, 5)
        
        
    }
    
    func test_instruction_equals_sub2() {
        let calculator = Calculator._withState(
            value: 15,
            lastOperand: 5,
            lastBinaryOperator: .subtaction
        )
       
        func assertInternalState() {
             XCTAssertEqual(calculator._lastOperand, 5)
             XCTAssertEqual(calculator._lastBinaryOperator, .subtaction)
             XCTAssertTrue(calculator._digits.isEmpty)
        }
        
        assertInternalState()
        XCTAssertEqual(
            calculator.input(.instruction(.operator(.equal))),
            10
        )
        
        assertInternalState()
        XCTAssertEqual(
            calculator.input(.instruction(.operator(.equal))),
            5
        )
        
        assertInternalState()
        XCTAssertEqual(
            calculator.input(.instruction(.operator(.equal))),
            0
        )
        
        assertInternalState()
        XCTAssertEqual(
            calculator.input(.instruction(.operator(.equal))),
            -5
        )
        
        XCTAssertEqual(calculator._value, -5)
    }
    
    func test_instruction_equals_mul2() {
        let calculator = Calculator._withState(
            value: 2,
            lastBinaryOperator: .multiplication
        )
       
        func assertInternalState() {
             XCTAssertEqual(calculator._lastOperand, 2)
             XCTAssertEqual(calculator._lastBinaryOperator, .multiplication)
             XCTAssertTrue(calculator._digits.isEmpty)
        }
        
        assertInternalState()
        XCTAssertEqual(
            calculator.input(.instruction(.operator(.equal))),
            4
        )
        
        assertInternalState()
        XCTAssertEqual(
            calculator.input(.instruction(.operator(.equal))),
            8
        )
        
        assertInternalState()
        XCTAssertEqual(
            calculator.input(.instruction(.operator(.equal))),
            16
        )
        
        
        XCTAssertEqual(calculator._value, 16)
    }
    
    func test_instruction_equals_div2() {
        let calculator = Calculator._withState(
            value: 512,
            lastOperand: 2,
            lastBinaryOperator: .division
        )
       
        func assertInternalState() {
             XCTAssertEqual(calculator._lastOperand, 2)
             XCTAssertEqual(calculator._lastBinaryOperator, .division)
             XCTAssertTrue(calculator._digits.isEmpty)
        }
        
        assertInternalState()
        XCTAssertEqual(
            calculator.input(.instruction(.operator(.equal))),
            256
        )
        
        assertInternalState()
        XCTAssertEqual(
            calculator.input(.instruction(.operator(.equal))),
            128
        )
        
        assertInternalState()
        XCTAssertEqual(
            calculator.input(.instruction(.operator(.equal))),
            64
        )
        
        
        XCTAssertEqual(calculator._value, 64)
    }
}



extension Input: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Digit.RawValue) {
        self = .digit(Digit(integerLiteral: value))
    }
}

extension Input: ExpressibleByStringLiteral {
    public init(stringLiteral value: Input.Operator.BinaryOperator.RawValue) {
        let banan: Input.Operator.BinaryOperator = .init(stringLiteral: value)
        let apa: Input.Operator = .binaryOperator(banan)
        self = .instruction(.operator(apa))
    }
}

extension Input.Operator.BinaryOperator: ExpressibleByStringLiteral {
    public init(stringLiteral value: RawValue) {
        guard let binaryOperator = Self.allCases.first(where: { $0.displayValue == value }) else {
            fatalError("Unrecognized operator value \(value)")
        }
        self = binaryOperator
    }
}

extension Input.Digit: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: RawValue) {
        self.init(rawValue: value)!
    }
}

