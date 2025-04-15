# 📝 Local WordPress to GitHub Pages

This project lets you run a WordPress site **locally using Docker**, and optionally **export it as a static website** for deployment (e.g. GitHub Pages).

---

## 📦 Requirements

Make sure the following are installed on your system:

- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- [Node.js](https://nodejs.org/) (v16+ recommended)
- [npm](https://www.npmjs.com/) (comes with Node.js)
- Git (optional, for cloning repo)

---

## 🚀 Getting Started

### 🧑‍💻 1. Clone the repository

```bash
git clone https://github.com/khairulazry/local-wordpress-to-github-pages.git
cd local-wordpress-to-github-pages
```

### 📦 2. Install dependencies

```bash
npm install
```

### 🐳 3. Start the WordPress environment

```bash
npm start
```
> This starts WordPress and MySQL via Docker Compose.

[^1]: This is the footnote.

### 🌐 4. Access your WordPress site
Open your browser and go to:
```arduino
http://localhost:8000
```

---

## 📁 Project Structure
```bash
.
├── wp-content/        # WordPress themes & plugins
├── docs/              # Static export (for GitHub Pages)
├── Dockerfile         # Custom image with WP-CLI
├── docker-compose.yml # Docker setup
├── scripts/export.sh  # Static site export script
├── package.json       # NPM scripts
└── README.md
```

---

## 🧰 Available Commands
| Command | Description |
| ----------- | ----------- |
| `npm start` | Starts Docker containers for WordPress + MySQL |
| `npm run stop` | Stops all running Docker containers |
| `npm run build` |Exports static site to `./docs` (includes CNAME if available)|

---

## 🛠 Static Site Export
To generate a static version of your WordPress site:
```bash
npm run build
```
- Output will be placed in the `/docs` folder
- A `CNAME` file with `www.yourdomainname.com` will be created for GitHub Pages (if you set a CNAME inside `scripts/export.sh`)

---

## 🌐 GitHub Pages Deployment
1. Push your repo to GitHub
2. In GitHub → Repo Settings → Pages:
    1. Source: `Deploy from branch`
    2. Branch: `main` (or `master`)
    3. Folder: `/docs`
> ✅ After a few minutes, your static site will be live at https://yourusername.github.io/your-repo-name/
---

## 👤 Author
[Khairul Azry](https://www.khairulazry.com/)