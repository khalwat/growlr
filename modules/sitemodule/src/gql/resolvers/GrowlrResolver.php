<?php

namespace modules\sitemodule\gql\resolvers;

use craft\gql\base\Resolver;
use GraphQL\Type\Definition\ResolveInfo;

class GrowlrResolver extends Resolver
{
    /**
     * @inheritDoc
     */
    public static function resolve(mixed $source, array $arguments, mixed $context, ResolveInfo $resolveInfo): mixed
    {
        return [];
    }
}
