Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CEC6BFC8A
	for <lists+freedreno@lfdr.de>; Sat, 18 Mar 2023 21:06:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA0310E128;
	Sat, 18 Mar 2023 20:06:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 399 seconds by postgrey-1.36 at gabe;
 Sat, 18 Mar 2023 19:51:48 UTC
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813CF10E11B
 for <freedreno@lists.freedesktop.org>; Sat, 18 Mar 2023 19:51:48 +0000 (UTC)
Received: (qmail 32315 invoked by uid 990); 18 Mar 2023 19:45:06 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (login)
MIME-Version: 1.0
Date: Sat, 18 Mar 2023 19:45:05 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Leonard Lausen" <leonard@lausen.nl>
Message-ID: <ae78354e98b719c1fc9466d5965aea5a45ac29f6@lausen.nl>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
X-Rspamd-Bar: ---
X-Rspamd-Report: BAYES_HAM(-2.999999) MIME_GOOD(-0.1)
X-Rspamd-Score: -3.099999
Received: from unknown (HELO unkown) (::1)
 by devico.uberspace.de (Haraka/3.0.1) with ESMTPSA;
 Sat, 18 Mar 2023 20:45:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lausen.nl; s=uberspace;
 h=from; bh=mMAvDOgPzRoHk+xlo6UuvhlBsy65oeD4+ECW73EB0gA=;
 b=khcb2mcdY+hPWv6mELQTyxizkFo7JHNhniw+Fh+fCRHQeA1DTerPCHUHpqo4pUZk11PHMMj7WN
 nDbcVoVUkuvi1cpaojPwxdLDaBy0mBlbxuBtQz6FG8x1ysU2yXzK/8zfwQ3cVoPHpHvXh/ultU+r
 BJH5mKvHa355BwL4MbGN7MIVxs2h7tFosfYMi6GOdkLXV6n7Ci00Efe9/XH0sUUkJssytmMfNV+u
 XhxvdP8GVI/eXLNSHOM9U1ZQaxBTXA2x/tSwZ2BSGtx1cnGbD5rcvFS76Whx+KjJVXOBIBE0ocsb
 SpQvT0bDCWeKoCgiqqHZd16348o3YOaYluB+k59DI7Q6Z3kbwVoGVSWvqh0txTBBdEimatdKp7MC
 gl6EcGhH5n4HPogz7Cb/ou1dJDM69E4em/mI4WydyqnTauTKMu1uWOrsHpTGVIgcsDw51cHMF66m
 9qUB/RSUv2/GaDuO+HfbhmfTbxsa3bwIgrCuY5rQIIa4quegq6n+r4vcpw3YY2MyCufe0BPkNYAG
 wyqX9bTw05529RT6PILwvXjXFGerLeRXYqUrju3gMwhORE9hi+L8qgVZ92XcFhGZ15mf+vfyG7jn
 4W3ivq3ClLt4hgJvRIwDFmneA08d+Z81+IS1fAo1r4A3UzUaYebJuNkwOxzm8FWNmck2r2XhcYRK
 A=
X-Mailman-Approved-At: Sat, 18 Mar 2023 20:06:01 +0000
Subject: [Freedreno] [PATCH] drm/msm/dpu: Add support for AR30 format
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Commit da7716a249b699978fb5 ("drm/msm/dpu: Add support for XR30 format") =
enabled
support for the 10-bit XR30 color format but missed AR30 color format.

This can trigger bugs in userspace. KDE KWin compositor for example alway=
s
prefers 10-bit color formats, rendering a 1cm^2 black box around the curs=
or due
to missing per-pixel alpha-blending if only XR30 but not AR30 support is
declared.

Signed-off-by: Leonard Lausen <leonard@lausen.nl>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu=
/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 83f1dd2c22bd..d99ce3919248 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -156,6 +156,7 @@ static const uint32_t plane_formats[] =3D {
 DRM_FORMAT_RGBX8888,
 DRM_FORMAT_BGRX8888,
 DRM_FORMAT_XBGR8888,
+ DRM_FORMAT_ARGB2101010,
 DRM_FORMAT_XRGB2101010,
 DRM_FORMAT_RGB888,
 DRM_FORMAT_BGR888,
@@ -185,6 +186,7 @@ static const uint32_t plane_formats_yuv[] =3D {
 DRM_FORMAT_RGBA8888,
 DRM_FORMAT_BGRX8888,
 DRM_FORMAT_BGRA8888,
+ DRM_FORMAT_ARGB2101010,
 DRM_FORMAT_XRGB2101010,
 DRM_FORMAT_XRGB8888,
 DRM_FORMAT_XBGR8888,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/=
msm/disp/dpu1/dpu_plane.c
index bfd5be89e8b8..0ed6a1a114c7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -69,6 +69,7 @@ static const uint32_t qcom_compressed_supported_formats=
[] =3D {
 DRM_FORMAT_ARGB8888,
 DRM_FORMAT_XBGR8888,
 DRM_FORMAT_XRGB8888,
+ DRM_FORMAT_ARGB2101010,
 DRM_FORMAT_XRGB2101010,
 DRM_FORMAT_BGR565,
=20
--=20
2.30.2
