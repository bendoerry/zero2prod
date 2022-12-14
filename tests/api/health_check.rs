use crate::helpers::spawn_app;

#[tokio::test]
async fn health_check_works() {
    // Arrange
    let app = spawn_app().await;

    // Act
    let response = reqwest::Client::new()
        .get(&format!("{}/health_check", &app.address))
        .send()
        .await
        .expect("Failed to execute");

    // Assert
    assert!(response.status().is_success());
    assert_eq!(Some(0), response.content_length());
}
