#let 字号 = (
  一号: 26pt,
  小一: 24pt,
  二号: 22pt,
  小二: 18pt,
  三号: 16pt,
  小三: 15pt,
  四号: 14pt,
  小四: 12pt,
  五号: 10.5pt,
)
#let 字体 = (
  仿宋: ("Times New Roman", "FangSong"),
  宋体: ("Times New Roman", "SimSun"),
  黑体: ("Times New Roman", "SimHei"),
  楷体: ("Times New Roman", "KaiTi"),
  代码: ("New Computer Modern Mono", "Times New Roman", "SimSun"),
)

#let conf(
  title: str,
  subtitle: "",
  faculty: str,
  major: str,
  class: str,
  student_name: str,
  student_id: str,
  adviser: str,
  date: datetime,
  abstract_ch: str,
  abstract_en: str,
  reference: "",
  thanks: str,
  appendixes: array,
  doc,
) = {
  set page("a4")

  // 
  {
    set page(header: {
      set align(left)
      image("./img/neusoft.png")
    })
    set align(center)
    set text(size: 字号.一号)
    set text(font: 字体.黑体)
    set par(leading: 1.5em)
    linebreak()
    [成都东软学院]
    linebreak()
    [本科毕业论文]

    linebreak()
    linebreak()

    set text(字号.三号)
    set par(leading: 1.5em)
    [#title]
    linebreak()
    subtitle

    linebreak()
    linebreak()
    linebreak()

    set table(
      stroke: (x, y) => if x == 1 {
        (bottom: black)
      },
      columns:  2,
      gutter: 0.5em,
    )
    table(
      [学#h(2em)院:], box(width: 15em, text(font: 字体.宋体)[#faculty]),
      [专#h(2em)业:], text(font: 字体.宋体)[#major],
      [班#h(2em)级:], text(font: 字体.宋体)[#class],
      [学生姓名:], text(font: 字体.宋体)[#student_name],
      [学生学号:], text(font: 字体.宋体)[#student_id],
      [指导老师:], text(font: 字体.宋体)[#adviser],
    )

    linebreak()
    linebreak()
    linebreak()

    text(size: 字号.三号, font: 字体.宋体, date.display("[year]年[month]月[day]日"))
  }

  pagebreak()

  set page(header: box(
    width: 100%,
    stroke: (bottom: black),
    align(center, text(font: 字体.宋体, size: 字号.五号)[成都东软学院毕业论文#v(5pt)]),
  ))

  // abstract
  {
    set page(numbering: "I")
    counter(page).update(1)

    set par(leading: 1.5em, justify: true, first-line-indent: 2em)
    // chinese
    set align(center)
    text(size: 字号.小二, font: 字体.黑体)[摘#h(1em)要]

    set align(left)
    set text(size: 字号.小四, font: 字体.宋体)
    abstract_ch

    pagebreak()

    // english
    set align(center)
    text(size: 字号.小二, font: 字体.黑体)[Abstract]

    set align(left)
    set text(size: 字号.小四, font: 字体.宋体)
    abstract_en
  }

  pagebreak()

  // content
  {
    set text(font: 字体.宋体, size: 字号.小四)
    outline(title: {
      set align(center)
      box(width: 100%, text()[目#h(1em)录])
    })
  }

  pagebreak()

  // body
  {
    set page(numbering: "1")
    set text(size: 字号.小四, font: 字体.宋体)
    set par(leading: 1.5em, justify: true, first-line-indent: (amount: 2em, all: true))
    counter(page).update(1)
    set heading(numbering: (..nums) => {
      let arr = nums.pos()
      let str_arr = arr.map(int => str(int))
      let len = arr.len()
      if(len == 1) { "第" + str_arr.first() + "章" }
      else { str_arr.join(".") }
    })
    show heading: it => {
      v(1em)
      set text(font: 字体.黑体)
      it
      v(1em)
    }
    show heading.where(level:  1): set align(center)

    set align(left)
    doc
  }

  // reference documentation
  if reference != "" {

    pagebreak()

    set page(numbering: "1")
    set text(size: 字号.小四, font: 字体.宋体)
    set par(leading: 1.5em, justify: true, first-line-indent: (amount: 2em, all: true))
    show heading.where(level:  1): set align(center)
    show heading: it => {
      v(1em)
      set text(font: 字体.黑体)
      it
      v(1em)
    }

    heading()[引#h(1em)用]
    bibliography(title: none, style: "gb-7714-2005-numeric", reference)
  }

  pagebreak()

  // thanks
  {
    set page(numbering: "1")
    set text(size: 字号.小四, font: 字体.宋体)
    set par(leading: 1.5em, justify: true, first-line-indent: (amount: 2em, all: true))
    show heading.where(level:  1): set align(center)
    show heading: it => {
      v(1em)
      set text(font: 字体.黑体)
      it
      v(1em)
    }

    heading()[致#h(1em)谢]
    set align(left)
    thanks
  }

  pagebreak()

  // appendixs
  {
    let appendix_numbering = counter("appendix_numbering")
    context appendix_numbering.step()

    set page(numbering: "1")
    set text(size: 字号.小四, font: 字体.宋体)
    set par(leading: 1.5em, justify: true, first-line-indent: (amount: 2em, all: true))
    show heading.where(level:  1): set align(center)
    show heading: it => {
      v(1em)
      set text(font: 字体.黑体)
      it
      v(1em)
    }

    let index = 0

    while index < appendixes.len() {
      let title = [附#h(1em)录] + [#context appendix_numbering.display("A")]
      heading(level: 1, title)
      context appendix_numbering.step()
      set align(left)
      appendixes.at(index)
      index += 1
      if(index != appendixes.len()) {
        pagebreak()
      }
    }
    
  }

  pagebreak()

  // letter of commitment
  {
    show heading.where(level: 1): set text(size: 字号.小二, font: 字体.黑体)
    show heading.where(level: 1): set align(center)
    set heading(outlined: false)
    set par(leading: 1.5em, justify: true, first-line-indent: (amount: 2em, all: true))

    set align(left)
    set text(font: 字体.宋体, size: 字号.四号)

    [
      = 成都东软学院
      = 毕业设计（论文）原创承诺书
      #v(1em)

      1、本人承诺：所提交的毕业设计（论文）是认真学习理解学校的《毕业设计（论文）工作规范》后，在教师的指导下，独立地完成了任务书中规定的内容，不弄虚作假，不抄袭别人的工作内容。

      2、本人在毕业设计（论文）中引用他人的观点和研究成果，均在文中加以注释或以参考文献形式列出，对本文的研究工作做出重要贡献的个人和集体均已在文中注明。

      3、在毕业设计（论文）中对侵犯任何方面知识产权的行为，由本人承担相应的法律责任。

      4、本人完全了解学校关于保存、使用毕业设计（论文）的规定，即：按照学校要求提交论文和相关材料的印刷本和电子版本；同意学校保留毕业设计（论文）的复印件和电子版本，允许被查阅和借阅；学校可以采用影印、缩印或其他复制手段保存毕业设计（论文），可以公布其中的全部或部分内容。

      5、本人完全了解《成都东软学院学士学位授予实施细则》关于“学生毕业设计（论文）出现购买、由他人代写、剽窃或者伪造数据等学位作假情形者”的情况，不授予学士学位；已经获得学位的，经学校学位评定委员会复议后，依法撤销其学位规定内容。

      6、本人完全了解《学生手册》中《成都东软学院毕业设计（论文）作假行为处理办法》的规定内容。

      以上承诺的法律结果、不能正常毕业及其他不可预见的后果由学生本人承担！

      #v(1em)

      #text(font: 字体.黑体, size: 字号.小三)[学生本人签字：]
      #h(1fr)
      #text(font: 字体.黑体, size: 字号.小三)[年#h(2em)月#h(2em)日]
    ]
  }
}
