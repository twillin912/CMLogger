# CMLogger Documentation

CMLogger Documentation is using a combination of [PlatyPS](https://github.com/PowerShell/platyPS) and [ReadTheDocs](https://readthedocs.org/). This let's you write the command help once and it will create External Help, Github Markdown Help, and Help hosted on ReadTheDocs.

- Help is written in Markdown in [the docs folder](https://github.com/twillin912/CMLogger/tree/master/docs) following a PlatyPS schema.
- It then gets exported into an External Help file CMLogger-help.xml.
- When committed, ReadTheDocs then uses the [mkdocs.yml](https://github.com/twillin912/CMLogger/blob/master/mkdocs.yml) file to build the Documentation based on the mkdocs.yml layout.

## Functions
  - [Write-CMLogFile](en-US/Write-CmLogFile.md)