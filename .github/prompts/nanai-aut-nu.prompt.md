---
description: "Apply nanai-aut-nu repository conventions when reviewing, improving, or generating code and scripts."
name: "nanai-aut-nu code guidance"
argument-hint: "Describe the code, file, or task to apply repo conventions to"
agent: "agent"
---

Apply the `nanai-aut-nu` repository conventions to the selected code or described task:

- Keep implementations concise and single-responsibility.
- Split complex behavior into small reusable helpers.
- Avoid duplication and preserve clear module boundaries.
- Separate OS-specific logic across files or folders rather than mixing Windows and POSIX behavior.
- Use snake_case filenames for code and data files, and lowercase identifiers consistently.
- Prefer `cargo add` for Rust dependency changes, and document the dependency reason briefly.
- Add short doc comments for important public functions and keep longer design notes in separate documentation files.
- Validate changes with the normal workflow and regression checks before merging.

If the task involves generating a new Nu script, ensure the solution fits the repo's OS-specific structure and naming conventions.
