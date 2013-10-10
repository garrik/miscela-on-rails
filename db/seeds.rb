# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
a = Article.new({ author: 'erik', title: 'Musicisti al Verde', content: '<a href="http://www.benjerry.it/goodideas/top_ideas/idea.php?id=111">Sostieni Musicisti al Verde!</a>'\
''\
'Grazie a voi la community "Musicisti al Verde" di Miscela sta crescendo sempre di più... ma non fermatevi ora, continuate a sostenerci e votarci! DAJE RAGA!!', draft: false, permalink: 'musicisti-al-verde' })
a[:created_at] = DateTime.strptime('6/10/2011 0:00:00', '%m/%d/%Y %H:%M:%S')
a[:updated_at] = DateTime.strptime('6/10/2011 0:00:00', '%m/%d/%Y %H:%M:%S')
a.save

a = Article.new({ author: 'erik', title: 'Musicisti al Verde è una GOOD IDEA!!!', content: 'Musicisti al Verde e MISCELA tra le 25 Good Ideas che fanno bene al mondo!'\
''\
'Un ringraziamento speciale a tutti coloro i quali hanno sostenuto e votato M.a.V. per la campagna "Good Ideas" promossa da Ben & Jerry.'\
''\
'Grazie a BEN & JERRY che hanno creduto in noi!'\
''\
'Vi aspettiamo sulla pagina di Musicisti al verde per condividere pensieri, azioni e idee ecosostenibili.  '\
''\
'<a href="http://www.benjerry.it/goodideas/donazioni/">Ben&Jerry</a>', draft: false, permalink: 'musicisti-al-verde-una-good-idea' })
a[:created_at] = DateTime.strptime('7/4/2011 0:00:00', '%m/%d/%Y %H:%M:%S')
a[:updated_at] = DateTime.strptime('7/4/2011 0:00:00', '%m/%d/%Y %H:%M:%S')
a.save

a = Article.new({ author: 'erik', title: 'CONTEST BELLA KAZZO!', content: 'Ciao Miscelari!!!'\
''\
'è online un nuovo contest creativo destinato a tutti. Non occorre essere musicisti, appassionati di musica o affini. Occorre essere creativi! 3 Premi per 3 Vincitori.'\
'Tutti i dettagli <a href="http://www.facebook.com/pages/BELLA-KAZZO/240763659289248?sk=info">QUI</a>', draft: false, permalink: 'contest-bella-kazzo' })
a[:created_at] = DateTime.strptime('8/1/2011 0:00:00', '%m/%d/%Y %H:%M:%S')
a[:updated_at] = DateTime.strptime('8/1/2011 0:00:00', '%m/%d/%Y %H:%M:%S')
a.save

a = Article.new({ author: 'erik', title: 'MRF9 per SCUOLINA DI ADDIS', content: 'L\'onda lunga del ROCK risuona nella YEKA FOREST.'\
''\
'Per l’ edizione 2011 l’associazione culturale MISCELA promuove e partecipa al progetto alimentare “Scuolina di Addis – Yeka Forest – Ethiopia” devolvendo 0,50 centesimi per ogni pasto che verrà servito al pubblico e ai musicisti durante la prossima edizione del Miscela Rock Festival.'\
'La nona edizione della rassegna di musica indipendente di qualità si terrà il 2 - 3 - 4 Settembre a Strambino in provincia di Torino, il festival eco sostenibile ad impatto zero si impegna dunque partecipando al progetto di sostentamento alimentare dei bambini della scuola etiope situata alle porte della Yeka Forest ad Addis Abeba.'\
''\
'Tutti i dettagli <a href="http://www.facebook.com/media/set/?set=a.145491292200758.37768.133265760089978&type=1">QUI</a>', draft: false, permalink: 'mrf9-per-scuolina-di-addis' })
a[:created_at] = DateTime.strptime('8/1/2011 0:00:00', '%m/%d/%Y %H:%M:%S')
a[:updated_at] = DateTime.strptime('8/1/2011 0:00:00', '%m/%d/%Y %H:%M:%S')
a.save

a = Article.new({ author: 'erik', title: 'Segui gli aggiornamenti del programma MRF9 cliccando su main event', content: 'programma MRF9', draft: false, permalink: 'programma-mrf9' })
a[:created_at] = DateTime.strptime('8/12/2011 0:00:00', '%m/%d/%Y %H:%M:%S')
a[:updated_at] = DateTime.strptime('8/12/2011 0:00:00', '%m/%d/%Y %H:%M:%S')
a.save

