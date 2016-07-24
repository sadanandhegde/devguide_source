---
layout: page
title: CloudShell's OOB Orchestration
category: orch
order:  9
---
Every CloudShell install comes bundled with default setup and teardown workflows out of the box. These reflect
some common workflows we see across many of our customers that we've decided to integrate as a default behavior.
The OOB setup and teardown handle app deployment and start, connectivity app discovery and installation.
As of CloudShell 7.1 the out of the box scripts are included as a part of the default blueprint template so all
blueprint will by default have these scripts.
The following diagram describes the OOB setup and teardown flow:

![Setup Workflow]({{ site.url }}/devguide/assets/orchestration_workflow.png){: .center-image }

The out of the box setup and teardown scripts can be found in the scripts management page.
You can review their source code in the
[cloudshell-orch-sandbox repository](https://github.com/QualiSystems/cloudshell-orch-sandbox/tree/develop/sandbox_scripts).

### Extending the OOB Orchestration Scripts

You can extend the out of the box setup and teardown scripts by adding additional steps, or controlling the order
of execution. For example, calling additional commands to validate apps or resource state, launching additional orchestration,
or controlling the order in which the sandbox is provisioned.

To extend the default setup or teardown, create a copy of the scripts and upload them separately as setup/teardown scripts.
Be sure not to remove any step in the setup workflow. However, you can add your own steps or change the order of execution.

### Example adding basic sequencing to app deployment

In this example, we want some apps - say the domain controllers - to be provisioned first.
We assume an _order_rank_ attribute was added to all of those apps 