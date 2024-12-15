import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player = AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClipPath Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final tabs = [
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
  ];

  int previousIndex = 0;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex == 0) player.play(AssetSource("1.mp3"));
    return Scaffold(
      appBar: AppBar(
        title: Text('我的自傳'),
        centerTitle: true,
      ),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        selectedFontSize: 18,
        unselectedFontSize: 14,
        iconSize: 30,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/f1.jpg',
              width: currentIndex == 0 ? 40 : 30,
              height: currentIndex == 0 ? 40 : 30,
            ),
            label: '自我介紹',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: '學習歷程',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.scale_outlined),
            label: '學習計畫',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.engineering),
            label: '專業方向',
          ),
        ],
        onTap: (index) async {
          setState(() {
            previousIndex = currentIndex;
            currentIndex = index;
          });

          // 停止當前播放的音檔
          await player.stop();

          // 根據新的 index 播放對應的音檔
          switch (index) {
            case 0:
              player.play(AssetSource("1.mp3"));
              break;
            case 1:
              player.play(AssetSource("2.mp3"));
              break;
            case 2:
              player.play(AssetSource("3.mp3"));
              break;
            case 3:
              player.play(AssetSource("4.mp3"));
              break;
          }
        },
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  final String content = '''
我的家庭採開放式教育，爸爸是CNC車床人員，媽媽則是家庭主婦，雖然小時候時常會到爸爸的工廠參觀，但對這行業就是提不太起興趣，反而在國二時得到了人生中第一台電腦，隨著對這電子設備有越深入的了解，興趣也越發濃厚，從而萌發出對資訊科技業的嚮往，家人也十分支持我選擇這條路，有了家人背後的支持，也令我更堅信自己未來所努力發展的方向。

國中時因會考失利，而未能考上心儀的學校，或許當下有些沮喪，但轉念一想這也是個新的出發點，拋下過去的遺憾從而認真面對這次的挑戰，因此我下定決心不管面對任何事都應當全力以赴。這三年來大大小小的考試我都不曾懈怠，因此成績維持在班上的前三名，這樣的結果對我來說也是另外一種肯定，也更加深了我對任何事物都應當不遺餘力的想法。

我是個責任感蠻重的人，只要是別人拜託我或是指派我的事，我都會想要盡力把它給做好，即使我對這件事情不太擅長，但我還是會盡我最大的努力去學習，辦法解決問題。由於我的個性比較沉穩，所以在團隊角色定位中比較趨向於監察員ME的位置，負責冷靜的判斷與分析問題，理性思考後再下定結論。 

由於我高中時的社團是秩序糾察社，因此深刻的體會分工合作的重要性，在社團中有負責服儀、交通、秩序的，每個人都是重要的一環缺一不可。且在我的職務中耐心是十分重要的，有時站崗就要花費一、兩個小時，雖然在這社團待了短短的一年，但在各方面也都學到了不少。 
''';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 3),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
            ],
          ),
          child: Text(content, style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  final String content = '''
在我成長的過程中，科技一直是我最大的興趣與追求。從小對電子設備的好奇心驅使我不斷探索與學習，這種對科技的熱愛也逐漸成為我未來的職業方向。中學時期，我開始接觸電腦硬體與軟體的運作，並學會了基本的程式設計，這讓我對資訊科技領域產生了濃厚的興趣。因此，在選擇大學科系時，我毫不猶豫地選擇了國立高雄科技大學電子工程系資訊組。

進入大學後，我的學習旅程充滿了挑戰與機會。課程內容從基本的數位邏輯、電路分析，到進階的資料結構與演算法，都讓我受益匪淺。特別是在實務課程，我學到了如何將理論知識應用於實際問題中，並透過實作專案提升自己的技能。

此外，課外閱讀與自學也成為我學習的重要一環。我經常閱讀最新的科技文章，關注人工智慧、物聯網等領域的發展，這些都加深了我對未來科技趨勢的理解，也激發了我繼續深造的動力。

回顧這幾年的學習經歷，我深刻體會到，知識的積累與實踐的結合才是學習的最佳方式。我將繼續保持對科技的熱情，不斷努力，拓展自己的專業領域，為未來的職業生涯做好準備。
''';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 3),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
            ],
          ),
          child: Text(content, style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  final String content = '''
近程(大學前):
a. 閱讀英語雜誌提升閱讀能力                          
b. 補強自身不足的學業科目                                                     
c. 多閱讀專業相關知識，為日後打下學習基礎           
d. 持續關注科技產業消息以跟上科技發展之脈動

中程I(大學四年)
(大一~大二)
a. 大一、大二時課程比例較重，因此要將學業鞏固好       
b. 善用校內資源，到圖書館借閱專業書籍提升相關專業知識                     
c. 持續加強英文聽說讀寫能力，報考多益驗收自身         
d. 跨領域選修，發展多元專業技術與知識                      
e. 課業負擔容許下，參加社團、志工服務等活動充實自我
 
中程II(大學四年)
(大三~大四)
. 參加專題競賽，鍛鍊抗壓性與解決問題的能力                                                        
b. 尋找各種校內外實習機會，增加自身實務能力                                                                 
c. 參與國內外各類研討會、演講等，增進自身科技視野          
d. 我會選修各類課程，學習更多專業技術                                                                     
e. 考取證照、製作專題精進自我

遠程(大學後)
a. 攻讀研究所，持續精進自身的專業能力                                                                                                     b. 到海外走走開拓國際視野
''';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 3),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
            ],
          ),
          child: Text(content, style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}

class Screen4 extends StatelessWidget {
  final String content = '''
在大學的學習過程中，我逐漸確立了自己在資訊科技領域的專業方向。對於資料處理、嵌入式系統以及人工智慧等領域產生了濃厚的興趣。這些技術不僅是未來科技發展的核心，對於現代社會的各個行業也有著深遠的影響。

我的專業方向主要集中在嵌入式系統與物聯網技術。嵌入式系統作為一種將計算機技術嵌入日常設備的技術，具有無處不在的特性。我對這一領域的興趣源於我對電子產品與硬體設備運作原理的好奇心，這也讓我在學習嵌入式系統課程時倍感興奮。我深入學習了各種嵌入式開發環境與編程語言，如C語言和Python，並進行了多次實作專案，從中提高了我的系統設計與調試能力。 

隨著物聯網技術的發展，我逐漸將目光轉向如何將嵌入式系統與互聯網技術結合，實現各種智能應用。物聯網技術作為未來智能城市與智慧家居的基礎，為我提供了廣闊的發展空間。這不僅讓我在學術上不斷拓展視野，也激發了我在未來專業領域進一步深耕的動力。

在未來，我希望能夠結合嵌入式系統與物聯網技術，深入研究智慧設備的開發與應用，特別是在智能醫療、環境監控等領域的應用。我相信，這些技術能夠為解決現代社會的各種挑戰提供有效的解決方案，並為我未來的職業生涯開闢新的道路。
''';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 3),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
            ],
          ),
          child: Text(content, style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
