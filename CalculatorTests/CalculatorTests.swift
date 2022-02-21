import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    func testEquals() {
        let calculator = Calculator._withState(value: 3, lastBinaryOperator: .addition)
       
        func assertInternalState() {
             XCTAssertEqual(calculator._lastOperand, 3)
             XCTAssertEqual(calculator._lastBinaryOperator, .addition)
             XCTAssertTrue(calculator._digits.isEmpty)
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
    }
}



extension Input: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Digit.RawValue) {
        self = .digit(Digit(integerLiteral: value))
    }
}
extension Input.Digit: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: RawValue) {
        self.init(rawValue: value)!
    }
}
