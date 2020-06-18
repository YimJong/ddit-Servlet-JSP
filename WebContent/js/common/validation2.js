/**
 * 
 */

String.prototype.validationBUYER = function() {
	return /^[P]{1}[0-9]{4}$/.test(this);
};


String.prototype.validationREGIST = function() {
	return /^[P]{1}[0-9]{5}$/.test(this);
};

