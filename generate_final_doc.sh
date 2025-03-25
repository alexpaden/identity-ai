#!/bin/bash

# Create the output file
output_file="results/one-shot-context.md"

# Create results directory if it doesn't exist
mkdir -p results

# Clear the output file if it exists
> "$output_file"

# Get current date
current_date=$(date)

# Add introduction note and wrapper
cat << EOF > "$output_file"
<!--
  Generated Documentation
  Auto-generated comprehensive documentation from multiple markdown sources
  Generated on: $current_date
-->

<CONTEXT>

# Comprehensive Documentation

EOF

# Append main-result.md
echo -e "\n<!-- ==================== MAIN CONTENT (results/main-result.md) ==================== -->" >> "$output_file"
echo -e "## Main Content\n" >> "$output_file"
echo -e "<MAIN-RESULT.md>" >> "$output_file"
cat results/main-result.md >> "$output_file"
echo -e "</MAIN-RESULT.md>" >> "$output_file"
echo "" >> "$output_file"

# Append other.md
echo -e "\n<!-- ==================== OTHER IDEAS (main/other.md) ==================== -->" >> "$output_file"
echo -e "## Other Ideas\n" >> "$output_file"
echo -e "<OTHER.md>" >> "$output_file"
cat main/other.md >> "$output_file"
echo -e "</OTHER.md>" >> "$output_file"
echo "" >> "$output_file"

# Append missing-result.md
echo -e "\n<!-- ==================== ADDITIONAL CONTEXT (results/missing-result.md) ==================== -->" >> "$output_file"
echo -e "## Additional Context\n" >> "$output_file"
echo -e "<MISSING-RESULT.md>" >> "$output_file"
cat results/missing-result.md >> "$output_file"
echo -e "</MISSING-RESULT.md>" >> "$output_file"
echo "" >> "$output_file"

# Append all files from main directory
echo -e "\n<!-- ==================== SOURCE DOCUMENTATION (./main/*.md) ==================== -->" >> "$output_file"
echo -e "## Source Documentation\n" >> "$output_file"
for file in ./main/*.md; do
    if [ -f "$file" ]; then
        filename=$(basename "$file" .md)
        # Convert filename to uppercase for tag name and add .md extension
        tagname=$(echo "$filename" | tr '[:lower:]' '[:upper:]')
        echo -e "\n<!-- ---------- $filename ---------- -->" >> "$output_file"
        echo "### $filename" >> "$output_file"
        echo "" >> "$output_file"
        echo -e "<$tagname.md>" >> "$output_file"
        cat "$file" >> "$output_file"
        echo -e "</$tagname.md>" >> "$output_file"
        echo "" >> "$output_file"
    fi
done

# Append todo and timeline within project-management wrapper
echo -e "\n<!-- ==================== PROJECT MANAGEMENT ==================== -->" >> "$output_file"
echo -e "## Project Management\n" >> "$output_file"
echo -e "<PROJECT-MANAGEMENT>" >> "$output_file"

echo -e "\n<!-- ---------- Todo List (todo.md) ---------- -->" >> "$output_file"
echo "### Todo List" >> "$output_file"
echo "" >> "$output_file"
echo -e "<TODO.md>" >> "$output_file"
cat todo.md >> "$output_file"
echo -e "</TODO.md>" >> "$output_file"
echo "" >> "$output_file"

echo -e "\n<!-- ---------- Timeline (timeline.md) ---------- -->" >> "$output_file"
echo "### Timeline" >> "$output_file"
echo "" >> "$output_file"
echo -e "<TIMELINE.md>" >> "$output_file"
cat timeline.md >> "$output_file"
echo -e "</TIMELINE.md>" >> "$output_file"
echo -e "</PROJECT-MANAGEMENT>" >> "$output_file"

# Close the CONTEXT wrapper
echo -e "\n</CONTEXT>" >> "$output_file"

# Make the script executable
chmod +x generate_final_doc.sh

echo "Generated $output_file successfully!" 