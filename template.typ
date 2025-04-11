#let 字号 = (
  一号: 26pt,
  小一: 24pt,
  二号: 22pt,
  小二: 18pt,
  三号: 16pt,
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
#let 间距(mutiple: int) = (
  (context text.size * mutiple).size()
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
  appendixs: array,
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

    if appendixs.len() == 1 {
      set heading(numbering: "A")
    }
    else {
      set heading(numbering: "A")
    }

    heading()[附#h(1em)录]
    set align(left)
    appendixs.first()
  }

  pagebreak()

  // letter of commitment
  {
  }
}
