#
# Project : Daisy
# Source  : ACTD.jl
# Author  : Li Huang (huangli@caep.cn)
# Status  : Unstable
#
# Last modified: 2025/09/10
#

using DelimitedFiles

function read_green(dir::String, type::String, ind::Int, bin::Int)

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

mesh, image = read_image("../src/mat_boson_cont_n1e-3", 10)
@show image
