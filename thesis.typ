#import "template.typ": *

#let ab_cn = [
本文对大数据在人力资源管理中的应用进行了研究。自1954年现代管理学之父彼得德鲁克在其著作《管理实践》中提出“人力资源”这一概念以来，人力资源经历了人事管理、人为资源管理、人力资本管理几个阶段。二十一世纪的市场竞争日益激烈，越来越多的企业认识到其本质是人才的竞争，拥有高素质的人力资源，并加充分的开发和利用，创造出高品质的产品和服务占领市场，征服消费者，是在竞争中制胜的关键。

同时，随着互联网掀起第三次革命浪潮，世界逐步进入海量数据大爆炸时期，计算机技术的普及和互联网工具的广泛应用为大数据的兴起和发展奠定了广泛的基础。大数据时代扑面而来，为企业人力资源管理带来了全新的发展机遇，尤其是互联网企业受到的冲击将别明显。但是目前，大数据在国内的应用尚处于起步阶段，被提及最多的也只是市场营销领域，如何将“大数据”的相关原理和理念，应用到人力资源领域，提升企业人力资源管理工作的效率，是非常值得探究的一个话题。
]

#let ab_en = [
In this paper, the application of big data in human resource management is studied. Since Peter Drucker, father of the modern management science in 1954, in his book “the practice of management”, put forward the concept of human resources, human resources has experienced personnel management, human resource management, human capital management in several stages. The twenty-first century, the market competition is becoming increasingly fierce, more and more enterprises recognize the essence is the competition of talents, with a high-quality human resources, and the full development and utilization, to create high-quality products and services to occupy the market, to conquer the consumer, is the key to win in the competition in the competition.

At the same time, with the Internet set off a third wave of revolution, the world has gradually entered the era of massive data explosion, the era of big data has to avoid the arrival of the inevitable, human resource management is facing new challenges and opportunities. At present, big data applications in China is still in initial stage, was the most mentioned only in the field of marketing, how big data related to the principle and concept, applied to the field of human resources, improve the efficiency of human resources management in enterprises is a topic worth exploring.
]

#show: doc => conf(
  title: "题目：大数据时代互联网企业人力资源管理研究",
  subtitle: "——以XXXX公司为例",
  faculty: "计算机软件学院",
  major: "计算机科学与技术",
  class: "计算机22202",
  student_name: "我的名字",
  student_id: "我的学号",
  adviser: [指导教1#h(1em)指导教师2],
  date: datetime.today(),
  abstract_ch: ab_cn,
  abstract_en: ab_en,
  doc,
)

= 第一个章节

== lorem的使用

#lorem(1000)

== typst是一个模板工具

#lorem(100)

= 第二个章节

没有小章节的章节.

#lorem(1000)