a = Article.new({ author: 'erik', title: 'comunicato stampa MRF9', content: 'Comunicato Stampa MRF9 online, puoi scaricarlo a questo link:'\
''\
'<a href="http://www.associazionemiscela.it/download/comunicato miscela rock festival 2011.pdf">COMUNICATO STAMPA MRF9</a>', draft: false, permalink: 'comunicato-stampa-mrf9' })
a[:created_at] = DateTime.strptime('8/13/2011 0:00:00', '%m/%d/%Y %H:%M:%S')
a[:updated_at] = DateTime.strptime('8/13/2011 0:00:00', '%m/%d/%Y %H:%M:%S')
a.save

a = Article.new({ author: 'erik', title: 'LE BAND DEL MRF9', content: 'TUTTA LA LINE UP DEL FESTIVAL:'\
''\
'VENERDI 2 Settembre:'\
''\
'HOLLYWOOD NOISE'\
'VURTULA'\
'MAAK'\
'ADAM FREI'\
'AUTOMATIC'\
''\
'SABATO 3 Settembre:'\
''\
'DOTTOR ZERO & LA FANTABAND'\
'BANDA FRATELLI'\
'ITALIAN BREAKFAST'\
'ENRICO CAPUANO E LA TAMMURRIATA ROCK'\
'POOR MAN STYLE'\
''\
'DOMENICA 4 Settembre:'\
''\
'FOOS'\
'ONE LEG MAN'\
'SUBA\''\
'MACS INGHIO'\
'EVA!'\
'MONELLI ANTONELLIANI'\
'SKIANTOS'\
''\
'Clicca sul banner in home page per scoprire tutto sulle band!', draft: false, permalink: 'le-band-del-mrf9' })
a[:created_at] = DateTime.strptime('8/26/2011 0:00:00', '%m/%d/%Y %H:%M:%S')
a[:updated_at] = DateTime.strptime('8/26/2011 0:00:00', '%m/%d/%Y %H:%M:%S')
a.save

a = Article.new({ author: 'erik', title: 'MRFX', content: 'Il "Memorial in musica a Ivan & Ciki" raggiunge nel 2012 lo storico traguardo delle dieci edizioni.'\
''\
'Per raccontare questi dieci anni di festival e rivivere alcuni dei momenti più'\
'significativi sarà proposto un “Best of…MRF Live” degli artisti che hanno partecipato alle edizioni precedenti lasciando un segno, una emozione e ricordo speciale.'\
''\
'A presto!', draft: false, permalink: 'mrfx' })
a[:created_at] = DateTime.strptime('5/21/2012 0:00:00', '%m/%d/%Y %H:%M:%S')
a[:updated_at] = DateTime.strptime('5/21/2012 0:00:00', '%m/%d/%Y %H:%M:%S')
a.save

a = Article.new({ author: 'erik', title: 'Contest "...portami il diario!"', content: 'Da oggi è attiva sul sito una pagina dedicata ad un contest/sondaggio online alla quale parteciperanno di diritto tutte le band che hanno preso parte alla rassegna di "...portami il diario!" dal 2009 ad oggi.'\
'Il sondaggio rimarrà aperto fino a Domenica 29 Luglio, si potranno votare una o più band semplicemente cliccando sul nome del gruppo preferito. '\
'Al termine di questo periodo di voto la band che avrà ricevuto più consensi dal pubblico e dai fan vincerà il contest e si aggiudicherà un live alla Decima Edizione del Miscela Rock Festival (Settembre 2012, Strambino -TO-)', draft: false, permalink: 'contest-portami-il-diario' })
a[:created_at] = DateTime.strptime('6/13/2012 0:00:00', '%m/%d/%Y %H:%M:%S')
a[:updated_at] = DateTime.strptime('6/13/2012 0:00:00', '%m/%d/%Y %H:%M:%S')
a.save

a = Article.new({ author: 'erik', title: 'Programma MRFX', content: 'Quest\'anno la storica edizione Numero 10 del Miscela Rock Festival presenterà sul palco il "best of Mrf Live..." il meglio dei dieci anni di Miscela...da non perdere!<br />'\
'<br />'\
''\
'Eccovi il primo nome:'\
''\
'<a href="https://www.facebook.com/photo.php?fbid=10151060617249847&set=a.167072614846.118973.85135214846&type=1&theater">DENIMOR</a>', draft: false, permalink: 'programma-mrfx' })
a[:created_at] = DateTime.strptime('7/27/2012 0:00:00', '%m/%d/%Y %H:%M:%S')
a[:updated_at] = DateTime.strptime('7/27/2012 0:00:00', '%m/%d/%Y %H:%M:%S')
a.save

