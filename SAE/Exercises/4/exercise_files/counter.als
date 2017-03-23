open util/ordering[Counter]
module util/integer



sig Counter { 
	n: Int
}

pred inc[c, c': Counter] {
	c'.n = c.n.add[Int[1]]
}

pred init[c: Counter] { c.n = Int[0] }

fact traces {
	init[ first ] && 
	all s: Counter - last | inc[s, s.next]
}

assert inv1 {
	all s : Counter | s.n >= Int[0]
}

assert inv2 {
	all s, s': Counter | lt[s, s'] => s.n <= s'.n
}

check inv1 for 10
check inv2 for 10

