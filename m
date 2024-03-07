Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F9D875B42
	for <lists+freedreno@lfdr.de>; Fri,  8 Mar 2024 00:57:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F1A10F5FC;
	Thu,  7 Mar 2024 23:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xGAXxjhM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E3F10F5FA
 for <freedreno@lists.freedesktop.org>; Thu,  7 Mar 2024 23:57:06 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-512bde3d197so1487929e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 07 Mar 2024 15:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709855824; x=1710460624; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kPbMM+ap6bTE3j0dauj5tCzlH9OJzhaDQAkiD6tMHbs=;
 b=xGAXxjhMBRXcOia6ERynrbvc0oJ/HbBGW+KbbSs2th1VTnBZSUGBBQVCy58lRxzeTc
 r6df7hcErQGUeOIfD+r+OB0pziQx7R+948u1pbqDRWVoCXj7kVpVpd162IxBIEkPZiTf
 cAEtbtEnyYKNeCtdtsdkBd+F6d2MBgF7BWXy7AvlP2QMbgyMXZTffhPA4BKd5dLCRYvK
 4i2ItGbkGlEsAfZLo+hcPYqgnyDo7Xd8dHVz4SNRKqZQBuXvFCr6qYM2kcZ9rqAeEs+i
 xDQSCM02ruxw3C9BiHkyeh0zeJymsYWeyMuQxliXLxS3/eCF03gNx/xkdzNb5w2QxvkJ
 jgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709855824; x=1710460624;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kPbMM+ap6bTE3j0dauj5tCzlH9OJzhaDQAkiD6tMHbs=;
 b=aNOrHSk0PlUOMu9IMs1Or9w/Sm/9y1y8JBULUh+K6a/IdmH/8kMU94h51dO7NuD59s
 Tk/24b8yHWjPuqY5WEDBOJftU/v1dgX72z2BRUS+2jlXSfdkUPHcBQhFxub9G9LREU5S
 gcxdDKokDDbMjIcFF34OYvT/sKRwAQS06tHnEaTofmL5sUEYJmlzlNxdjenys1Fe8hUH
 6FLk/B10xEF2G/aMq4E7k5Kit6WeJOZ9hSB7Q95ZFgHPdRHU6afawGIhMS41rRJPtfQK
 w7HiIDeU3KVeBt09l7St1pDdjctqR7erKc+6r6OAzCBm+/JlydvBchTf/aTXGJ6z5c5P
 25qQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXk696WsC7gVlvqYPAW1O0ByT1AFHVghi4VigLhL1wS+8kUJ//u2U/7owmYS8ilFtF87rgunV6OLUFIfApDooN0HhTEx/kE+NXJAtryS/Wg
X-Gm-Message-State: AOJu0YxMM0NQRllNyG8Lar7fDIH62MF3ew7oWdD1iZlwGqPiy84H4O3D
 FC2cvdrp1dA4jzJ9E4+r0BZ7nldM2rIYIv2jpot2xjUtRgZbuhd8tPoWjC/jwlw=
X-Google-Smtp-Source: AGHT+IFRM+RZOhXZOJcCVo33fKD0gUELk60egjTYuOpmUI5+6SBlNnemOhH2nuK2o/Z00lC5KjeX2g==
X-Received: by 2002:a05:6512:ea5:b0:513:57fe:97b7 with SMTP id
 bi37-20020a0565120ea500b0051357fe97b7mr2864486lfb.38.1709855823699; 
 Thu, 07 Mar 2024 15:57:03 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 c25-20020ac25f79000000b005133277eb29sm2796475lfc.270.2024.03.07.15.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 15:57:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH RFC 0/6] drm/msm: make use of the HDMI connector infrastructure
Date: Fri, 08 Mar 2024 01:56:59 +0200
Message-Id: <20240308-bridge-hdmi-connector-v1-0-90b693550260@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEtU6mUC/x2MQQqAIBAAvxJ7TrC0hK5BD+gaHUq32kMaa0QQ/
 T3pOAMzD0RkwghN9gDjRZGCT1DkGdht8isKcomhlKWWShoxM7lkN7eTsMF7tGdgYVCZSmNdF05
 Cag/Ghe7/O0DftTC+7wfy1C6cbAAAAA==
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1645;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ztKhf09WdcJUt6OCZRpTpvQyv9XZ/QxyJM/CXoCbSWc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl6lRNbA9c3v4rMPfYnKFGcDEGs4HEAIUzV0kTi
 bGknoVXg+CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZepUTQAKCRCLPIo+Aiko
 1UjLB/9qhB2lilo2+Mq64d7vpwGM0JmkBDubpjudlUYvH31iTFpUnDR2AMF2VG9FyFWkDGbhevQ
 /zy+2xz59qhtTz90fEB1djyDZJXkEbfMNmH42CaUJkSgU/3lyb9GSOr16bbqhx+t0ffJFXhF1HM
 ssuQux0kYS5SRJJqUmTyd31tWA90CUnz1QcuRURwUW96k0J1MsjKF/l532DRgdfgC4Pqzdhuhbl
 NuwaZV6vQhbJ+gGkCs9txg131YYpaLPrA8/4I/BwFGyKqPcPJROAKkN3Xkwp2pq/dU4qe5QUNua
 nsGH9n30eLVntIYu+uyJOL17UQpt9+aPthiulVqNQbcvi3qk
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

This patchset sits on top Maxime's HDMI connector patchset ([1]).

Currently this is an RFC exploring the interface between HDMI bridges
and HDMI connector code. This has been lightly verified on the Qualcomm
DB820c, which has native HDMI output. If this approach is considered to
be acceptable, I'll finish MSM HDMI bridge conversion (reworking the
Audio Infoframe code). Other bridges can follow the same approach (we
have lt9611 / lt9611uxc / adv7511 on Qualcomm hardware).

[1] https://patchwork.freedesktop.org/series/122421/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (6):
      drm/bridge: add setup_connector callback
      drm/connector: hdmi: fix Infoframes generation
      drm/connector: hdmi: split setup code of the HDMI connector
      drm/connector: hdmi: add opaque data type
      drm/msm/hdmi: switch to atomic bridge callbacks
      drm/msm/hdmi: make use of the drm_connector_hdmi framework

 drivers/gpu/drm/drm_atomic_state_helper.c |  25 +++----
 drivers/gpu/drm/drm_bridge.c              |  38 ++++++++++
 drivers/gpu/drm/drm_bridge_connector.c    |   8 ++
 drivers/gpu/drm/drm_connector.c           |  67 ++++++++++++-----
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c    | 120 +++++++++++++++++++++++++-----
 include/drm/drm_bridge.h                  |  15 ++++
 include/drm/drm_connector.h               |  10 +++
 7 files changed, 230 insertions(+), 53 deletions(-)
---
base-commit: 47dc3e3d3051709acd01143e21d2de2b5322336c
change-id: 20240307-bridge-hdmi-connector-7e3754e661d0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