a = Article.new({ author: 'erik', title: 'Risultati contest "...portami il diario!', content: 'Si chiude il contest "...portami il diario!" per il Miscela Rock Festival...tutte le giovani band emergenti piemontesi chiamate a sfidarsi per guadagnare un posto sul palco della decima edizione del MRF...ecco il podio dei progetti più votati:'\
''\
'1^CLASSIFICATO: Hollywood Noise'\
'2^CLASSIFICATO: La Muffa'\
'3^CLASSIFICATO: Black Lions'\
''\
'Grandi ragazzi! A giorni pubblicheremo qualche novità che vi riguarda!'\
''\
'<a href="https://www.facebook.com/pages/MISCELA-ROCK-FESTIVAL/85135214846">tutte le news su MRF</a>', draft: false, permalink: 'risultati-contest-portami-il-diario' })
a[:created_at] = DateTime.strptime('7/31/2012 0:00:00', '%m/%d/%Y %H:%M:%S')
a[:updated_at] = DateTime.strptime('7/31/2012 0:00:00', '%m/%d/%Y %H:%M:%S')
a.save

a = Article.new({ author: 'erik', title: 'MRFX al via il 7 Settembre', content: '...area Verde di Crotte - Strambino- stiamo arrivando.'\
''\
'Oramai è tutto pronto, tutto il programma è stato svelato e cresce l\'attesa.'\
''\
'Sulla home page del sito, cliccando sulla main news, potrete scoprire nel dettaglio cosa vi aspetta alla decima edizione del Miscela Rock Festival! stay BK!', draft: false, permalink: 'mrfx-al-via-il-7-settembre' })
a[:created_at] = DateTime.strptime('8/31/2012 0:00:00', '%m/%d/%Y %H:%M:%S')
a[:updated_at] = DateTime.strptime('8/31/2012 0:00:00', '%m/%d/%Y %H:%M:%S')
a.save

a = Article.new({ author: 'erik', title: 'ISCRIZIONI MRF11', content: 'Dopo il grande successo della decima edizione del Miscela Rock Festival dedicata al "best of MRF live" torna a grande richiesta il bando per le candidature degli artisti al festival ecosostenibile e presobene per eccellenza. <strong>Iscrizioni libere, gratuite e per tutti i generi musicali</strong>. Come sempre le ascolteremo tutte e contatteremo gli artisti più interessanti per comporre la lineup ufficiale del MRF11. BK!', draft: false, permalink: 'iscrizioni-mrf11' })
a[:created_at] = DateTime.strptime('1/9/2013 0:00:00', '%m/%d/%Y %H:%M:%S')
a[:updated_at] = DateTime.strptime('1/9/2013 0:00:00', '%m/%d/%Y %H:%M:%S')
a.save

a = Article.new({ author: 'erik', title: 'Per tutti gli utenti', content: 'Iscriversi e semplice e veloce, fate solo attenzione alle dimensioni consentite, ai formati e alla compilazione dei campi richiesti! BK!', draft: false, permalink: 'per-tutti-gli-utenti' })
a[:created_at] = DateTime.strptime('1/10/2013 0:00:00', '%m/%d/%Y %H:%M:%S')
a[:updated_at] = DateTime.strptime('1/10/2013 0:00:00', '%m/%d/%Y %H:%M:%S')
a.save

a = Article.new({ author: 'erik', title: 'MRF NON E\' UN CONCORSO', content: 'Alcuni di voi ci contattano credendo che MRF sia un contest. Il miscela e\' sempre stato un festival, non ci sono vincitori o premi...c\'e\' un bando pubblico perche\' siete tantissimi a voler suonare e in questo modo possiamo ascoltarvi tutti e scegliere i migliori che si esibiranno al MRF11.', draft: false, permalink: 'mrf-non-e-un-concorso' })
a[:created_at] = DateTime.strptime('2/17/2013 0:00:00', '%m/%d/%Y %H:%M:%S')
a[:updated_at] = DateTime.strptime('2/17/2013 0:00:00', '%m/%d/%Y %H:%M:%S')
a.save

