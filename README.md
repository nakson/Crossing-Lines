# JavaScript



## Introduction

#### What is?

- JavaScript is: a scripting language, used to interact with content in a web browser.

![](https://github.com/nakson/Crossing-Lines/blob/master/pic/1564703259899.png)

- Console is: a command line for the browser where you can write, manage, and monitor JavaScript on the fly. 

- jQuery is: 

  - a library of JavaScript functions;

  - introduces CSS-like syntax and several visual/UI;
  - simplifies the use of JavaScript in websites.

- Node.js is: a JavaScript platform built on browser run-time environment.

  

#### Tools:

- Code Editors: Atom, Visual Studio Code, Sublime Text, ...
- IDEs (Integrated development environments): NetBeans, Aptana Studio, Eclipse, ...
- Browsers: Chrome, Firefox, Edge, Opera, Brave, ...

- JavaScript Frameworks: React, Angular, Vue, ...

  

#### Writing Rules:

- JavaScript is case sensitive. (分大小写)
- Use camelCase. `eg. getElementByTagName();     var greenDuck;`
- Whitespace matters (to humans).
- End each statement with a semicolon (for humans). ` ;`
- Use comments. ` // /* */`

#### Others:

- JavaScript Loading Methods:

  - right away: <script src="script.js"></script>

     	HTML parsing >> JS download >> JS execution >> ...
    
  - asynchronous: <script src="script.js" async></script>

     	HTML parsing + JS download >> JS execution >> ...

  - deferred: <script src="script.js" defer></script>

     	HTML parsing + JS download (even faster)>> JS execution >> ...
  
    

## Data

``` javascript
//These are the same:
var a = 5;
var b = 4;
var sum = a + b;

var a, b, sum;
a = 5;
b = 4;
sum = a + b;

var a = 5, b = 4, sum = a + b;
```

` a = 6` is ok, but to avoid global scope, always declare your variables.



#### Date Types:

- Numeric

  ``` javascript
  var num = 1;
  ```

- String

  ``` javascript
  var string = "Typically words and sentences.";
  var escQuote = "Quotes can also be \"escaped\".";
  ```

- Boolean

  ``` javascript
  var isFemale = true;
  var isBird = false;
  ```

- null

  ``` javascript
  //Store the intentional absence of a value:
  var emptyInside = null;
  ```

- undefined

- Symbol

```javascript
//Find the Data Type of a Variable:
var num = 1;
console.log(typeof num);
```



#### Operators:

https://www.w3schools.com/jsref/jsref_operators.asp



#### Array:

https://www.w3schools.com/jsref/jsref_obj_array.asp

```javascript
var pens;
pens = ["red", "blue", "green", "orange"];

console.log("Before: ", pens);

// PROPERTIES:
// Get a property of an object by name:
console.log("Array length: ", pens.length);

// METHODS:
// Remove the first value of the array:
pens.shift(); //->["blue", "green", "orange"]

// Add to the front of the array:
pens.unshift("purple", "black"); //->["purple", "black", "blue", "green", "orange"]

// Remove the last value of the array:
pens.pop();  //->["purple", "black", "blue", "green"]

// Add to the end of the array:
pens.push("pink"); //->["purple", "black", "blue", "green","pink"]

// Find the specified position (pos) and remove n number of items from the array. Arguments: pens.splice(pos,n):
pens.splice(1, 2); // Starts at the seccond item and removes two items.

console.log("After: ", pens); //->["purple", "green","pink"]

// Create a copy of an array. Typically assigned to a new variable:
var newPens = pens.slice();
console.log("New pens: ", newPens);

// Return the first element that matches the search parameter after the specified index position. Defaults to index position 0. Arguments: pens.indexOf(search, index):
 ar result = pens.indexOf("orange", 1);
 console.log("The search result index is: ", result);

// Return the items in an array as a comma separated string. The separator argument can be used to change the comma to something else. Arguments: pens.join(separator):
 var arrayString = pens.join("_");
 console.log("String from array: ", arrayString);
```



## Functions and Objects

#### What is?

- const : constant, can't be changed once defined.
- let: block scope variable, smaller scope than var.
- course.title = course["title"]. 
- closures: function inside function.

#### Basic function:

```javascript
function multiply(a,b){
    var result = a*b;
    return result;
}
var test = multiply(3,4); 
console.log(test);	//12
```

#### Anonymous function:

``` javascript
var theBiggest = function(a,b) {
    var result;
    a>b ? result = ["a", a] : result = ["b", b];
    return result;
}
console.log(theBiggest(7/9,13/25)); //["a", 0.7777777777777778]

//Immediately invoked
var divided =  (function(a,b){
    var result = a/b;
    return result;
})(4,2)
console.log(divided); //2
```



#### Objects

``` javascript
var course = nre Object();

//course.title = "Introduction of JavaScript";
//course.instructor = "Nakson";
//course.level = 1;

var course = {
    title: "Introduction of JavaScript",
	level: 1,
    public: true,
    views: 0,
    updateViews: functino(){
   		 return ++course.views
	}
}
console.log(course.views); //0 
course.updateViews();
console.log(course.views); //1
//每次新建都要：
var course02 = new course();
```

Object constructors:

``` javascript
function Course(title, level, public, views){
    this.title = title;
    this.level = level;
    this.pubilc = public;
    this.views = views;
    this.updateViews = function(){return ++this.views;};
}
var courses = [
    new Course("Introduction of JavaScript", 1, true, 0);
    new Course("Introduction of speakers", 1, true, 100);
];
console.log(courses[1].updateViews()); //101
```

#### Closures:

A function inside of a function that relies on variables in the outside function to work. 

```javascript
function giveMeEms(pixels){
    var baseValue = 16;
    
    function doTheMath(){
        return pixels/baseValue;
    }
    
    return doTheMath;
}

var smallSize = giveMeEms(12);
var largeSize = giveMeEms(24);

console.log("Small size: ", smallSize()); //0.75
console.log("Large size: ", largeSize()); //2
```

more on closures:

https://developer.mozilla.org/en-US/docs/Web/JavaScript/Closures



## DOM

#### What is?

- BOM: Browser Object Model
- DOM: Document Object Model

#### BOM:

eg.   window.innerHeight			window.open()

​		document 

#### DOM

![1564703259899](pic\1564703259899.png)

- DOM properties: 

  eg.   document.body;

  ​		document.title;

  ​		document.URL;

- DOM methods: 

  eg.   document.getElementById("...");

  ​		document.getElementByClassName("...");

  ​		document.getElementByTagName("...");

  ​		document.querySelector(".main-nav a");

  ​		document.querySelectorAll(".post-content p");

more: https://developer.mozilla.org/en-US/docs/Web/API/document

​			https://developer.mozilla.org/en-US/docs/Web/API/Element#PropertiesA

#### Add Inline CSS to an Elem





