import {
  BookOpen,
  Calendar,
  ClipboardCheck,
  FileArchive,
  FileSpreadsheet,
  FileText,
  Link,
  Presentation,
  Trophy,
  Video,
} from "lucide-react";
import type { LucideIcon } from "lucide-react";

export const RESOURCE_ICON_SEPARATOR = "__";

export interface ResourceIconOption {
  key: string;
  label: string;
  description: string;
  Icon: LucideIcon;
}

export const RESOURCE_ICON_OPTIONS: ResourceIconOption[] = [
  {
    key: "pdf_template",
    label: "PDF Template",
    description: "Formal documents, briefs, and submission PDFs.",
    Icon: FileText,
  },
  {
    key: "ppt_template",
    label: "Presentation",
    description: "Pitch decks, slides, and demo presentations.",
    Icon: Presentation,
  },
  {
    key: "evaluation_rubrics",
    label: "Rubric",
    description: "Evaluation sheets, grading criteria, and scorecards.",
    Icon: ClipboardCheck,
  },
  {
    key: "rules_guidelines",
    label: "Guidebook",
    description: "Rules, guidelines, handbooks, and instructions.",
    Icon: BookOpen,
  },
  {
    key: "timeline_pdf",
    label: "Schedule",
    description: "Timelines, calendars, and dated plans.",
    Icon: Calendar,
  },
  {
    key: "spreadsheet",
    label: "Spreadsheet",
    description: "Budgets, trackers, lists, and tabular files.",
    Icon: FileSpreadsheet,
  },
  {
    key: "archive",
    label: "Archive",
    description: "ZIP packs, bundled files, and complete kits.",
    Icon: FileArchive,
  },
  {
    key: "video",
    label: "Video",
    description: "Recordings, explainers, tutorials, and demo videos.",
    Icon: Video,
  },
  {
    key: "external_link",
    label: "Link",
    description: "External docs, forms, drives, and reference links.",
    Icon: Link,
  },
  {
    key: "award",
    label: "Award",
    description: "Certificates, prizes, results, and recognition material.",
    Icon: Trophy,
  },
];

export const DEFAULT_RESOURCE_ICON_KEY = "pdf_template";

export const RESOURCE_ICON_MAP = RESOURCE_ICON_OPTIONS.reduce<Record<string, LucideIcon>>(
  (map, option) => {
    map[option.key] = option.Icon;
    return map;
  },
  {}
);

export function getResourceIconKey(sectionKey?: string | null) {
  if (!sectionKey) return DEFAULT_RESOURCE_ICON_KEY;

  const encodedIconKey = sectionKey.split(RESOURCE_ICON_SEPARATOR)[0];
  if (RESOURCE_ICON_MAP[encodedIconKey]) return encodedIconKey;
  if (RESOURCE_ICON_MAP[sectionKey]) return sectionKey;

  return DEFAULT_RESOURCE_ICON_KEY;
}

