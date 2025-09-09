#
# Project : Daisy
# Source  : ACTD.jl
# Author  : Li Huang (huangli@caep.cn)
# Status  : Unstable
#
# Last modified: 2025/09/10
#

using DelimitedFiles

function read_green(dir::String, type::String, ind::Int)
    if type == "matsubara"
        fn = joinpath(dir, "green.data.") * string(ind)
        if isfile(fn)
            dlm = readdlm(fn)
            @show size(dlm)
        else
            @error "File $fn doesn't exist!"
        end
    else
        fn = joinpath(dir, "green.bin.") * string(ind)
        if isfile(fn)
            # Read the green's functions
            dlm = readdlm(fn, comments = true)

            # Determine number of data bins and number of time slices 
            nline1 = countlines(fn)
            nline2, = size(dlm)
            nbins = (nline1 - nline2) ÷ 3
            ntime = nline2 ÷ nbins
            @assert nbins ≥ 1
            @assert ntime ≥ 1

            # Reshape the data and return them
            return reshape(dlm[:,1], (ntime, nbins)), # τ
                   reshape(dlm[:,2], (ntime, nbins)), # G(τ)
                   reshape(dlm[:,3], (ntime, nbins))  # ΔG(τ)
        else
            @error "File $fn doesn't exist!"
        end
    end
end

function read_image(dir::String, ind::Int)
    fn = joinpath(dir, "image.data.") * string(ind)
    if isfile(fn)
        dlm = readdlm(fn)
	    return dlm[:,1], dlm[:,2]
    else
        @error "File $fn doesn't exist!"
    end
end

#mesh, image = read_image("../src/mat_boson_cont_n1e-3", 10)
read_green("../src/mat_boson_cont_n1e-3/", "matsubara", 100)
time, green, error = read_green("../src/tau_boson_cont_n1e-3/", "time", 100)
@show green[:,1]
@show green[:,2]
@show green[:,100]