---
id: 506
title: Foo Bar Baz
date: 2014-02-22T17:20:08+00:00
author: Sean
layout: post
guid: http://www.seanhelvey.com/?p=506
permalink: /foo-bar-baz/
categories:
  - Potpourri
  - Technology
---
There you are in your first computer science class. Intimidated by all of the brain power in the room and confused by the professor who is attempting to teach Python, you are afraid to ask questions and seem stupid. She presents an example:

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="python" style="font-family:monospace;"><span style="color: #ff7700;font-weight:bold;">def</span> baz<span style="color: black;">&#40;</span><span style="color: black;">&#41;</span>:
    a_dict <span style="color: #66cc66;">=</span> <span style="color: black;">&#123;</span><span style="color: #483d8b;">'a'</span>: <span style="color: #ff4500;">1</span><span style="color: black;">&#125;</span>
    <span style="color: #ff7700;font-weight:bold;">return</span> foo<span style="color: black;">&#40;</span>a_dict<span style="color: black;">&#41;</span>
&nbsp;
<span style="color: #ff7700;font-weight:bold;">def</span> bar<span style="color: black;">&#40;</span>*args<span style="color: #66cc66;">,</span> **kwargs<span style="color: black;">&#41;</span>:
    <span style="color: #008000;">sum</span> <span style="color: #66cc66;">=</span> <span style="color: #ff4500;"></span>
    <span style="color: #ff7700;font-weight:bold;">for</span> key<span style="color: #66cc66;">,</span> value <span style="color: #ff7700;font-weight:bold;">in</span> kwargs.<span style="color: black;">items</span><span style="color: black;">&#40;</span><span style="color: black;">&#41;</span>:
        <span style="color: #008000;">sum</span> +<span style="color: #66cc66;">=</span> value
    <span style="color: #ff7700;font-weight:bold;">return</span> <span style="color: #008000;">sum</span>
&nbsp;
<span style="color: #ff7700;font-weight:bold;">def</span> foo<span style="color: black;">&#40;</span>a_dict<span style="color: black;">&#41;</span>:
    a_dict.<span style="color: black;">update</span><span style="color: black;">&#40;</span><span style="color: black;">&#123;</span><span style="color: #483d8b;">'b'</span>:<span style="color: #ff4500;">2</span><span style="color: black;">&#125;</span><span style="color: black;">&#41;</span>
    <span style="color: #ff7700;font-weight:bold;">return</span> bar<span style="color: black;">&#40;</span>**a_dict<span style="color: black;">&#41;</span></pre>
      </td>
    </tr>
  </table>
</div>

Don&#8217;t worry.. After years of computer science coursework and professional experience as a software developer, my eyes still glaze over when people use foo, bar, and baz. Why? People will tell you that these <a title="Placeholder name" href="http://en.wikipedia.org/wiki/Placeholder_name" target="_blank">placeholder names</a> (also referred to as <a title="Metasyntactic variable" href="http://en.wikipedia.org/wiki/Metasyntactic_variable" target="_blank">metasyntactic variables</a>) are meaningless and only used to demonstrate a concept.

<div style="width: 410px" class="wp-caption alignnone">
  <a href="http://25.media.tumblr.com/fc73c134f49433879e8b1f73f380cf42/tumblr_mta08g0xU01s7zcqdo2_400.gif"><img alt="Confused" src="http://25.media.tumblr.com/fc73c134f49433879e8b1f73f380cf42/tumblr_mta08g0xU01s7zcqdo2_400.gif" width="400" height="224" /></a>
  
  <p class="wp-caption-text">
    Confused
  </p>
</div>

For most humans, this is confusing. Naming things is important in software development, education, and just about any other aspect of life. Supposedly the name is unimportant because we are focusing on one particular part of the example, but I like understandable names for at least three reasons:

  1. The habit of using meaningful names is important to develop
  2. Real function and variable names give context to the example
  3. People tune out when they see that you are using fake names

Foo, bar, and baz are a distraction. If I had to choose a function or variable name that meant nothing, I would prefer a single letter like &#8220;a&#8221; or &#8220;b&#8221;, because at least that is explicitly unimportant.

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="python" style="font-family:monospace;"><span style="color: #ff7700;font-weight:bold;">def</span> a<span style="color: black;">&#40;</span><span style="color: black;">&#41;</span>:
    a_dict <span style="color: #66cc66;">=</span> <span style="color: black;">&#123;</span><span style="color: #483d8b;">'a'</span>: <span style="color: #ff4500;">1</span><span style="color: black;">&#125;</span>
    <span style="color: #ff7700;font-weight:bold;">return</span> b<span style="color: black;">&#40;</span>a_dict<span style="color: black;">&#41;</span>
