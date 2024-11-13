package com.mycompany.app;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/**
 * Unit test for calculator subtraction
 */
public class CalculatorSubtractionTest
{
    @Test
    public void twoMinusThree()
    {
        float correctAnswer = -1;
        assertEquals(correctAnswer, Calculator.Subtraction(2,3), 0.000001);
    }

    @Test
    public void fiveMinusTwo()
    {
        float correctAnswer = 3;
        assertEquals(correctAnswer, Calculator.Subtraction(5, 2), 0.000001);
    }
}
