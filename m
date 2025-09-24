Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35748B9A768
	for <lists+freedreno@lfdr.de>; Wed, 24 Sep 2025 17:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15B010E74B;
	Wed, 24 Sep 2025 15:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lC5yQ43p";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6786010E74B
 for <freedreno@lists.freedesktop.org>; Wed, 24 Sep 2025 15:08:27 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-b54dd647edcso6640707a12.1
 for <freedreno@lists.freedesktop.org>; Wed, 24 Sep 2025 08:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758726507; x=1759331307; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4cPuMIb0mZC5xOmyRNwA38vJPNTs1ammKswmchiIKuo=;
 b=lC5yQ43pAnN8S8v0otAtWLwqhVrz/O8N/Y+Vq41+7zpc2vJ/xZJdojXpF2v7jN46yW
 QnreeFYxdskMqlhWN4zOqRwimeNn7DDCzYooUsFuaQ8w/Mszs2tEBKFjWYgvfV7x5S4t
 Q9KGP1GURL2mOcg8pJmUxmnZSanRHNbrk+GRjM8t+HvPG1ydie+MVV4Y6ruFFuZmhlmF
 tJDOWE2glBUzJdL4sHRq7zt1pxz3/poZYTIWnxi+GMk8yNinuLGvhGY6QXTAUi7Tdxuj
 x5lNIWcmfGNSH7eegkEpUCmRpWGQPYM7MyPvPt6Rd+m5fcd46qV6OqS3mnyKwyNKcbE8
 QUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758726507; x=1759331307;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4cPuMIb0mZC5xOmyRNwA38vJPNTs1ammKswmchiIKuo=;
 b=mq+J9mRlH0Vnlwagz+GTp4Q3XJRHnKwVXvEdSxKZuKorUe1TGOx7zhCssEoV2jx031
 n/w5SksakIYlz9J1nPwhnMyNPPVzzsTL9zInJy0zTXhLMNLLpdJKq5SykZcSImLGiSzE
 5aD/Q5EtSTBDb3N3WlgkVMoBbURXXawgbazjm48rU4LVKZiNLDe/X+wPZyzocIdPFuGN
 L1CZYFEVjxLn76TSAkUJjQqXJneFJCGX3PnQPwdVCuFHZTgU7nF2uYHOiB677I6lqRMA
 xMukd0s276rbC6HZDKx6oCioz2mrlhr1673ZnTt6dZjU2aRX0nHfq/wuwVh1k8B8nqD/
 Y1Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEPJHaF57iESspFou5g7hnmeG1rpu+X3CoWnNKSnLApKVaK/kL46s6CJnhFnZcRSO5yjr3qN2KQQ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywh/T85zaDrmAD+Om/cfHd6smjB7eGlIxOBB1A/Tfg2NV+w8O3E
 sDX6VhSJH1kPUd27Z5TzJSDM7ClFPs6Pt94RCr4GT0pMRaCtmRUzH7/3bT1x3yVdxv8=
X-Gm-Gg: ASbGncuyVCl8ZFjwzgibLJK7+wirDyo5SLzYum7J/EPRskJs1LVD1YsLP5ddMKbye3F
 nvkykw0HBeVbdVuWLEGFvKAxKB9vF1c/bC73fJ8huS8OSfpd75v5HxgLy9G8g7/0vUvXgMrEZro
 4ILXcTUeahG/aszjZcgQ5Sr60iXFA4NCFNsvphZWSWUNqsMmClJnrtWr5eF5mDSvkuqKNs+uQI2
 ohOFs+Rh+2Gcd+A2LOE7PkK+JUfE9dGa6jMgUed2NQ6ToTUBcAiz2JNUzgyauO1QcK9o5RnnyXH
 etbh0fY84E41dA7AEI7rPOLW+EOTTRXk61SVdT/ap+1jKFRY+uVq1nfRlUJANm7Tj14EZjadVFT
 tV1265V9xm4sAFju/
X-Google-Smtp-Source: AGHT+IGdO7AHe6Adr0JVRoWrxVhan7hdmVuVEYOGDB1J6Z6YlniOSroTOkT9XhR+htou4GY59pzHXg==
X-Received: by 2002:a17:903:244a:b0:25c:d4b6:f117 with SMTP id
 d9443c01a7336-27ed4a3de3cmr643585ad.35.1758726506852; 
 Wed, 24 Sep 2025 08:08:26 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.5]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26b59d6538bsm158717445ad.82.2025.09.24.08.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 08:08:26 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v3 0/3] drm/msm/dsi: Add support to 2 panels in bonded-DSI mode
Date: Wed, 24 Sep 2025 23:08:09 +0800
Message-Id: <20250924-dsi-dual-panel-upstream-v3-0-6927284f1098@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFkJ1GgC/x3MwQrCMAyA4VcpOS9Q2k5wryIeookaqF1pNhHK3
 t3i8Tv8fweTpmKwuA5NPmq6loE4Obi/qDwFlYch+DD7c0jIpsg7ZaxUJONebWtCb0zEwqd448A
 zjLo2eej3f75cj+MHs2l9smkAAAA=
X-Change-ID: 20250924-dsi-dual-panel-upstream-4aded63bd2d5
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jun Nie <jun.nie@linaro.org>, 
 Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758726499; l=1682;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=iNszQabvn/lRi8yKKlr/FXddBVqjWQ7NUr1nerkkTZw=;
 b=R2JXFonK7pFkgd4mj9wIsv4DU1DOmzP4CuuDG3BZ/JK6k5rr3gcqHOzQEIW1nXqyTrVMHMRSN
 vZyLYGivB+2CKc7hjk474vCOrc4Ysh6AtEp/hbcX0DDEj6SpaIaO1sL
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

The 2 DSI interfaces may be connected to 2 independent panels in bonded-DSI
mode. Horizontal timing and DSC configuration are adjusted per individual
panel in DSI host side. Support to multiple slice per packet is added for
the device setup to test the usage case.

Changes vs v2:
- Polish commit message to describe usage case and requirements to
  panel driver.
- Remove changes in device tree and add dual_panel flag in mipi_dsi_device
  to pass information from panel to dsi host.
- Drop the register programming to DSI_VBIF_CTRL, as no issue is seen
  in latest test.
- Link to v2: https://lore.kernel.org/r/20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org

Change vs v1:
- Add device tree binding for dual panel case in handling frame width for
  DSC to avoid breaking existing dual-DSI case.
- Leverage Marijn's patch to configure proper slice per interface in
  dsi_update_dsc_timing().
- Polish commit comments.
- Link to v1: https://lore.kernel.org/all/20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org/

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
Jun Nie (3):
      drm/msm/dsi: support DSC configurations with slice_per_pkt > 1
      drm/mipi-dsi: Add flag to support dual-panel configurations
      drm/msm/dsi: Support dual panel use case with single CRTC

 drivers/gpu/drm/msm/dsi/dsi_host.c | 35 +++++++++++++++++++----------------
 include/drm/drm_mipi_dsi.h         |  4 ++++
 2 files changed, 23 insertions(+), 16 deletions(-)
---
base-commit: a3306041f55d0f86c40d06eaad1d4e8f06e4483d
change-id: 20250924-dsi-dual-panel-upstream-4aded63bd2d5

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>

