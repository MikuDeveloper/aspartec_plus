// Please see this file for the latest firebase-js-sdk version:
// https://github.com/firebase/flutterfire/blob/master/packages/firebase_core/firebase_core_web/lib/src/firebase_sdk_version.dart
importScripts("https://www.gstatic.com/firebasejs/10.11.1/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/10.11.1/firebase-messaging-compat.js");

firebase.initializeApp({
  apiKey: "AIzaSyB_ov3bcKrIbPRr1KGyYODISCzSNk0bwXg",
  authDomain: "aspartec-plus.firebaseapp.com",
  projectId: "aspartec-plus",
  storageBucket: "aspartec-plus.firebasestorage.app",
  messagingSenderId: "522512067177",
  appId: "1:522512067177:web:e06e4f5b8f40bb23bc10f8",
  measurementId: "G-MMTY3EVY2W"
});

const messaging = firebase.messaging();

messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});