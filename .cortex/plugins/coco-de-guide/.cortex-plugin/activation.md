# coco-de-guide

Project plugin for the CoCo data engineering guide (dbt on TPC-H in `DEMO_DB.TPCH_TRANSFORMED`).

It bundles:

- **Skills** (`./skills`) — task workflows such as creating new dbt models with source() references and primary key tests.
- **Agents** (`./agents`) — subagents the main agent can delegate dbt and Snowflake work to.
- **Hooks** (`./hooks/hooks.json`) — shell commands that run automatically around tool calls.

Project-scoped plugins activate once the workspace is trusted, or can be enabled individually in Agent Settings > Plugins.
