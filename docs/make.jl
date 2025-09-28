using Documenter

makedocs(
    sitename = "ACTD: The User Guide",
    clean = true,
    authors = "Li Huang <huangli@caep.cn> and contributors",
    format = Documenter.HTML(
        prettyurls = false,
        ansicolor = true,
        repolink = "https://github.com/huangli712/ACTD",
        size_threshold = 409600, # 400kb
        assets = ["assets/actd.css"],
        collapselevel = 1,
    ),
    remotes = nothing,
    #format = Documenter.LaTeX(platform = "none"),
    modules = Module[],
    pages = [
        "Welcome" => "index.md",
        "Introduction" => "intro.md",
        "Method" => "method.md",
        "Datasets" => "data.md",
        "Notes" => "note.md",
        "Acknowledgements" => "ack.md",
    ],
)
