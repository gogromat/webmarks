var page    = require('webpage').create(),
	address,
	output, 
	size;

if (phantom.args.length < 1) {
	phantom.exit('Error: Wrong number of parameters provided');
} 
else {
	address = phantom.args[0];
	output  = phantom.args[1];

	if (typeof output === 'undefined') {
		output = 'output.png';
	}
	page.viewportSize = { width: 1024, height: 768 };
	//page.clipRect = { top: 0, left: 0, width: 500, height: }

	page.open(address, function(status) {
		if (status === 'success') {
			console.log(output);
			window.setTimeout(function() {
				page.render(output);
				phantom.exit();
			});
		}
		else {
			phantom.exit('Error: Failed to load the address: ' + address);
		}
	});
}