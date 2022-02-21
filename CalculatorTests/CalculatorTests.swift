import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    func testEquals() {
        let calculator = Calculator(value: 3, lastOperator: .plus)
        XCTAssertEqual(
            calculator.input(.instruction(.operator(.equal))),
            6
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
