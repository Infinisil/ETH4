open util/ordering[State]

sig Image{}
one sig Null in Image{}

sig File {
	loadImage: Image
}
{ loadImage != Null }

sig ImageFile {}

sig State {
	imageFiles: set ImageFile,
	files: imageFiles -> one File,
	images: imageFiles -> one Image
}

pred newImageFile [s, s': State, f: File, i: ImageFile] {
	s'.imageFiles = s.imageFiles + i
	s'.files = s.files ++ i -> f
	s'.images = s.images ++ i -> f.loadImage // load the image eagerly
}

fun getImage [s: State, i: ImageFile] : Image { s.images[i] }

pred init[s: State] {
	no s.imageFiles
}

fact traces {
	init[first] &&
	all s: State - last | (some f: File, i: ImageFile - s.imageFiles | newImageFile[s, s.next, f, i])
}

assert inv2 {
	all s, s': State | lt[s, s'] => (all i: s.imageFiles | getImage[s, i] = getImage[s', i])
}

check inv1

run show{} for 3