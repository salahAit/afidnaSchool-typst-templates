// --- 2023 Mathematics Baccalaureate Exam - Model Answer ---
// --- Algeria - Official Correction ---

#set page(
  paper: "a4",
  margin: (top: 1cm, bottom: 1.5cm, x: 1.5cm),
  footer: context [
    #set align(center)
    #set text(size: 10pt)
    صفحة #counter(page).display() من #counter(page).final().at(0)
  ]
)

#set text(
  font: ("KFGQPC Uthman Taha Naskh", "Amiri", "Noto Naskh Arabic"),
  lang: "ar",
  region: "dz",
  dir: rtl,
  size: 11pt
)

// Global settings for lists and enums
#set enum(indent: 1em, spacing: 0.6em, numbering: n => text(weight: "bold")[#n\)])

// Math configuration
#show math.equation: set text(font: "New Computer Modern Math", dir: ltr)
#set math.equation(numbering: none)

// Helper function for the table
#let solution_table(content) = {
  table(
    columns: (1fr, 40pt, 40pt),
    stroke: 0.5pt,
    align: (right + horizon, center + horizon, center + horizon),
    inset: 6pt,
    fill: (col, row) => if row == 0 { gray.lighten(90%) } else { none },
    table.header([*عناصر الإجابة*], [*مجزأة*], [*مجموع*]),
    ..content
  )
}

// دالة احترافية لرسم العلم الجزائري
#let algerian_flag() = {
  box(width: 24pt, height: 16pt, stroke: 0.2pt + gray)[
    #stack(dir: ltr,
      rect(width: 50%, height: 100%, fill: rgb("#006233")),
      rect(width: 50%, height: 100%, fill: white)
    )
    #place(center + horizon, dx: -1pt)[
      #text(fill: red, size: 10pt, font: "DejaVu Sans")[☪]
    ]
  ]
}

#let header(topic) = {
  v(5pt)
  align(center)[
    #stack(dir: ltr, spacing: 15pt,
      algerian_flag(),
      [
        #text(size: 14pt, weight: "bold")[منصة أفدنا للعلوم والتربية] 
        #text(size: 12pt, weight: "bold")[الإجابة النموذجية - الموضوع #topic]
      ],
      algerian_flag()
    )
  ]
  v(3pt)
  align(center)[
    #line(length: 100%, stroke: 1.2pt)
    #text(size: 12pt, weight: "bold")[امتحان تجريبي بكالوريا التعليم الثانوي - دورة: 2023]
    #line(length: 100%, stroke: 1.2pt)
  ]
}

// --- Start of Solution Document ---

#header("الأول")

