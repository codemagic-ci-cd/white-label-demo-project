# White label sample project for Flutter

This sample shows how to set up multiple workflows and branches to white label a core version of a Flutter app. 

Please refer to the `codemagic.yaml` in the project root of any branches that will be built. This configuration makes use of a definitions sections where scripts and settings can be defined and then reused in the workflows which reduces code repition.
## Overview of white labeling with Codemagic

To get an overview of how you can white label your mobile apps with Codemagic, please refer to the overview provided in the documentation [here](https://docs.codemagic.io/knowledge-white-label/white-label-apps-overview/).

## White label automation scripts

The majority white label automation is done using shell scripts to perform tasks such as downloading assets, copying files such as logos, images, fonts etc. to a new location, or changing string values in projects. Please refer to the white labeling scripts samples in the Codemagic documentation [here](https://docs.codemagic.io/knowledge-white-label/white-label-scripts/).

## Branching and workflow strategies

There are many approaches to white labeling and setting up workflows. If you haven't already decided on your own strategy, you can use our suggested approach which can be found in the documentation [here](https://docs.codemagic.io/knowledge-white-label/white-label-branching-strategies/).

