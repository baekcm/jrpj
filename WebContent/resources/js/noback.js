var storedHash = window.location.hash;
window.setInterval(function () {
   if (window.location.hash != storedHash) {
        window.location.hash = storedHash;
   }
}, 50);
	
function noBackScript() {
	    window.location.href += "#";
	    setTimeout("noBackScriptAgain()", "50"); 
	}
	
function noBackScriptAgain() {
 window.location.href += "1";
}