import 'package:flutter/material.dart';

List categories = [
  "Technology",
  "Clothing",
  "Decoration",
  "Books",
  "Hobby",
  "Others"
];

List<IconData> icons = [
  Icons.power,
  Icons.checkroom,
  Icons.home,
  Icons.menu_book_sharp,
  Icons.book,
  Icons.add_box
];

List mostSeenPhotos = [
  "https://img.letgo.com/images/6e/2a/bf/f0/6e2abff0d8c08c606a537c225b9f9c16.jpeg?impolicy=img_600_pwa",
  "https://cdn.tutumluanne.com/cdn-cgi/image/format=auto,fit=contain,q=85,w=800,h=800/https://cdn.tutumluanne.com/Media/UrunResimleri/07040f43-1c1f-42c1-a8e3-3a745f87b18c.png",
  "https://images.gardrops.com/uploads/306884/user_items/30688456-s1-file-59b03271110dc.jpeg",
  "https://images.gardrops.com/uploads/199807/user_items/199807237-s1-iphone-product-5b1706102da4b.png"
];

List mostSeenWatches = [256, 185, 200, 157];

List mostRecentPhotos = [
  "https://www.ikincielmucevher.com/Files/ProductImages/61955a0c-5858-4481-abee-3ad065056ffa4aa9f47c-6b4c-499b-a7a8-ead3d313eac6.jpg",
  "https://i.pinimg.com/564x/67/09/92/670992498333f617774f955a87d14ca2.jpg",
  "https://i.pinimg.com/564x/67/82/08/67820885460c9b4b8f034553c0371f22.jpg",
  "https://images.gardrops.com/uploads/2351209/user_items/23512097-s4-file-6031053d52ea3.jpeg"
];

List clothing = [
  "https://images.gardrops.com/uploads/2351209/user_items/23512097-s4-file-6031053d52ea3.jpeg",
  "https://images.gardrops.com/uploads/134640/user_items/134640400-s1-iphone-product-595b89361554c.png",
  "https://images.gardrops.com/uploads/306884/user_items/30688456-s1-file-59b03271110dc.jpeg",
  "https://images.gardrops.com/uploads/199807/user_items/199807237-s1-iphone-product-5b1706102da4b.png"
];

List mostRecentWatches = [25, 30, 62];

List clothingPrices = ["200-300", "100-200", "50-100", "500-600"];

List clothingCities = ["Muğla", "İzmir", "Ankara", "Bolu"];

List messagesPersons = [
  "elifbilge.p",
  "kaganecee",
  "ekinkarr",
  "emirkaankurt_",
  "x.nezya",
  "tugbayill",
  "erenk35",
  "beyazdeniz71"
];

List messages = [
  "I will meet you there",
  "Can you make it 50?",
  "Where are you in Izmir?",
  "Is 60 ok?",
  "Hello!!",
  "Can u send another picture?",
  "Please make it 200",
  "I cant afford that",
];

List clothingPhotos = [
  "https://firebasestorage.googleapis.com/v0/b/swapp-77137.appspot.com/o/pictures%2Fswappies%2Fswappie_525fad8c-4f47-49d2-8398-6b5ced2949bf.jpg?alt=media&token=c0908133-cba4-4082-bc41-1b3c4489f14c",
  "https://firebasestorage.googleapis.com/v0/b/swapp-77137.appspot.com/o/pictures%2Fswappies%2Fswappie_8e691e8b-9c9f-4067-8bb7-2e5b363c3757.jpg?alt=media&token=f52121b1-3280-4cb0-b000-59a59b27eee2",
  "https://firebasestorage.googleapis.com/v0/b/swapp-77137.appspot.com/o/pictures%2Fswappies%2Fswappie_0e8687e5-27e9-49fb-8cb8-25939ad0c024.jpg?alt=media&token=0a004b34-3163-460a-943c-4fe8179aacce",
  "https://firebasestorage.googleapis.com/v0/b/swapp-77137.appspot.com/o/pictures%2Fswappies%2Fswappie_a3586cef-e74a-4063-9d8d-4e6774ad60db.jpg?alt=media&token=c8e506a4-9274-4fc2-a25f-c9c62a574ea2",
  "https://firebasestorage.googleapis.com/v0/b/swapp-77137.appspot.com/o/pictures%2Fswappies%2Fswappie_a13cb213-e944-4d59-97e8-c32a5f78e587.jpg?alt=media&token=81fdfd99-348a-4110-a963-db1d48ea4db4",
  "https://firebasestorage.googleapis.com/v0/b/swapp-77137.appspot.com/o/pictures%2Fswappies%2Fswappie_9d9eead4-2b07-4fd5-8e8c-6570c0200d5f.jpg?alt=media&token=98a8dbde-f23a-469d-83f5-a4a439a827b7",
  "https://firebasestorage.googleapis.com/v0/b/swapp-77137.appspot.com/o/pictures%2Fswappies%2Fswappie_525fad8c-4f47-49d2-8398-6b5ced2949bf.jpg?alt=media&token=c0908133-cba4-4082-bc41-1b3c4489f14c",
  "https://firebasestorage.googleapis.com/v0/b/swapp-77137.appspot.com/o/pictures%2Fswappies%2Fswappie_a3586cef-e74a-4063-9d8d-4e6774ad60db.jpg?alt=media&token=c8e506a4-9274-4fc2-a25f-c9c62a574ea2",
];

List profilPhotoUrl = [
  "https://lh3.googleusercontent.com/a-/AOh14GhpbgwD1KDwKIt0LpmxYi96KlEob210iFw7RO2JjCg=s96-c",
  "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
  "https://d3c3u5pdgvvczg.cloudfront.net/performance_photos/thumbs/LUKE_KEMPNER_20_2_2019_HALF.jpg.800x800_q85_crop-smart_scale.jpg",
  "https://images.unsplash.com/photo-1542909168-82c3e7fdca5c?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTB8fGZhY2V8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
  "https://i.guim.co.uk/img/media/0e622be011c6795a9c5fd869fa61db1fd0e4802d/1258_4_3554_2133/master/3554.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=d2ae81d43169b6992b4f5c282ec770c2",
  "https://1.bp.blogspot.com/-8KiboZ6_PP0/X2wyFBrKwII/AAAAAAAAE3k/wW73lZSKQKcEYGw0-RkSBrn9Zrfz_hU6wCLcBGAsYHQ/s2048/Facetune_06-09-2020-18-54-19.JPG",
  "https://i.pinimg.com/originals/d1/aa/88/d1aa88385b7b71ebb7d6886c8b376cad.jpg",
  "https://images.unsplash.com/photo-1568967729548-e3dbad3d37e0?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8&w=1000&q=80",
];

