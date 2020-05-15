# Catch List Tags

This library helps capture tags like Facebook comments after @

```
 1_ Get the current name after @
 
 2_ Get all  names in comment after @
 
```
###  Example

 ##### text

 ```
  Lorem ipsum #dolor sit amet, ea sea solum consul, eu est minim nusquam salutandi. #Sed consul mucius no, ad duo enim pertinacia. Nam soluta delectus ne, ad harum patrioque vix. Vim summo commune scripserit ne, facer timeam #sit id, eu has harum molestiae #scripse...
  
 ```
  ##### output

   ```
    List :  [#dolor , #Sed , #sit] ,
    
   ```
   ```
     currently : #scripse...
   ```
   
# Getting Started 
###  Parameters

| Name        |Type             | Usage  |
| ------------- |:-------------:| -----:|
| labelText     | String |  Text Field label |
| filterTag     | String | Filter character inside comment like @ or #  
| getListTags   | Function | Return names list in  comment  |
| getCurrentTag     | Function | Returns current name in  comment |


###  Usage

#####  Code

```
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: CatchListTags(
        filterTag: "@",
        labelText: "Content",
        getListTags: (allTags) {
          print(' List Tags : $allTags');
        },
        gteCurrentTag: (currentTag) {
          print(' Current Tag : $currentTag');
        },
      ),
    );
  }
}
```
#####   library

```
CatchListTags(
  filterTag: "@",
  labelText: "Content",
  getListTags: (allTags) {
    print(' List Tags : $allTags');
  },
  gteCurrentTag: (currentTag) {
    print(' Current Tag : $currentTag');
  },
),
```



















