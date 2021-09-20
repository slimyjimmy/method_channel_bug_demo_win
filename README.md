# method_channel_bug_demo_win

A sample app that shows that you cannot update a methodChannel's callback once registered on Windows.

Use the app in the following manner:
1. Run app on Windows
2a. Close app
2b. Notice there's a new statement in the console: "received native call"
3. Run app on Windows again
4. Press button (which is supposed to unregister the native call handler)
5a. Close app
5b. Notice there's a new statement in the console again (unregister didn't work).