use actix_web::{http::header::ContentType, HttpResponse};

use crate::session_state::TypedSession;
use crate::utils::{e500, see_other};

pub async fn change_password_form(session: TypedSession) -> Result<HttpResponse, actix_web::Error> {
    if session.get_user_id().map_err(e500)?.is_none() {
        return Ok(see_other("/login"));
    }

    Ok(HttpResponse::Ok()
        .content_type(ContentType::html())
        .body(include_str!("password.html")))
}
