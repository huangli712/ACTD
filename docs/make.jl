using Documenter

makedocs(
    sitename = "ACTD",
    clean = false,
    authors = "Li Huang <huangli@caep.cn> and contributors",
    format = Documenter.HTML(
        prettyurls = false,
        ansicolor = true,
        repolink = "https://github.com/huangli712/ACTD",
        assets = ["assets/actd.css"],
        collapselevel = 1,
    ),
    remotes = nothing,
    pages = [
        "Home" => "index.md",
        "Introduction" => "intro.md",
        "Method" => "method.md",
        "Datasets" => "data.md",
        "Notes" => "note.md",
        "Acknowledgements" => "ack.md",
    ],
)
