
# 🚀 Neovim Setup for React & React Native Developers

Modern, minimal and blazing fast Neovim configuration optimized for **React** and **React Native** development.

> ✅ One-command setup  
> ✅ Beautiful UI and useful shortcuts  
> ✅ Format on save, Git integration, TODO tracking and more

---

## 📦 Features

- 🔍 **Fuzzy file & text search** (Telescope)
- ✨ **LSP + Autocomplete** with icons (nvim-cmp + lspkind + luasnip)
- 💅 **Prettier** Format-on-Save
- 🔧 **Git integration** (gitsigns + neogit)
- 📝 **TODO/FIXME/NOTE** comment highlighting (todo-comments)
- 🎨 **Live color highlighting** (nvim-colorizer)
- 🧠 **Dynamic keybind popup** (which-key)

---

## ⚙️ Installation

### 1. Install dependencies (macOS example)

```bash
brew install neovim ripgrep node
npm install -g prettier typescript typescript-language-server
```

---

### 2. Clone the config

```bash
git clone https://github.com/your-username/nvim-config ~/.config/nvim
```

Or download ZIP and extract into:

```
~/.config/nvim/
```

---

### 3. Launch Neovim and install plugins

```vim
:PlugInstall
```

---

## ⌨️ Keybindings

| Shortcut        | Action                             |
|----------------|------------------------------------|
| `<Space>ff`     | Find file                          |
| `<Space>fg`     | Live grep (search in code)         |
| `<Space>fb`     | Switch between open buffers        |
| `<Space>gg`     | Open Neogit Git panel              |
| `<Space>td`     | List TODO/FIXME/NOTE comments      |

---

## 💾 Format on Save

Prettier will auto-format the following files when saving:

`.ts`, `.tsx`, `.js`, `.jsx`, `.json`, `.css`, `.md`

Settings are in `.prettierrc`:

```json
{
  "semi": true,
  "singleQuote": true,
  "trailingComma": "all",
  "printWidth": 80
}
```

---

## 🔥 Screenshot

![image](https://github.com/user-attachments/assets/e1ab0be0-2c8c-4541-b4f8-edab1be24774)


---

## 🛠️ Customization

You can add more plugins or tweak settings in `init.vim`. Contributions welcome!

---

## 🧙‍♂️ Made for Developers Who Want Superpowers

Minimal but powerful. Beautiful but fast. Your new favorite editor is ready.
