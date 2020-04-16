import 'package:fluttermobxboilerplate/store/articles/article_store.dart';
import 'package:fluttermobxboilerplate/store/theme/theme_store.dart';
import 'package:fluttermobxboilerplate/values/imports.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ThemeStore _themeStore;
  ArticleStore _articleStore;

  @override
  void initState() {
    super.initState();
    _articleStore = ArticleStore()..getArticles();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _themeStore ??= Provider.of<ThemeStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appName),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.lightbulb_outline),
            onPressed: () {
              openBottomSheet(context, _themeStore);
            },
          )
        ],
      ),
      body: Center(
        child: Observer(
          name: 'article_list_observer',
          builder: (_) {
            switch (_articleStore.networkState) {
              case NetworkState.initial:
                return SizedBox.shrink();
                break;
              case NetworkState.loading:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case NetworkState.completed:
                return ListView.builder(
                  itemCount: _articleStore.articles.items.length,
                  itemBuilder: (context, index) {
                    final item = _articleStore.articles.items[index];
                    return ListTile(
                      title: Text(item.title),
                    );
                  },
                );
                break;
              case NetworkState.error:
                return Center(
                  child: Text(_articleStore.exception.message),
                );
                break;
              default:
                return SizedBox.shrink();
                break;
            }
          },
        ),
      ),
    );
  }

  void openBottomSheet(BuildContext context, ThemeStore _themeStore) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(Strings.lightLabel),
              onTap: () => changeTheme(_themeStore, context, ThemeMode.light),
            ),
            ListTile(
              title: Text(Strings.darkLabel),
              onTap: () => changeTheme(_themeStore, context, ThemeMode.dark),
            ),
            ListTile(
              title: Text(Strings.systemLabel),
              onTap: () => changeTheme(_themeStore, context, ThemeMode.system),
            ),
          ],
        );
      },
    );
  }

  void changeTheme(
      ThemeStore _themeStore, BuildContext context, ThemeMode mode) {
    _themeStore.switchTheme(mode);
    Navigator.of(context).pop();
  }
}
