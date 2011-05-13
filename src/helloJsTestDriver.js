/*
 * $Id$
 */

/**
 * function for returns Hello JsTestDriver, + name
 * @namespace
 * @param {string} name your name
 * @return {string} 'Hello JsTestDriver, ' + name
 */
function helloJsTestDriverSync(name) {
    return 'Hello JsTestDriver, ' + name;
}

/**
 * function for returns Hello JsTestDriver, + name
 * and name is got from a server by using ajax
 * @namespace
 * @param {Function} callback callback function to receive return val
 * @param {boolean} [flag] resource select flag
 * @example
 * (function() {
 *     function callback(str) {
 *         alert(str);
 *     }
 *     helloJsTestDriverAsync(callback);
 * })();
 */
function helloJsTestDriverAsync(callback, flag) {
    var url;

    url = (flag) ? '/test/resources/foo.txt' : '/test/resources/bar.txt';

    jQuery.ajax({
                    'type': 'GET',
                    'dataType': 'text',
                    'url': url,
                    'async': true,
                    'cache': false,
                    'success': function(d) {
                        callback('Hello JsTestDriver, ' + d);
                    }
                });
}

/* EOF */
