---
id: 218
title: Deploying Node.js on Heroku
date: 2013-02-25T04:17:10+00:00
author: Sean
layout: post
guid: http://www.seanhelvey.com/?p=218
permalink: /deploying-node-js-on-heroku/
categories:
  - Libraries and Frameworks
  - Technology
---
I encountered a few gotchas that I wanted to share while hacking on Node.js this weekend. The tutorials available at <a title="nodejs.org" href="http://nodejs.org/" target="_blank">nodejs.org</a> are extremely thorough and very helpful, but you may run into some of the same issues that I did when expanding from your basic &#8220;hello world&#8221; application. First we will discuss Node.js specifically and then we will move on to deployment with Heroku.

There are several frameworks that can be used to build web applications with Node, such as <a title="Express.js" href="http://expressjs.com/" target="_blank">Express.js</a> and <a title="Geddy" href="http://geddyjs.org/" target="_blank">Geddy</a>. To keep things simple, we will not be using any of them here. Instead we will be building a basic fibonacci calculator that accepts and parses a GET request using nothing but Node. Assuming your parameter is named &#8220;n&#8221;, the following code can be used within the body of http.createServer to parse the GET request:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="javascript" style="font-family:monospace;"><span style="color: #000066; font-weight: bold;">var</span> url <span style="color: #339933;">=</span> require<span style="color: #009900;">&#40;</span><span style="color: #3366CC;">'url'</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
<span style="color: #000066; font-weight: bold;">var</span> url_parts <span style="color: #339933;">=</span> url.<span style="color: #660066;">parse</span><span style="color: #009900;">&#40;</span>req.<span style="color: #660066;">url</span><span style="color: #339933;">,</span> <span style="color: #003366; font-weight: bold;">true</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
<span style="color: #000066; font-weight: bold;">var</span> query <span style="color: #339933;">=</span> url_parts.<span style="color: #660066;">query</span><span style="color: #339933;">;</span>
<span style="color: #000066; font-weight: bold;">var</span> n <span style="color: #339933;">=</span> query<span style="color: #009900;">&#91;</span><span style="color: #3366CC;">'n'</span><span style="color: #009900;">&#93;</span><span style="color: #339933;">;</span></pre>
      </td>
    </tr>
  </table>
</div>

Now that you are able to access the request parameter, you may notice in your debugging that the request is actually made twice each time you enter the url. If you are using Chrome, the browser will re-request favicon.ico on every single page call. The following code snippet will control for this:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="javascript" style="font-family:monospace;"><span style="color: #000066; font-weight: bold;">if</span> <span style="color: #009900;">&#40;</span><span style="color: #000066; font-weight: bold;">typeof</span> n <span style="color: #339933;">!=</span> <span style="color: #3366CC;">'undefined'</span><span style="color: #009900;">&#41;</span> <span style="color: #009900;">&#123;</span>
    res.<span style="color: #660066;">write</span><span style="color: #009900;">&#40;</span>fib<span style="color: #009900;">&#40;</span>n<span style="color: #009900;">&#41;</span> <span style="color: #339933;">+</span> <span style="color: #3366CC;">'<span style="color: #000099; font-weight: bold;">\n</span>'</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
<span style="color: #009900;">&#125;</span></pre>
      </td>
    </tr>
  </table>
</div>

