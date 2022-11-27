use actix_web::{http::header::ContentType, HttpResponse};

pub async fn change_password_form() -> Result<HttpResponse, actix_web::Error> {
    Ok(HttpResponse::Ok()
        .content_type(ContentType::html())
        .body(include_str!("password.html")))
}
