#!/usr/bin/env nu

# Translate non-English .srt subtitle file using Apple Shortcut
# Usage: translate-subtitle.nu [--language en|id] <input.srt> <output.srt>

def main [input_file: string, output_file: string, --language (-l): string = "en"] {
    # Read the input .srt file
    let content = open $input_file | str trim
    if ($content | is-empty) {
        error make {msg: $"Input file ($input_file) is empty or not found"}
    }

    # Split into subtitle blocks (separated by empty lines)
    let blocks = $content | split row "\n\n" | each { |block|
        $block | split row "\n" | where { |line| not ($line | str trim | is-empty) }
    }

    let total = $blocks | length
    ^echo-style --alternative-screen-buffer --bold 'Starting translation of ' $"--code=($total)" ' subtitles from ' $"--path=($input_file)" ' to ' $"--path=($output_file)"

	print -n $"\e]9;4;1;0\a"  # Initialize progress bar at 0%
    let translated_chunks = process_chunks $blocks 40 [] 1 $total $language
    print -n $"\e]9;4;0\a"  # Finalize progress bar

    # Join all translated chunks
    let output = $translated_chunks | str join "\n\n"

    # Write to output file
    $output | save -f $output_file

	^echo-style --default-screen-buffer --success='Translation complete. Output saved to ' $"--path=($output_file)"
}

def process_chunks [remaining: list, chunk_size: int, translated: list, index: int, total: int, language: string] {
    if ($remaining | length) == 0 {
        $translated
    } else {
        let current_chunk = $remaining | take $chunk_size
        let new_remaining = $remaining | skip $chunk_size

        let chunk_content = $current_chunk | each { |block| $block | str join "\n" } | str join "\n\n"

        ^echo-style --bold 'Translate chunk ' $"--code=($index)" ' of ' $"--code=~(($total / $chunk_size) | math ceil)" ' with size ' $"--code=($chunk_size)" '...'
        #  ^echo-style --header2='INPUT:'
        # print $chunk_content
        # print ""
        let result = translate_chunk $current_chunk $language

        if $result.error {
            print $"Exit code: ($result.exit_code)"
            print $"Stderr: '($result.stderr)'"
            print $"Stdout: '($result.stdout)'"
            print $"Input file exists: ($result.temp_input | path exists)"
            let new_chunk_size = $chunk_size // 2
            if $new_chunk_size == 0 {
                error make {msg: "Chunk size reduced to 0, unable to process"}
            }
            print $"Chunk too large, reducing chunk size to ($new_chunk_size) and retrying..."
            # Put back the chunk and retry with smaller size
            process_chunks ($current_chunk ++ $remaining) $new_chunk_size $translated $index $total $language
        } else {
            ^echo-style --header2='OUTPUT:'
            print $result.translated
            print ""
            let new_translated = $translated | append $result.translated

            # Update progress bar
            let processed = $total - ($new_remaining | length)
            let progress = (($processed / $total) * 100) | math round
            print -n $"\e]9;4;1;($progress)\a"

            process_chunks $new_remaining $chunk_size $new_translated ($index + 1) $total $language
        }
    }
}

def translate_chunk [chunk: list, language: string] {
    let chunk_content = $chunk | each { |block| $block | str join "\n" } | str join "\n\n"

    # Create temp input file
    let rand = random int
    let temp_input = $"/tmp/subtitle_chunk_($rand).srt"

    $chunk_content | save $temp_input

    let shortcut_name = if $language == "en" { "Translate Subtitle" } else { "Translate Subtitle ID" }
    let result = do { ^shortcuts run $shortcut_name --input-path $temp_input } | complete

    let raw_output = $result.stdout | str trim

    let translated = if ($raw_output | str starts-with "{\\rtf") {
        let rtf_file = $"/tmp/rtf_($rand).rtf"
        $raw_output | save $rtf_file
        ^textutil -convert txt $rtf_file -output $"/tmp/txt_($rand).txt"
        open $"/tmp/txt_($rand).txt" | str trim
    } else {
        $raw_output
    }

    if ($result.exit_code != 0) or ($translated | is-empty) {
        {translated: "", error: true, stderr: $result.stderr, stdout: $result.stdout, exit_code: $result.exit_code, temp_input: $temp_input}
    } else {
        {translated: $translated, error: false, stderr: "", stdout: "", exit_code: 0, temp_input: $temp_input}
    }
}
