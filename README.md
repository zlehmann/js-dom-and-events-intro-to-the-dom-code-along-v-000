# Reintroduction to the DOM

## Objectives

1. Explain how DOM nodes are written
2. Describe how to structure the DOM
3. Explain the difference between inline and block elements

## DOM syntax
![Syntax](https://media.giphy.com/media/3o6MbkZSYy4mI3gLYc/giphy.gif)

When writing to the Document Object Model, DOM, we're do so in HTML, a markup
language for web pages. DOM nodes represent all components that make up a web
page, including, but not limited to HTML tags.  For the purposes of this lab,
we're only going to be looking at DOM nodes that represent HTML tags.

HTML DOM elements have a starting tag and an ending tag. Some nodes only have a
starting tag. Those are called _self-closing_ elements. These elements do not
have any content nested inside of them (more technically, they are called _void_
elements).

An example of a normal tag would be the paragraph:

```html
<p>I am a paragraph.</p>
```

An example of a self-closing tag, an image:

```html
<img src="https://media.giphy.com/media/3o6MbkZSYy4mI3gLYc/giphy.gif" alt="A policeman">
```

In self-closing tags, the trailing `/` is optional. This is valid too:

```html
<img src="https://media.giphy.com/media/3o6MbkZSYy4mI3gLYc/giphy.gif" alt="A policeman" />
```

## Trees and leaves
![A tree.](https://media.giphy.com/media/2XflxzDTUtH7VxyfoT6/giphy.gif)

DOM structure can be compared to a tree. You have one big tree trunk from which
all other elements spring forth. Those elements can also have children
themselves, leading to a branched structure. For clarity's sake, let's assume
our tree trunk starts at `<body>`, because those are the only elements that are
actually visible on the webpage.

To _nest_ items in an element, we simply add the content between its starting
and ending tag:

```html
<body>
  <main>
    <p>I am a nested paragraph, inside the main element, inside the body!</p>
  </main>
</body>
```

## Building blocks
![Lego](https://media.giphy.com/media/3ZALZoBtI1KJa/giphy.gif)

Every HTML element has a `display` value. This value can be many things
(including `none`, which hides the elements), but the default value for most
elements is either `block` or `inline`.

### Block elements
Block elements do two things: they start on a new line, and stretch
horizontally. They take up all available width. These elements are usually used
to contain other elements within, and are generally used for layout purposes.

Examples of block elements are `<div>`, `<h1>`, `<form>`, `<main>`, `<p>` and
so on. MDN has a great [list of all block elements][html-block-elements].

### Inline elements
Contrary to block-level elements, inline elements are shy and less greedy.
They only take up as much space as they need. Inline elements can _only_
contain text and other inline elements. If you start adding block-level
elements to an inline element, your browser will do all sorts of funky stuff to
fix the markup mistakes. Best to avoid that!

Examples of inline elements are `<span>`, `<em>`, `<strong>`, `<a>`, `<img>`
and so on. MDN also has a great [list of all inline elements][html-inline-elements].

### Taking it for a spin
Enough chit-chat, let's write some HTML! In your sandbox, create a file called
`index.html`.  Just to speed things up a bit, paste the following code into the
file:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>DOM Code Along</title>
</head>
<body>
  <!--All our work for this lesson will go here-->
</body>
</html>
```

In your terminal, type `httpserver` to start up a temporary web server, and use
the IP provided to open up `index.html` (alternatively, if you're not using the
in-browser IDE, you can use `open index.html` in the folder you're working on
to open up a copy of the file in your browser). Everything we'll be working on
will take place in the `<body>` tag.

First, let's add a title to our page:

```html
<h1>My HTML adventure</h1>
```

Next, we'll add a paragraph below the title. We'll also add some highlighted
bits of text to the paragraph to make it stand out a little.

```html
<p>
  We're writing HTML markup to display in our <strong>browser</strong>.
  We're basically telling computers what to do. <em>Neat!</em>
</p>
```

Save the file and check out the page in your browser.  What's happening above
is that we added some _inline_ elements, `<strong>` and `<em>` to our paragraph
to style things a little. The `<strong>` tag makes any text within look
**important**. It's usually bolded in browsers by default. The `<em>` tag
allows us to **emphasize** certain text. This text is typically rendered as
italic in browsers.

Oh, wait! Maybe people don't know what HTML is yet. Let's help them out by including a link to MDN to give them a quick explanation. We'll use the`<a>` tag for this.

```html
<p>
  We're writing <a href="https://developer.mozilla.org/en-US/docs/Web/HTML">HTML</a> markup to display in our <strong>browser</strong>. We're basically telling computers what to do. <em>Neat!</em>
</p>
```

Wait a minute. What's that weird `href` thing doing there? Well, that's an
attribute. Attributes allow us to configure or customize an element to change
their behavior. In this case, we're telling the `<a>` tag, which is a clickable
link, to take the user's browser to the specified URL in the `href` attribute.

Lastly, we'll add a table below the paragraph to recap some of the stuff in
this lesson:

```html
<table>
  <thead>
    <tr>
      <th>Element name</th>
      <th>Display value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>h1</td>
      <td>block</td>
    </tr>
    <tr>
      <td>p</td>
      <td>block</td>
    </tr>
    <tr>
      <td>strong</td>
      <td>inline</td>
    </tr>
    <tr>
      <td>em</td>
      <td>inline</td>
    </tr>
  </tbody>
</table>
```

Woah. That's a **lot** of markup! If you take a look at the result though,
you'll see that it's a fairly complex visual — it's a table! Our table consists
of a header and a body. The header allows us to give the columns a name, and
the table body contains the rows of content. Both `<thead>` and `<tbody>` tags
contains rows, which are represented as `<tr>` (table row). These rows then
contain columns (or cells). In the `<thead>` row, cells are represented as
`<th>`, while cells in `<tbody>` have their content in `<td>` tags.

## Looking at the DOM

Now that we've got some content on the page, we will be able to see the DOM
more clearly.  In your browser, while you're looking at the `index.html` file
we've created.  Open up the inspector (in Chrome, you can do this by right
clicking and selecting 'Inspect' from the context menu), and navigate to the
'Elements' tab.  You should see something that _looks like_ our `index.html`
file.  This is the DOM tree!  We can actually use this tab to directly edit the
DOM, deleting elements, adding attributes, even modifying styling.  However,
anything done on this tab will not persist, so if you make a change, say delete
our table, then refresh your page, the table will reappear.  

**Fun Fact:** If you've ever seen an image or meme of a fake tweet or of some
silly, unbelievable facebook comments - it is entirely possible that these are
made using DOM manipulation - all anyone has to do is go to a webpage, select
the area they want to change, add their own content and take a screenshot. You
can even swap out image sources!

This sums up our crash course on HTML DOM elements! We've barely scratched the
surface — so it's definitely a good idea to check out MDN to up your HTML game!

## Resources
- [HTML element reference](https://developer.mozilla.org/en-US/docs/Web/HTML/Element)

[html-block-elements]: https://developer.mozilla.org/en/docs/Web/HTML/Block-level_elements
[html-inline-elements]: https://developer.mozilla.org/en-US/docs/Web/HTML/Inline_elements

<p class='util--hide'>View <a href='https://learn.co/lessons/javascript-reintroduction-to-the-dom'>Reintroduction to the DOM</a> on Learn.co and start learning to code for free.</p>
