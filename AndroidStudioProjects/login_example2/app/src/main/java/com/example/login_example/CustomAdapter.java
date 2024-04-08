package com.example.login_example;

import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import org.w3c.dom.Text;

public class CustomAdapter extends RecyclerView.Adapter<CustomAdapter.CustomViewHolder> {

    @NonNull
    @Override
    public CustomViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return null;
    }

    @Override
    public void onBindViewHolder(@NonNull CustomViewHolder holder, int position) {

    }

    @Override
    public int getItemCount() {
        return 0;
    }

    public class CustomViewHolder extends RecyclerView.ViewHolder {
        ImageView iv_profile;
        TextView tv_id;
        TextView tv_pass;
        TextView tv_userName;


        public CustomViewHolder(@NonNull View itemView) {
            super(itemView);
            this.iv_profile
        }
    }


}