&nbsp;
<span style="color: #ff7700;font-weight:bold;">def</span> c<span style="color: black;">&#40;</span>*args<span style="color: #66cc66;">,</span> **kwargs<span style="color: black;">&#41;</span>:
    <span style="color: #008000;">sum</span> <span style="color: #66cc66;">=</span> <span style="color: #ff4500;"></span>
    <span style="color: #ff7700;font-weight:bold;">for</span> key<span style="color: #66cc66;">,</span> value <span style="color: #ff7700;font-weight:bold;">in</span> kwargs.<span style="color: black;">items</span><span style="color: black;">&#40;</span><span style="color: black;">&#41;</span>:
        <span style="color: #008000;">sum</span> +<span style="color: #66cc66;">=</span> value
    <span style="color: #ff7700;font-weight:bold;">return</span> <span style="color: #008000;">sum</span>
&nbsp;
<span style="color: #ff7700;font-weight:bold;">def</span> b<span style="color: black;">&#40;</span>a_dict<span style="color: black;">&#41;</span>:
    a_dict.<span style="color: black;">update</span><span style="color: black;">&#40;</span><span style="color: black;">&#123;</span><span style="color: #483d8b;">'b'</span>:<span style="color: #ff4500;">2</span><span style="color: black;">&#125;</span><span style="color: black;">&#41;</span>
    <span style="color: #ff7700;font-weight:bold;">return</span> c<span style="color: black;">&#40;</span>**a_dict<span style="color: black;">&#41;</span></pre>
      </td>
    </tr>
  </table>
</div>

Alternatively, you could use nonsensical names other than foo, bar, or baz. Even if the function name is unrelated to the specific issue that a teacher is trying to convey, the fact that it is a common word will allow the student to focus on what is being emphasized.

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="python" style="font-family:monospace;"><span style="color: #ff7700;font-weight:bold;">def</span> apple<span style="color: black;">&#40;</span><span style="color: black;">&#41;</span>:
    a_dict <span style="color: #66cc66;">=</span> <span style="color: black;">&#123;</span><span style="color: #483d8b;">'a'</span>: <span style="color: #ff4500;">1</span><span style="color: black;">&#125;</span>
    <span style="color: #ff7700;font-weight:bold;">return</span> banana<span style="color: black;">&#40;</span>a_dict<span style="color: black;">&#41;</span>
&nbsp;
<span style="color: #ff7700;font-weight:bold;">def</span> carrot<span style="color: black;">&#40;</span>*args<span style="color: #66cc66;">,</span> **kwargs<span style="color: black;">&#41;</span>:
    <span style="color: #008000;">sum</span> <span style="color: #66cc66;">=</span> <span style="color: #ff4500;"></span>
    <span style="color: #ff7700;font-weight:bold;">for</span> key<span style="color: #66cc66;">,</span> value <span style="color: #ff7700;font-weight:bold;">in</span> kwargs.<span style="color: black;">items</span><span style="color: black;">&#40;</span><span style="color: black;">&#41;</span>:
        <span style="color: #008000;">sum</span> +<span style="color: #66cc66;">=</span> value
    <span style="color: #ff7700;font-weight:bold;">return</span> <span style="color: #008000;">sum</span>
&nbsp;
<span style="color: #ff7700;font-weight:bold;">def</span> banana<span style="color: black;">&#40;</span>a_dict<span style="color: black;">&#41;</span>:
    a_dict.<span style="color: black;">update</span><span style="color: black;">&#40;</span><span style="color: black;">&#123;</span><span style="color: #483d8b;">'b'</span>:<span style="color: #ff4500;">2</span><span style="color: black;">&#125;</span><span style="color: black;">&#41;</span>
    <span style="color: #ff7700;font-weight:bold;">return</span> carrot<span style="color: black;">&#40;</span>**a_dict<span style="color: black;">&#41;</span></pre>
      </td>
    </tr>
  </table>
</div>

Better yet, instead of using an arbitrary block of code to illustrate your point, find a real example that someone might actually encounter. It will take more time to come up with something that makes sense, but the person you are trying to help will be able to remember what you are telling them.

In the examples above, my friend was trying to explain the power of <a title="keyword arguments" href="http://docs.python.org/2/tutorial/controlflow.html#keyword-arguments" target="_blank">keyword arguments</a> in Python. If you were going to write production quality code, would you use function names like foo, bar, and baz? Also, wouldn&#8217;t you include comments for other developers and docstrings explaining methods?

<div class="wp_syntax">
  <table>
    <tr>
      <td class="code">
        <pre class="python" style="font-family:monospace;"><span style="color: #ff7700;font-weight:bold;">def</span> generate_class_report<span style="color: black;">&#40;</span>class_name<span style="color: #66cc66;">,</span> student_grades<span style="color: #66cc66;">,</span> *arguments<span style="color: #66cc66;">,</span> **keywords<span style="color: black;">&#41;</span>:
    <span style="color: #483d8b;">"""generate a class report.
&nbsp;
    required arguments:
    class_name -- a string such as "biology"
    student_grades -- a dict of names and grades {"billy": 105, "jean": 64}
&nbsp;
    optional keyword arguments:
    anything relevant to the report can be included here. in the past teachers
    have used class_pet, favorite_game, statement_of_purpose, etc.
    """</span>
