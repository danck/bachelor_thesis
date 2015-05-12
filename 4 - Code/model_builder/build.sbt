name := "Simple Project"

version := "1.0"

scalaVersion := "2.10.4"

libraryDependencies += "org.apache.spark" %% "spark-core" % "1.3.0"

/*lazy val root = (project in file(".")).
  settings(
    name := "model-builder",
    version := "1.0",
    scalaVersion := "2.10.4",
    mainClass in Compile := Some("haw.thesis.sdws.ModelBuilder")
  )

libraryDependencies ++= Seq(
  "org.apache.spark" %% "spark-core" % "1.3.0" % "provided",
  "org.apache.spark" %% "spark-streaming" % "1.3.0" % "provided",
  "org.apache.spark" % "spark-streaming-twitter_2.10" % "1.3.0"
)

// META-INF discarding
mergeStrategy in assembly <<= (mergeStrategy in assembly) { (old) =>
  {
    case PathList("META-INF", xs @ _*) => MergeStrategy.discard
    case x => MergeStrategy.first
  }
}*/