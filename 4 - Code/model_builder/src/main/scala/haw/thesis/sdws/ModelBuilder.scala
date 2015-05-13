/**
 *
 * Created by Daniel on 12.05.2015.
 */

import org.apache.spark.SparkConf
import org.apache.spark.SparkContext._

/**
 *
 */
object ModelBuilder {
  def main (args: Array[String]) {
    val sparkConf = new SparkConf().setAppName("Model Builder")
    val sc = new SparkContext(sparkConf)
  }
}
