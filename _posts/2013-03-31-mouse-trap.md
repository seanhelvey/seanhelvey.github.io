---
id: 281
title: Mouse Trap
date: 2013-03-31T15:58:23+00:00
author: Sean
layout: post
guid: http://www.seanhelvey.com/?p=281
permalink: /mouse-trap/
categories:
  - Technology
  - 'Web &amp; Mobile'
---
Inspired by Quick Left&#8217;s <a title="Rube Goldberg Hackfest" href="http://quickleft.com/blog/virtual-rube-goldberg-machines-and-yolo" target="_blank">Rube Goldberg Hackfest</a>, I set out to build a fancy web application version of the board game &#8220;Mouse Trap&#8221;. This involved setting up a web server using Node.js and Express, hitting the server with a simple iOS app, polling said web server using client side JavaScript, cropping images with Gimp, and working with jQuery.

<p style="text-align: left;">
  iOS <a title="source" href="https://bitbucket.org/shelvey/mousetrap" target="_blank">source</a> &#8211; Includes HTTP request and swipe gestures. Node.js w/ Express <a title="source" href="https://bitbucket.org/shelvey/node-indicator" target="_blank">source</a> &#8211; Processes requests and maintains state. HTML, CSS, JavaScript, jQuery <a title="source" href="https://bitbucket.org/shelvey/mousetrapweb" target="_blank">source</a> &#8211; Polling server and doing animation. Hosted <a title="here" href="http://www.dev.seanhelvey.com/mouseTrapWeb/fling/" target="_blank">here</a> (fling the knife from the cutting board) and <a title="here" href="http://www.dev.seanhelvey.com/mouseTrapWeb/catch/" target="_blank">here</a> (trapping the mouse). You can hit the server <a title="here" href="http://stormy-chamber-1319.herokuapp.com/hit" target="_blank">here</a> to start the entire process. If something isn&#8217;t working, try resetting the state of the server <a title="here" href="http://stormy-chamber-1319.herokuapp.com/flush" target="_blank">here</a> and refreshing both pages.
</p>

<p style="text-align: left;">
  I have been working on my 13&#8221; MacBook and the site is not responsive, so you may need to adjust your browser windows accordingly. I can&#8217;t cover everything that I would like to here, so I will just touch on a couple of things that I learned along the way.
</p>

<p style="text-align: left;">
  <strong>Polling the server</strong>
</p>

<p style="text-align: left;">
  Express makes it very easy to build web applications with Node.js. I set up one endpoint for the iOS application to hit and another for the web applications to poll. Both are able to reference the same variable in order to maintain state. To communicate with cross-domain client-side JavaScript, I used the following command:
</p>

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="javascript" style="font-family:monospace;">app.<span style="color: #660066;">enable</span><span style="color: #009900;">&#40;</span><span style="color: #3366CC;">"jsonp callback"</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span></pre>
      </td>
    </tr>
  </table>
</div>

Responding with json is simple:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="javascript" style="font-family:monospace;">response.<span style="color: #660066;">json</span><span style="color: #009900;">&#40;</span><span style="color: #009900;">&#123;</span>value<span style="color: #339933;">:</span><span style="color: #3366CC;">"zero"</span><span style="color: #009900;">&#125;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span></pre>
      </td>
    </tr>
  </table>
</div>

<p style="text-align: left;">
  jQuery callbacks can be tricky and working around the <a title="same-origin policy" href="http://en.wikipedia.org/wiki/Same_origin_policy" target="_blank">same-origin policy</a> can be too. To get around the same-origin policy using JSONP, I added this string to the end of the requested URL: &#8220;callback=?&#8221;. In the future, I would love to rebuild this app or something like it using <a title="WebSocket" href="http://en.wikipedia.org/wiki/WebSocket" target="_blank">WebSocket</a>.
</p>

<p style="text-align: left;">
  <strong>Animation challenges</strong>
</p>

<p style="text-align: left;">
  Most of the animation for this project was extremely simple, but I did have a hard time getting the knife to spin or rotate. I found that the CSS3 <a title="@keyframes" href="http://www.w3schools.com/css3/css3_animations.asp" target="_blank">@keyframes</a> rule was the best method here:
</p>

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="css" style="font-family:monospace;"><span style="color: #a1a100;">@-webkit-keyframes spinnerRotate {</span>
  from <span style="color: #00AA00;">&#123;</span>
    -webkit-transform<span style="color: #00AA00;">:</span>rotate<span style="color: #00AA00;">&#40;</span>0deg<span style="color: #00AA00;">&#41;</span><span style="color: #00AA00;">;</span>
  <span style="color: #00AA00;">&#125;</span>
  to <span style="color: #00AA00;">&#123;</span>
    -webkit-transform<span style="color: #00AA00;">:</span>rotate<span style="color: #00AA00;">&#40;</span>-360deg<span style="color: #00AA00;">&#41;</span><span style="color: #00AA00;">;</span>
  <span style="color: #00AA00;">&#125;</span>
<span style="color: #00AA00;">&#125;</span></pre>
      </td>
    </tr>
  </table>
</div>

And obviously this can be implemented on demand using jQuery:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="javascript" style="font-family:monospace;">$<span style="color: #009900;">&#40;</span><span style="color: #3366CC;">"#knife"</span><span style="color: #009900;">&#41;</span>.<span style="color: #660066;">css</span><span style="color: #009900;">&#40;</span><span style="color: #009900;">&#123;</span><span style="color: #3366CC;">"webkit-animation-name"</span><span style="color: #339933;">:</span> <span style="color: #3366CC;">"spinnerRotate"</span><span style="color: #009900;">&#125;</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span></pre>
      </td>
    </tr>
  </table>
</div>

<p style="text-align: left;">
  <strong>Cropping for programmers</strong>
</p>

<p style="text-align: left;">
  OK, great.. You made something spin. But what if you aren&#8217;t very good with Photoshop (like me) and you are better at lambda calculus than cropping images? I want to introduce you to the <a title="free selection tool" href="http://docs.gimp.org/en/gimp-tool-free-select.html" target="_blank">free selection tool</a>.
</p>

<p style="text-align: left;">
  I was using GIMP in this case, but I think the equivalent tool in Photoshop also has a lasso on the icon. Just add dots around the irregular shape that you want to crop, copy it, and paste it onto a transparent background. Don&#8217;t forget to modify the z-index if you want your newly cropped image to sit on top of another one in the background:
</p>

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="css" style="font-family:monospace;"><span style="color: #000000; font-weight: bold;">z-index</span><span style="color: #00AA00;">:</span> <span style="color: #cc66cc;">1</span><span style="color: #00AA00;">;</span></pre>
      </td>
    </tr>
  </table>
</div>

That is it! Please let me know if I have butchered anything 😉