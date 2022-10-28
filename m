Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD70611DE7
	for <lists+freedreno@lfdr.de>; Sat, 29 Oct 2022 01:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C800910E8FF;
	Fri, 28 Oct 2022 23:06:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 365 seconds by postgrey-1.36 at gabe;
 Fri, 28 Oct 2022 23:06:14 UTC
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5132810E8FF
 for <freedreno@lists.freedesktop.org>; Fri, 28 Oct 2022 23:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1666998374; x=1698534374;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PoDeQEWu7Czj0YF5666wI+2wnzELwAHNeXJptcuiyRE=;
 b=qYa4AM9vKnrrTQUa0l+npCwyNPZCbHIaEBOgxo0XsRkO6H7fYVdQGvjH
 OcTTS0DBctvuzKdpqfcWXcQVpWFborV07MPmF1hbSrRdOdhcBvrPaUzVM
 hUAZjRuRzErKp2CSiy05N5V+W8UQZvtNIldhP+RuF3jPZrBwguUfTux/b 0=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Oct 2022 16:00:08 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2022 16:00:08 -0700
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Fri, 28 Oct 2022 16:00:08 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Date: Fri, 28 Oct 2022 15:59:49 -0700
Message-ID: <20221028225952.160-1-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
Subject: [Freedreno] [RFC PATCH 0/3] Support for Solid Fill Planes
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, daniel.vetter@ffwll.ch,
 robdclark@gmail.com, seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 contact@emersion.fr, dmitry.baryshkov@linaro.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Introduce and add support for COLOR_FILL and COLOR_FILL_FORMAT
properties. When the color fill value is set, and the framebuffer is set
to NULL, memory fetch will be disabled.

In addition, loosen the NULL FB checks within the atomic commit callstack
to allow a NULL FB when color_fill is nonzero and add FB checks in
methods where the FB was previously assumed to be non-NULL.

Finally, have the DPU driver use drm_plane_state.color_fill and
drm_plane_state.color_fill_format instead of dpu_plane_state.color_fill,
and add extra checks in the DPU atomic commit callstack to account for a
NULL FB in cases where color_fill is set.

Some drivers support hardware that have optimizations for solid fill
planes. This series aims to expose these capabilities to userspace as
some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
hardware composer HAL) that can be set by apps like the Android Gears
app.

Userspace can set the color_fill value by setting COLOR_FILL_FORMAT to a
DRM format, setting COLOR_FILL to a color fill value, and setting the
framebuffer to NULL.

Jessica Zhang (3):
  drm: Introduce color fill properties for drm plane
  drm: Adjust atomic checks for solid fill color
  drm/msm/dpu: Use color_fill property for DPU planes

 drivers/gpu/drm/drm_atomic.c              | 68 ++++++++++++-----------
 drivers/gpu/drm/drm_atomic_helper.c       | 34 +++++++-----
 drivers/gpu/drm/drm_atomic_uapi.c         |  8 +++
 drivers/gpu/drm/drm_blend.c               | 38 +++++++++++++
 drivers/gpu/drm/drm_plane.c               |  8 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  7 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 66 ++++++++++++++--------
 include/drm/drm_atomic_helper.h           |  5 +-
 include/drm/drm_blend.h                   |  2 +
 include/drm/drm_plane.h                   | 28 ++++++++++
 10 files changed, 188 insertions(+), 76 deletions(-)

-- 
2.38.0

