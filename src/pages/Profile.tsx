import { useEffect, useState } from "react";
import { Layout } from "@/components/layout/Layout";
import { Card, CardContent } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Button } from "@/components/ui/button";
import { Label } from "@/components/ui/label";
import { useAuth } from "@/contexts/AuthContext";
import { useAdmin } from "@/hooks/useAdmin";
import { Link } from "react-router-dom";
import { supabase } from "@/integrations/supabase/client";
import { toast } from "sonner";
import { useTenant } from "@/context/TenantContext";
import { tenantPath } from "@/utils/tenantPath";
import { Eye, EyeOff } from "lucide-react";

interface UserProfile {
  id: string;
  name: string | null;
  email: string | null;
  phone: string | null;
  department: string | null;
  year: string | null;
  tenant_id: string | null;
}

export default function Profile() {
  const { user, loading } = useAuth();
  const { tenant } = useTenant();
  const [usernameValue, setUsernameValue] = useState("");
  const [usernameSaving, setUsernameSaving] = useState(false);
  const [profile, setProfile] = useState<UserProfile | null>(null);
  const [profileLoading, setProfileLoading] = useState(false);
  const [currentPassword, setCurrentPassword] = useState("");
  const [newPassword, setNewPassword] = useState("");
  const [updatingPassword, setUpdatingPassword] = useState(false);
  const [showCurrentPassword, setShowCurrentPassword] = useState(false);
  const [showNewPassword, setShowNewPassword] = useState(false);
  const { isAdmin, loading: adminLoading } = useAdmin();
  const path = (value: string) => tenantPath(tenant?.slug || "", value);

  useEffect(() => {
    if (!user) return;
    const initialUsername =
      (user.user_metadata?.full_name as string) ||
      (user.user_metadata?.name as string) ||
      user.email?.split("@")[0] ||
      "";
    setUsernameValue(initialUsername);
  }, [user]);

  useEffect(() => {
    if (!user || !tenant?.id) return;

    let cancelled = false;

    const fetchProfile = async () => {
      setProfileLoading(true);
      try {
        const { data, error } = await supabase
          .from("profiles")
          .select("id,name,email,phone,department,year,tenant_id")
          .eq("id", user.id)
          .eq("tenant_id", tenant.id)
          .maybeSingle();

        if (error) throw error;
        if (cancelled) return;

        setProfile(data);
        if (data?.name) {
          setUsernameValue(data.name);
        }
      } catch (error) {
        console.error("Failed to load tenant profile:", error);
        if (!cancelled) setProfile(null);
      } finally {
        if (!cancelled) setProfileLoading(false);
      }
    };

    fetchProfile();

    return () => {
      cancelled = true;
    };
  }, [user, tenant?.id]);

  const handleUsernameSave = async () => {
    if (!usernameValue.trim()) {
      toast.error("Username cannot be empty.");
      return;
    }
    setUsernameSaving(true);
    try {
      const { error } = await supabase.auth.updateUser({
        data: {
          name: usernameValue.trim(),
          full_name: usernameValue.trim(),
        },
      });
      if (error) throw error;

      if (tenant?.id) {
        const { error: profileError } = await supabase
          .from("profiles")
          .update({ name: usernameValue.trim() })
          .eq("id", user!.id)
          .eq("tenant_id", tenant.id);

        if (profileError) throw profileError;
        setProfile((current) =>
          current ? { ...current, name: usernameValue.trim() } : current
        );
      }

      toast.success("Username updated successfully.");
    } catch (error: any) {
      console.error("Failed to update username:", error);
      toast.error(error?.message || "Unable to update username.");
    } finally {
      setUsernameSaving(false);
    }
  };

  const handlePasswordChange = async () => {
    if (!currentPassword) {
      toast.error("Please enter your current password.");
      return;
    }

    if (!newPassword) {
      toast.error("Please enter a new password.");
      return;
    }

    if (newPassword.length < 8) {
      toast.error("New password must be at least 8 characters long.");
      return;
    }

    if (currentPassword === newPassword) {
      toast.error("New password must be different from current password.");
      return;
    }

    setUpdatingPassword(true);
    try {
      const { error: signInError } = await supabase.auth.signInWithPassword({
        email: user!.email!,
        password: currentPassword,
      });

      if (signInError) {
        toast.error("Incorrect current password. Please try again.");
        setUpdatingPassword(false);
        return;
      }

      const { error: updateError } = await supabase.auth.updateUser({
        password: newPassword,
      });

      if (updateError) {
        toast.error(updateError.message || "Failed to update password. It might be too weak.");
        return;
      }

      toast.success("Password changed successfully.");
      setCurrentPassword("");
      setNewPassword("");
    } catch (error: any) {
      console.error("Failed to change password:", error);
      toast.error(error?.message || "Unable to change password.");
    } finally {
      setUpdatingPassword(false);
    }
  };

  if (loading || profileLoading || adminLoading) {
    return (
      <Layout>
        <div className="container mx-auto px-4 py-20 text-center">Loading profile...</div>
      </Layout>
    );
  }

  if (!user) {
    return (
      <Layout>
        <div className="container mx-auto px-4 py-20 text-center">
          <p className="text-lg font-semibold">You need to be logged in to view your profile.</p>
          <Button asChild variant="orange" className="mt-6">
            <Link to={path("/auth")}>Go to Login</Link>
          </Button>
        </div>
      </Layout>
    );
  }

  const username =
    profile?.name ||
    (user.user_metadata?.full_name as string) ||
    (user.user_metadata?.name as string) ||
    user.email?.split("@")[0] ||
    "User";

  const displayedUsername = usernameValue || username;

  return (
    <Layout>
      <section className="container mx-auto px-4 py-20">
        <div className="max-w-3xl mx-auto space-y-6">
          <div className="flex flex-col items-center gap-3 text-center">
            <div className="flex h-16 w-16 items-center justify-center rounded-full bg-primary text-2xl font-bold text-primary-foreground">
              {displayedUsername.charAt(0).toUpperCase()}
            </div>
            <div>
              <h1 className="text-3xl font-bold">{displayedUsername}</h1>
              <p className="text-sm text-muted-foreground">Account profile details</p>
            </div>
          </div>

          <Card>
            <CardContent className="space-y-4">
              <div className="space-y-2">
                <p className="text-sm text-muted-foreground">Username</p>
                <p className="text-lg font-semibold">{username}</p>
              </div>

              <div className="space-y-2">
                <p className="text-sm text-muted-foreground">Email</p>
                <p className="text-lg font-semibold">{profile?.email || user.email}</p>
              </div>

              {!isAdmin && profile?.department && (
                <div className="space-y-2">
                  <p className="text-sm text-muted-foreground">Department</p>
                  <p className="text-lg font-semibold">{profile.department}</p>
                </div>
              )}

              {!isAdmin && profile?.year && (
                <div className="space-y-2">
                  <p className="text-sm text-muted-foreground">Year</p>
                  <p className="text-lg font-semibold">{profile.year}</p>
                </div>
              )}

              {user.created_at && (
                <div className="space-y-2">
                  <p className="text-sm text-muted-foreground">Joined</p>
                  <p className="text-lg font-semibold">{new Date(user.created_at).toLocaleDateString()}</p>
                </div>
              )}

            </CardContent>
          </Card>

          <Card>
            <CardContent className="space-y-6">
              <div>
                <h2 className="text-xl font-semibold">Edit username</h2>
                <p className="text-sm text-muted-foreground">Update the name shown on your profile.</p>
              </div>

              <div className="space-y-4">
                <Input
                  value={usernameValue}
                  onChange={(e) => setUsernameValue(e.target.value)}
                  placeholder="Enter username"
                />
                <div className="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
                  <div className="text-sm text-muted-foreground">
                    Current username: <span className="font-medium text-foreground">{username}</span>
                  </div>
                  <Button
                    variant="orange"
                    size="sm"
                    onClick={handleUsernameSave}
                    disabled={usernameSaving || !usernameValue.trim()}
                  >
                    {usernameSaving ? "Saving..." : "Save username"}
                  </Button>
                </div>
              </div>
            </CardContent>
          </Card>

          <Card>
            <CardContent className="space-y-6">
              <div>
                <h2 className="text-xl font-semibold">Change password</h2>
                <p className="text-sm text-muted-foreground">
                  Provide your current password and a new password to update.
                </p>
              </div>

              <div className="space-y-4">
                <div className="space-y-2">
                  <label className="text-sm font-medium text-foreground">Current password</label>
                  <div className="relative">
                    <Input
                      type={showCurrentPassword ? "text" : "password"}
                      value={currentPassword}
                      onChange={(e) => setCurrentPassword(e.target.value)}
                      placeholder="Current password"
                      className="pr-10"
                    />
                    <button
                      type="button"
                      onClick={() => setShowCurrentPassword(!showCurrentPassword)}
                      className="absolute right-3 top-1/2 -translate-y-1/2 text-muted-foreground hover:text-foreground z-10"
                    >
                      {showCurrentPassword ? <EyeOff className="w-4 h-4" /> : <Eye className="w-4 h-4" />}
                    </button>
                  </div>
                </div>

                <div className="space-y-2">
                  <label className="text-sm font-medium text-foreground">New password</label>
                  <div className="relative">
                    <Input
                      type={showNewPassword ? "text" : "password"}
                      value={newPassword}
                      onChange={(e) => setNewPassword(e.target.value)}
                      placeholder="New password"
                      className="pr-10"
                    />
                    <button
                      type="button"
                      onClick={() => setShowNewPassword(!showNewPassword)}
                      className="absolute right-3 top-1/2 -translate-y-1/2 text-muted-foreground hover:text-foreground z-10"
                    >
                      {showNewPassword ? <EyeOff className="w-4 h-4" /> : <Eye className="w-4 h-4" />}
                    </button>
                  </div>
                </div>

                <Button
                  variant="orange"
                  size="sm"
                  onClick={handlePasswordChange}
                  disabled={updatingPassword || !currentPassword || !newPassword}
                >
                  {updatingPassword ? "Updating..." : "Change password"}
                </Button>
              </div>
            </CardContent>
          </Card>
        </div>
      </section>
    </Layout>
  );
}
