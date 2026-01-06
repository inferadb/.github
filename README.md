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

This repository contains GitHub organization configuration and tooling for InferaDB:

- **Organization Profile** — The README displayed on the [InferaDB GitHub organization](https://github.com/inferadb) page
- **Shared Templates** — Common files synced across all repositories (licenses, security policy, etc.)
- **Repository Tools** — Automation for managing settings, labels, and topics across all repos

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

The `repos.sh` script manages settings across all InferaDB repositories:

```bash
cd tools

# Process all repositories (settings, labels, topics, templates)
./repos.sh

# Individual operations
./repos.sh --settings      # Repository settings only
./repos.sh --labels        # Labels only
./repos.sh --topics        # Descriptions and topics only
./repos.sh --templates     # Sync template files
./repos.sh --dependabot    # Validate dependabot.yml

# Preview changes without applying
./repos.sh --dry-run
./repos.sh --templates --dry-run
```

### Configuration

Repository metadata is defined in `repos.json`:

- Repository descriptions and topics
- Label definitions (name, color, description)
- Merge settings (squash, rebase, merge commit options)
- Security features (vulnerability alerts, automated fixes)

### Template Sync

Template files in `tools/templates/` are synced to all repositories:

| File                 | Purpose                           |
| -------------------- | --------------------------------- |
| `CODE_OF_CONDUCT.md` | Community code of conduct         |
| `CONTRIBUTING.md`    | Contribution guidelines           |
| `LICENSE-APACHE`     | Apache 2.0 license                |
| `LICENSE-MIT`        | MIT license                       |
| `SECURITY.md`        | Security vulnerability reporting  |

## Community

Join us on [Discord](https://discord.gg/inferadb) to discuss InferaDB, get help with your projects, and connect with other developers. Whether you have questions, want to share what you're building, or are interested in contributing, we'd love to have you!

## License

Licensed under either of:

- [Apache License, Version 2.0](LICENSE-APACHE)
- [MIT License](LICENSE-MIT)

at your option.