a = Article.new({ author: 'erik', title: 'RI.PRESA MUSICA', content: 'Esce oggi, Giovedi 28 Febbraio, il trailer del documentario Ri.PRESA Musica dell\'Associazione Miscela. Un documentario ad alta definizione che raccoglie sotto forma di video/interviste, musica originale e fotografie i contributi di testimonial e lavoratori della filiera musica...secondo Miscela.'\
'Clicca sul banner in Home Page per vedere il trailer e non perderti la "prima visione", sabato 16 marzo ore 17.30 presso salone pluriuso di Romano Canavese.', draft: false, permalink: 'ri-presa-musica' })
a[:created_at] = DateTime.strptime('2/28/2013 0:00:00', '%m/%d/%Y %H:%M:%S')
a[:updated_at] = DateTime.strptime('2/28/2013 0:00:00', '%m/%d/%Y %H:%M:%S')
a.save

a = Article.new({ author: 'erik', title: 'RI.PRESA MUSICA', content: 'Si terrà Sabato 16 Marzo alle ore 17,30 presso il Salone  polifunzionale  del Mulino di Cascine a Romano Canavese  la  presentazione del progetto Ri.Presa Musica, un video documentario ad alta definizione ideato e realizzato dalla Associazione Culturale Miscela.'\
''\
'Ad accompagnare la presentazione e la prima visione ufficiale del progetto sarà la band THE AFTERGLOW che proporrà uno show case semiacustico del loro ultimo lavoro discografico contenente il brano " I STILL GO", in programmazione nei migliori network radiofonici nazionali.'\
''\
'E\' un progetto  sostenuto da Tiesse e Localport, partner ufficiali dell\'Associazione Miscela.'\
''\
'L\'evento è realizzato dalla Associazione Culturale Miscela con il supporto del Comune di Romano Canavese.'\
''\
'guarda il trailer <a href="http://www.youtube.com/watch?v=EJ-g_3_N0CI">qui</a>', draft: false, permalink: 'ri-presa-musica' })
a[:created_at] = DateTime.strptime('3/15/2013 0:00:00', '%m/%d/%Y %H:%M:%S')
a[:updated_at] = DateTime.strptime('3/15/2013 0:00:00', '%m/%d/%Y %H:%M:%S')
a.save

a = Article.new({ author: 'erik', title: 'Chiusura iscrizioni MRF11', content: 'Si sono chiuse venerdi 31 maggio le iscrizioni gratuite per gli artisti che vogliono candidarsi a suonare al MRF11. 367 progetti provenienti da tutte le regioni italiane sono adesso in fase di ascolto. Grazie a tutti i musicisti che credono ogni anno nella qualita\' e nella originalita\' del miscela rock festival.bk!', draft: false, permalink: 'chiusura-iscrizioni-mrf11' })
a[:created_at] = DateTime.strptime('6/2/2013 0:00:00', '%m/%d/%Y %H:%M:%S')
a[:updated_at] = DateTime.strptime('6/2/2013 0:00:00', '%m/%d/%Y %H:%M:%S')
a.save

a = Article.new({ author: 'erik', title: 'comunicato stampa MRF11', content: 'Da oggi puoi scaricare il <strong>COMUNICATO STAMPA</strong> ufficiale del MISCELA ROCK FESTIVAL undicesima edizione cliccando <a href="http://associazionemiscela.it/download/comunicato MRF11 E_.pdf">qui</a>', draft: false, permalink: 'comunicato-stampa-mrf11' })
a[:created_at] = DateTime.strptime('8/26/2013 0:00:00', '%m/%d/%Y %H:%M:%S')
a[:updated_at] = DateTime.strptime('8/26/2013 0:00:00', '%m/%d/%Y %H:%M:%S')
a.save

a = Article.new({ author: 'erik', title: 'PARTNER MRF11', content: 'Miscela Rock Festival undicesima edizione è un evento organizzato e curato dall\'Associazione Culturale Miscela con il contributo di :'\
'Fondazione Cassa di Risparmio di Torino, Comune di Strambino, Unione collinare "Piccolo anfiteatro morenico", Tiesse spa, Sit impianti tecnologici, Hotel la villa, Hotel Cristal Palace, 3bite comunicazione.'\
'L\'associazione Miscela sostiene TO ADD, Insieme per Matilde onlus, U.G.I.', draft: false, permalink: 'partner-mrf11' })
a[:created_at] = DateTime.strptime('9/3/2013 0:00:00', '%m/%d/%Y %H:%M:%S')
a[:updated_at] = DateTime.strptime('9/3/2013 0:00:00', '%m/%d/%Y %H:%M:%S')
a.save
