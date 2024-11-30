---
layout: post
title:  "Ejected create-react-app not working on Heroku"
date:  2018-03-11
permalink: /:title/
---

This post is for everyone learning React out there. Weekend warriors, boot campers, and autodidacts.. I'm here for you! They told you not to do it, but you did it anyway.

<div class="sean-blog-image">
  <figure>
    <a href="http://carhumor.net/wp-content/uploads/2012/10/car-humor-funny-traffic-sign-one-way.jpg" target="_blank"><img alt="oneway" class=" lazyloaded" src="http://carhumor.net/wp-content/uploads/2012/10/car-humor-funny-traffic-sign-one-way.jpg">
    </a>
  <figcaption>
    Note: this is a one-way operation.
  </figcaption>
  </figure>
</div>

You used create-react-app followed by `npm run eject` and now your app doesn't work on Heroku. You google and find that the maintainers of create-react-app have no answers for you. Can you blame them? They are busy! So here we go:

### Make sure you are running the right build pack
If you have already deployed your app created with create-react-app to Heroku, you are probably using the create-react-app-buildpack. After ejecting, you will need to remove that buildpack and add the heroku/nodejs buildpack instead.

<div class="sean-blog-image">
  <figure>
    <a href="/assets/images/seanhelvey/2018/buildpacks.png" target="_blank"><img alt="buildpacks" class=" lazyloaded" src="/assets/images/seanhelvey/2018/buildpacks.png">
    </a>
  <figcaption>
    Heroku > App > Settings > Buildpacks
  </figcaption>
  </figure>
</div>

### Update your Procfile
This one is tricky because the create-react-app maintainers don't have the time to debug this Heroku issue for you. Also, they told you not to eject!

<div class="sean-blog-image">
  <figure>
    <a href="https://media.giphy.com/media/JGF7ctowtLGak/giphy.gif" target="_blank"><img alt="eject" class=" lazyloaded" src="https://media.giphy.com/media/JGF7ctowtLGak/giphy.gif">
    </a>
  <figcaption>
    Once you eject, you can’t go back!
  </figcaption>
  </figure>
</div>

But you did. So you need to update your procfile to something like `web: node scripts/start.js` instead of `web: react-scripts start`.

<div class="sean-blog-image">
  <figure>
    <a href="/assets/images/seanhelvey/2018/procfile.png" target="_blank"><img alt="procfile" class=" lazyloaded" src="/assets/images/seanhelvey/2018/procfile.png">
    </a>
  <figcaption>
    Update your Procfile
  </figcaption>
  </figure>
</div>

That should do it. Don't forget to take a look at your GitHub repo along the way and make sure your most recent changes made it up there. That may sound obvious, but it is something that can easily be overlooked in the heat of the moment. Hope this helps!
