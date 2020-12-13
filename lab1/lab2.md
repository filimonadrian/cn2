# lab 2 - explicatii

- Comportamental:
  - cum se comporta
  - folosim un always!!!
  - vrem sa ne trezim pe fiecare front pozitiv
  - de cate ori setam o iesire in always atunci trebuie setata variabila ca reg

- pentru fisierele de test: 
  - input -> reg
  - output -> wire
  - dupa instantiere, trebuie sa facem un initial(cum ma joc cu variabilele mele)

- SET AS TOP ca sa mearga simularea()

- assign se face doar in structural
- = si <= se folosesc doar in always(adica in comportamental)
- diferenta: una este blocanta, una nu este blocanta
  - = este blocant, adica fix acum se intampla
  - la neblicant se intampla dupa ce se termina toate de rulat(la sfarsitul ciclului, se seteaza valorile) 