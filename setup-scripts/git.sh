# Git identity switcher
gitid() {
  case "$1" in
  gippo)
    git config user.name "gippo"
    git config user.email "gippo2026@outlook.com"
    ;;
  aryan)
    git config user.name "Aryan Shinde"
    git config user.email "aryanpshinde2006@gmail.com"
    ;;
  show)
    git config user.name
    git config user.email
    return
    ;;
  list)
    echo "gippo  — gippo <gippo2026@outlook.com>"
    echo "aryan  — Aryan Shinde <aryanpshinde2006@gmail.com>"
    return
    ;;
  help | -h | --help | "")
    echo "Usage: gitid {gippo|aryan|show|list}"
    return
    ;;
  *)
    echo "Unknown identity: $1" >&2
    return 1
    ;;
  esac

  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "Error: Not inside a Git repository." >&2
    return 1
  fi

  echo "Git identity switched to: $1"
  git config user.name
  git config user.email
}
