
var ComicVineClient = require('node_modules/comicvine-client/comicvine');

var client = new ComicVineClient({
    //Example API key, insert your API key here. More info http://api.comicvine.com/
    apikey: "29ea453895c508f6063bdf136251bde0f4d99551",

    //Base URL for all the API requets. Don't change it unless you are using your own proxy or something like that.
    apiUrl: "http://api.comicvine.com",

    //Use redis cache for http requests
    cache: 'redis',

    //Redis host
    host: "192.168.56.2",

    //Redis port
    port: 6379,
});

var searchCollection = new client.Search("Batman","character");

//Now searchCollection is a regular paginated collection. You can set pageSize, use .fetch(), .fetchNextPage()...
searchCollection.fetchAll({
    success: function(results) {
        var batman = results.where({"name": "Batman"})[0];
        console.log( batman.get("real_name") );
    }
})

