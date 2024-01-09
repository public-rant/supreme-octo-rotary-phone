#!/usr/bin/env jq

def filter: map(select(.type == "match"));
# $collection | map(select(.data.line_number > $part.data.line_number and .data.line_number < $next.data.line_number).data.lines.text),

def transform:
    group_by(.data.submatches[].match.text)
    | .[0] as $parts
    | .[1] as $tasks
    | .[2] as $remote_docs
    | { data: { line_number: 9999 }} as $nullPart
    | $parts[]
    | . as $part
    | $parts | map(select(.data.line_number > $part.data.line_number))[0] as $next
    | [$part.data.lines.text | split("\n")[0], [$tasks | map(select(.data.line_number > $part.data.line_number and .data.line_number < $next.data.line_number))[].data.lines.text], [[$remote_docs | map(select(.data.line_number > $part.data.line_number and .data.line_number < (if $next == null then $nullPart else $next end).data.line_number))][][].data.lines.text]];

def load:
    . as $input
    | $input[0] as $heading
    | $input[1] as $tasks
    | (if $input[2] == null then [] else $input[2] end) as $remote_docs
    | { heading: $heading, tasks: $tasks, remote_docs: $remote_docs};