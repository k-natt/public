function tweetValid() {
	console.log('checking');
	tfield = document.getElementById('tweet');
	return tfield.textLength > 0 && tfield.textLength <= 140;
}
function updateCCField(e) {
	tfield  = document.getElementById('tweet');
	ccfield = document.getElementById('charcount');
	len = tfield.textLength;
	ccfield.innerHTML = len;
	if(tweetValid()) {
		ccfield.classList.add('green');
		ccfield.classList.remove('red');
	} else {
		ccfield.classList.add('red');
		ccfield.classList.remove('green');
	}
}
function register () {
	tfield = document.getElementById('tweet');
	if(tfield) {
		tfield.addEventListener('keyup', updateCCField, false);
		updateCCField();
	}
	form = document.getElementById('tweetform');
	if(form) {
		form.onsubmit = tweetValid
	}
}
window.addEventListener('load', register, false);
//register();
//;
