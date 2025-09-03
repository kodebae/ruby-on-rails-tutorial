# 🚀 Ruby on Rails Tutorial | Study Companion
## by Michael Hartl (6th Edition)

Welcome to my walkthrough of the **Ruby on Rails Tutorial (6th Edition)** — quick started with a custom Docker wrapper built by [Shannarra’s Rails 7 template](https://github.com/Shannarra/rails7template).

This repo combines my learnings from the book but utilizes with a pre-built Docker-based Rails 7 environment. So there is added complexity there. This also allowed me to utilize hotwire and stimulus, which I will be adding an additional section for later on. I'm actively studying and modifying this as I build the toy app, track progress, and add real-world notes from my dev environment. Please be sure to refer to the repo linked above for more info on the Docker wrapper.

---

## 📚 About This Project

This Rails 7 app was bootstrapped using [Shannarra’s rails7template](https://github.com/Shannarra/rails7template), which includes:

* Rails 7 + Ruby 3
* PostgreSQL & Redis
* Bootstrap (via importmaps)
* Turbo + Stimulus + Hotwire
* Docker/Docker Compose setup
* Rubocop, Brakeman, and bundler-audit
* GitHub Actions for testing & CI

> Big thanks to **Shannarra** for providing such a solid launchpad — all credit for the original template belongs to them.
> [Link to original repo](https://github.com/Shannarra/rails7template)

---

## 📖 My Book Progress + Notes

* 

- Configured `.env` with correct external Render DATABASE_URL
- Fixed `docker-compose.yml` to respect `.env` via `env_file` for web service
- Resolved ActiveRecord connection issue by switching to external PG instead of default socket
- Ensured db:prepare runs cleanly with production ENV in Docker
- Verified working app at localhost:3000 with correct DB connection
- Scaffolded `User` model with name:string and email:string

### ✅ Chapter Checklist

| Chapter | Topic                 | Status | Notes                                            |
| ------: | --------------------- | ------ | ------------------------------------------------ |
|       1 | Introduction & Setup  | ✅     | What is RoR w/ setup, caveat: I used a Docker wrapper instead of manual Ruby setup |
|       2 | Toy App Basics        | 🧸     | Building views, controllers inside container     |
|       3 | Mostly Static Pages   | 🔲     | Using rails generate and understanding setup instructions TDD: Red-Green-Refactor            |
|       4 | Rails-Flavored Ruby   | 🛤️     | Plan to mirror examples in IRB via container     |
|       5 | Filling in the Layout | 🫥     | Use importmaps with Stimulus for interactivity   |

> *I'll keep expanding this section as I progress.*

---

## 🐳 Running the App (Docker Setup)

Start everything:

```bash
sh ./startup.sh --run
```

Or manually:

```bash
docker compose up
```

Then visit:
[localhost](http://localhost:3000)

Rails Console:

```bash
docker compose exec web bin/rails c
```
Must preface all rails console commands with the following in order to run rails inside of the Docker container:

```bash
docker compose run --rm web bin/
```

Tests:

```bash
docker compose run --rm web bin/rspec
```

---

## 🔐 Optional: Devise Auth Setup

Want built-in authentication?

```bash
sh startup.sh --devise
```

Or follow the [Devise setup](https://github.com/heartcombo/devise#getting-started) instructions manually.

---

## 🛠 Common Commands

**Update gems:**

```bash
docker compose run --rm web bundle
docker compose up --build
```

**Change timezone:**

Edit `.env`:

```env
TIMEZONE=America/New_York
```

**Production build:**

```bash
docker build -f production.Dockerfile .
```

---

## 🌍 Deploying to Render

Deploy via Render:

👉 [Deploy to Render](https://dashboard.render.com/login?next=%2Fblueprint%2Fnew%3Frepo%3Dhttps%3A%2F%2Fgithub.com%2FShannarra%2Frails7template)

Remember to:

```bash
bin/rails secret
```

Then set `SECRET_KEY_BASE` in your environment variables.

---

## 🔑 Key References


### Docker + Rails

* [Docker Quickstart for Rails](https://docs.docker.com/compose/rails/)
* [Ruby on Whales: Docker for Rails Dev](https://evilmartians.com/chronicles/ruby-on-whales-docker-for-ruby-rails-development)

### Rails 7 Hotwire Stack

* [Importmaps in Rails 7](https://www.youtube.com/watch?v=PtxZvFnL2i0)
* [Turbo + Stimulus = Hotwire](https://world.hey.com/dhh/stimulus-3-turbo-7-hotwire-1-0-9d507133)
* [Hotwire vs Rails UJS](https://www.driftingruby.com/episodes/hotwire-turbo-replacing-rails-ujs)

---

## ✍️ Personal Study Notes (WIP)

I'll keep this section updated with debugging tricks, gotchas, and reflections as I go.

* **Lesson Learned (Chapter 1):** Using the Docker wrapper saves tons of setup time once you figure it out, but can be a pain to set up. Utilizing hotwire/stimulus changed the answer for "hola, mundo!" Hint: you will need to modify a different type of controller, not the one mentioned in the book.
* **Docker Tip:** If you're editing code inside the container, always run `chmod -R 777 tmp` if weird caching issues show up.You will need to run rails console commands inside of the Docker container with my setup. I had to modify the Docker wrapper to make it work, please check the configurations in the relative files. I googled how to set up the Render deploy for my app and my PostgreSQL DB.
* **Rails Tip:** The `importmap` + Turbo combo is nice, but gets tricky when you're following a book written before Rails 7. You will need to rely heavily on outsiude resources.
* **Lesson Learned (Chapter 2):** Using the rails console to rapidly generate code is a helpful way to get up and running quickly. Active Record and AR associations are the foundation of our application and our DB. [Understanding Active Record Associations](https://youtu.be/5mhuNSkV_vQ?feature=shared)
* **Lesson Learned (Chapter 3):** We run bundle install to install and include the specified gems in the Gemfile. Rails actions come bundled together inside of controllers.
* **Rails Tip:** 'rails g' is short for 'rails generate'.'rails generate' and 'rails destroy' cancel each other out. Undo migrations with 'rails db:rollback' run migrations with 'rails db:migrate' go all the way back to the begining with 'rails db:migrate VERSION=0'
---

## 🙏 Credits

Original template by **[Shannarra](https://github.com/Shannarra)**
Starter app inspired by [rails7template](https://github.com/Shannarra/rails7template)

---

🎓 *Built while learning with the Ruby on Rails Tutorial (6th Ed.) — with Docker on my side.*
