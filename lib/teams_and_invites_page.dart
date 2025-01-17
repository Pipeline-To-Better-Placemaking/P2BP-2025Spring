import 'package:flutter/material.dart';
import 'teams_settings_screen.dart';

class TeamsAndInvitesPage extends StatefulWidget {
  const TeamsAndInvitesPage({super.key});

  @override
  State<TeamsAndInvitesPage> createState() => _TeamsAndInvitesPageState();
}

class _TeamsAndInvitesPageState extends State<TeamsAndInvitesPage> {
  List<int> items = [123, 3, 51, 2, 531, 3, 5];
  int itemCount = 7;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              labelColor: Colors.blue,
              indicatorColor: Colors.blue,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  child: Text(
                    'Teams',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Tab(
                  child: Text(
                    'Invites',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // TODO Backend: if list of projects is not empty
              itemCount > 0
                  // Iterate through list of projects, each being a card.
                  // Update variables each time with: color, team name, num of
                  // projects, and members list from database.
                  ? ListView.separated(
                      padding: const EdgeInsets.only(
                        left: 35,
                        right: 35,
                        top: 50,
                        bottom: 20,
                      ),
                      itemCount: itemCount,
                      itemBuilder: (BuildContext context, int index) {
                        return buildContainer(
                            index: index,
                            color: Colors.blue,
                            numProjects: items[index],
                            teamName: 'PlaceHolder');
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        height: 50,
                      ),
                    )
                  : const Center(
                      child: Text(
                          'You have no teams! Join a team or create one first.')),
              itemCount > 0
                  ? ListView.separated(
                      padding: const EdgeInsets.only(
                        left: 35,
                        right: 35,
                        top: 25,
                        bottom: 25,
                      ),
                      itemCount: itemCount,
                      itemBuilder: (BuildContext context, int index) {
                        return const InviteCard(
                          color: Colors.blue,
                          name: 'Placeholder',
                          teamName: 'Placeholder',
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        height: 25,
                      ),
                    )
                  : const Center(child: Text('You have no invites!')),
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainer(
      {required int index,
      required Color color,
      required int numProjects,
      required String teamName}) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      height: 200,
      child: Row(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, bottom: 10.0, right: 5.0, top: 5.0),
              child: Tooltip(
                message: "Select team",
                child: InkWell(
                  child: selectedIndex == index
                      ? const Icon(Icons.radio_button_on)
                      : const Icon(Icons.radio_button_off),
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
              ),
            ),
          ),
          const CircleAvatar(
            radius: 35,
          ),
          const SizedBox(width: 20),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text.rich(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  TextSpan(
                    children: [
                      const TextSpan(text: 'Team: '),
                      TextSpan(
                        text: teamName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '$numProjects ',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(text: 'Projects'),
                    ],
                  ),
                ),
                const Row(
                  children: [
                    Text(
                      'Members: ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
              tooltip: 'Open team settings',
              onPressed: () {
                // TODO: Actual function
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TeamSettingsScreen()));
              },
            ),
          ),
        ],
      ),
    );
  }
}

// class TeamCard extends StatefulWidget {
//   final Color color;
//   final String teamName;
//   final bool selected;
//   final Function onTap;
//   final int numProjects; // TODO: Variable class project, project.numProjects
//   // TODO: final List<Members> members; (implement list of members to use for
//   // members section with cover photos)
//
//   const TeamCard({
//     super.key,
//     required this.color,
//     required this.teamName,
//     required this.numProjects,
//     required this.selected,
//     required this.onTap,
//   });
//
//   @override
//   State<TeamCard> createState() => _TeamCardState();
// }
//
// class _TeamCardState extends State<TeamCard> {
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

class InviteCard extends StatelessWidget {
  final Color color;
  final String name;
  final String teamName;
  // TODO: final List<Members> members; (for cover photo, not implemented yet)

  const InviteCard({
    super.key,
    required this.color,
    required this.name,
    required this.teamName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      height: 140,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(width: 15),
          const CircleAvatar(
            radius: 25,
          ),
          Flexible(
            child: Stack(
              children: <Widget>[
                Center(
                  child: Text.rich(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    TextSpan(
                      children: [
                        TextSpan(
                          text: name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(text: ' has invited you to join: '),
                        TextSpan(
                          text: teamName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.check),
                        tooltip: 'Accept invitation',
                        color: Colors.white,
                        onPressed: () {
                          // TODO: Actual function
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.clear),
                        tooltip: 'Deny invitation',
                        color: Colors.white,
                        onPressed: () {
                          // TODO: Actual function
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10.0),
        ],
      ),
    );
  }
}
