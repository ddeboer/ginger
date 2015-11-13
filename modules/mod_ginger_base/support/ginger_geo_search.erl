-module(ginger_geo_search).

-export([search_query/2]).

-include_lib("zotonic.hrl").

-compile(export_all).

try_search(Context) ->
    m_search:search({ginger_geo, []}, Context).

%% @doc Geo-related searches
search_query(#search_query{search={ginger_geo, Args}}, Context) ->
        
    BaseSearch = search_query:search(Args, Context),
    WhereStr = "rsc.pivot_location_lat IS NOT NULL AND rsc.pivot_location_lng IS NOT NULL",
    
    Where = case BaseSearch#search_sql.where of
        [] ->
            [WhereStr];
        OldWhere ->
            lists:append(OldWhere, " And " ++ WhereStr)
    end,
           
    BaseSearch#search_sql{
        select="rsc.id, rsc.pivot_location_lat, rsc.pivot_location_lng, rsc.pivot_category_nr",
        limit="Limit ALL",
        where=Where
    };

search_query(#search_query{}, _Context) ->
    undefined. %% fall through
