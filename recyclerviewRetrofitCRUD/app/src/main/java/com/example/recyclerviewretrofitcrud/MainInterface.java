package com.example.recyclerviewretrofitcrud;

import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.DELETE;
import retrofit2.http.GET;
import retrofit2.http.POST;
import retrofit2.http.PUT;
import retrofit2.http.Path;
import retrofit2.http.Query;

public interface MainInterface {
    @GET("api/posts")
    Call<String> getPost (
            @Query("page") int page
    );
    @POST("api/posts/")
    Call<MainData> addPost(@Body MainData user);
    @PUT("api/posts/{id}")
    Call<MainData> updatePost(@Path("id") int id, @Body MainData body);
    @DELETE("api/posts/{id}")
    Call<String> deletePost(@Path("id") int id);
}
