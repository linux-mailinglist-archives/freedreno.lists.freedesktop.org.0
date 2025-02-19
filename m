Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFA7A3BF3F
	for <lists+freedreno@lfdr.de>; Wed, 19 Feb 2025 14:00:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8FB910E7E9;
	Wed, 19 Feb 2025 13:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NIUjg/dr";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0C610E7EA
 for <freedreno@lists.freedesktop.org>; Wed, 19 Feb 2025 13:00:37 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-545fed4642aso3806963e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 19 Feb 2025 05:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739970035; x=1740574835; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j9nu9CEuORGkEvM5vI9UglG07cy4F38vVcl8XiBSAjU=;
 b=NIUjg/drWRL4NTX3Lhq3aKQLaEACiyyIEgr7ebXvw1HDE/sr9QhpvPPQjc1mPU0tIl
 lOtvr9NkHq9Q8Q77qacyguR3dvvyWLcjx/N8It76JMrDL5ZvNTR5ohb8H83cMS3/c696
 mEkhBv5cP6WVIcmr1OMMfLqOHqQyzLWCTtZ1pXYGwLfgFRq7mLPCqqar8IONwEQndO85
 l+GfotXv0HqsiFiW0Pw0/9rlDw+oedF2SjyIFt/atIEhAsTFHEW/7Nw8Y5hvD01rvTel
 TYMREvb32BjDpRor9zEAbpr6WK0rOrDBNWsu0p33hfF8R3hhzRAkgbPM0e/79WyPZFzP
 ZcjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739970035; x=1740574835;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j9nu9CEuORGkEvM5vI9UglG07cy4F38vVcl8XiBSAjU=;
 b=WPNpHhzZRKMhvci1TFryK72RYahi+OKkFTnoXm1Y5ZB0BzTCPcwgQR2DiLKChl3JW/
 bHC48sYweivHWQoCHiwSfooTBlWWJVw0I5Oi9qeNvgR1+o8800QZDbSLaZ2NPI8UHFF3
 hw4gzFFvXWWILq7RUvnJeWeheKnTe0KaUuw0HPGU3gQUVgahqeRC4uH+Pj0k/aVtEqtA
 IsnVPyEXDIvYO9bx0yoZAW7be11mihO5QWHu83PvN0SE0jOamKh3aYyr4YV4YO8QBb3I
 KcGSj2Y83nfldv/kaPtLdG89e9nlcJUkWxAHBadAvbzi7Q7D6kezYwcj6dXcFL6xWPQ6
 +I5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGHxDZnuafC0fPf2HPMvO86g2CQj3jGv81HDwBdYLxAFv+70BVRlVozkmkWfHxLKrlRoDbHWBl7c8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxX380XC+YchqLfdKVI9DF0RI1MJ5fNUWMjYJN6SZLleAbMqM6n
 vdJUUMKevGatKHq2hg64tFGBQHgPV4EkFqyQ+qkcXdaViRCV8xtfVo7WpB1YtqA=
X-Gm-Gg: ASbGnctU6UzBr5zJRSUN8AlDk4t9XHUkmbQRgRRyP5bsFMmCTAtpSah1YPJnjL7P9zy
 SUZ3Ny4EI9QtrQgEwC+v252U4/I9TIA08IY5hkm7BCmqe9JkoIs7y3+cbj2zU1TjN75qMyFYsIy
 Maq0OonKiPdmIIB22RLE6Zj7Xuotp08YqphmxgcQSmPqzmD9gRYRW89qOHfD4+AYLyaXCvdfcQj
 61HoRPgHh9BFVarXgHXYBba+JMBbGTYCjaq6OOeTSspAepaPm5kXIwJGMR29rSjz1MLk3YWOXKC
 Vf8Au5LEvyzV6HoN6Xjt6m0=
X-Google-Smtp-Source: AGHT+IF6YzLxPjQygzIyCyDmuGvnG2Nvx8WRct2Dh5q/Fm/R1qDKwRlM49lHsASYxtLspq93RsPzSw==
X-Received: by 2002:a05:6512:36d0:b0:545:3037:a704 with SMTP id
 2adb3069b0e04-5453037a70amr4902370e87.17.1739970035480; 
 Wed, 19 Feb 2025 05:00:35 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f105a3dsm2179515e87.144.2025.02.19.05.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 05:00:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/2] drm/bridge: reuse DRM HDMI Audio helpers for
 DisplayPort bridges
