import { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import { supabase } from "@/integrations/supabase/client";
import { Card, CardContent } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Calendar, Clock, MapPin } from "lucide-react";
import { Layout } from "@/components/layout/Layout";
import { useTenant } from "@/context/TenantContext";
import { Dialog, DialogContent } from "@/components/ui/dialog";

interface Event {
  id: string;
  title: string;
  description: string;
  event_date: string;
  location: string;
  event_type: string | null;
  mode: string | null;
  registration_deadline: string | null;
  max_participants: number | null;
  organizer_name: string | null;
  organizer_contact: string | null;
  is_active: boolean;
  image_url?: string | null;
  registration_link?: string | null;
}

export default function EventDetails() {
  const { id } = useParams();
  const navigate = useNavigate();
  const { tenant } = useTenant();
  const [event, setEvent] = useState<Event | null>(null);
  const [loading, setLoading] = useState(true);
  const [imageOpen, setImageOpen] = useState(false);

  useEffect(() => {
    fetchEvent();
  }, [id, tenant?.id]);

  const fetchEvent = async () => {
    const { data, error } = await supabase
      .from("events")
      .select("*")
      .eq("id", id)
      .eq("tenant_id", tenant!.id)
      .single();

    if (!error) setEvent(data);
    setLoading(false);
  };

  if (loading) {
    return (
      <Layout>
        <p className="text-center py-20">Loading event...</p>
      </Layout>
    );
  }

  if (!event) {
    return (
      <Layout>
        <p className="text-center py-20">Event not found</p>
      </Layout>
    );
  }

  const eventDate = new Date(event.event_date);
  const registrationDeadlineDate = event.registration_deadline
    ? new Date(event.registration_deadline)
    : null;
  const isRegistrationOpen =
    event.is_active && (!registrationDeadlineDate || registrationDeadlineDate > new Date());

  return (
    <Layout>
      <section className="container mx-auto px-4 py-16">
        <Card>
          <CardContent className="p-6">
            <div className="grid grid-cols-1 lg:grid-cols-3 gap-6 items-start">
              {/* Image column */}
              <div className="lg:col-span-1">
                  <div className="w-full rounded-lg overflow-hidden border">
                    <img
                      src={event.image_url || "/og-image.png"}
                      alt={event.title}
                      className="w-full h-64 object-cover cursor-zoom-in"
                      onClick={() => setImageOpen(true)}
                    />
                  </div>

                  {imageOpen && (
                    <div
                      className="fixed inset-0 z-50 flex items-center justify-center bg-black/70 backdrop-blur-sm p-6"
                      onClick={() => setImageOpen(false)}
                    >
                      <div className="max-h-[95vh] max-w-[95vw]" onClick={(e) => e.stopPropagation()}>
                        <img
                          src={event.image_url || "/og-image.png"}
                          alt={event.title}
                          className="max-h-[95vh] max-w-[95vw] object-contain rounded-lg"
                        />
                      </div>
                    </div>
                  )}
                <div className="mt-4">
                  {isRegistrationOpen ? (
                    <Button
                      variant="orange"
                      className="w-full"
                      onClick={() => {
                        if (event.registration_link) {
                          window.open(event.registration_link, "_blank", "noopener,noreferrer");
                        } else {
                          navigate(`/events/${event.id}/register`);
                        }
                      }}
                    >
                      Register Now
                    </Button>
                  ) : (
                    <Button variant="outline" className="w-full" disabled>
                      Registration Closed
                    </Button>
                  )}
                </div>
              </div>

              {/* Details column */}
              <div className="lg:col-span-2">
                <h1 className="text-2xl lg:text-3xl font-bold mb-2">{event.title}</h1>
                <div className="flex gap-2 mb-4">
                  {event.event_type && (
                    <span className="text-xs bg-primary text-white px-2 py-1 rounded">
                      {event.event_type}
                    </span>
                  )}
                  {event.mode && (
                    <span className="text-xs bg-muted px-2 py-1 rounded">
                      {event.mode}
                    </span>
                  )}
                </div>

                <p className="text-muted-foreground whitespace-pre-line mb-6">{event.description}</p>

                <div className="grid grid-cols-1 sm:grid-cols-3 gap-4 mb-6 text-sm">
                  <div className="flex items-center gap-2">
                    <Calendar className="w-4 h-4 text-primary" />
                    <span>{eventDate.toLocaleDateString("en-IN")}</span>
                  </div>
                  <div className="flex items-center gap-2">
                    <Clock className="w-4 h-4 text-primary" />
                    <span>{eventDate.toLocaleTimeString("en-IN", { hour: "2-digit", minute: "2-digit" })}</span>
                  </div>
                  <div className="flex items-center gap-2">
                    <MapPin className="w-4 h-4 text-primary" />
                    <span>{event.location}</span>
                  </div>
                </div>

                <div className="border-t pt-4 text-sm space-y-2">
                  <p><strong>Organizer:</strong> {event.organizer_name || "TBA"}</p>
                  <p><strong>Contact:</strong> {event.organizer_contact || "TBA"}</p>
                  <p><strong>Registration Deadline:</strong> {registrationDeadlineDate ? registrationDeadlineDate.toLocaleDateString("en-IN") : "Not set"}</p>
                  <p><strong>Max Participants:</strong> {event.max_participants ?? "Unlimited"}</p>
                  {event.registration_link && (
                    <p className="pt-2">
                      <a href={event.registration_link} target="_blank" rel="noopener noreferrer" className="text-primary underline">Open Registration Link</a>
                    </p>
                  )}
                </div>
              </div>
            </div>
          </CardContent>
        </Card>
      </section>
    </Layout>
  );
}
