package com.ryanbourdais;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/**
 * Unit test for simple App.
 */
public class AppTest 
{
    /**
     * Rigorous Test :-)
     */
    @Test
    public void shouldAnswerWithTrue()
    {
        assertTrue( true );
    }

    @Test
    public void shouldEqualFive()
    {
        float correctAnswer = 5;
        assertEquals(correctAnswer, Calculator.Addition(2,3), 0.000001);
    }

    @Test
    public void shouldEqualThree()
    {
        float correctAnswer = 3;
        assertEquals(correctAnswer, Calculator.Subtraction(5, 2), 0.000001);
    }

    @Test
    public void shouldEqualTwentyOne()
    {
        float correctAnswer = 21;
        assertEquals(correctAnswer, Calculator.Multiplication(7, 3), 0.000001);
    }

    @Test
    public void DivisionTest()
    {
        float correctAnswer = 0.41666f;
        assertEquals(correctAnswer, Calculator.Division(5, 12), 0.00001);
    }
}
