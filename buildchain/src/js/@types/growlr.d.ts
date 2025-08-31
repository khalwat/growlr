interface GrowlrAsset {
  url?: string
}

interface GrowlrUser {
  id?: number,
  username?: string,
  fullName?: string,
  photo?: GrowlrAsset,
  affection?: number,
  activityLevel?: number,
  bodySize?: number,
  hairyness?: number,
  diet?: number,
  attractiveness?: number,
}

interface GrowlrUserResponse {
  data: {
    users: GrowlrUser[]
  }
}

interface GrowlrPawmate {
  id?: number,
  title?: string,
  age?: string,
  sex?: string,
  shortDescription?: string,
  image?: GrowlrAsset[],
  affection?: number,
  activityLevel?: number,
  bodySize?: number,
  hairyness?: number,
  diet?: number,
  attractiveness?: number,
}

interface GrowlrPawmateResponse {
  data: {
    pawmateResolveMatch: GrowlrPawmate
  }
}
