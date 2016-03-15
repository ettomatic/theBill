# theBill

A simple Bill page

## Local Setup
### Requiremens
First, you will need the version of Ruby defined in the .ruby-version file and bundler installed.

Now you're ready to setup the app:
```
gem install foreman
bundle install
cp .env.sample .env
```

Use this command to run the test suite:

```
bundle exec rspec
```

Run the app with:
```
foreman start
```

Now you can vist the page:
[http://127.0.0.1:9292/my/bill](http://127.0.0.1:9292/my/bill).


## Demo version

A demo version of the app is available here:
[http://guarded-peak-90382.herokuapp.com/my/bill](http://guarded-peak-90382.herokuapp.com/my/bill)

## Screenshots

Desktop & Mobile

![Desktop](https://raw.githubusercontent.com/ettomatic/theBill/master/docs/desktop_screenshot.jpg)
![Mobile](https://raw.githubusercontent.com/ettomatic/theBill/master/docs/mobile_screenshot.jpg)
