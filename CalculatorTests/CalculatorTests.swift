import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {

    func test_instruction_equals_add3() {
        let calculator = Calculator()
       
        func initialState() {
            calculator.input(2)
            calculator.input("+")
            calculator.input(3)
        }
        
        initialState()

        XCTAssertEqual(
            calculator.input(.instruction(.operator(.equal))),
            5
        )
        
        calculator.input("+")
        calculator.input(4)
        
        XCTAssertEqual(
            calculator.input(.instruction(.operator(.equal))),
            9
        )
      
        XCTAssertEqual(calculator._value, 9)
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
        let calculator = Calculator()
       
        func initialState() {
            calculator.input(2)
            calculator.input("-")
            calculator.input(3)
        }
        
       initialState()
        XCTAssertEqual(
            calculator.input(.instruction(.operator(.equal))),
            -1
        )
        calculator.input("-")
        calculator.input(4)
        XCTAssertEqual(
            calculator.input(.instruction(.operator(.equal))),
            -5
        )
        
        
        XCTAssertEqual(calculator._value, -5)
    }
    
    func test_instruction_equals_mul2() {
        //Issues with using multiplication after equals
        let calculator = Calculator()
        
        func initialState() {
            calculator.input(2)
            calculator.input("X")
            calculator.input(3)
        }
        
        initialState()
        XCTAssertEqual(
            calculator.input(.instruction(.operator(.equal))),
            6
        )
        
        calculator.input("X")
        calculator.input(3)
        
        XCTAssertEqual(
            calculator.input(.instruction(.operator(.equal))),
            18
        )
        
        XCTAssertEqual(calculator._value, 18)
    }
    
    func test_instruction_equals_div2() {
        //Currently throws and error, needs fixing.
        let calculator = Calculator()
       
        func initialState() {
            calculator.input(512)
            calculator.input(.instruction(.operator(.binaryOperator(.division))))
            calculator.input(2)
        }
        
        initialState()
        XCTAssertEqual(
            calculator.input(.instruction(.operator(.equal))),
            256
        )
        
        calculator.input(.instruction(.operator(.binaryOperator(.division))))
        calculator.input(2)
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

