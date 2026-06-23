import { memo } from "react";

function PageSkeletonComponent() {
  return (
    <div className="container mx-auto px-4 py-10">
      <div className="space-y-6">
        <div className="h-8 w-48 rounded-md bg-muted animate-pulse" />
        <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-3">
          {Array.from({ length: 6 }).map((_, index) => (
            <div key={index} className="rounded-lg border border-border bg-card p-5">
              <div className="h-5 w-2/3 rounded bg-muted animate-pulse" />
              <div className="mt-4 h-4 w-full rounded bg-muted animate-pulse" />
              <div className="mt-2 h-4 w-4/5 rounded bg-muted animate-pulse" />
              <div className="mt-6 h-9 w-28 rounded bg-muted animate-pulse" />
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}

export const PageSkeleton = memo(PageSkeletonComponent);
