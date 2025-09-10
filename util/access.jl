#
# Project : Daisy
# Source  : ACTD.jl
# Author  : Li Huang (huangli@caep.cn)
# Status  : Unstable
#
# Last modified: 2025/09/10
#

#=

*Remarks* :

In this file, we provide two functions to access the green's functions and
spectral functions in the ACTD.
=#

using DelimitedFiles

"""
    read_green(dir::String, type::String, ind::Int)

Read Matsubara and imaginary time Green's functions in the ACTD.

### Arguments
* dir -> Directory for the dataset.
* type -> Type of the Green's function. It could be "matsubara" or "time".
* ind -> Index for the record.

### Returns

If type is "matsubara", the returns are:

* grid -> Matsubara frequency, ωₙ.
* gre -> Real part of Matsubara Green's function, ReG(iωₙ).
* gim -> Imaginary part of Matsubara Green's function, ImG(iωₙ).
* dre -> Error bar for real part of Matsubara Green's function, Δ ReG(iωₙ).
* dim -> Error bar for imaginary part of Matsubara Green's function, Δ ImG(iωₙ).

They are vectors. The size is given by `size(grid)`.

If type is "time", the returns are:

* grid -> Imaginary time slice, τ.
* gt -> Imaginary time Green's function, G(τ).
* dt -> Error bar for imaginary time Green's function, Δ G(τ).

They are 2d array. The shape is `(ntime, nbins)`.

### Examples

```html
dd
```
"""
function read_green(dir::String, type::String, ind::Int)
    if type == "matsubara"
        fn = joinpath(dir, "green.data.") * string(ind)
        if isfile(fn)
            dlm = readdlm(fn)
            return dlm[:,1], # ωₙ
                   dlm[:,2], # ReG(iωₙ)
                   dlm[:,3], # ImG(iωₙ)
                   dlm[:,4], # Δ ReG(iωₙ)
                   dlm[:,5]  # Δ ImG(iωₙ)
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
                   reshape(dlm[:,3], (ntime, nbins))  # Δ G(τ)
        else
            @error "File $fn doesn't exist!"
        end
    end
end

"""
    read_image(dir::String, ind::Int)

### Arguments
### Returns
### Examples

```julia
mesh, image = read_image("../src/mat_boson_cont_n1e-3", 10)
```
"""
function read_image(dir::String, ind::Int)
    fn = joinpath(dir, "image.data.") * string(ind)
    if isfile(fn)
        dlm = readdlm(fn)
	    return dlm[:,1], # ω
               dlm[:,2]  # A(ω)
    else
        @error "File $fn doesn't exist!"
    end
end




