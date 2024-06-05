import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isEditing = false;
  List<UserInfo> _userInfoList = [
    UserInfo(title: "Name", value: ""),
    UserInfo(title: "Gender", value: ""),
    UserInfo(title: "Phone Number", value: ""),
    UserInfo(title: "Email", value: ""),
    UserInfo(title: "Date of Birth", value: ""),
  ];
  List<UserInfo> _editedUserInfoList = [];

  @override
  void initState() {
    super.initState();
    _editedUserInfoList.addAll(_userInfoList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            itemCount: _userInfoList.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return _buildProfileImage();
              }
              final userInfo = _editedUserInfoList[index - 1];
              return ListTile(
                title: _isEditing
                    ? TextFormField(
                        initialValue: userInfo.value,
                        onChanged: (newValue) {
                          _editedUserInfoList[index - 1] = UserInfo(
                            title: userInfo.title,
                            value: newValue,
                          );
                        },
                      )
                    : Text(userInfo.value),
                subtitle: Text(userInfo.title),
              );
            },
          ),
          Positioned(
            top: 16,
            left: 16,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Color(0xFF4CAF50),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_isEditing) {
              _userInfoList = List.from(_editedUserInfoList);
            }
            _toggleEditing();
          });
        },
        backgroundColor: Color(0xFF4CAF50),
        child: Icon(
          _isEditing ? 
          Icons.save : Icons.edit,
        color: Colors.white,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildProfileImage() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: CircleAvatar(
        radius: 60,
        backgroundImage: NetworkImage(
          "https://images.unsplash.com/photo-1511367461989-f85a21fda167?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
        ),
      ),
    );
  }

  void _toggleEditing() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }
}

class UserInfo {
  final String title;
  final String value;

  UserInfo({required this.title, required this.value});
}
