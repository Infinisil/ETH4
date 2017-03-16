abstract sig FSObject {
	parent: lone Dir
}
sig File extends FSObject {}
sig Dir extends FSObject {
	contents: set FSObject
}

one sig Root extends Dir {}

FSObject in Root.*contents
