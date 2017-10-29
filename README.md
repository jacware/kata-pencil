# kata-pencil

## Setup
1. Install **Ruby** (2.0+), if not already installed
2. Install the dependency manager **Bundler**, if not already installed: ``gem install bundler``
3. Install dependencies from the project directory: ``bundle install``

## Run tests
Run the following command from the project directory: ``bundle exec rake test``

## Command line application
Start the command line application by running: ``bundle exec ruby app.rb`` from the project directory

### Available commands
``print`` displays the current paper

``write`` appends an inputed string to the paper

``sharpen`` resets the pencils durabilty while decreasing its length (if applicable)

``erase`` replaces the last occurrence of the text provided with white space

``edit`` inserts the text provided in white space starting at the index provided

``exit`` terminates the application
