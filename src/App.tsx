import { lazy, Suspense } from "react";
import { Toaster } from "@/components/ui/toaster";
import { Toaster as Sonner } from "@/components/ui/sonner";
import { TooltipProvider } from "@/components/ui/tooltip";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { BrowserRouter, Navigate, Routes, Route, useLocation } from "react-router-dom";
import { AuthProvider } from "@/contexts/AuthContext";
import { ProtectedRoute } from "@/components/ProtectedRoute";
import TenantLayout from "@/layouts/TenantLayout";
import ScrollToTop from "./components/ScrollToTop";
import { PageSkeleton } from "@/components/PageSkeleton";

const queryClient = new QueryClient();
const defaultTenantSlug = "gcet";

const Index = lazy(() => import("./pages/Index"));
const About = lazy(() => import("./pages/About"));
const Problems = lazy(() => import("./pages/Problems"));
const Departments = lazy(() => import("./pages/Departments"));
const ProblemDetails = lazy(() => import("./pages/ProblemDetails"));
const Events = lazy(() => import("./pages/Events"));
const Resources = lazy(() => import("./pages/Resources"));
const Registration = lazy(() => import("./pages/Registration"));
const Contact = lazy(() => import("./pages/Contact"));
const Auth = lazy(() => import("./pages/Auth"));
const Profile = lazy(() => import("./pages/Profile"));
const AdminDashboard = lazy(() => import("./pages/AdminDashboard"));
const NotFound = lazy(() => import("./pages/NotFound"));
const EventDetails = lazy(() => import("./pages/EventDetails"));
const EventRegister = lazy(() => import("./pages/EventRegister"));

function LegacyTenantRedirect() {
  const location = useLocation();
  return (
    <Navigate
      to={`/${defaultTenantSlug}${location.pathname}${location.search}${location.hash}`}
      replace
    />
  );
}

const App = () => (
  <QueryClientProvider client={queryClient}>
    <AuthProvider>
      <TooltipProvider>
        <Toaster />
        <Sonner />
        <BrowserRouter>
          <ScrollToTop />
          <Suspense fallback={<PageSkeleton />}>
          <Routes>
            <Route path="/" element={<Navigate to={`/${defaultTenantSlug}`} replace />} />
            <Route path="/about" element={<LegacyTenantRedirect />} />
            <Route path="/auth" element={<LegacyTenantRedirect />} />
            <Route path="/problems" element={<LegacyTenantRedirect />} />
            <Route path="/problems/:id" element={<LegacyTenantRedirect />} />
            <Route path="/events" element={<LegacyTenantRedirect />} />
            <Route path="/events/:id/register" element={<LegacyTenantRedirect />} />
            <Route path="/events/:id" element={<LegacyTenantRedirect />} />
            <Route path="/resources" element={<LegacyTenantRedirect />} />
            <Route path="/registration" element={<LegacyTenantRedirect />} />
            <Route path="/contact" element={<LegacyTenantRedirect />} />
            <Route path="/departments" element={<LegacyTenantRedirect />} />
            <Route path="/admin" element={<LegacyTenantRedirect />} />
            <Route path="/profile" element={<LegacyTenantRedirect />} />
            <Route path="/:tenantSlug" element={<TenantLayout />}>
              <Route index element={<Index />} />
              <Route path="about" element={<About />} />
              <Route path="auth" element={<Auth />} />
              <Route path="problems" element={<Problems />} />
              <Route path="problems/:id" element={<ProblemDetails />} />
              <Route path="events" element={<Events />} />
              <Route path="events/:id/register" element={<EventRegister />} />
              <Route path="events/:id" element={<EventDetails />} />
              <Route path="resources" element={<Resources />} />
              <Route path="registration" element={<Registration />} />
              <Route path="contact" element={<Contact />} />
              <Route
                path="profile"
                element={
                  <ProtectedRoute>
                    <Profile />
                  </ProtectedRoute>
                }
              />
              <Route
                path="departments"
                element={
                  <ProtectedRoute requireAdmin>
                    <Departments />
                  </ProtectedRoute>
                }
              />
              <Route
                path="admin"
                element={
                  <ProtectedRoute requireAdmin>
                    <AdminDashboard/>
                  </ProtectedRoute>
                }
              />
            </Route>
            <Route path="*" element={<NotFound />} />
          </Routes>
          </Suspense>
        </BrowserRouter>
      </TooltipProvider>
    </AuthProvider>
  </QueryClientProvider>
);

export default App;
