import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../styles/styles.dart';
import 'package:provider/provider.dart';
import '../../providers/searchProviders.dart';
import '../../styles/base.dart';
import 'speach.dart';

class Search extends StatefulWidget {
  static const routname = '/search';
  final String title;
  final String imageUrl;
  final String searchKey;
  Search({Key key, this.title, this.imageUrl, this.searchKey})
      : super(key: key);
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var isInit = true;
  ProductsSearchProvider item;
  var _isLoading = false;
  var com;
  bool isStyle;
  var duplicateItems;
  @override
  void didChangeDependencies() async {
    if (isInit) {
      setState(() => _isLoading = true);
      item = Provider.of<ProductsSearchProvider>(context);
      try {
        await item.fetchByProductsList();
      } catch (error) {
        showGeneralDialog(
            context: context,
            barrierDismissible: true,
            barrierLabel:
                MaterialLocalizations.of(context).modalBarrierDismissLabel,
            barrierColor: Colors.black45,
            transitionDuration: const Duration(milliseconds: 1000),
            pageBuilder: (BuildContext buildContext, Animation animation,
                Animation secondaryAnimation) {
              return Align(
                alignment: Alignment.center,
                child: Container(
                  width: 300,
                  height: 215,
                  padding: EdgeInsets.all(20),
                  //color: Colors.white,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    image: DecorationImage(
                      image: AssetImage("assets/pattern5.png"),
                      colorFilter: new ColorFilter.mode(
                          Colors.grey[200].withOpacity(0.04),
                          BlendMode.dstATop),
                      repeat: ImageRepeat.repeat,
                      fit: BoxFit.none,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Error',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w200),
                      ),
                      Divider(
                        height: 20,
                        thickness: 1.0,
                        color: Colors.black,
                        indent: 0,
                        endIndent: 0,
                      ),
                      Text(
                        'Internet Connection problem. Please try again later',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w200),
                      ),
                      Divider(
                        height: 20,
                        thickness: 1.0,
                        color: Colors.black,
                        indent: 0,
                        endIndent: 0,
                      ),
                      TextButton(
                        onPressed: () {
                          //Navigator.of(context).pop();
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              Home.routname, (Route<dynamic> route) => false);
                        },
                        child: Text(
                          "Ok",
                          style: TextStyle(color: Colors.black),
                        ),
                        //color: Colors.transparent,
                      )
                    ],
                  ),
                ),
              );
            });
      }

      setState(() => _isLoading = false);
      duplicateItems = List.generate(
          item.productsList.length,
          (int i) => Search(
              title: item.productsList[i].title,
              imageUrl: item.productsList[i].imageUrl,
              searchKey: item.productsList[i].title.toLowerCase()));
    }
    isInit = false;
    super.didChangeDependencies();
  }

  var items = [];
  void filterSearchResults(String query) {
    List dummySearchList = [];
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.searchKey.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }

  FocusNode _focus = new FocusNode();
  final TextEditingController editingController = TextEditingController();
  @override
  void initState() {
    //items.addAll(duplicateItems);
    super.initState();
    if (widget.title == null) {
      editingController.addListener(() {
        final text = editingController.text.toLowerCase();
        editingController.value = editingController.value.copyWith(
          text: text,
          selection:
              TextSelection(baseOffset: text.length, extentOffset: text.length),
          composing: TextRange.empty,
        );
      });
    } else {
      editingController.text = widget.title;
      _focus.addListener(_onFocusChange);
    }
  }

  void _onFocusChange() {
    filterSearchResults(widget.title);
  }

  Scaffold _page(dynamic context) {
    final bottomBarIndex = -1;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: <Widget>[
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(CupertinoIcons.left_chevron, color: Colors.white),
              ),
              Container(
                //color: Colors.black,
                width: screenWidth / 1.6,
                alignment: Alignment.center,
                padding: new EdgeInsets.only(left: 10),
                child: Text(
                  "Search Products",
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 2.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              // Your widgets here
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                CupertinoIcons.mic,
                color: Colors.white,
                size: 26,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(Speach.routname);
              },
            ),
          ],
          backgroundColor: Colors.pink[700],
          centerTitle: true,
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[700]),
                backgroundColor: Colors.white,
              ),
            )
          : Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 20, 8, 8),
                        child: CupertinoTextField(
                          padding: EdgeInsets.fromLTRB(12.0, 14.0, 12.0, 14.0),
                          placeholder: "Search",
                          placeholderStyle: BaseStyles.placeholder(),
                          style: BaseStyles.text(),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue[400],
                              width: BaseStyles.borderWidth(),
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          prefix: BaseStyles.iconPrefix(CupertinoIcons.search),
                          autofocus: true,
                          focusNode: _focus,
                          onSubmitted: (value) {
                            filterSearchResults(value);
                          },
                          onChanged: (value) {
                            filterSearchResults(value);
                          },
                          controller: editingController,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 40, 10, 0),
                        height: screenHeight,
                        child: GridView.count(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 150),
                          crossAxisCount: 2,
                          primary: false,
                          childAspectRatio:
                              (screenHeight / (screenHeight / .8)),
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                          children: <Widget>[
                            for (var i in items)
                              card(context, i.title, i.imageUrl, screenHeight,
                                  screenWidth),
                            paddingVerticle(20.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _page(context),
          SideBar(),
        ],
      ),
    );
  }
}

Card card(context, title, image, screenHeight, screenWidth) {
  return new Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10), // if you need this
      side: BorderSide(
        color: Colors.grey.withOpacity(0.9),
        width: 1,
      ),
    ),
    color: Colors.white,
    child: GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Product(title: title, image: image),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: new EdgeInsets.fromLTRB(10, 10, 10, 0),
            //height: 60.0,
            //width: (screenWidth - 80) / 2,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Image.network(
              image,
              semanticLabel: title,
              filterQuality: FilterQuality.none,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.pink[400]),
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes
                        : null,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/demi.PNG',
                  fit: BoxFit.cover,
                  width: screenWidth / 2.5,
                  height: screenWidth / 2.5,
                  filterQuality: FilterQuality.high,
                );
              },
            ),
          ),
          paddingVerticle(5.0),
          Container(
            child: Text(
              title.length > 20 ? "${title.substring(0, 20)}.." : title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
