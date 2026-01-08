<div align="center">
    <p><a href="https://inferadb.com"><img src=".github/inferadb.png" width="100" /></a></p>
    <h1>InferaDB GitHub</h1>
    <p>
        <a href="https://discord.gg/inferadb"><img src="https://img.shields.io/badge/Discord-Join%20us-5865F2?logo=discord&logoColor=white" alt="Discord" /></a>
        <a href="#license"><img src="https://img.shields.io/badge/license-MIT%2FApache--2.0-blue.svg" alt="License" /></a>
    </p>
    <p>Organization profile, shared templates, and repository management tools</p>
</div>

> [!IMPORTANT]
> Under active development. Not production-ready.

## Overview

GitHub organization configuration and tooling for InferaDB:

- **Organization Profile** — README for the [InferaDB GitHub organization](https://github.com/inferadb) page
- **Shared Templates** — Common files synced across repos (licenses, security policy, etc.)
- **Repository Tools** — Automation for managing settings, labels, and topics

## Structure

```
github/
├── profile/
│   └── README.md          # GitHub organization profile
├── tools/
│   ├── repos.sh           # Repository management script
│   ├── repos.json         # Repository configuration
│   └── templates/         # Shared template files
├── CODE_OF_CONDUCT.md
├── CONTRIBUTING.md
├── LICENSE-APACHE
├── LICENSE-MIT
└── SECURITY.md
```

## Repository Management

`repos.sh` manages settings across all repositories:

```bash
cd tools

# All operations (settings, labels, topics, templates)
./repos.sh

# Individual operations
./repos.sh --settings      # Repository settings
./repos.sh --labels        # Labels
./repos.sh --topics        # Descriptions and topics
./repos.sh --templates     # Template files
./repos.sh --dependabot    # Validate dependabot.yml

# Preview changes
./repos.sh --dry-run
./repos.sh --templates --dry-run
```

### Configuration

`repos.json` defines repository metadata:

- Descriptions and topics
- Labels (name, color, description)
- Merge settings (squash, rebase, merge commit)
- Security features (vulnerability alerts, automated fixes)

### Template Sync

Files in `tools/templates/` sync to all repositories:

| File                 | Purpose                           |
| -------------------- | --------------------------------- |
| `CODE_OF_CONDUCT.md` | Community code of conduct         |
| `CONTRIBUTING.md`    | Contribution guidelines           |
| `LICENSE-APACHE`     | Apache 2.0 license                |
| `LICENSE-MIT`        | MIT license                       |
| `SECURITY.md`        | Security vulnerability reporting  |

## Community

Join us on [Discord](https://discord.gg/inferadb) for questions, discussions, and contributions.

## License

Dual-licensed under [MIT](LICENSE-MIT) or [Apache 2.0](LICENSE-APACHE).
