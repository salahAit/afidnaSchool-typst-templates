// ═══════════════════════════════════════════════════════
// exam-template.typ — قالب امتحان قابل لإعادة الاستخدام
// ═══════════════════════════════════════════════════════
// الاستخدام:
//   #import "exam-template.typ": *
//   #show: exam.with(
//     institution: "...",
//     subtitle: "...",
//     exam-name: "...",
//     division: "...",
//     session: "...",
//     duration: "...",
//     subject: "...",
//   )

// === دالة رسم العلم الجزائري ===
#let algerian_flag() = {
  box(width: 45pt, height: 30pt, stroke: 0.2pt + gray)[
    #stack(dir: ltr,
      rect(width: 50%, height: 100%, fill: rgb("#006233")),
      rect(width: 50%, height: 100%, fill: white)
    )
    #place(center + horizon, dx: -2pt)[
      #text(fill: red, size: 18pt, font: "DejaVu Sans")[☪]
    ]
  ]
}

// === ترقيم فرعي (أ، ب، ج) ===
#let sub-enum(content) = {
  set enum(numbering: n => text(weight: "bold")[#("أ", "ب", "ج", "د", "هـ").at(n - 1) -])
  content
}

// === عنوان الموضوع ===
#let topic-header(num) = {
  v(8pt)
  align(center)[
    #line(length: 20%, stroke: 0.6pt + luma(160))
    #v(3pt)
    #text(size: 16pt, weight: "bold")[الموضوع #num]
    #v(3pt)
    #line(length: 20%, stroke: 0.6pt + luma(160))
  ]
}

// === عنوان تمرين ===
#let exercise(num, points) = {
  v(12pt)
  block(width: 100%)[
    #grid(
      columns: (auto, 1fr),
      column-gutter: 8pt,
      text(weight: "bold", size: 13pt, fill: black)[التمرين #num: (#points نقاط)],
      align(left + horizon)[#line(length: 100%, stroke: 0.4pt + luma(180))]
    )
  ]
  v(4pt)
}

// === تعليمة اختيار الموضوع ===
#let choice-instruction() = {
  v(8pt)
  align(center)[
    #rect(
      inset: 8pt,
      stroke: 1.2pt + luma(60),
      radius: 3pt,
      fill: luma(248),
    )[
      #text(size: 12pt, weight: "bold")[على المترشح أن يختار أحد الموضوعين الآتيين:]
    ]
  ]
}

// === نهاية الموضوع ===
#let topic-end(name) = {
  v(10pt)
  align(center)[
    #line(length: 15%, stroke: 0.4pt + luma(150))
    #v(3pt)
    #text(size: 11pt, fill: luma(80))[انتهى الموضوع #name]
  ]
}

// === القالب الرئيسي ===
#let exam(
  institution: "منصة أفدنا للعلوم والتربية",
  subtitle: "موافق للمناهج الدراسية لوزارة التربية الوطنية الجزائرية",
  exam-name: "امتحان بكالوريا التعليم الثانوي",
  division: "علوم تجريبية",
  session: "2023",
  duration: "03 سا و 30 د",
  subject: "الرياضيات",
  logo: "afidnaSchool.png",
  body,
) = {

  // إعدادات الصفحة
  set page(
    paper: "a4",
    margin: (top: 1cm, bottom: 1.5cm, x: 1.5cm),
    footer: context [
      #line(length: 100%, stroke: 0.3pt + luma(200))
      #v(2pt)
      #set align(center)
      #set text(size: 9pt, fill: luma(100))
      صفحة #counter(page).display() من #counter(page).final().at(0)
    ]
  )

  // إعدادات النص
  set text(
    font: ("KFGQPC Uthman Taha Naskh", "Amiri", "Noto Naskh Arabic"),
    lang: "ar",
    region: "dz",
    dir: rtl,
    size: 12pt
  )

  // إعدادات القوائم
  set enum(indent: 1em, spacing: 0.8em, numbering: n => text(weight: "bold")[#n\)])

  // إعدادات الرياضيات
  show math.equation: set text(font: "New Computer Modern Math", dir: ltr)

  // === رأس الصفحة ===
  v(5pt)
  align(center)[
    #stack(dir: ltr, spacing: 15pt,
      algerian_flag(),
      [
        #text(size: 16pt, weight: "bold")[#institution] \
        #text(size: 10pt, weight: "bold", fill: luma(80))[#subtitle]
      ],
      algerian_flag()
    )
  ]

  v(3pt)

  grid(
    columns: (1fr, auto, 1fr),
    column-gutter: 10pt,
    align(right + horizon)[
      #set par(leading: 0.6em)
      *#exam-name* \
      *الشعبة: #division*
    ],
    align(center + horizon)[#image(logo, width: 2.2cm)],
    align(left + horizon)[
      #set par(leading: 0.6em)
      *دورة: #session* \
      *المدة: #duration*
    ]
  )

  v(3pt)
  align(center)[
    #line(length: 100%, stroke: 1.2pt)
    #v(3pt)
    #text(size: 14pt, weight: "bold")[اختبار في مادة: #subject]
    #v(3pt)
    #line(length: 100%, stroke: 1.2pt)
  ]

  // المحتوى
  body
}
