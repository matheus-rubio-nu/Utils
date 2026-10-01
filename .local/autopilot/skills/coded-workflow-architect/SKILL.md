---
name: coded-workflow-architect
description: Comprehensive workflow for generating and editing Coded Workflows, Coded Test Cases, and Coded Source Files (C# .cs files) in UiPath Studio Desktop. Use this when users need to create new C# automations, test cases, helper/utility classes, modify existing coded workflows, fix C# errors, or iterate on coded workflow implementations. Supports discovery-first approach with error-driven refinement.
icon: FaCode
color: "#0078D4"
---

# Coded Workflow Architect

Generate and edit Coded Workflows, Coded Test Cases, and Coded Source Files (C# .cs files) using a **discovery-first approach** with **iterative error-driven refinement**.

## Loading Strategy

**Read files in this order. Stop when you have enough context for the task.**

1. **ALWAYS read:** [codedworkflow-reference.md](references/codedworkflow-reference.md) (file formats, namespaces, arguments, built-in methods)
2. **ALWAYS read:** [SERVICE_INDEX.md](references/SERVICE_INDEX.md) (service → package mapping)
3. **ALWAYS read:** [coding-guidelines.md](references/coding-guidelines.md) (workflow phases, using statements, anti-patterns, error fixes)
4. **Read domain docs ONLY when the user's request involves that domain:**
   - UI automation → [ui-automation/ui-automation.md](references/ui-automation/ui-automation.md), then windows-api.md / examples.md as needed
   - Excel/Word/Mail/etc. → the corresponding folder under references/
5. **Read for code templates:** [code-examples.md](references/code-examples.md) (generic templates — for domain-specific examples, use the domain's examples.md instead)

**DO NOT** load all reference files. Load only what the current task requires.

> **API specifics come from activity docs, not these bundled files.** Before generating any service call, read the package's coded docs under `{PROJECT_DIR}/.local/docs/packages/{PackageId}/coded/` — see [Activity Documentation](#activity-documentation-primary-api-source). The bundled references above give patterns and domain guidance; the activity docs give the exact, source-accurate API.

---

## Core Principles

1. **Activity Docs Are the Source of Truth** — Installed packages may ship generated docs at `{PROJECT_DIR}/.local/docs/packages/{PackageId}/`, with the coded-workflow API reference under the `coded/` subfolder (service accessors, method signatures, parameter/return types, enums, ready-to-use C# examples). These are source-accurate — trust them over guessed APIs or tool-inferred defaults. Check them **first** for every package you call. If you need a package that isn't installed yet, add its **latest** version (a new dependency — latest ensures docs ship). If an **already-installed** package has no docs, **do not update it to chase docs** — updating an in-use package can change or break the automation; fall back to existing `.cs` patterns and `CodeGenerationPrerequisitesTool`, and at most *suggest the user update it manually*. See [Activity Documentation](#activity-documentation-primary-api-source).
2. **API Discovery Before Generation** — Never generate C# code blind. Read `project.json`, consult the activity docs for the packages you'll use, and study existing `.cs` patterns first.
3. **Start Simple, Iterate** — Create a minimal working version first, then refine through validation cycles
4. **Validate After Every Change** — Always check with `GetErrorsTool` after any create/edit
5. **Fix Errors Methodically** — Syntax → Type → Logic order, max 5 attempts before asking user

---

## Activity Documentation (Primary API Source)

**Check this before `CodeGenerationPrerequisitesTool` or guessing an API.** Installed packages may ship generated docs at `{PROJECT_DIR}/.local/docs/packages/{PackageId}/`. For coded workflows, the content you want is the **`coded/` subfolder**.

**Availability:** docs exist only for **installed** packages, and typically only for **newer** versions. **Need a package that isn't installed?** Add its **latest** version — a new dependency, and latest ensures docs ship. **Installed but no docs?** Do **not** auto-update it — updating an in-use package can change or break the existing automation. Work against the installed version's fallbacks; if docs would clearly help, *tell the user they can update it manually* and let them decide.

### Structure

```
{PROJECT_DIR}/.local/docs/packages/{PackageId}/
├── overview.md          # Package summary + links to every doc — START HERE
├── activities/          # Per-activity docs for XAML (+ types/, components/, filtering/) — ignore for coded
└── coded/               # Present only when the package ships a coded API (often absent)
    └── coded-api.md      # Coded API: service accessor, sub-services, method signatures,
                          #   param/return types, enums, and worked C# "Common Patterns" examples
```

`overview.md` is the authoritative index and links the coded doc. Not every package has a `coded/` folder (e.g. OCR, Testing don't) — when absent, fall back per the table below.

### How to use it

| Situation | Action |
|-----------|--------|
| Know the package | `ReadFileTool` its `overview.md`, then the coded doc it links (`coded/coded-api.md`). |
| Don't know the package | Map capability → package via [SERVICE_INDEX.md](references/SERVICE_INDEX.md), then read that package's `overview.md` → `coded/coded-api.md`. |
| Installed, no `coded/` folder | Some packages ship no coded API doc. **Don't auto-update to chase docs** — fall back to existing `.cs` patterns + `CodeGenerationPrerequisitesTool`; optionally suggest the user update the package manually (may affect compatibility). |
| No `.local/docs/` at all | Older host/project — use the fallback discovery flow in [coding-guidelines.md § Phase 1](references/coding-guidelines.md#phase-1-discovery). |

Full discovery flow: [coding-guidelines.md § Phase 1](references/coding-guidelines.md#phase-1-discovery).

---

## Tool Quick Reference

| Tool | Purpose |
|------|---------|
| **FileSearchTool** | Find .cs files by regex (MANDATORY first step) |
| **ReadFileTool** | Read file contents with line numbers |
| **WriteFileTool** | Create new file |
| **EditFileTool** | Edit existing file via string replacement |
| **GetErrorsTool** | Check for compilation errors |
| **GetQuickFixesTool** | Get quick fix suggestions |
| **GetTypeDefinitionsTool** | Get type info at specific location |
| **GetProjectContextTool** | Get project info including Object Repository and UILibrary descriptors |
| **RunWorkflowTool** | Run/debug a workflow file |
| **CodeGenerationPrerequisitesTool** | Get APIs — fallback only, when activity docs are unavailable AND <5 relevant .cs files found |

---

## Workflow Phases

All phases are detailed in [coding-guidelines.md](references/coding-guidelines.md). Summary:

| Phase | Goal |
|-------|------|
| **1. Discovery** | Read project.json, read activity docs (`.local/docs/…/coded/`), discover APIs and descriptors |
| **2. Generate/Edit** | Create or modify C# code, add dependencies |
| **3. Validate & Fix** | Iterate until 0 errors |
| **4. Run & Test** | Execute workflow (optional, only if user requests) |
| **5. Response** | Summarize what was done |

---

## Request Classification

**Step 1: Identify file type** — Coded Workflow, Coded Test Case, or Coded Source File. See [codedworkflow-reference.md § Three Types](references/codedworkflow-reference.md#three-types-of-cs-files) for the full comparison (base class, attributes, service access).

**Step 2: Identify action** — CREATE (generate/create/make/build/new) or EDIT (update/change/fix/modify/add to).

If unclear → **ask the user** rather than guessing.

