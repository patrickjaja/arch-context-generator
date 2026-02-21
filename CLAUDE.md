# Project Guidelines

## Purpose

The main purpose of this project is to gather and collect system context (hardware, packages, configuration, services, etc.) for an Arch Linux machine. This context is also used as a foundation for machine administration tasks — diagnosing issues, applying fixes, and maintaining the system.

## System Context

This is an Arch Linux system context generator for a Dell XPS 9320 (Intel Alder Lake-P, Iris Xe Graphics) running XFCE on X11. The generated context files (`arch-context_*.md`) provide a comprehensive snapshot of the system state.

## System Changes

When diagnosing or fixing system issues:

- Always analyse the actual system state first (logs, parameters, debugfs) before suggesting fixes
- Document every system change in `CHANGELOG.md` (in this project directory) with:
  - Date and short description
  - Problem description
  - Root cause (with evidence from logs/diagnostics)
  - Exact change made (file, diff)
  - How it was applied
  - How to revert
- Changes requiring sudo must be confirmed with the user before execution
