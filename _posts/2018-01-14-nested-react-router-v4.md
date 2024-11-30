---
layout: post
title:  "Nested React Routes in v4"
date:  2018-01-14-nested-react-router-v4.md
permalink: /:title/
---

Using `render` instead of `component` in React Router v4 works for plain old child components, but not when your child component is a nested `Route`. In [this example](https://github.com/seanhelvey/react-router-quickstart-nested-routes/) I've taken the react router quickstart tweaked it to pass props into a wrapped route.

```

const WrappedRoute = (props) => {
  console.log("WrappedRoute props", props)
  return(
    <div>
      <h3>{props.yo()}</h3>
      <Route path={`${props.match.path}/:topicId`} render={Topic}/>
    </div>
  );
}

<WrappedRoute yo={() => "yo"} {...props}></WrappedRoute>

```

Please [Let me know](https://twitter.com/seanhelvey) if you disagree with this approach or have a better alternative. Hope this helps!
