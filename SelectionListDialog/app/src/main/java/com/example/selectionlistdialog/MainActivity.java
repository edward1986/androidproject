package com.example.selectionlistdialog;

import androidx.appcompat.app.AppCompatActivity;

import android.app.Dialog;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {

    TextView textView;
    ArrayList<String> arrayList;
    Dialog dialog;

    @Override
    protected
    void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        textView = findViewById(R.id.text_view);
        arrayList = new ArrayList<>();
        arrayList.add("Volvo");
        arrayList.add("BMW");
        arrayList.add("Ford");
        arrayList.add("Mazda");

        textView.setOnClickListener(new View.OnClickListener() {
            @Override
            public
            void onClick(View v) {
                dialog = new Dialog(MainActivity.this);
                dialog.setContentView(R.layout.dialog_searchable_spinner);
                dialog.getWindow().setLayout(650, 800);
                dialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                dialog.show();

                EditText editText = dialog.findViewById(R.id.edit_text);
                ListView listView = dialog.findViewById(R.id.list_item);

                final ArrayAdapter<String> adapter = new ArrayAdapter<>(MainActivity.this, android.R.layout.simple_list_item_1, arrayList);
                listView.setAdapter(adapter);
                editText.addTextChangedListener(new TextWatcher() {
                    @Override
                    public
                    void beforeTextChanged(CharSequence s, int start, int count, int after) {

                    }

                    @Override
                    public
                    void onTextChanged(CharSequence s, int start, int before, int count) {
                        adapter.getFilter().filter(s);
                    }

                    @Override
                    public
                    void afterTextChanged(Editable s) {

                    }
                });
                listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                    @Override
                    public
                    void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                        textView.setText(adapter.getItem(position));
                        dialog.dismiss();
                    }
                });
            }
        });
    }
}
