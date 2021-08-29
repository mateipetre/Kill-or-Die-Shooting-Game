# Kill-or-Die-Shooting-Game

Shooter game implemented in assembly x86

**KILL OR DIE Shooting Game**

    
    
**Descrierea proiectului**
     
    
-  Proiectul consta in implementarea in assembly a unui joc de tip shooter in care jucatorii
   se pot deplasa pe o harta si se pot ataca reciproc pana cand unul dintre acestia moare si pierde runda
   respectiva.
     
- Exista 2 niveluri de joc care pot fi selectate la deschiderea aplicatiei prin tastarea
  tastei 1, respectiv a tastei 2. Nivelul 2 aduce in plus fata de nivelul 1 inca o modalitate prin care
  jucatorii pot muri, si anume, un cadru de flacari. 
    
-  Utilizatorii trebuie sa isi aleaga un nume de jucator dupa ce au selectat nivelul de joc.
     
- Este desemnat castigator jucatorul care a castigat primul 3 runde.
     
- Jucatorii se pot deplasa si ataca reciproc folosind o serie de taste. In cadrul jocului exista 3 puteri
  care pot fi absorbite de catre jucatori.
 
- Harta este creata astfel incat jucatorii se pot deplasa prin
  miscare stanga-dreapta, salt sau cazatura. Barele de viata sunt afisate pentru fiecare jucator
  in parte in cadrul interfetei grafice in care are loc lupta. De asemenea, scorul este actualizat tot
  in aceeasi interfata. 



**Descrierea functiilor implementate**

- Adaugarea a 3 puteri (powerups) care pot fi absorbite de jucatori pe durata unei runde 
  
  Cele 3 puteri constau in: adaugarea unei vieti pe durata unei runde, dublarea impactului loviturii
  unui jucator (o lovitura va lua unui jucator 2 vieti), adaugarea unui scut care ofera imunitate pentru
  o singura lovitura incasata de catre un jucator pe durata unei runde.

- Adaugarea unui element de clearing a puterii absorbite

  Dupa ce jucatorul absoarbe o putere aceasta va disparea si va aparea, eventual, in alt loc prin
  alte mecanisme implementate.

- Adaugarea unui efect de anulare a loviturilor cand cei 2 jucatori lovesc in acelasi timp

  Daca cei 2 jucatori lovesc in acelasi timp, loviturile nu sunt incasate de niciunul dintre acestia 
  si, deci, nu li se vor decrementa numarul de vieti.

- Implementarea cazurilor de ciocnire intre jucatori si adaugarea efectului de anulare a loviturilor si in acest caz particular

  Cand jucatorii se ciocnesc acestia nu se pot ataca, deci efectul apasarii tastelor va fi anulat.

- Tratarea situatiilor de ciocnire a puterilor pe harta 

  Se verifica cazurile in care obiectele care reprezinta cele 3 puteri se pot ciocni intre ele sau
  cu alte obiecte de pe harta (jucatori, lovituri).

- Implementarea generarii aleatoare a pozitiilor in care se afla puterile pe harta

  Cele 3 puteri pot aparea pe harta in locuri selectate total aleator astfel incat sa nu ofere un 
  caracter anticipativ luptei (jucatorii nu stiu unde vor fi plasate puterile pe harta in niciun moment
  de timp).


**Detalii de implementare**

Proiectul a fost implementat in assembly si am folosit niste pattern-uri pentru a desena puterile
adaugate pe harta folosind o serie de culori reprezentate pe biti. Am folosit o serie de variabile
globale pentru a stoca pozitiile si starile acestora pe harta, dar si pentru generarea aleatoare
a acestora. Cele mai relevante sunt variabilele powerups1, powerups2, powerups3 si clearpowerup.

Am adaugat o functie de anulare a loviturilor jucatorilor cand ataca simultan, HIT_EACH_OTHER_CHECK, 
care verifica faptul ca cele 2 lovituri se intalnesc pe parcursul deplasarii lor (in sens opus una fata
de alta) si le sterge prin intermediul apelului unor proceduri specifice.

Implementarea puterilor a constat in mai multe etape: plasarea propriu-zisa a puterilor pe harta prin
intermediul variabilelor de pozitie powerup1x, powerup1y, powerup2x si powerup2y folosind apelul unor
proceduri de desenare sau stergere a acestora (am folosit stiva pentru a salva istoricul pozitiilor
si al starilor acestora), verificarea posibilitatii ciocnirii acestora pe harta folosind, de asemenea,
pozitiile si starile lor la anumite momente de timp verificand pe cazuri (cazul ciocnirii pe verticala,
cazul ciocnirii pe orizontala), adaugarea functionalitatiilor puterilor prin salturi conditionate
la etichete unde se vor incrementa puterea de atac sau viata dupa caz si generarea aleatoare a pozitiilor
puterilor pe harta folosind un macro care contine salturi conditionate multiple la etichete care 
sugereaza activarea sau dezactivarea starilor, folosind un index si vectori cu pozitii prestabilite.

