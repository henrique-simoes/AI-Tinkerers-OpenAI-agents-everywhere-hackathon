#!/bin/sh
# relay.sh - optional convenience wrapper for the agent-relay protocol.
#
# The protocol is plain markdown + plain git and works entirely by hand; this script
# only saves typing. It never force-pushes, never deletes, and never writes to another
# agent's file.
#
#   relay.sh init <handle>     create .coord/ and your agent file
#   relay.sh status            pull, then print every agent's header (the board)
#   relay.sh sync              pull --rebase only
#   relay.sh publish "<msg>"   stage .coord/, commit, push (retrying). Stage your own code first.
#   relay.sh stale [minutes]   list agents whose heartbeat is older than N minutes (default 25)
#
# Set RELAY_HANDLE, or pass the handle as the last argument to commands that need it.

set -eu

COORD=".coord"
STALE_DEFAULT=25

die() { printf '%s\n' "relay: $*" >&2; exit 1; }

need_git() {
    command -v git >/dev/null 2>&1 || die "git is not installed or not on PATH."
    git rev-parse --show-toplevel >/dev/null 2>&1 \
        || die "not inside a git repository. Run this from your repo."
}

repo_root() { git rev-parse --show-toplevel; }

handle_of() {
    h="${1:-${RELAY_HANDLE:-}}"
    [ -n "$h" ] || die "no handle. Pass one, or set RELAY_HANDLE=<person>-<harness>."
    printf '%s' "$h"
}

now_iso() {
    # ISO 8601 with offset; GNU and BSD date both accept this format string.
    date +%Y-%m-%dT%H:%M%z 2>/dev/null | sed 's/\(..\)$/:\1/' \
        || die "could not read the system clock."
}

cmd_init() {
    need_git
    h=$(handle_of "${1:-}")
    cd "$(repo_root)"
    mkdir -p "$COORD/agents" "$COORD/contracts" "$COORD/decisions" "$COORD/handoffs"

    if [ ! -f "$COORD/README.md" ]; then
        cat > "$COORD/README.md" <<'EOF'
# .coord/

Lightweight coordination notes for people working in this repo with AI agents.
Plain markdown, advisory only.

- `agents/<handle>.md` - one file per agent; only its owner writes it
- `contracts/` - published interfaces others build against
- `decisions/` - decisions we have settled
- `handoffs/` - notes so anyone can resume unfinished work

**This is entirely optional.** Nothing here affects the build, the tests, or the product.
Ignore it freely, or delete the whole directory - nothing breaks.

Stale-claim threshold: 25 minutes.
EOF
        printf '%s\n' "created $COORD/README.md"
    fi

    f="$COORD/agents/$h.md"
    if [ -f "$f" ]; then
        printf '%s\n' "$f already exists - leaving it alone."
    else
        cat > "$f" <<EOF
---
handle: $h
human: <name>
harness: <harness>
model: <model>
status: idle
updated: $(now_iso)
---

## Now
Just joined.

## Claims

## Contracts I publish

## Blocked on
- nothing

## Recent
- $(date +%H:%M) joined
EOF
        printf '%s\n' "created $f - fill in human/harness/model, then: relay.sh publish \"joined\""
    fi
}

cmd_sync() {
    need_git
    cd "$(repo_root)"
    git pull --rebase || die "pull --rebase failed. Resolve it manually; never force-push."
}

cmd_status() {
    need_git
    cd "$(repo_root)"
    git pull --rebase >/dev/null 2>&1 || printf '%s\n' "relay: could not pull; showing local state." >&2
    [ -d "$COORD/agents" ] || die "no $COORD/agents yet. Run: relay.sh init <handle>"
    found=0
    for f in "$COORD"/agents/*.md; do
        [ -e "$f" ] || continue
        found=1
        printf '\n=== %s ===\n' "$(basename "$f" .md)"
        sed -n '1,/^## Recent$/p' "$f" | sed '/^---$/d'
    done
    [ "$found" -eq 1 ] || printf '%s\n' "no agent files yet."
}

cmd_publish() {
    need_git
    msg="${1:-}"
    [ -n "$msg" ] || die "publish needs a message: relay.sh publish \"what changed\""
    h=$(handle_of "${2:-}")
    cd "$(repo_root)"
    f="$COORD/agents/$h.md"
    [ -f "$f" ] || die "$f not found. Run: relay.sh init $h"

    # Refresh the heartbeat in your own file only.
    tmp="$f.relay.tmp"
    sed "s|^updated: .*|updated: $(now_iso)|" "$f" > "$tmp" && mv "$tmp" "$f"

    # Stage ONLY the coordination directory. Your own code is yours to stage - this
    # avoids sweeping up a stray .env or build artifact into a repo that may be public.
    git add "$COORD"
    if git diff --cached --quiet; then
        printf '%s\n' "nothing to publish."
        return 0
    fi
    git commit -m "$msg"
    git push || { git pull --rebase && git push; } \
        || die "push failed twice. Resolve manually; never force-push."
    printf '%s\n' "published."
}

cmd_stale() {
    need_git
    mins="${1:-$STALE_DEFAULT}"
    cd "$(repo_root)"
    [ -d "$COORD/agents" ] || die "no $COORD/agents yet."
    printf 'agents with no heartbeat in %s minutes:\n' "$mins"
    for f in "$COORD"/agents/*.md; do
        [ -e "$f" ] || continue
        st=$(sed -n 's/^status: *//p' "$f" | head -1)
        up=$(sed -n 's/^updated: *//p' "$f" | head -1)
        [ "$st" = "offline" ] && continue
        # Compare without date arithmetic portability problems: report and let a human judge.
        printf '  %-24s status=%-8s updated=%s\n' "$(basename "$f" .md)" "${st:-?}" "${up:-?}"
    done
    printf '%s\n' "(compare 'updated' against now; older than $mins min with status != offline is stale)"
}

case "${1:-}" in
    init)    shift; cmd_init "${1:-}" ;;
    sync)    shift; cmd_sync ;;
    status)  shift; cmd_status ;;
    publish) shift; cmd_publish "${1:-}" "${2:-}" ;;
    stale)   shift; cmd_stale "${1:-}" ;;
    *)
        sed -n '2,16p' "$0" | sed 's/^# \{0,1\}//'
        exit 1
        ;;
esac
