package org.example;

import okhttp3.*;
import okhttp3.internal.connection.RealConnectionPool;

import java.io.IOException;
import java.util.Collections;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

public class HttpMain {

        private static final int THREAD_COUNT = 20;
        private static final String URL = "https://example.com";
        static OkHttpClient client = null;
        static {
                Dispatcher dispatcher = new Dispatcher();
                dispatcher.setMaxRequests(64);
                dispatcher.setMaxRequestsPerHost(64);
                client =  new OkHttpClent.Builder()
                        .protocols(Collections.singletonList(Protocol.HTTP_1_1))
                        .connectTimeout(15, TimeUnit.SECONDS) // Connection timeout
                        .readTimeout(15, TimeUnit.SECONDS)    // Read timeout
                        .writeTimeout(15, TimeUnit.SECONDS)   // Write timeout
                        .connectionPool(new ConnectionPool(10, 5, TimeUnit.MINUTES)) // Connection pool
                        .retryOnConnectionFailure(true)       // Retry on connection failure
                        .build();
            }

        public static void main(String[] args) {
            ExecutorService executorService = Executors.newFixedThreadPool(THREAD_COUNT);

            for (int i = 0; i < THREAD_COUNT; i++) {
                executorService.submit(() -> {
                    try {
                        Request request = new Request.Builder()
                                .url(URL)
                                .build();

                        for (int j = 0; j < 200; j++) { // 每个线程循环调用 10 次
                            Response response = client.newCall(request).execute();
                            System.out.println("conncount" + client.connectionPool().connectionCount());
                            System.out.println("protocol" + response.protocol());
//                            System.out.println(client.connectionPool().getDelegate$okhttp());
                            response.body().string();

                        }
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                });
            }

            executorService.shutdown();
            while (!executorService.isTerminated()) {
                // 等待所有线程完成
            }
            RealConnectionPool realConnectionPool    = client.connectionPool().getDelegate$okhttp();
            // 打印成功的连接数
            System.out.println("Total successful connections: " + client.connectionPool().connectionCount());
        }

}
