# Understanding ER-Model

1. B
2. C
3. C (line means a key that uniquely identifies the entity, dotted line (on weak entity) means partial key that uniquely identifies the entity only with the corresponding other entity)
4. D (N can mean any number and there's no need to participate in the relation)

5. T
6. F
7. F
8. F
9. T
10. T
11. T (to have a `isDaughter` relationship there needs to be 1 mother and 1 father)
12. F (no need to participate in the `isSon` relationship
13. T
14. T
15. F (no need to participate)
16. F

# Cardinalities in Min/Max Notation

```
.--------.     N                    1      .-----------.
|Employee|------------- works -------------|Departement|
'--------'   (0, 1)               (0, N)   '-----------'
```

Departments can have many employees, employees can have work or not.

```
.--------.     1                    1      .-----------.
|Employee|------------- mang. -------------|Departement|
'--------'   (0, 1)               (0, 1)   '-----------'
```

Rest is like this.

# Cardinalities in Ternary Relationships

Not possible because there are cases we can't cover.

```
.--------.                  .---------.
|Students|                  |Professor|
'--------.                  '---------'
          \                /
		   \N            1/
		    \.----------./
			 |supervises|
             '----------'
			      |
				  | 1
				  |
               .-----.
			   |Topic|
			   '-----'
```

# Modeling Miniworlds: Getting started

1.

```
.===. N    1 .===. N    1 .===. N    1 .===. N    1 .-------.
| A |===in---| H |===in---| S |===in---| C |===in---|Country|
'===' N    1 '===' N    1 '===' N    1 '===' N    1 '-------'
```

2.

```
.--------.   N Home
|        |------------\        1    .-------.
|  Team  |             play --------|Referee|
|        |------------/             '-------'
'--------'  M Visitor
```

# Miniworld: International Wholesale Supplier

```

```







