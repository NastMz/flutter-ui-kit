# Agent Execution Model

## Purpose

This document defines **how work is executed** in the multi-agent system.

Its goal is to remove ambiguity about:

- Task Groups
- “Parallel” work
- Agent collaboration
- Execution order

---

## Core Principle

This repository uses a **sequential, orchestrated execution model**.

> At any point in time, **only one agent is executing work**.

There is **no real parallelism**, no multi-threading, and no simultaneous agent activity.

---

## Agents Do NOT Collaborate Directly

- Agents **never communicate with each other**
- Agents **never see the full system state**
- Agents **never integrate results**

### Single Point of Integration

**Agent A0 (Orchestrator)** is the only agent that:

- Sees all outputs
- Integrates results
- Updates planning or status documents
- Decides sequencing and transitions

---

## Task Groups Explained

A **Task Group** is a **logical unit of work**, not an execution unit.

A Task Group may list multiple agents.  
This means:

- The work requires **multiple roles**
- Each agent executes **independently**
- Execution happens **one agent at a time**

### Example

Task Group 2 — Showcase Token Preview
Owners: A3, A2

Actual execution:

1. A0 assigns subtasks to A3
2. A3 executes and produces a work log
3. A0 reviews A3 output
4. A0 assigns review to A2
5. A2 executes and produces a work log
6. A0 consolidates results

---

## Meaning of “Parallel” in Planning Documents

When planning documents describe tasks as **parallel**, this means:

- There are **no logical dependencies**
- Execution order does not affect correctness

It does NOT mean:

- Concurrent chats
- Simultaneous agents
- Independent integrations

---

## Mandatory Outputs

Every agent execution MUST result in a **work log**.

Agents MUST NOT:

- Update ROADMAP
- Update STATUS
- Merge conclusions

Only A0 may do so.

---

## Summary

- Task Groups are conceptual
- Execution is always sequential
- A0 is the single integrator
- Work logs are mandatory artifacts
