<?php

namespace modules\sitemodule\gql\resolvers;

use craft\elements\Entry;
use craft\gql\base\Resolver;
use GraphQL\Type\Definition\ResolveInfo;
use Illuminate\Support\Collection;

class GrowlrResolver extends Resolver
{
    protected const PAWMATE_ATTRIBUES = [
        'affection',
        'activityLevel',
        'bodySize',
        'hairyness',
        'diet',
        'attractiveness',
    ];

    protected const PAWMATE_RESPONSE = [
        'id',
        'title',
        'age',
        'sex',
        'shortDescription',
        'image',
        'affection',
        'activityLevel',
        'bodySize',
        'hairyness',
        'diet',
        'attractiveness',
    ];

    public static function resolve(mixed $source, array $arguments, mixed $context, ?ResolveInfo $resolveInfo): mixed
    {
        $pawmateMatches = new Collection();
        $entryQuery = Entry::find();
        $pawmates = $entryQuery
            ->section('pawmates')
            ->type('pawmates')
            ->with(['image'])
            ->collect();
        foreach ($pawmates as $pawmate) {
            $score = 0;
            foreach (self::PAWMATE_ATTRIBUES as $attribute) {
                $score += abs((int)($arguments[$attribute] ?? 5) - (int)($pawmate[$attribute] ?? 5));
            }
            $score /= count(self::PAWMATE_ATTRIBUES);
            $pawmateMatches[$score] = $pawmate;
        }
        /** @var Entry $entry */
        $entry = $pawmateMatches->sortKeys()->first();
        $matchScore = $pawmateMatches->sortKeys()->keys()->first();
        foreach (self::PAWMATE_RESPONSE as $pawmateResponseItem) {
            $pawmateMatch[$pawmateResponseItem] = $entry->{$pawmateResponseItem};
        }
        $pawmateMatch['imageUrl'] = $entry->image->one()->getUrl() ?? '';
        unset($pawmateMatch['image']);
        $pawmateMatch['matchPercentage'] = (int)(100 - ($matchScore * 100) / 6);

        return $pawmateMatch;
    }
}