In general, este folosita stiva pentru a stoca parametrii procedurilor si apelul acestora. 
A fost nevoie de modificarea procedurii de atac intre jucatori, luand in calcul si puterile absorbite de
acestia pe durata unei runde, astfel ca se verifica in plus daca efectul scutului exista pentru unul
dintre jucatori sau daca lovitura are un efect dublat folosind salturi conditionate si label-uri
specifice. 

**Probleme de implementare**

Efectul de anulare nu prezinta exact functionalitatea pe care mi-am dorit-o, in sensul ca atunci
cand ambii jucatori se ataca reciproc in acelasi timp cele 2 lovituri sunt prinse intr-una dintre acestea
care ramane statica pe harta. Ea ramane ca un obiect pe harta care poate fi sters de catre unul dintre
jucatori (absorbita). In cazul in care obiectul rezultat in urma coliziunii nu este sters atunci 
efectul de anulare a loviturilor continua desi, poate, cei 2 jucatori nu mai ataca in acelasi timp.

Am vrut sa mai schimb si alte aspecte grafice ale jocului initial dar este destul de complicat in assembly
intrucat am observat ca schimbarea unui singur element da peste cap intreaga grafica a jocului si atunci
am decis sa nu ma complic. Nu a fost usoara nici adaugarea de noi functionalitati intrucat a fost necesara
modificarea celorlalte situatii de joc (spre exemplu, a fost destul de greu sa sincronizez loviturile
cu puterile absorbite de jucatori).


**Proiecte similare pe internet**

1. Rocket Shooting - https://github.com/MichaelKMalak/Rocket-Shooting

   Exista un singur jucator care trebuie sa loveasca mai multe pietre si sa le distruga complet
   pentru a castiga, asta inainte de a fi lovit el de pietre si sa piarda jocul. Este scris in assembly.

2. Space Shooter - https://github.com/polina-krukovich/Space-Shooter

   Jucatorul conduce o naveta si trebuie sa distruga alte nave inamice inainte de a fi distrus el de
   catre acestea. Este scris in assembly.

3. Blobby Volley - https://github.com/aashrafh/BlobbyVolley

   Este proiectul din care m-am inspirat cel mai mult. Exista 2 jucatori care joaca volley folosind
   un perete intre ei. Primul cara scapa mingea pierde runda. Este scris in assembly. Proiectul
   contine o similaritate ridicata a modului grafic si a functionalitatilor cu proiectul meu.

**Instructiuni de instalare**

1. Instalare DOSBox, dupa ce a fost downloadat in prealabil de pe pagina principala.
2. Download fisiere sursa si adaugare intr-un director pe PC-ul propriu.
3. Introducere la sfarsitul fisierului DOSBox Options a urmatoarei secvente de instructiuni:

```
   mount c C:\Users\matei\OneDrive\Desktop\Projects\ShootingGame\sursa
c:
masm game;
link game;
game
```



   Atentie! Trebuie sa puneti calea de pe PC-ul propriu la care se gasesc fisierele sursa ale jocului.
   Se va inlocui, asadar, C:\Users\matei\OneDrive\Desktop\Projects\ShootingGame\sursa cu calea
   proprie. Dupa acesti pasi jocul poate fi accesat prin intermediul aplicatiei DOSBox.

**Capturi de ecran din joc**

Dupa ce a fost ales 1 pentru nivelul 1 de joc sau 2 pentru nivelul 2 de joc, jucatorii trebuie sa-si introduca numele

<img src="/images/introducere_nume_jucatori.png" alt="Introducere_nume_jucatori" width="636"/>

A pornit jocul pentru cei 2 jucatori la nivelul 1

<img src="/images/pornire_joc_nivel1.png" alt="Pornire joc nivel 1" width="636"/>

Unul dintre jucatori ataca 

<img src="/images/atac_jucator.png" alt="Atac jucator" width="636"/>

Jucatorul 2 a castigat o runda

<img src="/images/jucatorul2_a_castigat_o_runda.png" alt="Jucatorul 2 a castigat o runda" width="636"/>

A pornit jocul pentru cei 2 jucatori la nivelul 2

<img src="/images/pornire_joc_nivel2.png" alt="Pornire joc nivel 2" width="636"/>

Un jucator a castigat 3 runde

<img src="/images/un_jucator_castiga.png" alt="Un jucator castiga " width="636"/>

**Exemplu de utilizare**

Un exemplu de utilizare a jocului se regaseste la urmatoarea adresa: https://vimeo.com/556100720