Here is the recursive fibonacci function which is being called:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="javascript" style="font-family:monospace;"><span style="color: #000066; font-weight: bold;">function</span> fib<span style="color: #009900;">&#40;</span>n<span style="color: #009900;">&#41;</span><span style="color: #009900;">&#123;</span>
    <span style="color: #000066; font-weight: bold;">if</span><span style="color: #009900;">&#40;</span>n <span style="color: #339933;">==</span> <span style="color: #CC0000;"></span> <span style="color: #339933;">||</span> n <span style="color: #339933;">==</span> <span style="color: #CC0000;">1</span><span style="color: #009900;">&#41;</span><span style="color: #009900;">&#123;</span>
        <span style="color: #000066; font-weight: bold;">return</span> n<span style="color: #339933;">;</span>
    <span style="color: #009900;">&#125;</span> <span style="color: #000066; font-weight: bold;">else</span> <span style="color: #009900;">&#123;</span>
        <span style="color: #000066; font-weight: bold;">return</span> fib<span style="color: #009900;">&#40;</span>n<span style="color: #339933;">-</span><span style="color: #CC0000;">1</span><span style="color: #009900;">&#41;</span> <span style="color: #339933;">+</span> fib<span style="color: #009900;">&#40;</span>n<span style="color: #339933;">-</span><span style="color: #CC0000;">2</span><span style="color: #009900;">&#41;</span><span style="color: #339933;">;</span>
    <span style="color: #009900;">&#125;</span>
<span style="color: #009900;">&#125;</span></pre>
      </td>
    </tr>
  </table>
</div>

Feel free to skip ahead and grab the <a title="code" href="https://github.com/smh436/fib_node" target="_blank">code</a> from my GitHub repository if you would like to see the entire source. First though, let&#8217;s discuss a couple more issues which came about as I was deploying this application to Heroku. There is an excellent <a title="tutorial" href="https://devcenter.heroku.com/articles/nodejs" target="_blank">tutorial</a> which will get you up to speed in no time, but I would like to emphasize a few details that may help you along the way.

You can use the &#8220;engines&#8221; section of your app’s package.json to select the version of Node.js and npm to use on Heroku. However, be careful not to specify the most recent version of Node which isn&#8217;t yet supported on Heroku. To avoid this, an empty block can be used to choose the default settings instead of defining particular engines:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="javascript" style="font-family:monospace;"><span style="color: #009900;">&#123;</span>
  <span style="color: #3366CC;">"name"</span><span style="color: #339933;">:</span> <span style="color: #3366CC;">"fib_node"</span><span style="color: #339933;">,</span>
  <span style="color: #3366CC;">"version"</span><span style="color: #339933;">:</span> <span style="color: #3366CC;">"0.0.1"</span><span style="color: #339933;">,</span>
  <span style="color: #3366CC;">"dependencies"</span><span style="color: #339933;">:</span> <span style="color: #009900;">&#123;</span><span style="color: #009900;">&#125;</span><span style="color: #339933;">,</span>
  <span style="color: #3366CC;">"engines"</span><span style="color: #339933;">:</span> <span style="color: #009900;">&#123;</span><span style="color: #009900;">&#125;</span>
<span style="color: #009900;">&#125;</span></pre>
      </td>
    </tr>
  </table>
</div>

When I was developing my application locally, I hard-coded a port and an IP address, but this caused it to crash on Heroku. The port is discussed in the tutorial above, but in case you have also hard-coded an IP address, the following lines can be used to ensure that your application runs both locally and on Heroku:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="javascript" style="font-family:monospace;"><span style="color: #000066; font-weight: bold;">var</span> port <span style="color: #339933;">=</span> process.<span style="color: #660066;">env</span>.<span style="color: #660066;">PORT</span> <span style="color: #339933;">||</span> <span style="color: #CC0000;">5000</span><span style="color: #339933;">;</span>
<span style="color: #000066; font-weight: bold;">var</span> ip <span style="color: #339933;">=</span> <span style="color: #3366CC;">'0.0.0.0'</span><span style="color: #339933;">;</span></pre>
      </td>
    </tr>
  </table>
</div>

That is it! You can see the finished product <a title="here" href="http://fathomless-citadel-7964.herokuapp.com/?n=10" target="_blank">here</a>. Try passing different parameters in the GET request to see the resulting fibonacci number. Hopefully this fills in some of the gaps between developing a &#8220;hello world&#8221; application locally with Node.js and deploying a slightly more sophisticated application on Heroku.