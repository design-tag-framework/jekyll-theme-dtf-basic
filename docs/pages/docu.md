---
permalink: /documentation
layout: page
---

<h1>{{ site.title }} Documentation</h1>

Contents:

* toc
{:toc}

For Theme developers, have a look at the DTF plugin [TODO]().

## Installation

Add this line to your Jekyll site's `Gemfile`:

```ruby
gem "jekyll-theme-dtf-basic"
```

And add this line to your Jekyll site's `_config.yml`:

```yaml
theme: jekyll-theme-dtf-basic
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install jekyll-theme-dtf-basic
```

## General Usage


### Navigation

Put the main navigation under `_data/navigation.yml`, e.g.:

```yaml
- title: Home
  url: /
```

### Layouts

Available Layouts:

- `page`: A minimalistic page
- `post`: The page extended with general post styling, e.g., displaying the title, date, image, etc.

### Responsive Image Generation

Will use imagemagick for responsive images, put these images under `assets/img`. The {% raw %}{% picture_element %}{% endraw %} will load pictures based on the device width.

### Pagination

The theme uses `octopress-paginate` (see [USAGE](https://github.com/octopress/paginate#usage))to allow for pagination of collections. To introduce a paginated site configure it in the front yaml of a page, e.g.:

```yaml
paginate:
    collection: projects
```

### Github Pages

This theme requires several Gems not whitelisted by Github Pages. You can use an Action like [jekyll-build-pages](https://github.com/actions/jekyll-build-pages) instead.


### Other configuration options

Useful configuration options:

```yaml
lang: en

# brand_icon is used as favicon if generate_favicon == false
# default brand text is the title
brand:
  image: "assets/dtf_brand.svg"
  brand_icon:
  text:

# If you have multiple authors you can display them on projects/posts/etc.
show_authors: true

# Display the top 5 related posts
show_related_posts: true

# Activate optional dark mode, currently only "auto" is working
dark_mode: "auto"

# A Text prepended to the footer
footer: "© Markus Sosnowski"

# Generate Favicons from the brand.image
generate_favicon: true

# Generate collections from folders, like _projects
collections:
  projects:
    output: true
```

### Dark Mode and Cookies

The theme uses cookies to save the preference for the dark mode. It should be fine to not have a cookie banner for these cookies, as they contain no personal data and are required for the function of the website, however, I am not a legal advisor and cannot guarantee anything.
If you have doubts, deactivate the dark-mode.

## Using the Design Tags

The concept is simple, the theme provides `design_element`s that can be used in the different pages. A `design_element` is usually grouped in a `design_group`. For example,

{% highlight liquid %}{% raw %}
{% design_group title="My Group" %}
{% design_element title="Element 1" %}
{% enddesign_group %}
{% endraw %}{% endhighlight %}

Instead of setting each argument as parameters, we can instead give a variable.
For instance, we might to display elements of a collection or our posts, a quick and easy way to display this would be:

{% highlight liquid %}{% raw %}
{% design_group title="My Group" %}
{% for post in site.posts %}
{% design_element post %}
{% endfor %}
{% enddesign_group %}
{% endraw %}{% endhighlight %}

The DTF comes with several pre-defined tags that can be directly used, these are inspired by common design elements found on different Jekyll websites.
The logic is almost the same, but the theme can display them differently.
The parameter values are theme specific.

| Tag | Description | Parameters |
|---|---|
| `post_group` | A collection of posts. An optional `link` parameter allows to display a link to a posts archive | `title`, `link` |
| `post_element` | A single post | `title`, `author`, `url`, `date`, optional: `description`, `teaser-image`, `image` |
| `project_group` | A collection of projects. An optional `link` parameter allows to display a link to the collection | `title`, `link` |
| `project_element` | A single project | `title`, optional: `author`, `url`, `image`, `description` |
| `feature_group` | A collection of featuers | `title`, optional: `link` |
| `feature_element` | A single feature | `title`, optional: `url`, `description`, `icon` (path), `icon-class` (a font awesome CSS class) |
| `alert_box` | An alert box, needs to be closed with a liquid `endalert_box` tag | optional: `variant` |
| `author_element` | An element to display information of the current author. See <a href="#authorlogic">Author Logic</a>. | requires `author.name`, optional: `author.picture`, `author.url`, `author.description` |
| `picture_element` | A responsive picture | `src`, `alt`, optional: `size-hint`, `height`, `class` |

{% alert_element variant="danger" %}
Make sure you don't use indents between the `design_group` tags, as this would cause the markdown parser to treat it as code and render it incorrectly!
{% endalert_element %}

For example, the following code would not work and produce an error!

{% highlight liquid %}{% raw %}
{% design_group title="My Group" %}
    {% for post in site.posts %}
        {% design_element post %}
    {% endfor %}
{% enddesign_group %}
{% endraw %}{% endhighlight %}

### The Feature Design Elements

display features with straightforward liquid tags, e.g.,

{% highlight liquid %}{% raw %}
{% feature_group title="Our Features" %}

{% feature_element title="Intuitive Elements" icon-class="fa-solid fa-check" description="Description" %}
{% feature_element title="Good Design" icon-class="fa-solid fa-check" description="Description" %}
{% feature_element title="Documentation" icon-class="fa-solid fa-book" description="It even has a Documentation" url="/documentation" %}
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

If you have a page for every feature, you could create a collection and loop over that, just like the projects in the next example.

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

<h3 id="authorlogic">Author Logic</h3>

Each post should have an author. This theme uses the logic of the [Jekyll SEO Tag](https://github.com/jekyll/jekyll-seo-tag), which means:

1. The author is defined in `page.author`, if empty `site.author` is used.
2. If the author is a YAML object, it is directly used, if it is a string, the corresponding entry in `_data/authors.yml` is loaded.

The logic is used by several elements, like the `author_element`:
{% highlight liquid %}{% raw %}
{% author_element %}
{% endraw %}{% endhighlight %}

which will render as:

{% author_element %}
