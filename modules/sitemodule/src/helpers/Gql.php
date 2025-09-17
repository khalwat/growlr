<?php

namespace modules\sitemodule\helpers;

use craft\helpers\Gql as GqlHelper;

class Gql extends GqlHelper
{
    // Public Methods
    // =========================================================================

    public static function canQueryPawmate(): bool
    {
        $allowedEntities = self::extractAllowedEntitiesFromSchema();

        return isset($allowedEntities['pawmate']);
    }
}
