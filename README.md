# 🚀 Ruby on Rails Tutorial + Docker Wrapper Walkthrough

Welcome to my walkthrough of the **Ruby on Rails Tutorial (6th Edition)** — powered by a custom Docker wrapper based on [Shannarra’s Rails 7 template](https://github.com/Shannarra/rails7template).

This repo combines my learnings from the book with a pre-built Docker-based Rails 7 environment. I'm actively studying and modifying this as I build the toy app, track progress, and add real-world notes from my dev environment.

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

## 🧪 My Book Progress + Notes

### ✅ Chapter Checklist

| Chapter | Topic                 | Status | Notes                                            |
| ------: | --------------------- | ------ | ------------------------------------------------ |
|       1 | Introduction & Setup  | ✅      | Used Docker wrapper instead of manual Ruby setup |
|       2 | Toy App Basics        | 🚧     | Building views, controllers inside container     |
|       3 | Mostly Static Pages   | 🔲     | Templating and routes under Docker               |
|       4 | Rails-Flavored Ruby   | 🔲     | Plan to mirror examples in IRB via container     |
|       5 | Filling in the Layout | 🔲     | Use importmaps with Stimulus for interactivity   |

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
[http://localhost:3000](http://localhost:3000)

Rails Console:

```bash
docker compose exec web bin/rails c
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

## 📖 Key References

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

* **Lesson Learned (Week 1):** Using Docker saves tons of setup time, but can be a pain when resolving git conflicts inside mounted volumes.
* **Docker Tip:** If you're editing code inside the container, always run `chmod -R 777 tmp` if weird caching issues show up.
* **Rails Tip:** The `importmap` + Turbo combo is nice, but gets tricky when you're following a book written before Rails 7.

---

## 🙏 Credits

Original template by **[Shannarra](https://github.com/Shannarra)**
Starter app inspired by [rails7template](https://github.com/Shannarra/rails7template)

---

🎓 *Built while learning with the Ruby on Rails Tutorial (6th Ed.) — with Docker on my side.*
