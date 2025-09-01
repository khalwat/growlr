<?php

namespace modules\sitemodule\gql\queries;

use craft\gql\base\Query;
use GraphQL\Type\Definition\Type;
use modules\sitemodule\gql\arguments\GrowlrArguments;
use modules\sitemodule\gql\interfaces\GrowlrInterface;
use modules\sitemodule\gql\resolvers\GrowlrResolver;
use modules\sitemodule\helpers\Gql as GqlHelper;

class GrowlrQuery extends Query
{
    public static function getQueries($checkToken = true): array
    {
        if ($checkToken && !GqlHelper::canQueryGrowlr()) {
            return [];
        }

        return [
            'pawmateResolveMatches' => [
                'type' => Type::listOf(GrowlrInterface::getType()),
                'args' => GrowlrArguments::getArguments(),
                'resolve' => GrowlrResolver::class . '::resolve',
                'description' => 'This query is used to resolve a pawmate that best matches the passed in attributes arguments.',
            ],
        ];
    }
}
