# Julia installation and initial setup

*Disclaimer: The following instructions contain personal recommendations by the
author and are neither "official" nor the only way of installing and setting up
Julia. The instructions and included software/scripts are licensed under the
[MIT license](https://opensource.org/license/mit/), without warranty, use at
your own risk.*

This is a short tutorial on how to install the
[Julia programming language](https://julialang.org/)
and set things up so you can use Julia [Jupyter notebooks](https://jupyter.org/)
(via the [IJulia Jupyter kernel](https://julialang.github.io/IJulia.jl/stable/))
and automatic code reloading
(via [Revise](https://timholy.github.io/Revise.jl/stable/)).


## Software Installation

### Installing Julia

The easiest way to install Julia is using the Juliaup installation manager, just follow the
[official Julia installation instructions](https://julialang.org/downloads/).

(In addition to Juliaup, you can also
[manually download](https://julialang.org/downloads/#official_binaries_for_manual_download)
and unpack/install a binary tarball for Linux, a binary tarball or a disk
image for OS-X, and either a standalone installer or a portable ZIP archive
for Windows.)

On Windows (only!), you may also need to install the
[Visual C++ redistributable](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist), e.g. if you want to use
[CUDA from Julia](https://cuda.juliagpu.org/stable/installation/overview/).


### Julia in Visual Studio Code

[Visual Studio Code](https://code.visualstudio.com/download) provides a great
environment to work with Julia.

Install the
[VS-Code Julia extension](https://code.visualstudio.com/docs/languages/julia),
in most cases it should locate your Julia installation automatically. If
not, configure the VS-Code setting `"julia.executablePath"` manually.

Also try setting `"julia.execution.codeInREPL": true` in your VS-code setting,
it makes code section you evaluate in scripts via Ctrl-enter available in the
Julia REPL history afterwards.


### Julia Jupyter notebooks

#### Jupyter notebooks in Visual Studio Code

You should be able to run Julia Jupyter notebooks directly within Visual
Studio Code without any additional configuration. By default, VS-Code Julia
notebooks use the same Julia version/installation that is used by the VS-Code
Julia extension, so no Jupyter kernel configuration is required.


#### Jupyter notebooks outside of Visual Studio Code

If you want to run Julia Jupyter notebooks outside of Visual Studio Code, you
will also need a working Jupyter installation.
[JupyterLab Desktop](https://github.com/jupyterlab/jupyterlab-desktop)
is easy
[to install](https://github.com/jupyterlab/jupyterlab-desktop/releases),
but an [Anaconda](https://www.anaconda.com/) or system/custom Python
installation that includes Jupyter will work too, of course.

For non-VS-Code Jupyter notebooks you also also need to install the
[IJulia Jupyter Julia kernel](https://github.com/JuliaLang/IJulia.jl) (see
next section).


## Setting up Julia

Now open a [Julia REPL](https://docs.julialang.org/en/v1/stdlib/REPL/). To
open a REPL, you can

* use Ctrl+Shift+P (Shift+Command+P on OS-X) and select "Julia: Start REPL" in
  Visual Studio Code, or

* start the Julia application on OS-X or Windows, or

* run `julia` in a shell/terminal if the Julia executable is on your `$PATH`.

Then run

```julia
julia> include(download("https://raw.githubusercontent.com/oschulz/julia-setup/main/julia_setup_ijulia_revise.jl"))
```

to install and configure IJulia and Revise. Note that IJulia and Revise should
always be installed in your *default* Julia environment (*not* in individual
project environments) to avoid version conflicts: the Jupyter kernel
configuration is tied to a specific IJulia install path.
"julia_setup_ijulia_revise.jl" takes care of this automatically.

To manually install IJulia instead, run

```julia
julia> import Pkg; Pkg.activate(); Pkg.add("IJulia"); Pkg.build("IJulia")
```

(IJulia is not required to run Julia Jupyter notebooks in Visual Studio Code,
but installing it anyway doesn't hurt.)


## First steps in Julia

Now press "]" to enter the Julia
[package management console](https://docs.julialang.org/en/v1/stdlib/Pkg/)
and add some Julia packages you need, like

```
(@v1.10) pkg> add Plots
```

*Note: Later on, you will probably want to
[use](https://pkgdocs.julialang.org/v1/environments/) separate Julia
[project environments](https://docs.julialang.org/en/v1/manual/code-loading/#Project-environments)
for different use cases, instead of adding all packages you may possibly need
to your default environment. Julia project environments are lightweight
(different from Python virtual environments) and easy to manage.*

Press backspace or Ctrl+C to get back to the main Julia REPL. Test if you can
[make a plot](https://docs.juliaplots.org/stable/):

```julia
using Plots
plot(rand(100))
```

You should be all set now,
[have fun with Julia](https://julialang.org/learning/)!
