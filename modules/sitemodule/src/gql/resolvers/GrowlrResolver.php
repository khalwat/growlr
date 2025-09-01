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
            $score = (int)($score / count(self::PAWMATE_ATTRIBUES) * 100);
            if (!$pawmateMatches->has($score)) {
                $pawmateMatches[$score] = new Collection();
            }
            $pawmateMatches[$score]->push($pawmate);
        }
        $entries = $pawmateMatches->sortKeys()->first();
        $matchScore = $pawmateMatches->sortKeys()->keys()->first();
        $resolvedPawmates = [];
        foreach ($entries as $entry) {
            $pawmateMatch = [];
            /** @var Entry $entry */
            foreach (self::PAWMATE_RESPONSE as $pawmateResponseItem) {
                $pawmateMatch[$pawmateResponseItem] = $entry->{$pawmateResponseItem};
            }
            $pawmateMatch['imageUrl'] = $entry->image->one()->getUrl() ?? '';
            unset($pawmateMatch['image']);
            $pawmateMatch['matchPercentage'] = (int)(100 - ($matchScore / 6));
            $resolvedPawmates[] = $pawmateMatch;
        }

        return $resolvedPawmates;
    }
}
