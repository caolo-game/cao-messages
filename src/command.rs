use super::{CompiledScript, StructureType, WorldPosition};
use serde::{Deserialize, Serialize};
use uuid::Uuid;

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all(serialize = "camelCase", deserialize = "camelCase"))]
pub struct PlaceStructureCommand {
    pub position: WorldPosition,
    pub owner: Option<Uuid>,
    pub ty: StructureType,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all(serialize = "camelCase", deserialize = "camelCase"))]
pub struct UpdateEntityScriptCommand {
    pub user_id: Uuid,
    pub entity_id: u32,
    pub script_id: Uuid,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all(serialize = "camelCase", deserialize = "camelCase"))]
pub struct UpdateScriptCommand {
    pub user_id: Uuid,
    pub script_id: Uuid,
    pub compiled_script: CompiledScript,
}
