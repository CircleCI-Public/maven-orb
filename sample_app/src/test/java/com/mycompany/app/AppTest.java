package com.mycompany.app;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import org.junit.Before;
import org.junit.Test;
import org.junit.After;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.*;

/**
 * Unit test for simple App.
 */
public class AppTest
{

    private final ByteArrayOutputStream outContent = new ByteArrayOutputStream();

    @Before
    public void setUpStreams() {
        System.setOut(new PrintStream(outContent));
    }

    @Test
    public void testAppConstructor() {
        try {
            new App();
        } catch (Exception e) {
            fail("Construction failed.");
        }
    }

    @Test
    public void testAppMain()
    {
        App.main(null);
        try {
            assertEquals("Hello World!" + System.getProperty("line.separator"), outContent.toString());
        } catch (AssertionError e) {
            fail("\"message\" is not \"Hello World!\"");
        }
    }

    @After
    public void cleanUpStreams() {
        System.setOut(null);
    }
    
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

