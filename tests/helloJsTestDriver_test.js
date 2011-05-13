/**
 * $Id$
 */

/* Sync Api Test */
helloJsTestDriverSyncTest = TestCase('helloJsTestDriverSyncTest');
helloJsTestDriverSyncTest.prototype.testAll = function() {
    var r, name;

    name = 'foo';
    r = helloJsTestDriverSync(name);
    assertEquals('Hello JsTestDriver, ' + name, r);
};

/* Async Api Test */
helloJsTestDriverAsyncTest = AsyncTestCase('helloJsTestDriverAsyncTest');
helloJsTestDriverAsyncTest.prototype.testAll = function(queue) {
    var called;

    queue.defer('get foo.txt',
                function(pool) {
                    var callback = pool.add(
                        function(r) {
                            called = true;
                            assertEquals('Hello JsTestDriver, foo\n', r);
                        });

                    // check flag for callback is called
                    called = false;
                    helloJsTestDriverAsync(callback, true);
                });
    queue.defer('check whether callback is called',
                function() {
                    assertEquals(true, called);
                });

    queue.defer('get bar.txt',
                function(pool) {
                    var callback = pool.add(
                        function(r) {
                            called = true;
                            assertEquals('Hello JsTestDriver, bar\n', r);
                        });

                    // check flag for callback is called
                    called = false;
                    helloJsTestDriverAsync(callback);
                });
    queue.defer('check whether callback is called',
                function() {
                    assertEquals(true, called);
                });
};

/* EOF */
