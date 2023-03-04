import ProjectDescription

let target = Target(
    name: "TeamPlan",
    platform: .iOS,
    product: .app,
    bundleId: "com.kobong.TeamPlan",
    infoPlist: .default,
    sources: ["TeamPlan/Sources/**"],
    resources: ["TeamPlan/Resources/**"],
    dependencies: []
)

let project = Project(
    name: "TeamPlan",
    organizationName: nil,
    options: [],
    packages: [],
    settings: nil,
    targets: [target],
    schemes: [],
    fileHeaderTemplate: nil,
    additionalFiles: [],
    resourceSynthesizers: []
)
