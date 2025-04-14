package org.example.calculator;

public enum Operator {
    ADD("Addition", "+") {
        @Override
        public float apply(float a, float b) {
            return a + b;
        }
    },
    SUBTRACT("Subtraction", "-") {
        @Override
        public float apply(float a, float b) {
            return a - b;
        }
    },
    MULTIPLY("Multiplication", "*") {
        @Override
        public float apply(float a, float b) {
            return a * b;
        }
    },
    DIVIDE("Division", "/") {
        @Override
        public float apply(float a, float b) {
            if (b == 0) throw new ArithmeticException("Division by zero");
            return a / b;
        }
    };

    private final String label;
    private final String symbol;

    Operator(String label, String symbol) {
        this.label = label;
        this.symbol = symbol;
    }

    public String getLabel() {
        return label;
    }

    public String getSymbol() {
        return symbol;
    }

    public abstract float apply(float a, float b);
//    String
//            ADD = "Addition",
//            SUBTRACT = "Subtraction",
//            MULTIPLY = "Multiplication",
//            DIVIDE = "Division";
}