Date: Wed, 19 Feb 2025 15:00:29 +0200
Message-Id: <20250219-dp-hdmi-audio-v3-0-42900f034b40@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO3VtWcC/3XMQQ6CMBCF4auQrq1pRyDgynsYFy0zhUmUklYbD
 eHuFlZq4vK95PtnESkwRXEsZhEocWQ/5nHYFaIbzNiTZMxbgIJKgaolTnLAG0vzQPZSV9g6tGR
 t60Q2UyDHz613vuQ9cLz78NrySa/vv1LSUsnGGF2aplNY4unKowl+70Mv1lSCT97+cshc12hrs
 g7AuS++LMsb2LJyleoAAAA=
X-Change-ID: 20250206-dp-hdmi-audio-15d9fdbebb9f
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Hermes Wu <Hermes.wu@ite.com.tw>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2231;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=xLBEqgHgGc6f4GhWFZTZYL2fXQhQWUDFIGyzofB5XTk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntdXxTPSIb3Dq/+5KCR2epY51xmqraveZyobcV
 3GTWgbS4XmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7XV8QAKCRCLPIo+Aiko
 1fjiCACucytRzp+kgNNU42Wz6rz4JB5m835hRXFZRFNkxVQL4iN1K4NUjk1970tPgxM0ejsc+EJ
 MWfeH7BZ9kEaJzjH23bIgxBNS955/l6oVPvuQeSHQcNoAyUXhLpeadElzKSiH2IhUu/SxWhGXRg
 CwMB/Qu99lbFD70FLE2h7FTEOrKs8/JczxvrZ7xAf2CPqC4bS3ZA3/laUBUBEWWc+6p+DzLwkpT
 +bYDXQK9Z0DMjYbRobucVtIO6DT68dCgfISRT/bJyqeE3+XDQNgsoAxsUzZzvFtulxc+xCTJQVx
 UX7dBMhG6rvm4CrvBgu8RTYyzk7ugOjkZSp444w1RGcl6nVd
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

A lot of DisplayPort bridges use HDMI Codec in order to provide audio
support. Present DRM HDMI Audio support has been written with the HDMI
and in particular DRM HDMI Connector framework support, however those
audio helpers can be easily reused for DisplayPort drivers too.

Patches by Hermes Wu that targeted implementing HDMI Audio support in
the iTE IT6506 driver pointed out the necessity of allowing one to use
generic audio helpers for DisplayPort drivers, as otherwise each driver
has to manually (and correctly) implement the get_eld() and plugged_cb
support.

Implement necessary integration in drm_bridge_connector and provide an
example implementation in the msm/dp driver.

The plan is to land core parts via the drm-misc-next tree and msm patch
via the msm-next tree.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v3:
- Dropped DRM_BRIDGE_OP_DisplayPort, added DRM_BRIDGE_OP_HDMI_AUDIO
  (Laurent, Maxime)
- Dropped the subconnector patch (again)
- Link to v2: https://lore.kernel.org/r/20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org

Changes in v2:
- Added drm_connector_attach_dp_subconnector_property() patches
- Link to v1: https://lore.kernel.org/r/20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org

---
Dmitry Baryshkov (2):
      drm/bridge: split HDMI Audio from DRM_BRIDGE_OP_HDMI
      drm/msm/dp: reuse generic HDMI codec implementation

 drivers/gpu/drm/bridge/lontium-lt9611.c        |   2 +-
 drivers/gpu/drm/display/drm_bridge_connector.c |  59 +++++++----
 drivers/gpu/drm/msm/Kconfig                    |   1 +
 drivers/gpu/drm/msm/dp/dp_audio.c              | 131 +++----------------------
 drivers/gpu/drm/msm/dp/dp_audio.h              |  27 ++---
 drivers/gpu/drm/msm/dp/dp_display.c            |  28 +-----
 drivers/gpu/drm/msm/dp/dp_display.h            |   6 --
 drivers/gpu/drm/msm/dp/dp_drm.c                |   8 ++
 include/drm/drm_bridge.h                       |  23 ++++-
 9 files changed, 90 insertions(+), 195 deletions(-)
---
base-commit: 0e9eb9d5dfffee443c2765f86625b3a6d2659e95
change-id: 20250206-dp-hdmi-audio-15d9fdbebb9f

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

