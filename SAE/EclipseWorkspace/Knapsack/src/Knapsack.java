public class Knapsack {
    public static int knapsack(int[] values, int[] weights, int i, int capacity) {
    	if (i < 0) {
            return 0;
        } else if (weights[i] > capacity) {
            return knapsack(values, weights, i - 1, capacity);
        } else {
            int a = knapsack(values, weights, i - 1, capacity);
            int b = knapsack(values, weights, i - 1, capacity - weights[i]) + values[i];
            return Math.max(a, b);
        }
    }

    public static int solve(int[] values, int[] weights, int capacity) {
        if (values == null || weights == null) {
            throw new IllegalArgumentException("Array is null");
        }
        if (values.length != weights.length) {
            throw new IllegalArgumentException("Arrays have different lengths");
        }
        return knapsack(values, weights, values.length - 1, capacity);
    }
}
