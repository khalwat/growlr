<?php

namespace modules\sitemodule\helpers;

use craft\elements\Entry;
use Illuminate\Support\Collection;

class Pawmate
{

    protected const PAWMATE_ATTRIBUTE_RANGE = 10;

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
        'neutered',
        'shortDescription',
        'image',
        'affection',
        'activityLevel',
        'bodySize',
        'hairyness',
        'diet',
        'attractiveness',
    ];

    // Public Methods
    // =========================================================================

    public static function getPawmateMatches(array $arguments, ?int $limit): array
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
            // The score will range from 0 to the number of attributes * the range of potential values of each attribute
            // 0 is a perfect match
            $score = ($score * 100) / (count(self::PAWMATE_ATTRIBUES) * self::PAWMATE_ATTRIBUTE_RANGE);
            if (!$pawmateMatches->has($score)) {
                $pawmateMatches[$score] = new Collection();
            }
            $pawmateMatches[$score]->push($pawmate);
        }
        $limit = $limit ?: $pawmateMatches->count();
        $pawmateMatches = $pawmateMatches->sortKeys()->take($limit);
        $resolvedPawmates = [];
        foreach ($pawmateMatches as $matchScore => $entries) {
            foreach ($entries as $entry) {
                $pawmateMatch = [];
                /** @var Entry $entry */
                foreach (self::PAWMATE_RESPONSE as $pawmateResponseItem) {
                    $pawmateMatch[$pawmateResponseItem] = $entry->{$pawmateResponseItem};
                }
                $pawmateMatch['imageUrl'] = $entry->image->one()->getUrl() ?? '';
                unset($pawmateMatch['image']);
                // Subtract the score from 100 to get the percentage
                $pawmateMatch['matchPercentage'] = (int)(100 - $matchScore);
                $resolvedPawmates[] = $pawmateMatch;
            }
        }

        return $resolvedPawmates;
    }
}
