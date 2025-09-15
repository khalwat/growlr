<?php

namespace modules\sitemodule\gql\queries;

use craft\gql\base\Query;
use GraphQL\Type\Definition\Type;
use modules\sitemodule\gql\arguments\GrowlrArguments;
use modules\sitemodule\gql\interfaces\GrowlrInterface;
use modules\sitemodule\gql\resolvers\GrowlrAllMatchesResolver;
use modules\sitemodule\gql\resolvers\GrowlrBestMatchesResolver;
use modules\sitemodule\helpers\Gql as GqlHelper;

class GrowlrQuery extends Query
{
    public static function getQueries($checkToken = true): array
    {
        if ($checkToken && !GqlHelper::canQueryGrowlr()) {
            return [];
        }

        return [
            'pawmateBestMatches' => [
                'type' => Type::listOf(GrowlrInterface::getType()),
                'args' => GrowlrArguments::getArguments(),
                'resolve' => GrowlrBestMatchesResolver::class . '::resolve',
                'description' => 'This query is used to resolve pawmates that best match the passed in attributes arguments.',
            ],
            'pawmateAllMatches' => [
                'type' => Type::listOf(GrowlrInterface::getType()),
                'args' => GrowlrArguments::getArguments(),
                'resolve' => GrowlrAllMatchesResolver::class . '::resolve',
                'description' => 'This query is used to resolve all pawmates, sorted by `matchPercentage`.',
            ],
        ];
    }
}
