import { useEffect, useState } from "react";
import { supabase } from "@/integrations/supabase/client";
import { Card, CardContent } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import { Calendar, Clock, MapPin, Plus, Edit, Trash2, Save, X } from "lucide-react";
import { useNavigate } from "react-router-dom";
import { Layout } from "@/components/layout/Layout";
import { useAdmin } from "@/hooks/useAdmin";
import { EventFormDialog } from "@/components/admin/EventFormDialog";
import { DeleteConfirmDialog } from "@/components/admin/DeleteConfirmDialog";
import { toast } from "sonner";
import { useTenant } from "@/context/TenantContext";
import { tenantPath } from "@/utils/tenantPath";

interface Event {
  id: string;
  title: string;
  description: string;
  event_date: string;
  location: string;
  event_type: string | null;
  mode: string | null;
  organizer_name: string | null;
  organizer_contact: string | null;
  registration_deadline: string | null;
  registration_link?: string | null;
  max_participants: number | null;
  is_active: boolean;
  image_url?: string | null;
}

interface PageTextContent {
  title: string;
  subtitle: string;
  styles?: {
    title?: {
      fontSize?: string;
      fontStyle?: "default" | "serif" | "mono" | "italic";
      fontWeight?: "normal" | "semibold" | "bold";
      textEffect?: "none" | "shadow" | "highlight";
      animation?: "none" | "fadeIn" | "slideUp" | "bounce";
      textColor?: string;
    };
    subtitle?: {
      fontSize?: string;
      fontStyle?: "default" | "serif" | "mono" | "italic";
      fontWeight?: "normal" | "semibold" | "bold";
      textEffect?: "none" | "shadow" | "highlight";
      animation?: "none" | "fadeIn" | "slideUp" | "bounce";
      textColor?: string;
    };
  };
}

const defaultPageText: PageTextContent = {
  title: "Events",
  subtitle:
    "Stay updated with the latest workshops, seminars, and competitions happening on campus. Join us to learn, network, and innovate together.",
  styles: {
    title: {
      fontSize: "text-5xl",
      fontStyle: "default",
      fontWeight: "bold",
      textEffect: "none",
      animation: "fadeIn",
      textColor: "#ffffff",
    },
    subtitle: {
      fontSize: "text-lg",
      fontStyle: "default",
      fontWeight: "normal",
      textEffect: "none",
      animation: "fadeIn",
      textColor: "#e6eef8",
    },
  },
};

const fontStyleClasses: Record<string, string> = {
  default: "",
  serif: "font-serif",
  mono: "font-mono",
  italic: "italic",
};

const fontWeightClasses: Record<string, string> = {
  normal: "font-normal",
  semibold: "font-semibold",
  bold: "font-bold",
};

const textEffectClasses: Record<string, string> = {
  none: "",
  shadow: "drop-shadow-lg",
  highlight: "bg-yellow-200/30 px-2 py-1 rounded",
};

const animationClasses: Record<string, string> = {
  none: "",
  fadeIn: "animate-fade-in",
  slideUp: "animate-slide-up",
  bounce: "animate-bounce",
};

const titleSizeOptions = ["text-3xl", "text-4xl", "text-5xl", "text-6xl"];
const subtitleSizeOptions = ["text-base", "text-lg", "text-xl", "text-2xl"];

