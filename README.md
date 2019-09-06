# RailsSourcePath

In rails project, one common scenario is:

One form used to create or update an object can be routed from more than one page, when the object is created or updated, it should be redirected back to wherever it came from.

Rails `redirect_back` doesn't work in this case because:
- `redirect_back` in create/update action will go back to new/edit form.
- usually the form is re-rendered if any error exists, which basically breaks the `redirect_back`.

`rails-source-path` can hanlde this by explicily specifying the entry actions and remember the
previous route in `session` store, hence can be used later in the whole controller. Also a helper
method is providered so it can be used in view like `back` or `cancel` button.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_source_path'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_source_path

## Usage
```
class YourController < ApplicationController
  rails_source_path_entry_actions :new, :edit
  ...

  def create
    if @object.create
      redirect_to_source
    else
      ...
    end
  end

  def update
    if @object.save
      redirect_to_source
    else
      ...
    end
  end
end

# in your view/partial
link_to 'Cancel', rails_source_path, class: 'button'
```

Both `redirect_to_source` and `rails_source_path` accept an optional argument which is the path when there is no previous route remembered.

```
def rails_source_path(default_path = root_path)
def redirect_to_source(default_path = root_path)
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
