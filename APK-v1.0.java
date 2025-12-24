package com.xp.quenq;

import android.app.Activity;
import android.os.Bundle;
import android.webkit.WebView;

public class MainActivity extends Activity {
    @Override
    protected void onCreate(Bundle b) {
        super.onCreate(b);

        WebView w = new WebView(this);
        w.getSettings().setJavaScriptEnabled(true);
        w.loadUrl("https://xp.quenq.com");
        setContentView(w);
    }
}
