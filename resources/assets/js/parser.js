var osmosis = require('osmosis');

osmosis
.get('https://playoverwatch.com/en-us/career/pc/eu/TERRA-22123')
.find('h1 + a')
.data(function(listing) {
    console.log(listing)
})
.log(console.log)
.error(console.log)
.debug(console.log)