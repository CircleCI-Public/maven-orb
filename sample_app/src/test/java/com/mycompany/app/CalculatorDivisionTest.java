package com.mycompany.app;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/**
 * Unit test for calculator division
 */
public class CalculatorDivisionTest 
{
    @Test
    public void fiveDividedByTwelve()
    {
        float correctAnswer = 0.41666f;
        assertEquals(correctAnswer, Calculator.Division(5, 12), 0.00001);
    }

    @Test
    public void fourDividedByTwo()
    {
        float correctAnswer = 2f;
        assertEquals(correctAnswer, Calculator.Division(4, 2), 0.00001);
    }
}
