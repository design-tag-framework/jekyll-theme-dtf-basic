# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "jekyll-theme-dtf-basic"
  spec.version       = "0.0.2"
  spec.authors       = ["Markus Sosnowski"]
  spec.licenses      = ["CC-BY-NC-SA-4.0"]

  spec.summary       = "A beautiful and simple Jekyll theme based on the Design Tag Framework (DTF), mainly for showcasing the DTF features."
  spec.homepage      = "https://design-tag-framework.github.io/jekyll-theme-dtf-basic"

  spec.files         = `git ls-files -z`.split("\x0").select do |file|
    file.match(%r!^(assets|_data|_layouts|_includes|_sass|LICENSE|README|_config\.yml)!i)
  end

  spec.platform = Gem::Platform::RUBY

  spec.add_runtime_dependency "jekyll", ">= 4.3", "< 5.0"
  spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.7"
  spec.add_runtime_dependency "jekyll-design-tag-framework", "~> 0.0.2"
  spec.add_runtime_dependency "jekyll-imagemagick", "~> 1.4.0"
  spec.add_runtime_dependency "jekyll-archives", "~> 2.3.0"
  spec.add_runtime_dependency "jekyll-feed", "~> 0.17.0"
  spec.add_runtime_dependency "jekyll-sitemap", "~> 1.4"
  spec.add_runtime_dependency "classifier-reborn", "~> 2.3"
  spec.add_runtime_dependency "octopress-paginate", "~> 1.2"
  spec.add_runtime_dependency "jekyll-minifier", "~> 0.1.10"
end
