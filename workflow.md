```xml
<workflow>
    <metadata>
        <title>Document Generation Workflow</title>
        <description>Process for generating comprehensive documentation from multiple sources</description>
        <context>
            This workflow processes documentation for an AI system called "Mirror of Becoming" - 
            a platform that helps individuals discover and develop their future potential through AI-driven identity evolution.
            The system combines temporal knowledge graphs, community-specific AI models, and cross-platform identity analysis.
        </context>
    </metadata>

    <filesystem>
        <directories>
            <dir path="./main">
                <file>core-philosophy.md</file>
                <description>Contains foundational essays about the system's vision and philosophy</description>
                <file>business-strategy.md</file>
                <description>Details business model, growth strategy, and market approach</description>
                <file>technical-architecture.md</file>
                <description>Technical implementation details and system architecture</description>
            </dir>
            <file>timeline.md</file>
            <description>Project timeline and development phases</description>
            <file>todo.md</file>
            <description>Immediate action items and research topics</description>
        </directories>
    </filesystem>

    <steps>
        <step id="1" name="generate-main-content">
            <input>
                <context>./main/*</context>
            </input>
            <output>results/main-result.md</output>
            <template>
                <!-- Core template for synthesizing main insights -->
                <CODEX>
                    <Vision><!-- Core directional thesis (1 line max) --></Vision>
                    <Friction><!-- Active pain points in current thinking patterns --></Friction>
                    <Leverage><!-- Force multipliers already available but underutilized --></Leverage>
                    <Mechanics><!-- How the system actually compounds insights --></Mechanics>
                    <NextMoves><!-- Immediate executable actions (next 72 hours) - 'none' valid --></NextMoves>
                    <Whispers><!-- Half-formed intuitions and pattern fragments --></Whispers>
                    <RecursiveMultiplier><!-- Weekly synthesis that modifies the template itself --></RecursiveMultiplier>
                    <OneThingNotIncluded>
                        <!-- Critical blind spots in: system design, data analytics, product approach, project philosophy -->
                    </OneThingNotIncluded>
                </CODEX>

                <principles>
                    <principle name="VELOCITY_OVER_POLISH">
                        - Capture thoughts in raw XML-like format without overstructuring
                        - Favor 3 bullet points over 3 paragraphs
                        - Update the template weekly based on what actually generated insight
                    </principle>
                    <principle name="COMPOUNDING_MECHANICS">
                        - Daily: Brutally simple capture (90 seconds max per entry)
                        - Weekly: Cluster related friction/leverage points
                        - Monthly: Prune ineffective template sections
                    </principle>
                    <principle name="NONLINEAR_THINKING">
                        - Track idea half-life (mark expiration dates on insights)
                        - Preserve whispers in dedicated container
                        - Allow moves = 'none' when in observation mode
                    </principle>
                    <principle name="ANTIFRAGILE_FEEDBACK">
                        - Let system break before your company does
                        - Stress-test blind spots weekly
                        - Automate pattern detection (simple scripts over manual analysis)
                    </principle>
                </principles>
            </template>
            <action>
                <command>ai_synthesis</command>
                <description>
                    The AI assistant will:
                    1. Read and analyze all files in ./main directory
                    2. Extract key concepts, patterns, and insights
                    3. Apply CODEX template structure directly in its response
                    4. Follow velocity-over-polish principle
                    5. Synthesize insights across all input files into results/main-result.md
                    6. Generate content directly rather than executing scripts
                </description>
                <print_to_chat>true</print_to_chat>
            </action>
        </step>

        <step id="2" name="generate-working-result">
            <input>
                <files>
                    <file>results/main-result.md</file>
                    <file>timeline.md</file>
                    <file>todo.md</file>
                </files>
            </input>
            <output>results/missing-result.md</output>
            <template>
                <!-- Simple Instructions for LLM: Write a concise, casual, direct report on something genuinely important 
                     that is missing or overlooked in the provided context. Follow all instructions carefully, step-by-step. 
                     DO NOT include XML tags in your response. Keep it simple, clear, and free of buzzwords or fluff. -->
                <RootTemplate>
                    <Context>
                        <!-- Content will be populated during execution -->
                        <ContextData></ContextData>
                    </Context>

                    <Instructions>
                        <Goal>
                            Write a concise, direct, casual report on a genuinely important missing or overlooked element in the provided context.
                        </Goal>

                        <ToneAndStyle>
                            - Casual, not sloppy.
                            - Layman-friendly (no obscure jargon).
                            - No fluff, no hype.
                            - Emphasize clarity and practicality over long-winded detail.
                        </ToneAndStyle>

                        <KeyPoint>
                            - Must highlight a specific "missing element."
                            - Must show *why* it matters, *what* challenges it creates, and *how* to fix it.
                        </KeyPoint>
                    </Instructions>

                    <SubWorkflows>
                        <SubWorkflow id="1" name="IdentifyMissingElement">
                            <Step>Read context carefully, note any unaddressed or insufficiently covered topic.</Step>
                            <Step>Select the most impactful missing or overlooked element.</Step>
                        </SubWorkflow>

                        <SubWorkflow id="2" name="ExplainWhyItMatters">
                            <Step>Outline the direct impacts on users, community, or product if not addressed.</Step>
                            <Step>Use layman-friendly examples.</Step>
                        </SubWorkflow>

                        <SubWorkflow id="3" name="ListChallenges">
                            <Step>Identify key problems or friction points.</Step>
                            <Step>Create bullet lists for clarity (or short paragraphs).</Step>
                        </SubWorkflow>

                        <SubWorkflow id="4" name="ProposeSolutions">
                            <Step>Offer simple, realistic solutions—avoid hype or vagueness.</Step>
                            <Step>Ensure bullet lists or enumerated steps for clarity.</Step>
                        </SubWorkflow>

                        <SubWorkflow id="5" name="MindMapAndNextSteps">
                            <Step>Include text-based mind map to show hierarchy of ideas.</Step>
                            <Step>Conclude with a short list of recommended next steps.</Step>
                        </SubWorkflow>
                    </SubWorkflows>

                    <FormattingGuidelines>
                        <HeaderLevel>Use H2 or H3 for main headings (Why It Matters, Challenges, Solutions, etc.).</HeaderLevel>
                        <Lists>Use bullet points or numbered steps for clarity.</Lists>
                        <MindMapFormat>Use simple ASCII text to illustrate the hierarchy of the missing element, challenges, solutions.</MindMapFormat>
                    </FormattingGuidelines>

                    <Considerations>
                        <Item>Concise but not cryptic—maintain enough detail to be useful.</Item>
                        <Item>Casual but not sloppy—respectful tone.</Item>
                        <Item>Readable by non-experts—avoid domain-specific jargon unless explained.</Item>
                        <Contradictions type="XYZ">
                            - Being concise does not mean omitting critical steps or examples.
                            - Being casual does not mean ignoring structure or flow.
                            - Being direct does not mean abrupt or impolite phrasing.
                        </Contradictions>
                    </Considerations>
                </RootTemplate>

                <output_structure>
                    <section name="What's Missing"><!-- Clear problem statement --></section>
                    <section name="Why It Matters"><!-- Impact analysis --></section>
                    <section name="Key Challenges"><!-- Technical and practical obstacles --></section>
                    <section name="Simple Solutions"><!-- Actionable fixes --></section>
                    <section name="Mind Map"><!-- Visual relationship structure --></section>
                    <section name="Next Steps"><!-- Immediate actions --></section>
                </output_structure>
            </template>
            <action>
                <command>ai_synthesis</command>
                <description>
                    The AI assistant will:
                    1. Analyze results/main-result.md for gaps
                    2. Compare against timeline and todo
                    3. Apply missing element template structure
                    4. Focus on practical implementation gaps
                    5. Generate results/missing-result.md directly with recommendations
                    6. Ensure recommendations align with timeline/todo
                </description>
                <print_to_chat>true</print_to_chat>
            </action>
        </step>

        <step id="3" name="generate-final-document">
            <input>
                <files>
                    <file>results/main-result.md</file>
                    <file>results/missing-result.md</file>
                    <dir>./main/*.md</dir>
                    <file>todo.md</file>
                    <file>timeline.md</file>
                </files>
            </input>
            <output>results/one-shot-context.md</output>
            <action>
                <command>shell_script</command>
                <script_path>./generate_final_doc.sh</script_path>
                <description>
                    Execute generate_final_doc.sh which will:
                    1. Create output file with proper header and timestamp
                    2. Append results/main-result.md under "Main Content"
                    3. Append results/missing-result.md under "Additional Context"
                    4. Append all files from ./main/ under "Source Documentation"
                    5. Append todo.md and timeline.md under "Project Management"
                    6. Add footer noting AI-assisted compilation
                    
                    DO NOT attempt to generate content directly - use the shell script to combine existing files.
                </description>
                <print_to_chat>true</print_to_chat>
            </action>
        </step>
    </steps>

    <validation>
        <rules>
            <rule>Verify all CODEX sections are present in results/main-result.md</rule>
            <rule>Check that results/missing-result.md addresses practical implementation gaps</rule>
            <rule>Ensure results/one-shot-context.md contains all source content</rule>
            <rule>Validate proper formatting and section organization</rule>
        </rules>
    </validation>
</workflow>
