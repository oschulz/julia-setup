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

First, download and install
[Julia v1.10](https://julialang.org/downloads/#upcoming_release):

* On Linux, simply download and extract the binary tarball and add the `"bin"`
subdirectory to your `$PATH`.

* On OS-X, download the disk image, open it, and drop "Julia" into your
  "Applicaitons" folder.

* On Windows, downdload and run the Julia installer.

Alternatively, you can use [Juliaup](https://github.com/JuliaLang/juliaup) to
install Julia and manage Julia versions.

On Windows (only!), you may also need to install the
[Visual C++ redistributable](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170), e.g. if you want to use [CUDA from Julia](https://cuda.juliagpu.org/stable/).

You should also install [Visual Studio Code](https://code.visualstudio.com/download)
and the excellent
[VS-Code Julia extension](https://code.visualstudio.com/docs/languages/julia).

If you want to run Jupyter notebooks outside of Visual Studio Code, you will
also need a working Jupyter installation.
[JupyterLab Desktop](https://github.com/jupyterlab/jupyterlab-desktop)
is easy [to install](https://github.com/jupyterlab/jupyterlab-desktop/releases),
but an [Anaconda](https://www.anaconda.com/) or custom Python installation with
Jupyter will work too, of course.

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

to install and configure IJulia and Revise.

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
