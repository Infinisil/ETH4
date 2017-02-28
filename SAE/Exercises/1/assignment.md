# Exercise 1 - Design and Documentation

1. If the `source` and `target` change often.
2. The documentation should include what happens when there is no shortest path.
3.
	(a) Save the result of `shortestPath` to an object property. Reset to `null` when `addEdge` or `setST` is called.
	(b) Could maybe indicate that repeated calling of `shortestPath` only calculates the result once unless the modifying methods are called.
	(c) Postcondition to change is that the stored path is `null`. Postcondition for `stortestPath` is that the stored path should be the methods result.
	(d) 


# Exercise 2 - Design

1.

	```java
	Integer[] arr = {1, 2, 3};
	List<Integer> a = new List(arr, 3);
	a.take();
	a.set(2, 0);
	```
	
	or

	```java
	List<Integer> x = new List(arr, 3);
	List<Integer> y = new List(arr, 3);
	x.set(0, 0);
	y.set(0, 10);
	// Original aray is not referenced anymore even though 
	```

2.
	```java
	
	class Ref<O>{
		O obj;
		int refcount;

		
	
	class List<E>{
		E[] elems;
		int len;
		int counter;

		List(E[] e, int l, int counter = 2) {
			elems = e;
			len = l;
			this.counter = counter;
		}

		void set(int index, E e) {
			if(counter > 1) {
				elems = elems.clone();
				counter = 1;
			}
			elems[index] = e;
		}
		
		List<E> take(){
			counter += 1
			return new List<E>(elems, len - 1);
		}
	}
	```

# Exercise 3 - Requirement Elicitation

## Actors

- Shop owner
- Daughter (needs to know backend API)
- Supplier
- Frequent customers with in-house account
- Regular customers

## Scenarios

Online order: Customer opens the website and wants to order flowers. He can add the flowers he wants to a shopping cart. When they are done, the payment can be made either through the customer being logged in (if they have an account) and having the information saved  or by having them supply the address and payment information manually. Upon arrival of the money, the order is confirmed via E-Mail (logged in) or a dialog.

Owner looks at statistics by logging in with the admin account.



## Use Cases













