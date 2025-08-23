import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:go_router/go_router.dart';

// Your GeoJSON data as a constant string
const String campusGeoJson = """
{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {},
      "geometry": {
        "coordinates": [
          [75.56392444978056, 26.842118238227712], [75.56410508193716, 26.842181240945493], [75.56401969219002, 26.84235852747595], [75.56431691381769, 26.84245815921315], [75.56447455642638, 26.842477206492788], [75.5644449984375, 26.84254900005726], [75.56460920948888, 26.84257097766998], [75.56469624134758, 26.84260467666836], [75.56502520203475, 26.842816634470097], [75.56573292970253, 26.84307157311632], [75.56583309770062, 26.84311111215075], [75.56597609588894, 26.843160967771638], [75.56580039006354, 26.84353604975], [75.56661650341132, 26.84383344838463], [75.56685946380196, 26.843271147080316], [75.56729626413173, 26.843446967241533], [75.56722236915857, 26.8437165568578], [75.56748346473105, 26.843867468156773]
        ],
        "type": "LineString"
      }
    },
    {
      "type": "Feature",
      "properties": {},
      "geometry": {
        "coordinates": [
          [75.5639926707567, 26.842125677272932], [75.56411345483349, 26.84185852857624], [75.56524134009419, 26.84225621583623], [75.56522432825224, 26.842292645112934], [75.56564281956409, 26.842435326335135], [75.56583675435732, 26.84251122060556], [75.56579422475252, 26.84261899027311], [75.56603409118523, 26.84270854448428]
        ],
        "type": "LineString"
      }
    },
    {
      "type": "Feature",
      "properties": {},
      "geometry": {
        "coordinates": [
          [75.56411698439504, 26.841856789502444], [75.56416631873734, 26.84173991174815], [75.56529250267153, 26.842148224417684], [75.5653401358285, 26.842055633197745], [75.56540307970002, 26.842076882335462], [75.56545071285694, 26.841966076371094], [75.56570248811673, 26.842045006657926], [75.5657739378531, 26.84186589554237], [75.56583858285197, 26.84174901779666]
        ],
        "type": "LineString"
      }
    },
    {
      "type": "Feature",
      "properties": {},
      "geometry": {
        "coordinates": [
          [75.56392346599003, 26.842120211427115], [75.5635875669798, 26.842981338916644], [75.56477174628486, 26.843415901141668], [75.56443134200907, 26.844071459158926]
        ],
        "type": "LineString"
      }
    },
    {
      "type": "Feature",
      "properties": {},
      "geometry": {
        "coordinates": [75.5639037337811, 26.84210947005886],
        "type": "Point"
      },
      "id": 4
    },
    {
      "type": "Feature",
      "properties": {},
      "geometry": {
        "coordinates": [75.56423439944129, 26.842432342733858],
        "type": "Point"
      },
      "id": 5
    },
    {
      "type": "Feature",
      "properties": {},
      "geometry": {
        "coordinates": [75.56441940258387, 26.842508731240954],
        "type": "Point"
      },
      "id": 6
    },
    {
      "type": "Feature",
      "properties": {},
      "geometry": {
        "coordinates": [75.565269883485, 26.842990982262336],
        "type": "Point"
      },
      "id": 7
    },
    {
      "type": "Feature",
      "properties": {},
      "geometry": {
        "coordinates": [75.5658299896817, 26.84310826990493],
        "type": "Point"
      },
      "id": 8
    },
    {
      "type": "Feature",
      "properties": {},
      "geometry": {
        "coordinates": [75.56689282842939, 26.84374588812436],
        "type": "Point"
      },
      "id": 9
    },
    {
      "type": "Feature",
      "properties": {},
      "geometry": {
        "coordinates": [75.56751416189044, 26.843887382755796],
        "type": "Point"
      },
      "id": 10
    },
    {
      "type": "Feature",
      "properties": {},
      "geometry": {
        "coordinates": [75.5659101997521, 26.84166094208605],
        "type": "Point"
      },
      "id": 11
    },
    {
      "type": "Feature",
      "properties": {},
      "geometry": {
        "coordinates": [75.56565257839608, 26.841566594616495],
        "type": "Point"
      },
      "id": 12
    },
    {
      "type": "Feature",
      "properties": {},
      "geometry": {
        "coordinates": [
          [75.56393241081534, 26.84211123638525], [75.56414100426912, 26.8416686547977], [75.56417221116277, 26.841728740479084]
        ],
        "type": "LineString"
      }
    },
    {
      "type": "Feature",
      "properties": {},
      "geometry": {
        "coordinates": [
          [75.56414757414066, 26.841640810203074], [75.56463867211443, 26.841804946663345], [75.56534329274558, 26.842054083057064], [75.56493686650214, 26.842965140763113], [75.56476604961054, 26.843409182877195], [75.5653327005846, 26.843611418537122], [75.56595519603599, 26.842272101224168], [75.56540989695137, 26.84207425927626]
        ],
        "type": "LineString"
      }
    },
    {
      "type": "Feature",
      "properties": {},
      "geometry": {
        "coordinates": [
          [75.56481040187367, 26.841850043053668], [75.56485474851371, 26.84174892333887], [75.5650009281787, 26.84166099307852], [75.56560207151631, 26.841706423721703], [75.56575974845853, 26.841854439561416], [75.56597317249947, 26.841882368549804], [75.5660487260331, 26.84185745501277], [75.56631644834093, 26.842042108160356], [75.5666022376304, 26.842231157766832], [75.56683875304293, 26.841964436902245], [75.56637229209113, 26.84163616420615], [75.5662523943214, 26.841527718584928], [75.56634437253649, 26.84131082339502], [75.56575472647435, 26.84109685881438], [75.56562989889665, 26.84132108196016], [75.56498540412665, 26.841275651737575], [75.56486386148379, 26.841385564926398], [75.56484086714926, 26.841757803452225]
        ],
        "type": "LineString"
      }
    },
    {
      "type": "Feature",
      "properties": {},
      "geometry": {
        "coordinates": [
          [75.5648619596912, 26.841771804382446], [75.56545324822244, 26.841971112679616], [75.56654670680922, 26.842355073174417], [75.56660419319405, 26.84222317846441], [75.56649743276509, 26.84245619234784], [75.56595541827974, 26.84227300537279], [75.56591928394971, 26.842350676673277], [75.56647279571243, 26.84254119099046], [75.56640381205031, 26.84268480926434], [75.56642023673166, 26.842715584585065], [75.56637096268759, 26.842821099906715], [75.56690969165106, 26.843017474809443], [75.5669753903766, 26.84287385695758], [75.5666206172578, 26.842741962851974], [75.56654342125503, 26.842566103805495], [75.56647608006205, 26.842549983379044], [75.56650400202076, 26.842456191761954], [75.56659926517236, 26.842488432639172], [75.56665018168388, 26.842696532624316], [75.56693432867314, 26.842800582473444], [75.56704624407234, 26.842846115053803], [75.56685900270574, 26.843284295587253], [75.56679161389283, 26.843419204010004], [75.56673412750803, 26.843408945634224], [75.56690987159911, 26.843016195700784], [75.5667423398487, 26.842959041679237]
        ],
        "type": "LineString"
      }
    },
    {
      "type": "Feature",
      "properties": {},
      "geometry": {
        "coordinates": [
          [75.56655674115225, 26.843801694175625], [75.56673084277594, 26.84341187656959], [75.56664871936903, 26.843378170472448], [75.56658630557837, 26.84347049584416], [75.56641713136062, 26.843417738498246], [75.56645326565993, 26.843313689216302], [75.56653046166275, 26.843136365571937], [75.56670784822126, 26.843190588534213], [75.56663065221846, 26.843381101438055]
        ],
        "type": "LineString"
      }
    },
    {
      "type": "Feature",
      "properties": {},
      "geometry": {
        "coordinates": [
          [75.56475373482411, 26.84496834227963], [75.56532478120582, 26.843614647556606], [75.56650606342504, 26.844014263919178], [75.56660123782149, 26.84384442713757]
        ],
        "type": "LineString"
      }
    },
    {
      "type": "Feature",
      "properties": {},
      "geometry": {
        "coordinates": [
          [75.56413230199757, 26.844788516606954], [75.56442902217603, 26.844074206251534]
        ],
        "type": "LineString"
      }
    },
    {
      "type": "Feature",
      "properties": {},
      "geometry": {
        "coordinates": [
          [75.56386417960653, 26.842299037514735], [75.56401651527739, 26.84235646929531], [75.5637719199755, 26.8429441861758], [75.56375261119442, 26.84298055807706], [75.56440271976129, 26.84319496861798], [75.56472270201866, 26.84330781847993], [75.56493082258316, 26.842773706283495], [75.56476990462124, 26.842660757503793], [75.56472699316473, 26.842756476816078], [75.56455534733865, 26.842722017873385], [75.56468408170818, 26.842371684689226], [75.56456178405668, 26.842337225629407], [75.56462186009531, 26.842161101379645], [75.56472484759166, 26.842199389283223], [75.56465618926083, 26.84235828394442], [75.5648621642523, 26.842431030824088], [75.56476990462124, 26.842647356793165]
        ],
        "type": "LineString"
      }
    },
    {
      "type": "Feature",
      "properties": {},
      "geometry": {
        "coordinates": [
          [75.56358555013196, 26.842974715726143], [75.56366064518087, 26.843210184436714], [75.56467335555502, 26.843558600653125], [75.56413267311927, 26.844795274789817], [75.56378079917494, 26.844866105753667], [75.56402324890496, 26.844703385906755], [75.56346539991199, 26.84512262880631], [75.56335168455149, 26.84546146743989], [75.56347277854877, 26.845899803567036], [75.56387614624066, 26.846196524682014], [75.56431169752503, 26.846229068241257], [75.56477609386843, 26.846029977020763], [75.56549271519313, 26.846052948979803], [75.56583910469237, 26.846072091553864], [75.56587343385664, 26.84560499422325], [75.56502807816244, 26.84558393651112], [75.56475988155927, 26.846028061969193], [75.56502593259052, 26.845570536147548], [75.56475556799617, 26.844990083483935]
        ],
        "type": "LineString"
      }
    },
    {
      "type": "Feature",
      "properties": {},
      "geometry": {
        "coordinates": [
          [75.56671460317895, 26.842774360890346], [75.56683381774965, 26.842833454806637]
        ],
        "type": "LineString"
      }
    }
  ]
}
""";

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final MapController _mapController;
  final List<Polyline> _polylines = [];
  final List<Marker> _markers = [];
  final LatLng _initialCenter = const LatLng(26.842109, 75.563903);

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _parseGeoJson();
  }

  void _parseGeoJson() {
    final Map<String, dynamic> data = jsonDecode(campusGeoJson);
    final features = data['features'] as List<dynamic>;

    for (var feature in features) {
      final geometry = feature['geometry'];
      final type = geometry['type'];
      final coordinates = geometry['coordinates'];

      if (type == 'LineString') {
        final List<LatLng> points = [];
        // The GeoJSON format is [longitude, latitude], but LatLng expects (latitude, longitude)
        for (var coord in coordinates) {
          points.add(LatLng(coord[1], coord[0]));
        }
        _polylines.add(
          Polyline(
            points: points,
            color: const Color(0xFFF0624A), // Orange color from your theme
            strokeWidth: 5.0,
          ),
        );
      } else if (type == 'Point') {
        _markers.add(
          Marker(
            point: LatLng(coordinates[1], coordinates[0]),
            width: 30,
            height: 30,
            child: const Icon(
              Icons.location_on,
              color: Color(0xFF1366A9), // Blue for markers
              size: 30,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              center: _initialCenter,
              zoom: 17.0,
              maxZoom: 19.0,
              minZoom: 15.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: const ['a', 'b', 'c'],
              ),
              PolylineLayer(
                polylines: _polylines,
              ),
              MarkerLayer(
                markers: _markers,
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Container(
                color: const Color(0xFFF7F5F0),
                child: Column(
                  children: [
                    _buildAppBar(context, 'Map'),
                    const SizedBox(height: 8),
                    _buildSearchBar('Search for your destination'),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => context.pop(),
          ),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Gilroy-Bold',
                  fontSize: 24,
                  color: Color(0xFF2A4459),
                ),
              ),
            ),
          ),
          const SizedBox(width: 40),
        ],
      ),
    );
  }

  Widget _buildSearchBar(String hintText) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: const Color(0xFFD1D1D1).withOpacity(0.9),
          width: 1,
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          icon: const ImageIcon(AssetImage('assets/images/search.png')),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: 'Gilroy-Medium',
            color: Color(0x33000000),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}