package com.mycompany.app;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/**
 * Unit test for calculator addition
 */
public class CalculatorAdditionTest
{
    @Test
    public void twoPlusThree()
    {
        float correctAnswer = 5;
        assertEquals(correctAnswer, Calculator.Addition(2,3), 0.000001);
    }

    @Test
    public void onePlusTwo()
    {
        float correctAnswer = 3;
        assertEquals(correctAnswer, Calculator.Addition(1, 2), 0.000001);
    }
}
