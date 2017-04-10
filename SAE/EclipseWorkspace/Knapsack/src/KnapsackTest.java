import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class KnapsackTest {
	public void testCase(int[] values, int[] weights, int capacity, int expected) {
		int actual = Knapsack.solve(values, weights, capacity);
		assertEquals(expected, actual);
	}
	
    @Test
    public void testKnapsack() {
        int actual = Knapsack.solve(new int[]{0, 1, 2}, new int[]{0, 1, 2}, 10);
        int expected = 3;
        assertEquals(expected, actual);
        
        testCase(new int[]{9, 5, 10}, new int[]{3, 2, 3}, 5, 15);
        
        new Knapsack();
    }
    
    @Test(expected = Exception.class)
    public void testUnequalLengths() {
    	Knapsack.solve(new int[]{}, new int[]{1, 2}, 3);
    }

    @Test(expected = IllegalArgumentException.class)
    public void testValuesIsNull() {
        Knapsack.solve(new int[]{0}, null, 0);
    }

    @Test(expected = IllegalArgumentException.class)
    public void testArraysHaveDifferentLengths() {
        Knapsack.solve(new int[]{0}, new int[]{0, 0}, 0);
    }
}