#solution_table((
  table.cell(colspan: 3, fill: gray.lighten(95%), align(center)[*التمرين الأول (04 نقاط)*]),
  [
    أ) إنجاز الشجرة التي تنمذج التجربة: 
    - اختيار الصندوقين: $P(U_1) = 1/2$ ، $P(U_2) = 1/2$. 
    - في $U_1$: سحب 2 من 5. $C_5^2 = 10$. 
    - في $U_2$: سحب 2 من 4. $C_4^2 = 6$.
  ], [0.75], [2],
  [
    ب) بيّن أنّ $P(A) = 23/60$: 
    $P(A) = P(U_1) times P(A|U_1) + P(U_2) times P(A|U_2)$ 
    $P(A) = 1/2 times C_4^2/C_5^2 + 1/2 times C_2^2/C_4^2 = 1/2 times 6/10 + 1/2 times 1/6 = 3/10 + 1/12 = 23/60$ 
    - حساب $P(B)$: $P(B) = 1/2 times C_1^2/10 + 1/2 times C_2^2/6 = 0 + 1/12 = 1/12$ 
    - حساب $P(C)$: $P(C) = 1 - (P(A) + P(B)) = 1 - (23/60 + 5/60) = 32/60 = 8/15$
  ], [2 times 0.5 \ 0.25], [],
  
  table.cell(colspan: 3, fill: gray.lighten(95%), align(center)[*التمرين الثاني (04 نقاط)*]),
  [
    1) صحيح لأن: $h(ln 2) = 7e^(2 ln 2) + 3 = 7(4) + 3 = 31$ (تصحيح: يرجى مراجعة القيمة في التمرين). 
    الدالة هي $h(x) = k e^(2x) + 3$. من $h(ln 2) = 25$ نجد $k(4)+3=25 => 4k=22 => k=5.5$.
  ], [1], [1],
  [
    2) خاطئ لأن: $lim_(x -> +oo) [x - ln(e^x - 1)] = lim_(x -> +oo) [ln e^x - ln(e^x - 1)] = lim_(x -> +oo) ln(e^x / (e^x - 1)) = ln(1) = 0$
  ], [1], [1],
  [
    3) خاطئ لأن القيمة المتوسطة هي: $1/2 integral_0^2 x(x^2+1)^2 dif x = 1/2 [1/6 (x^2+1)^3]_0^2 = 1/12 (125 - 1) = 124/12 = 31/3$
  ], [1], [1],
  [
    4) صحيح لأن: $v_n = integral_n^(n+1) e^(-x+3) dif x = [-e^(-x+3)]_n^(n+1) = e^(-n+3) - e^(-n+2)$ 
    المجموع $S_n = (e^3 - e^2) + (e^2 - e^1) + ... + (e^(-n+3) - e^(-n+2)) = e^3 - e^(-n+2)$
  ], [1], [1],

  table.cell(colspan: 3, fill: gray.lighten(95%), align(center)[*التمرين الثالث (05 نقاط)*]),
  [
    1) أ) البرهان بالتراجع: التحقق من الخاصية الابتدائية وإثبات الوراثة.
  ], [1], [1.5],
  [
    ب) $u_(n+1) - u_n = - (u_n - 1)^2 / (2 - u_n) < 0$ ، إذن $(u_n)$ متناقصة تماماً.
  ], [0.5], [],
  [
    2) أ) إثبات أن $(v_n)$ هندسية أساسها $q=2$: $v_(n+1) = 2 v_n$. عبارة $v_n = v_0 times 2^n = 2^n$.
  ], [1], [2],
  [
    ب) استنتاج $u_n = 1 / (2^n + 1)$ وحساب النهاية: $lim_(n -> +oo) u_n = 0$.
  ], [1], [],
  [
    3) حساب $S_n = 2^(n+1) - 1$. 
    تبيان أن $T_n = S_n + (n+1) = 2^(n+1) + n$.
  ], [1.5], [1.5],
))

#pagebreak()
#header("الثاني")

#solution_table((
  table.cell(colspan: 3, fill: gray.lighten(95%), align(center)[*التمرين الأول (04 نقاط)*]),
  [
    1) أ) تبيان $P(A) = 2/15$ و $P(B) = 2/3$. 
    ب) $P(C) = 1/3$ و $P(A inter C) = 4/45$. الحدثان غير مستقلان. 
    ج) الاحتمال الشرطي $P(A|C) = P(A inter C) / P(C) = 4/15$.
  ], [2.75], [2.75],
  [
    2) أ) تبرير مجموعة القيم ${2, 3, 4}$. 
    ب) قانون الاحتمال: $P(X=2) = 6/45$ ، $P(X=3) = 24/45$ ، $P(X=4) = 15/45$. 
    الأمل الرياضياتي $E(X) = 16/5 = 3.2$.
  ], [1.25], [1.25],

  table.cell(colspan: 3, fill: gray.lighten(95%), align(center)[*التمرين الثاني (04 نقاط)*]),
  [
    1) الاقتراح الصحيح هو (أ) لأن $Delta = -16$.
  ], [1], [1],
  [
    2) الاقتراح الصحيح هو (أ) بعد الضرب في المرافق.
  ], [1], [1],
  [
    3) الاقتراح الصحيح هو (أ) لأن $(1+3i)^2 = 1 - 9 + 6i = -8+6i$.
  ], [1], [1],
  [
    4) الاقتراح الصحيح هو (ب) بحساب الطويلة والعمدة.
  ], [1], [1],

  table.cell(colspan: 3, fill: gray.lighten(95%), align(center)[*التمرين الثالث (05 نقاط)*]),
  [
    1) أ) البرهان بالتراجع $u_n < 5$. 
    ب) $u_(n+1) - u_n = 1/5 (5 - u_n) > 0$ إذن متزايدة تماماً.
  ], [1.5], [1.5],
  [
    2) أ) $v_n$ هندسية أساسها $4/5$ و $v_0 = -5$. 
    ب) $v_n = -5 (4/5)^n$ و $u_n = 5 - 5(4/5)^n$. 
    ج) $lim u_n = 5$.
  ], [2], [2],
  [
    3) $S_n = -25 [1 - (4/5)^(n+1)]$. 
    $T_n = S_n + 5(n+1) = 5n - 20 [1 - (4/5)^n]$.
  ], [1.5], [1.5],
))
