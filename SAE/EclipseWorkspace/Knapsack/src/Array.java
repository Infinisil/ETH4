public class Array {
    public static int indexOf(int[] a, int n) {
        if (a == null) {
            throw new IllegalArgumentException("Array is null");
        }
        int index = -1;
        for (int i = 0; i <= a.length; i++) {
            if (a[i] == n) {
                index = i;
                break;
            }
        }
        return index;
    }

    public static int average(int[] a) {
        if (a == null) {
            throw new IllegalArgumentException("Array is null");
        }
        if (a.length == 0) {
            throw new IllegalArgumentException("Array is empty");
        }
        int sum = 0;
        for (int i = 1; i < a.length; i++) {
            sum += a[i];
        }
        return sum / a.length;
    }

}