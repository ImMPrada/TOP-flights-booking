# README

## Local Setup Instructions

Clone the repo
```bash
git clone git@github.com:ImMPrada/TOP-flights-booking.git
```

Install ruby. rbenv is recommended
```bash
rbenv install 3.2.2
```

Install ruby dependencies
```bash
bundle install
```

Set up the DB
```bash
rails db:create
rails db:migrate
```
please run the seeds, to have some basic db data
```bash
rails db:seed
```

Build tailwind styles:
```bash
rails tailwindcss:build
```
or instead of that, you can observe changes you make to styles with:
```bash
rails tailwindcss:watch
```

Start a server:
```bash
rails s
```