&nbsp;
    class_report <span style="color: #66cc66;">=</span> <span style="color: black;">&#123;</span><span style="color: black;">&#125;</span>
    average_grade <span style="color: #66cc66;">=</span> calculate_average_grade<span style="color: black;">&#40;</span>student_grades<span style="color: black;">&#41;</span>
    class_report.<span style="color: black;">update</span><span style="color: black;">&#40;</span><span style="color: black;">&#123;</span><span style="color: #483d8b;">"average_grade"</span>: average_grade<span style="color: black;">&#125;</span><span style="color: black;">&#41;</span>
&nbsp;
    <span style="color: #808080; font-style: italic;">#if this is not done, the arguments are printed in an undefined order</span>
    keys <span style="color: #66cc66;">=</span> <span style="color: #008000;">sorted</span><span style="color: black;">&#40;</span>keywords.<span style="color: black;">keys</span><span style="color: black;">&#40;</span><span style="color: black;">&#41;</span><span style="color: black;">&#41;</span>
    <span style="color: #ff7700;font-weight:bold;">for</span> kw <span style="color: #ff7700;font-weight:bold;">in</span> keys:
        class_report.<span style="color: black;">update</span><span style="color: black;">&#40;</span><span style="color: black;">&#123;</span>kw: keywords<span style="color: black;">&#91;</span>kw<span style="color: black;">&#93;</span><span style="color: black;">&#125;</span><span style="color: black;">&#41;</span>
&nbsp;
    <span style="color: #ff7700;font-weight:bold;">return</span> class_report
&nbsp;
<span style="color: #ff7700;font-weight:bold;">def</span> calculate_average_grade<span style="color: black;">&#40;</span>student_grades<span style="color: black;">&#41;</span>:
    <span style="color: #008000;">sum</span> <span style="color: #66cc66;">=</span> <span style="color: #ff4500;"></span>
    <span style="color: #ff7700;font-weight:bold;">for</span> key<span style="color: #66cc66;">,</span> value <span style="color: #ff7700;font-weight:bold;">in</span> student_grades.<span style="color: black;">items</span><span style="color: black;">&#40;</span><span style="color: black;">&#41;</span>:
        <span style="color: #008000;">sum</span> +<span style="color: #66cc66;">=</span> value
    <span style="color: #ff7700;font-weight:bold;">return</span> <span style="color: #008000;">sum</span> / <span style="color: #008000;">float</span><span style="color: black;">&#40;</span><span style="color: #008000;">len</span><span style="color: black;">&#40;</span>student_grades<span style="color: black;">&#41;</span><span style="color: black;">&#41;</span>
&nbsp;
class_report <span style="color: #66cc66;">=</span> generate_class_report<span style="color: black;">&#40;</span><span style="color: #483d8b;">"underwater basket weaving"</span><span style="color: #66cc66;">,</span>
                                     <span style="color: black;">&#123;</span><span style="color: #483d8b;">"sean"</span>: <span style="color: #ff4500;">44</span><span style="color: #66cc66;">,</span> <span style="color: #483d8b;">"nick"</span>: <span style="color: #ff4500;">99</span><span style="color: #66cc66;">,</span> <span style="color: #483d8b;">"cara"</span>: <span style="color: #ff4500;">73</span><span style="color: black;">&#125;</span><span style="color: #66cc66;">,</span>
                                     teaching_assistant<span style="color: #66cc66;">=</span><span style="color: #483d8b;">"henry winkler"</span><span style="color: #66cc66;">,</span>
                                     big_field_trip<span style="color: #66cc66;">=</span><span style="color: #483d8b;">"the zoo"</span><span style="color: black;">&#41;</span>
&nbsp;
<span style="color: #ff7700;font-weight:bold;">print</span> class_report
&nbsp;
this will generate the following output:
<span style="color: black;">&#123;</span><span style="color: #483d8b;">'average_grade'</span>: <span style="color: #ff4500;">72.0</span><span style="color: #66cc66;">,</span> <span style="color: #483d8b;">'big_field_trip'</span>: <span style="color: #483d8b;">'the zoo'</span><span style="color: #66cc66;">,</span> <span style="color: #483d8b;">'teaching_assistant'</span>: <span style="color: #483d8b;">'henry winkler'</span><span style="color: black;">&#125;</span></pre>
      </td>
    </tr>
  </table>
</div>

It is ok if you love using foo, bar, and baz. At least consider that everyone learns differently and focuses on certain things. Believe it or not, it took me a long time to come up with the last example (maybe 15m). Professional engineers don&#8217;t always have that kind of time and there are usually great docs that people can refer to instead. However, if you are going to take the time to try and teach someone, make it memorable.