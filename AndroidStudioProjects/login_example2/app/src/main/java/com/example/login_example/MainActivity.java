package com.example.login_example;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import androidx.activity.EdgeToEdge;
import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

import java.net.HttpCookie;

public class MainActivity extends AppCompatActivity {
    private FirebaseAuth mFirebaseAuth;
    private DatabaseReference mDatabaseRef;;
    TextView tv_main;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mFirebaseAuth = FirebaseAuth.getInstance();

        mDatabaseRef = FirebaseDatabase.getInstance().getReference("login_exmaple");

        tv_main = findViewById(R.id.tv_main);

        DatabaseReference userRef = mDatabaseRef.child("UserAccount").child(mFirebaseAuth.getCurrentUser().getUid());
        userRef.addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(@NonNull DataSnapshot dataSnapshot) {
                if (dataSnapshot.exists()) {
                    String nickname = dataSnapshot.child("nickname").getValue(String.class);
                    // 닉네임을 maintitle TextView에 설정
                    tv_main.setText(nickname + "님 지금은 ");
                }
            }

            @Override
            public void onCancelled(@NonNull DatabaseError databaseError) {
                // 에러 처리
            }
        });






        Button btn_logout = findViewById(R.id.btn_logout);
        btn_logout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // 로그아웃 하기
                mFirebaseAuth.signOut();

                Intent intent = new Intent(MainActivity.this, LoginActivity.class);
                startActivity(intent);
                finish();
            }
        });

        // 회원탈퇴 mFirebaseAuth.getCurrentUser().delete();
        Button btn_gf = findViewById(R.id.btn_gf);
        btn_gf.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, GirlFriendActivity.class);
                startActivity(intent);
            }
        });

    }
}