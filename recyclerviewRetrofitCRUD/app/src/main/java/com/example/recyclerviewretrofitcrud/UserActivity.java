package com.example.recyclerviewretrofitcrud;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import java.util.Objects;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class UserActivity extends AppCompatActivity {

    MainInterface postService;
    Button btnBack;
    Button btnSave;
    Button btnDelete;
    EditText edtUId;
    EditText edtUName;
    TextView tUserId;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_user);
        edtUId = (EditText) findViewById(R.id.edtUId);
        edtUName = (EditText) findViewById(R.id.edtUName);
        btnBack = (Button) findViewById(R.id.btnBack);
        btnSave = (Button) findViewById(R.id.btnSave);
        btnDelete = (Button) findViewById(R.id.btnDelete);
        tUserId = (TextView) findViewById(R.id.tUserId);
        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl("http://192.168.1.18:8080/")
                .addConverterFactory(GsonConverterFactory.create())
                .build();

        postService = retrofit.create(MainInterface.class);
        Bundle extras = getIntent().getExtras();
        final String userId = extras.getString("user_id");
        String userName = extras.getString("user_name");
        edtUId.setText(userId);
        edtUName.setText(userName);
        if (userId != null && userId.trim().length() > 0) {
            edtUId.setFocusable(false);
        } else {
            tUserId.setVisibility(View.INVISIBLE);
            edtUId.setVisibility(View.INVISIBLE);
            btnDelete.setVisibility(View.INVISIBLE);
        }

        btnSave.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                MainData u = new MainData();
                u.setName(edtUName.getText().toString());
                if (userId != null && userId.trim().length() > 0) {
                    updateUser(Integer.parseInt(userId), u);
                } else {
                    addUser(u);
                }
            }
        });

        btnBack.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(UserActivity.this, MainActivity.class);
                startActivity(intent);
            }
        });

        btnDelete.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                deleteUser(Integer.parseInt(userId));
                Intent intent = new Intent(UserActivity.this, MainActivity.class);
                startActivity(intent);
            }
        });

    }

    public void addUser(MainData u) {
        Call<MainData> call = postService.addPost(u);
        call.enqueue(new Callback<MainData>() {
            @Override
            public void onResponse(Call<MainData> call, Response<MainData> response) {
                if (response.isSuccessful()) {
                    Toast.makeText(UserActivity.this, "User created successfully", Toast.LENGTH_SHORT).show();
                }
            }

            @Override
            public void onFailure(Call<MainData> call, Throwable t) {
                Log.e("Error: ", Objects.requireNonNull(t.getMessage()));
            }
        });
    }
    public void updateUser(int id, MainData u) {
        Call<MainData> call = postService.updatePost(id, u);
        call.enqueue(new Callback<MainData>() {
            @Override
            public void onResponse(Call<MainData> call, Response<MainData> response) {
                if (response.isSuccessful()) {
                    Toast.makeText(UserActivity.this, "User updated successfully", Toast.LENGTH_SHORT).show();
                }
            }

            @Override
            public void onFailure(Call<MainData> call, Throwable t) {
                Log.e("Error: ", Objects.requireNonNull(t.getMessage()));
            }
        });
    }
    public void deleteUser(int id) {
        Call<String> call = postService.deletePost(id);
        call.enqueue(new Callback<String>() {
            @Override
            public void onResponse(Call<String> call, Response<String> response) {
                if (response.isSuccessful()) {
                    Toast.makeText(UserActivity.this, "User deleted successfully", Toast.LENGTH_SHORT).show();
                }
            }

            @Override
            public void onFailure(Call<String> call, Throwable t) {
                Log.e("Error: ", Objects.requireNonNull(t.getMessage()));
            }
        });
    }
}
