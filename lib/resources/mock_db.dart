// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unnecessary_new

import 'package:bacheloroppgave/models/TttProjectInfo.dart';
import 'package:bacheloroppgave/models/ZoneObject.dart';
import 'package:bacheloroppgave/models/ActivityObject.dart';



TttProjectInfo getMockDb() {
  //MOCK Projectinfo init init
  ZoneObject zoneobj = new ZoneObject(
      order_number: 1,
      zone_name: "Ungdomsrommet 2.Etg",
      zone_info: "Eget rom med ungdomsbøker",
      id: 1);
  ZoneObject zoneobj1 = new ZoneObject(
      order_number: 2,
      zone_name: "Torget 2.Etg",
      zone_info: "Mingleområde med sitteplasser",
      id: 2);
  ZoneObject zoneobj2 = new ZoneObject(
      order_number: 3,
      zone_name: "Fantasia 2.Etg",
      zone_info:
          "eget rom for småbarn/barnehager (inneholder ikke bøker, men kan fungere som f.eks lunsjsted eller base for barnehager/grupper)",
      id: 3);

  ZoneObject zoneobj3 = new ZoneObject(
      order_number: 4,
      zone_name: "Gresseplasser 2.Etg",
      zone_info:
          "Området mellom bokhyllene der folk går og gresser/snuser etter bøker",
      id: 4);

  ZoneObject zoneobj4 = new ZoneObject(
      order_number: 5,
      zone_name: "Krimrommet 1.Etg",
      zone_info: "Eget rom for krimbøker",
      id: 5);

  ZoneObject zoneobj5 = new ZoneObject(
      order_number: 6,
      zone_name: "Lesesal 1.Etg",
      zone_info: "Lesesal i 1.etg",
      id: 6);

  ZoneObject zoneobj6 = new ZoneObject(
      order_number: 7,
      zone_name: "Sitteplasser 1.Etg",
      zone_info: "Sitteplasser i 1. etg, gjelder ikke sitteplasser i kafeen",
      id: 7);

  ZoneObject zoneobj7 = new ZoneObject(
      order_number: 8,
      zone_name: "Torget 1.Etg",
      zone_info: "Mingelområde med inn- og utleveringsmulighteter",
      id: 8);

  ZoneObject zoneobj8 = new ZoneObject(
      order_number: 9,
      zone_name: "Gresseplasser 1.Etg",
      zone_info:
          "Området mellom bokhyllene der folk går og gresser/snuser etter bøker",
      id: 9);

  ZoneObject zoneobj9 = new ZoneObject(
      order_number: 10,
      zone_name: "Musikkrommmet U.Etg",
      zone_info: "Eget rom for musikksamlinger",
      id: 10);

  ZoneObject zoneobj10 = new ZoneObject(
      order_number: 11,
      zone_name: "Sitteplasser U.Etg",
      zone_info: "Sitteplasser langs ytterveggene",
      id: 11);

  ZoneObject zoneobj11 = new ZoneObject(
      order_number: 12,
      zone_name: "Torget U.Etg",
      zone_info:
          "Sceneomåde i underetasjen, består for det meste av sitteplasser",
      id: 12);

  ZoneObject zoneobj12 = new ZoneObject(
      order_number: 13,
      zone_name: "Gresseplasser U.Etg",
      zone_info:
          "Området mellom bokhyllene der folk går og gresser/snuser etter bøker",
      id: 13);

  ZoneObject zoneobj13 = new ZoneObject(
      order_number: 14,
      zone_name: "Fleksible plasser (Studieverkstedet og Vepsebolet)",
      zone_info: "Sone 14",
      id: 14);

  ActivityObject actobj = new ActivityObject(
      activity_name: "ALLAP", activity_info: "Alene med digitalt hjelpemiddel");

  ActivityObject actobj1 = new ActivityObject(
      activity_name: "GRLAP",
      activity_info:
          "Sitter eller står i gruppe med bærbar(e) datamaskin(er) eller nettbrett slått på");

  ActivityObject actobj2 = new ActivityObject(
      activity_name: "ALUDIG",
      activity_info:
          "Sitter eller står alene og arbeider uten digitale medier");

  ActivityObject actobj3 = new ActivityObject(
      activity_name: "GRUDIG",
      activity_info:
          "Sitter eller står i gruppe og arbeider uten digitale medier");

  ActivityObject actobj4 = new ActivityObject(
      activity_name: "ALPERS",
      activity_info: "Individuell kontakt med personalet");

  ActivityObject actobj5 = new ActivityObject(
      activity_name: "GRPERS",
      activity_info: "Gruppevis kontakt med personalet");

  ActivityObject actobj6 = new ActivityObject(
      activity_name: "ALFYS", activity_info: "Kikker/browser alene");

  ActivityObject actobj7 = new ActivityObject(
      activity_name: "GRFYS", activity_info: "Kikker/browser i gruppe");

  ActivityObject actobj8 = new ActivityObject(
      activity_name: "ALPC",
      activity_info: "Bruker stasjonær datamaskin eller søketerminal alene");

  ActivityObject actobj9 = new ActivityObject(
      activity_name: "GRPC",
      activity_info: "Bruker stasjonær datamaskin eller søketerminal i gruppe");

  ActivityObject actobj10 =
      new ActivityObject(activity_name: "KØ", activity_info: "Venter i kø");

  ActivityObject actobj11 = new ActivityObject(
      activity_name: "MOB", activity_info: "Snakker i mobiltelefon");

  ActivityObject actobj12 = new ActivityObject(
      activity_name: "ALGÅ", activity_info: "Står eller går alene");

  ActivityObject actobj13 = new ActivityObject(
      activity_name: "GRGÅ", activity_info: "Står eller går i gruppe");

  ActivityObject actobj14 =
      new ActivityObject(activity_name: "ALSI", activity_info: "Sitter alene");

  ActivityObject actobj15 = new ActivityObject(
      activity_name: "GRSI", activity_info: "Sitter i gruppe");

  ActivityObject actobj16 = new ActivityObject(
      activity_name: "DIV", activity_info: " Andre aktiviteter");

  List<ZoneObject> zoneList = [];
  zoneList.addAll([
    zoneobj,
    zoneobj1,
    zoneobj2,
    zoneobj3,
    zoneobj4,
    zoneobj5,
    zoneobj6,
    zoneobj7,
    zoneobj8,
    zoneobj9,
    zoneobj10,
    zoneobj11,
    zoneobj12
  ]);

  List<ActivityObject> actList = [];
  actList.addAll([
    actobj,
    actobj1,
    actobj2,
    actobj3,
    actobj4,
    actobj5,
    actobj6,
    actobj7,
    actobj8,
    actobj9,
    actobj10,
    actobj11,
    actobj12,
    actobj13,
    actobj14,
    actobj15,
    actobj16
  ]);

  List<String> observerList = ["Maria", "Hans", "Helene"];
  String title = "OsloMet sitt bibliotek";
  String description = "En beskrivelse av mock-prosjektet :)";

  TttProjectInfo projectInfo = TttProjectInfo(
      activities: actList,
      zones: zoneList,
      observers: observerList,
      project_name: title,
      description: description,
      id: 12345);

  return projectInfo;
}
