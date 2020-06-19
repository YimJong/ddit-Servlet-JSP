/**
 * 
 */

String.prototype.validationBUYER = function() {
	return /^[P]{1}[0-9]{4}$/.test(this);
};


String.prototype.validationREGIST = function() {
	return /^[P]{1}[0-9]{5}$/.test(this);
};

String.prototype.validationTITLE = function() {
	return /^[가-힣a-zA-Z ]{1,30}$/.test(this);
};

String.prototype.validationNICKNAME = function() {
	return /^[가-힣]{2,5}$/.test(this);
};

String.prototype.validationMAIL = function () {
    // test@test.com or test@test.co.kr
    return /^[a-z0-9]+@[a-z]+(\.[a-z]+){1,2}$/.test(this);
};

String.prototype.validationPWD = function () {
    // "asdfasdf".validationPWD()
    return/^[a-z0-9]{4,15}$/.test(this);
};