export default function EventsPage() {
  const [events, setEvents] = useState<Event[]>([]);
  const [loading, setLoading] = useState(true);
  const [pageText, setPageText] = useState<PageTextContent>(defaultPageText);
  const [editPageText, setEditPageText] = useState<PageTextContent>(defaultPageText);
  const [editingHeader, setEditingHeader] = useState(false);
  const [headerSaving, setHeaderSaving] = useState(false);
  const navigate = useNavigate();
  const { isAdmin } = useAdmin();
  const { tenant } = useTenant();

  // Admin state
  const [formOpen, setFormOpen] = useState(false);
  const [deleteOpen, setDeleteOpen] = useState(false);
  const [selectedEvent, setSelectedEvent] = useState<Event | null>(null);
  const [saving, setSaving] = useState(false);

  useEffect(() => {
    fetchEvents();
    fetchPageText();
    }, [tenant?.id]);   

  const fetchEvents = async () => {
    const { data, error } = await (supabase as any)
      .from("events")
      .select("*")
      .eq("tenant_id", tenant!.id)
      .order("event_date", { ascending: true });

    if (!error && data) setEvents(data as Event[]);
    setLoading(false);
  };

  const fetchPageText = async () => {
    try {
      const { data } = await supabase
        .from("page_content")
        .select("*")
        .eq("page_name", "events")
        .eq("section_key", "page_header")
        .eq("tenant_id", tenant!.id);

      if (data && data.length > 0) {
        const row = data[0];
        const parsed = typeof row.content === "string" ? JSON.parse(row.content) : row.content;
        setPageText(parsed);
        setEditPageText(parsed);
      }
    } catch (error) {
      console.error("Failed to load events page header:", error);
    }
  };

  const savePageText = async () => {
    setHeaderSaving(true);
    try {
      const entry = {
        page_name: "events",
        section_key: "page_header",
        content: editPageText,
        tenant_id: tenant!.id,
        updated_at: new Date().toISOString(),
      };
      const { error } = await supabase.from("page_content").upsert([entry], {
        onConflict: "page_name,section_key,tenant_id",
      });
      if (error) throw error;
      setPageText(editPageText);
      setEditingHeader(false);
      toast.success("Events page text updated.");
    } catch (err: any) {
      console.error(err);
      toast.error(err?.message || "Failed to save page text.");
    } finally {
      setHeaderSaving(false);
    }
  };

  const handleSave = async (data: Omit<Event, "id" | "created_at" | "updated_at">) => {
    setSaving(true);
    try {
      if (selectedEvent) {
        // Update existing
        const { error } = await (supabase as any)
          .from("events")
          .update({ ...data, tenant_id: tenant!.id })
          .eq("id", selectedEvent.id)
          .eq("tenant_id", tenant!.id);
        if (error) throw error;
        toast.success("Event updated");
      } else {
        // Create new
        const { error } = await (supabase as any)
          .from("events")
          .insert([{ ...data, tenant_id: tenant!.id }]);
        if (error) throw error;
        toast.success("Event created");
      }
      setFormOpen(false);
      setSelectedEvent(null);
      fetchEvents();
    } catch (err: any) {
      toast.error(err.message || "Failed to save");
    } finally {
      setSaving(false);
    }
  };

  const handleDelete = async () => {
    if (!selectedEvent) return;
    setSaving(true);
    try {
      const { error } = await (supabase as any)
        .from("events")
        .delete()
        .eq("id", selectedEvent.id)
        .eq("tenant_id", tenant!.id);
      if (error) throw error;
      toast.success("Event deleted");
      setDeleteOpen(false);
      setSelectedEvent(null);
      fetchEvents();
    } catch (err: any) {
      toast.error(err.message || "Failed to delete");
    } finally {
      setSaving(false);
    }
  };

  const openEditDialog = (event: Event) => {
    setSelectedEvent(event);
    setFormOpen(true);
  };

  const openDeleteDialog = (event: Event) => {
    setSelectedEvent(event);
    setDeleteOpen(true);
  };

  const openCreateDialog = () => {
    setSelectedEvent(null);
    setFormOpen(true);
  };

  const formatDate = (date: string) =>
    new Date(date).toLocaleDateString("en-IN", {
      day: "numeric",
      month: "short",
      year: "numeric",
    });

  const formatTime = (date: string) =>
    new Date(date).toLocaleTimeString("en-IN", {
      hour: "2-digit",
      minute: "2-digit",
    });

  if (loading) {
    return (
      <Layout>
        <p className="text-center py-20">Loading events...</p>
      </Layout>
    );
  }

  // Calculate stats
  const totalEvents = events.length;
  const upcomingEvents = events.filter(event =>
    new Date(event.event_date) > new Date()
  ).length;

  return (
    <Layout>
      {/* Header */}
      <section className="bg-primary py-16 lg:py-24">
        <div className="container mx-auto px-4 text-center">
          {editingHeader ? (
            <div className="max-w-5xl mx-auto">
              <div className="grid lg:grid-cols-3 gap-6 items-start rounded-[2rem] border border-white/20 bg-white/95 p-8 shadow-[0_24px_60px_rgba(15,23,42,0.16)]">
                <div>
                  <label className="block text-sm font-medium text-foreground">Title</label>
                  <Input
                    value={editPageText.title}
                    onChange={(e) => setEditPageText({ ...editPageText, title: e.target.value })}
                    className="bg-white text-foreground text-2xl lg:text-4xl font-poppins font-bold"
                    placeholder="Page title"
                  />

                  <label className="block text-sm font-medium text-foreground mt-4">Subtitle</label>
                  <Textarea
                    value={editPageText.subtitle}
                    onChange={(e) => setEditPageText({ ...editPageText, subtitle: e.target.value })}
                    className="min-h-[140px] bg-white text-foreground"
                    placeholder="Page subtitle"
                  />
                </div>

                <div>
                  <h4 className="text-sm font-semibold mb-2">Title Style</h4>
                  <div className="grid grid-cols-2 gap-3 mb-4">
                    <select
                      value={editPageText.styles?.title?.fontSize}
                      onChange={(e) => setEditPageText({ ...editPageText, styles: { ...(editPageText.styles || {}), title: { ...(editPageText.styles?.title || {}), fontSize: e.target.value as any } } })}
                      className="rounded-lg border border-border bg-background px-3 py-2 text-sm text-foreground"
                    >
                      {titleSizeOptions.map((s) => (<option key={s} value={s}>{s.replace('text-', '')}</option>))}
                    </select>

                    <select
                      value={editPageText.styles?.title?.fontWeight}
                      onChange={(e) => setEditPageText({ ...editPageText, styles: { ...(editPageText.styles || {}), title: { ...(editPageText.styles?.title || {}), fontWeight: e.target.value as any } } })}
                      className="rounded-lg border border-border bg-background px-3 py-2 text-sm text-foreground"
                    >
                      <option value="normal">Normal</option>
                      <option value="semibold">Semi Bold</option>
                      <option value="bold">Bold</option>
                    </select>

                    <select
                      value={editPageText.styles?.title?.fontStyle}
                      onChange={(e) => setEditPageText({ ...editPageText, styles: { ...(editPageText.styles || {}), title: { ...(editPageText.styles?.title || {}), fontStyle: e.target.value as any } } })}
                      className="rounded-lg border border-border bg-background px-3 py-2 text-sm text-foreground"
                    >
                      <option value="default">Default</option>
                      <option value="serif">Serif</option>
                      <option value="mono">Monospace</option>
                      <option value="italic">Italic</option>
                    </select>

                    <select
                      value={editPageText.styles?.title?.animation}
                      onChange={(e) => setEditPageText({ ...editPageText, styles: { ...(editPageText.styles || {}), title: { ...(editPageText.styles?.title || {}), animation: e.target.value as any } } })}
                      className="rounded-lg border border-border bg-background px-3 py-2 text-sm text-foreground"
                    >
                      <option value="none">None</option>
                      <option value="fadeIn">Fade In</option>
                      <option value="slideUp">Slide Up</option>
                      <option value="bounce">Bounce</option>
                    </select>

                    <input
                      type="color"
                      value={editPageText.styles?.title?.textColor || '#ffffff'}
                      onChange={(e) => setEditPageText({ ...editPageText, styles: { ...(editPageText.styles || {}), title: { ...(editPageText.styles?.title || {}), textColor: e.target.value } } })}
                      className="w-full h-10 rounded-lg border border-border bg-background px-3 py-2 text-sm text-foreground"
                    />
                  </div>

                  <h4 className="text-sm font-semibold mb-2">Subtitle Style</h4>
                  <div className="grid grid-cols-2 gap-3">
                    <select
                      value={editPageText.styles?.subtitle?.fontSize}
                      onChange={(e) => setEditPageText({ ...editPageText, styles: { ...(editPageText.styles || {}), subtitle: { ...(editPageText.styles?.subtitle || {}), fontSize: e.target.value as any } } })}
                      className="rounded-lg border border-border bg-background px-3 py-2 text-sm text-foreground"
                    >
                      {subtitleSizeOptions.map((s) => (<option key={s} value={s}>{s.replace('text-', '')}</option>))}
                    </select>

                    <select
                      value={editPageText.styles?.subtitle?.fontWeight}
                      onChange={(e) => setEditPageText({ ...editPageText, styles: { ...(editPageText.styles || {}), subtitle: { ...(editPageText.styles?.subtitle || {}), fontWeight: e.target.value as any } } })}
                      className="rounded-lg border border-border bg-background px-3 py-2 text-sm text-foreground"
                    >
                      <option value="normal">Normal</option>
                      <option value="semibold">Semi Bold</option>
                      <option value="bold">Bold</option>
                    </select>

                    <select
                      value={editPageText.styles?.subtitle?.fontStyle}
                      onChange={(e) => setEditPageText({ ...editPageText, styles: { ...(editPageText.styles || {}), subtitle: { ...(editPageText.styles?.subtitle || {}), fontStyle: e.target.value as any } } })}
                      className="rounded-lg border border-border bg-background px-3 py-2 text-sm text-foreground"
                    >
                      <option value="default">Default</option>
                      <option value="serif">Serif</option>
                      <option value="mono">Monospace</option>
                      <option value="italic">Italic</option>
                    </select>

                    <select
                      value={editPageText.styles?.subtitle?.animation}
                      onChange={(e) => setEditPageText({ ...editPageText, styles: { ...(editPageText.styles || {}), subtitle: { ...(editPageText.styles?.subtitle || {}), animation: e.target.value as any } } })}
                      className="rounded-lg border border-border bg-background px-3 py-2 text-sm text-foreground"
                    >
                      <option value="none">None</option>
                      <option value="fadeIn">Fade In</option>
                      <option value="slideUp">Slide Up</option>
                      <option value="bounce">Bounce</option>
                    </select>

                    <input
                      type="color"
                      value={editPageText.styles?.subtitle?.textColor || '#e6eef8'}
                      onChange={(e) => setEditPageText({ ...editPageText, styles: { ...(editPageText.styles || {}), subtitle: { ...(editPageText.styles?.subtitle || {}), textColor: e.target.value } } })}
                      className="w-full h-10 rounded-lg border border-border bg-background px-3 py-2 text-sm text-foreground"
                    />
                  </div>
                </div>

                <div className="col-span-1 sticky top-24 self-start">
                  <h4 className="text-sm font-semibold mb-2">Preview</h4>
                  <div className="rounded-[1rem] overflow-hidden border border-border">
                    <div className="relative w-full h-64 bg-primary">
                      <div className="absolute inset-0" style={{ background: "linear-gradient(135deg, rgba(33, 37, 41, 0.3) 0%, rgba(33, 37, 41, 0.4) 100%)" }} />
                      <div className="absolute inset-0 z-10 flex items-center justify-center p-6 text-center">
                        <div>
                          <h2 className={`${editPageText.styles?.title?.fontSize || 'text-5xl'} ${fontStyleClasses[editPageText.styles?.title?.fontStyle || 'default']} ${fontWeightClasses[editPageText.styles?.title?.fontWeight || 'bold']}`} style={{ color: editPageText.styles?.title?.textColor || undefined }}>{editPageText.title}</h2>
                          <p className={`${editPageText.styles?.subtitle?.fontSize || 'text-lg'} ${fontStyleClasses[editPageText.styles?.subtitle?.fontStyle || 'default']} ${fontWeightClasses[editPageText.styles?.subtitle?.fontWeight || 'normal']} mt-3`} style={{ color: editPageText.styles?.subtitle?.textColor || undefined }}>{editPageText.subtitle}</p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          ) : (
            <>
              <h1
                className={`${pageText.styles?.title?.fontSize || 'text-3xl lg:text-5xl'} ${fontStyleClasses[pageText.styles?.title?.fontStyle || 'default']} ${fontWeightClasses[pageText.styles?.title?.fontWeight || 'bold']} ${animationClasses[pageText.styles?.title?.animation || '']}`}
                style={{ color: pageText.styles?.title?.textColor || undefined }}
              >
                {pageText.title}
              </h1>
              <p
                className={`${pageText.styles?.subtitle?.fontSize || 'text-lg'} ${fontStyleClasses[pageText.styles?.subtitle?.fontStyle || 'default']} ${fontWeightClasses[pageText.styles?.subtitle?.fontWeight || 'normal']} mt-4 max-w-2xl mx-auto ${animationClasses[pageText.styles?.subtitle?.animation || '']}`}
                style={{ color: pageText.styles?.subtitle?.textColor || undefined }}
              >
                {pageText.subtitle}
              </p>
            </>
          )}
          <div className="mt-6 flex justify-center gap-8 text-primary-foreground">
            <div className="text-center">
              <span className="text-3xl font-bold">{totalEvents}</span>
              <p className="text-sm">Total Events</p>
            </div>
            <div className="text-center">
              <span className="text-3xl font-bold">{upcomingEvents}</span>
              <p className="text-sm">Upcoming</p>
            </div>
          </div>
          {isAdmin && (
            <div className="mt-6 flex flex-wrap justify-center gap-2">
              {editingHeader ? (
                <>
                  <Button
                    onClick={savePageText}
                    disabled={headerSaving}
                    variant="orange"
                    size="sm"
                  >
                    <Save className="w-4 h-4 mr-2" />
                    {headerSaving ? "Saving..." : "Save Page Text"}
                  </Button>
                  <Button
                    onClick={() => {
                      setEditingHeader(false);
                      setEditPageText(pageText);
                    }}
                    variant="orange"
                    size="sm"
                  >
                    <X className="w-4 h-4 mr-2" />
                    Cancel
                  </Button>
                </>
              ) : (
                <Button
                  onClick={() => setEditingHeader(true)}
                  variant="orange"
                  size="sm"
                >
                  <Edit className="w-4 h-4 mr-2" />
                  Edit Page Text
                </Button>
              )}
              <Button
                onClick={openCreateDialog}
                className="mt-2 sm:mt-0"
                variant="orange"
                size="sm"
              >
                <Plus className="w-4 h-4 mr-2" />
                Add Event
              </Button>
            </div>
          )}
        </div>
      </section>


      {/* Events List */}
      <section className="py-12 lg:py-16 bg-background">
        <div className="container mx-auto px-4">
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
            {events.map((event) => (
              <Card key={event.id} className="overflow-hidden shadow-lg hover:shadow-xl transition">
                {/* image header */}
                <div className="relative h-48 w-full bg-gray-100">
                  <img
                    src={event.image_url || "/og-image.png"}
                    alt={event.title}
                    className="absolute inset-0 w-full h-full object-cover"
                  />
                  <div className="absolute inset-0 bg-gradient-to-t from-black/40 to-transparent" />
                  {/* badges */}
                  <div className="absolute top-2 left-2 flex flex-wrap gap-2">
                    {event.event_type && (
                      <span className="text-xs bg-primary text-white px-2 py-1 rounded">
                        {event.event_type}
                      </span>
                    )}
                    {event.mode && (
                      <span className="text-xs bg-muted text-muted-foreground px-2 py-1 rounded">
                        {event.mode}
                      </span>
                    )}
                  </div>
                </div>

                <CardContent className="p-4 flex flex-col">
                  {/* title + description */}
                  <div className="space-y-2">
                    <h2 className="text-lg font-semibold text-foreground">
                      {event.title}
                    </h2>
                    <p className="text-sm text-muted-foreground line-clamp-3">
                      {event.description}
                    </p>
                  </div>

                  {/* meta & actions */}
                  <div className="mt-4 flex flex-col gap-3">
                    <div className="flex items-center gap-2 text-sm text-muted-foreground">
                      <Calendar className="w-4 h-4" />
                      {formatDate(event.event_date)}
                      <span>·</span>
                      <Clock className="w-4 h-4" />
                      {formatTime(event.event_date)}
                    </div>
                    {event.location && (
                      <div className="flex items-center gap-2 text-sm text-muted-foreground">
                        <MapPin className="w-4 h-4" />
                        {event.location}
                      </div>
                    )}

                    {/* action buttons row placed here so it's always visible */}
                    <div className="flex items-center gap-2 pt-4 border-t border-border">
                      {new Date(event.event_date) < new Date() ? (
                        <span className="text-xs bg-muted text-muted-foreground px-2 py-1 rounded">
                          Event Ended
                        </span>
                      ) : (
                        <Button
                          variant="orange"
                          size="sm"
                          onClick={() => {
                            if (event.registration_link) {
                              // open provided registration link in a new tab/window
                              window.open(event.registration_link, '_blank', 'noopener,noreferrer');
                            } else {
                              navigate(tenantPath(tenant!.slug, `/events/${event.id}/register`));
                            }
                          }}
                        >
                          Register Now
                        </Button>
                      )}
                      <Button
                        variant="outline"
                        size="sm"
                        onClick={() => navigate(tenantPath(tenant!.slug, `/events/${event.id}`))}
                      >
                        View Details
                      </Button>
                      {isAdmin && (
                        <>
                          <Button
                            variant="outline"
                            size="icon"
                            onClick={() => openEditDialog(event)}
                            title="Edit"
                            className="ml-auto"
                          >
                            <Edit className="w-4 h-4" />
                          </Button>
                          <Button
                            variant="outline"
                            size="icon"
                            onClick={() => openDeleteDialog(event)}
                            title="Delete"
                            className="text-destructive hover:text-destructive"
                          >
                            <Trash2 className="w-4 h-4" />
                          </Button>
                        </>
                      )}
                    </div>
                  </div>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* Admin Dialogs */}
      <EventFormDialog
        open={formOpen}
        onOpenChange={setFormOpen}
        event={selectedEvent}
        onSave={handleSave}
        loading={saving}
      />
      <DeleteConfirmDialog
        open={deleteOpen}
        onOpenChange={setDeleteOpen}
        onConfirm={handleDelete}
        title="Delete Event"
        description={`Are you sure you want to delete "${selectedEvent?.title}"? This action cannot be undone.`}
        loading={saving}
      />

    </Layout>
  );
}
