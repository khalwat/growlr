<?php

namespace modules\sitemodule\gql\resolvers;

use craft\gql\base\Resolver;
use GraphQL\Type\Definition\ResolveInfo;
use modules\sitemodule\helpers\Pawmate as PawmateHelper;

class PawmateBestMatchesResolver extends Resolver
{
    public static function resolve(mixed $source, array $arguments, mixed $context, ?ResolveInfo $resolveInfo): mixed
    {
        return PawmateHelper::getPawmateMatches($arguments, 1);
    }
}
