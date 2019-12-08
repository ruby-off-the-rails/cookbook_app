/* global axios */

console.log('hello there');


// HTTP.get("localhost:3000/api/recipes")

axios.get("/api/recipes").then(function(response) {
  console.log("i am on line 9");
  console.log(response.data);
  // find an element on the page
  var message = document.querySelector('#message');
  console.log(message);

  // change that element on the page
  message.innerHTML = response.data[5].title;
});

console.log('new update');

// show information from js in HTML



