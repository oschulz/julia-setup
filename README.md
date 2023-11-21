# Julia installation and initial setup

This is a short tutorial on how to install the
[Julia programming language](https://julialang.org/)
and set things up so you can use
[the Julia Jupyter kernel (IJulia)](https://julialang.github.io/IJulia.jl/stable/)
and
[automatic code reloading (via Revise)](https://timholy.github.io/Revise.jl/stable/)

Please download and install
[Julia v1.10.0-rc1](https://julialang.org/downloads/#upcoming_release).
On Windows (only!), you may also need to install the [Visual C++ redistributable](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170).
Alternatively, you can use [Juliaup](https://github.com/JuliaLang/juliaup)
to install Julia and manage Julia versions.

You should also install [Visual Studio Code](https://code.visualstudio.com/download) and the
[VS-Code Julia extension](https://code.visualstudio.com/docs/languages/julia).

If you want to run Jupyter notebooks outside of Visual Studio Code, you will
also need a working Jupyter installation.
[JupyterLab Desktop](https://github.com/jupyterlab/jupyterlab-desktop/releases)
is easy to install, but a full Anaconda or custom Python installation with
Jupyter will work too, of course.

Now open a [Julia REPL](https://docs.julialang.org/en/v1/stdlib/REPL/)
and run

```
julia> include(download("https://raw.githubusercontent.com/oschulz/julia-setup/main/julia_setup_ijulia_revise.jl"))
```

You should be all set now, have fun with Julia!
