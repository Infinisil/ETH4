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