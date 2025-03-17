#!/bin/bash

# Create the output file
output_file="one-shot-context.md"

# Clear the output file if it exists
> "$output_file"

# Add introduction note and wrapper
cat << 'EOF' > "$output_file"
<!--
  Generated Documentation
  Auto-generated comprehensive documentation from multiple markdown sources
  Generated on: $(date)
-->

<CONTEXT>

# Comprehensive Documentation

EOF

# Append main-result.md
echo -e "\n<!-- ==================== MAIN CONTENT (main-result.md) ==================== -->" >> "$output_file"
echo -e "## Main Content\n" >> "$output_file"
cat main-result.md >> "$output_file"
echo "" >> "$output_file"

# Append working-result.md
echo -e "\n<!-- ==================== ADDITIONAL CONTEXT (working-result.md) ==================== -->" >> "$output_file"
echo -e "## Additional Context\n" >> "$output_file"
cat working-result.md >> "$output_file"
echo "" >> "$output_file"

# Append all files from main directory
echo -e "\n<!-- ==================== SOURCE DOCUMENTATION (./main/*.md) ==================== -->" >> "$output_file"
echo -e "## Source Documentation\n" >> "$output_file"
for file in ./main/*.md; do
    if [ -f "$file" ]; then
        filename=$(basename "$file" .md)
        echo -e "\n<!-- ---------- $filename ---------- -->" >> "$output_file"
        echo "### $filename" >> "$output_file"
        echo "" >> "$output_file"
        cat "$file" >> "$output_file"
        echo "" >> "$output_file"
    fi
done

# Append todo and timeline
echo -e "\n<!-- ==================== PROJECT MANAGEMENT ==================== -->" >> "$output_file"
echo -e "## Project Management\n" >> "$output_file"

echo -e "\n<!-- ---------- Todo List (todo.md) ---------- -->" >> "$output_file"
echo "### Todo List" >> "$output_file"
echo "" >> "$output_file"
cat todo.md >> "$output_file"
echo "" >> "$output_file"

echo -e "\n<!-- ---------- Timeline (timeline.md) ---------- -->" >> "$output_file"
echo "### Timeline" >> "$output_file"
echo "" >> "$output_file"
cat timeline.md >> "$output_file"

# Close the CONTEXT wrapper
echo -e "\n</CONTEXT>" >> "$output_file"

# Make the script executable
chmod +x generate_final_doc.sh

echo "Generated $output_file successfully!" 