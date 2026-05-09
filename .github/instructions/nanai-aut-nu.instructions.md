---
description: "Repository-level Copilot instructions for nanai-aut-nu. Use when working with project files, nu scripts, docs, and automation workflows."
applyTo: "**/*"
---

# nanai-aut-nu Copilot Instructions

- Prefer concise, single-responsibility implementations. Keep each function, module, or script focused on one clear task.
- Split complex behavior into small, reusable helpers. High-level flow should remain easy to read, while detailed logic stays isolated.
- Avoid duplication. If the same behavior appears in multiple places, factor it into a shared helper or module.
- Use clear module boundaries and hide implementation details behind simple public interfaces.
- For environment and automation scripts, keep OS-specific logic separated by file or folder rather than mixing Windows and POSIX behavior in the same script.
- Follow repository naming conventions:
  - use `snake_case` for file names in code and data files
  - use `hyphen-case` for web-related names where appropriate
  - use lowercase identifiers consistently
- When adding Rust dependencies, prefer `cargo add` and document the reason briefly in the commit or project notes.
- Add short doc comments for important public functions and keep longer design notes in separate documentation files.
- Validate changes with the normal workflow and regression checks before merging.
