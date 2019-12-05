/* global axios */

console.log('hello there');


// HTTP.get("localhost:3000/api/recipes")

axios.get("/api/recipes").then(function(response) {
  console.log("i am on line 9")
  console.log(response);
});

console.log("i am on line 12")
