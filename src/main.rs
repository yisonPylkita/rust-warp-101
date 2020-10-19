use warp::Filter;

#[tokio::main]
async fn main() {
    // Use localhost:8080/hello/Adam
    let hello = warp::path!("hello" / String)
        .map(|name| format!("Nice to meet you - {}", name));

    warp::serve(hello)
        .run(([127, 0, 0, 1], 8080))
        .await;
}
