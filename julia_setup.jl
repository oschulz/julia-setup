import Pkg

# Activate default environment
# Can't use `Pkg.activate()` with stacked depots if first(DEPOT_PATH) doesn't exist:
Pkg.activate(joinpath(first(DEPOT_PATH), "environments", "v$(VERSION.major).$(VERSION.minor)"))
# Will also create he environment if it doesn't exist:
Pkg.instantiate()

if !("Revise" in keys(Pkg.project().dependencies))
    @info "Installing Revise into default Julia environment \"$(Pkg.project().path)\""
    Pkg.add("Revise")
end

config_dir = joinpath(first(DEPOT_PATH), "config")
mkpath(config_dir)

startup_jl = joinpath(config_dir, "startup.jl")
if !isfile(startup_jl)
    @info "Adding Revise initialization code to \"$startup_jl\"."
    write(startup_jl,
"""
try
    using Revise
catch e
    @warn "Error initializing Revise, try adding Revise.jl to your environment" exception=(e, catch_backtrace())
end
"""
    )
else
    @warn "File \"$startup_jl\" already exists, not adding Revise initialization code automatically."
end

startup_ijulia_jl = joinpath(config_dir, "startup_ijulia.jl")
if !isfile(startup_ijulia_jl)
    @info "Adding Revise initialization code to \"$startup_ijulia_jl\"."
    write(startup_ijulia_jl,
"""
try
    @eval using Revise
catch e
    @warn "Error initializing Revise" exception=(e, catch_backtrace())
end
"""
    )
else
    @warn "File \"$startup_ijulia_jl\" already exists, not adding Revise initialization code automatically."
end

try
    @eval using Revise
catch e
    @warn "Error initializing Revise" exception=(e, catch_backtrace())
end


@info "All done, enjoy using Julia!"
