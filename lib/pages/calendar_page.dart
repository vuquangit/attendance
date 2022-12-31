import 'package:attendance/provider/sign_in_provider.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/calendar/v3.dart' as GoogleAPI;
import 'package:http/io_client.dart' show IOClient, IOStreamedResponse;
import 'package:http/http.dart' show BaseRequest, Response;
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CalendarPage> {
  var appointments;

  // GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    final sp = context.read<SignInProvider>();
    super.initState();

    setState(() {
      appointments = sp.calendarData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Event Calendar'),
        ),
        body: Stack(
          children: [
            SfCalendar(
              view: CalendarView.month,
              // initialDisplayDate: DateTime(2020, 7, 15, 9, 0, 0),
              dataSource: GoogleDataSource(events: appointments),
              monthViewSettings: const MonthViewSettings(
                  appointmentDisplayMode:
                      MonthAppointmentDisplayMode.appointment),
            ),
            appointments != null
                ? Container()
                : const Center(
                    child: CircularProgressIndicator(),
                  )
          ],
        ));
  }
}

class GoogleDataSource extends CalendarDataSource {
  GoogleDataSource({required List<GoogleAPI.Event>? events}) {
    appointments = events;
  }

  @override
  DateTime getStartTime(int index) {
    final GoogleAPI.Event event = appointments![index];
    return event.start?.date ?? event.start!.dateTime!.toLocal();
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].start.date != null;
  }

  @override
  DateTime getEndTime(int index) {
    final GoogleAPI.Event event = appointments![index];
    return event.endTimeUnspecified != null && event.endTimeUnspecified!
        ? (event.start?.date ?? event.start!.dateTime!.toLocal())
        : (event.end?.date != null
            ? event.end!.date!.add(const Duration(days: -1))
            : event.end!.dateTime!.toLocal());
  }

  @override
  String getLocation(int index) {
    return appointments![index].location ?? '';
  }

  @override
  String getNotes(int index) {
    return appointments![index].description ?? '';
  }

  @override
  String getSubject(int index) {
    final GoogleAPI.Event event = appointments![index];
    return event.summary == null || event.summary!.isEmpty
        ? 'No Title'
        : event.summary!;
  }
}

class GoogleAPIClient extends IOClient {
  final Map<String, String> _headers;

  GoogleAPIClient(this._headers) : super();

  @override
  Future<IOStreamedResponse> send(BaseRequest request) =>
      super.send(request..headers.addAll(_headers));

  @override
  Future<Response> head(Uri url, {Map<String, String>? headers}) =>
      super.head(url,
          headers: (headers != null ? (headers..addAll(_headers)) : headers));
}
