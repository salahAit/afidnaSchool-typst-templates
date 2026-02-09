// ==========================================================================
// امتحان كتاب التوحيد - قالب المجالس الوهرانية
// ==========================================================================

// ------------------------------------------------------------------
// 1. استيراد البيانات من JSON
// ------------------------------------------------------------------

#let exam = json("exam_data.json")

// ------------------------------------------------------------------
// 2. الألوان والإعدادات
// ------------------------------------------------------------------

#let primary = rgb("#1a472a")       // أخضر داكن
#let secondary = rgb("#c9a227")     // ذهبي
#let accent = rgb("#2d5a3d")        // أخضر متوسط
#let question_bg = rgb("#fefae8")   // كريمي فاتح (للأسئلة)
#let options_bg = rgb("#fcfcfc")    // رمادي فاتح جداً (للخيارات)
#let text_main = rgb("#1a1a1a")     // أسود

// ------------------------------------------------------------------
// 3. إعدادات الصفحة والخطوط العامة
// ------------------------------------------------------------------

#set page(
  paper: "a4",
  margin: (
    top: 2.5cm,
    bottom: 2cm,
    inside: 2cm,
    outside: 2cm,
  ),
  // ترويسة الصفحات (تظهر بعد صفحة الغلاف)
  header: context {
    if counter(page).get().first() > 1 {
      set text(size: 9pt, fill: primary.lighten(40%))
      grid(
        columns: (1fr, 1fr),
        align(right)[#exam.info.title],
        align(left)[#exam.info.subtitle]
      )
      v(0.2em)
      line(length: 100%, stroke: 0.5pt + secondary)
    }
  },
  // تذييل الصفحات
  footer: context {
    if counter(page).get().first() > 1 {
      set align(center)
      set text(size: 10pt, fill: primary)
      line(length: 100%, stroke: 0.5pt + secondary)
      v(0.3em)
      counter(page).display("1")
    }
  },
)

// إعداد الخط العام: مجمع الملك فهد أولاً، ثم الأميري كاحتياط
#set text(
  font: ("KFGQPC Uthman Taha Naskh", "Amiri", "Noto Naskh Arabic"),
  lang: "ar",
  dir: rtl,
  size: 12pt,
  fill: text_main,
)

#set par(
  justify: true,
  leading: 0.9em,
)

// ------------------------------------------------------------------
// 4. دوال مساعدة للتنسيق
// ------------------------------------------------------------------

#let question_box(number, text_content) = {
  block(
    fill: question_bg,
    stroke: (
      right: 4pt + secondary,
      rest: 0.5pt + secondary.lighten(60%),
    ),
    inset: 1em,
    radius: (left: 6pt),
    width: 100%,
  )[
    #set par(first-line-indent: 0pt)
    #text(size: 14pt, weight: "bold", fill: secondary)[س #number]
    #h(0.5em)
    #text(size: 12pt, weight: "bold", fill: primary)[#text_content]
  ]
}

#let options_grid(options) = {
  pad(left: 0.5cm, top: 0.3cm, bottom: 0.8cm)[
    #grid(
      columns: (1fr, 1fr),
      row-gutter: 1.2em,
      column-gutter: 1em,
      ..options.map(opt => [
        #box(
          fill: white,
          stroke: 0.5pt + primary.lighten(80%),
          inset: (x: 0.5em, y: 0.5em),
          radius: 4pt,
          width: 100%,
        )[
          #box(stroke: 1pt + secondary, width: 12pt, height: 12pt, radius: 2pt)[ ] 
          #h(0.5em) 
          #text(size: 11pt)[#opt]
        ]
      ])
    )
  ]
}

// ------------------------------------------------------------------
// 5. صفحة الغلاف
// ------------------------------------------------------------------

#page(header: none, footer: none)[
  #place(center + horizon)[
    #block(
      stroke: (
        paint: secondary,
        thickness: 3pt,
        dash: "loosely-dotted"
      ),
      inset: 2cm,
      radius: 20pt,
    )[
      #set align(center)
      
      // الزخرفة
      #text(size: 24pt, fill: secondary)[﴿❁﴾]
      #v(1cm)
      
      // العنوان الرئيسي
      #text(size: 36pt, weight: "bold", fill: primary)[#exam.info.title]
      
      #v(0.5cm)
      #line(length: 60%, stroke: 2pt + secondary)
      #v(0.5cm)
      
      // العنوان الفرعي
      #text(size: 18pt, fill: accent)[#exam.info.subtitle]
      
      #v(2cm)
      
      #text(size: 14pt, fill: text_main)[
        "العلم قال الله قال رسوله ... قال الصحابة هم أولو العرفان"
      ]
      
      #v(3cm)
      
      // بيانات الطالبة
      #grid(
        columns: (1fr),
        row-gutter: 1.5em,
        align: center,
        text(size: 16pt, weight: "bold", fill: primary)[بيانات الطالبة],
        line(length: 40%, stroke: 0.5pt + secondary),
        text(size: 14pt)[الاسم: ...........................................................],
        text(size: 14pt)[الرقم: ...........................................................],
      )
      
      #v(2cm)
      #text(size: 12pt, fill: gray)[
        زمن الامتحان: #exam.info.time | الدرجة النهائية: #exam.info.total_marks
      ]
    ]
  ]
]

// ------------------------------------------------------------------
// 6. تعليمات الامتحان (الصفحة الداخلية)
// ------------------------------------------------------------------

#pagebreak()

#v(1cm)
#block(width: 100%)[
  #set align(center)
  #text(size: 18pt, weight: "bold", fill: primary)[#exam.info.description]
  #v(0.5em)
  #line(length: 30%, stroke: 1pt + secondary)
]
#v(1cm)

// ------------------------------------------------------------------
// 7. سرد الأسئلة
// ------------------------------------------------------------------

#let question_counter = counter("questions")

#for q in exam.questions [
  #question_counter.step()
  
  #block(breakable: false)[
    #context question_box(question_counter.display(), q.text)
    #options_grid(q.options)
  ]
]

// ------------------------------------------------------------------
// 8. الخاتمة
// ------------------------------------------------------------------

#v(1fr)
#align(center)[
  #line(length: 50%, stroke: 1pt + secondary)
  #v(0.5em)
  #text(size: 11pt, fill: primary, weight: "bold")[انتهت الأسئلة]
  #linebreak()
  #text(size: 9pt, fill: gray)[وفقكم الله وسدد خطاكم]
]
