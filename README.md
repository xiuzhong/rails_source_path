# RailsSourcePath

In rails project, one common case is one form used to create or update
an object can be routed from more than one page, when the object is created or updated, it
should be redirected back to wherever it came from. Rails redirect_back doesn't work in this
case because: 1. redirect_back in create/update action will go back to new/edit form. 2.
usually the form is re-rendered if any error exists, which basically breaks the redirect_back.
rails-source-path can hanlde this by explicily specifying the entry actions and remember the
previous route in session store, hence can be used in the whole controller. Also a helper
method is providered so it can be used in view like 'back' or 'cancel' button.

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

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
