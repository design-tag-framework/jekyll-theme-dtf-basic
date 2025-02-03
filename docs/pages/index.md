---
permalink: /
layout: page
---

# {{ site.title }}

{{ site.description }}

### The Feature Design Elements

display features with straightforward liquid tags, e.g.,

{% highlight liquid %}{% raw %}
{% feature_group title="Our Features" %}

{% feature_element title="Intuitive Elements" icon-class="fa-solid fa-check" description="Description" %}
{% feature_element title="Good Design" icon-class="fa-solid fa-check" description="Description" %}
{% feature_element title="Documentation" icon-class="fa-solid fa-book" description="Also supports links!" url="/documentation" %}
{% feature_element title="Another Feature" icon-class="fa-solid fa-check" description="Description" %}
{% feature_element title="Another Feature" icon-class="fa-solid fa-check" description="Description" %}
{% feature_element title="Another Feature" icon-class="fa-solid fa-check" description="Description" %}

{% endfeature_group %}
{% endraw %}{% endhighlight %}

will produce a grid like this

{% feature_group title = "Our Features" %}
{% feature_element title = "Intuitive Elements" icon-class = "fa-solid fa-check" description = "Description" %}
{% feature_element title = "Good Design" icon-class = "fa-solid fa-check" description = "Description" %}
{% feature_element title="Documentation" icon-class="fa-solid fa-book" description="It even has a Documentation" url="/documentation" %}
{% feature_element title = "Another Feature" icon-class = "fa-solid fa-check" description = "Description" %}
{% feature_element title = "Another Feature" icon-class = "fa-solid fa-check" description = "Description" %}
{% feature_element title = "Another Feature" icon-class = "fa-solid fa-check" description = "Description" %}
{% endfeature_group %}

### The Project Feature Tag

To display a collection of projects you can use this:

{% highlight liquid %}{% raw %}
{% project_group title = "Latest Projects" link = "/projects" %}
{% for project in site.projects limit: 5 %}
{% project_element project %}
{% endfor %}
{% endproject_group %}
{% endraw %}{% endhighlight %}

This would result in cards like this:

{% project_group title = "Latest Projects" link = "/projects" %}
{% for project in site.projects limit: 5 %}
{% project_element project %}
{% endfor %}
{% endproject_group %}

### The Post Feature Tag

To display a the latest 5 posts you can use this:

{% highlight liquid %}{% raw %}
{% post_group title = "Latest Posts" link = "/posts" %}
{% for post in site.posts limit: 5 %}
{% post_element post %}
{% endfor %}
{% endpost_group %}
{% endraw %}{% endhighlight %}

For this theme, this would look like this:

{% post_group title = "Latest Posts" link = "/posts" %}
{% for post in site.posts limit: 5 %}
{% post_element post %}
{% endfor %}
{% endpost_group %}

