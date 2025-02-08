Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 431AEA2D203
	for <lists+freedreno@lfdr.de>; Sat,  8 Feb 2025 01:28:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024D310E025;
	Sat,  8 Feb 2025 00:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wjP4RXm1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9F210E039
 for <freedreno@lists.freedesktop.org>; Sat,  8 Feb 2025 00:27:06 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-543e47e93a3so2858440e87.2
 for <freedreno@lists.freedesktop.org>; Fri, 07 Feb 2025 16:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738974425; x=1739579225; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pPck6SLH/Kwo2T9+Ge6JyfzFebpTdKePxgnTBTgjN3E=;
 b=wjP4RXm1f34KsKiS94OURVnGW9UGrGbo9lUDGEG0RRe9hTKOVpM99InsfAeAqzGIgK
 AORFOC3MCx+/Z1nPhJtRf5hDgmD5OK3HGbmQxOA5J9DpzmKcjymGyM+fkAnkBiHnunRt
 N1w7Ei4wbLsh6LSll5ssbOzG0FmU4/Nj5T9Z+M9veL2HTY/uKVzjtTZ3GaGcDh61gNSC
 GGshhQDXP+4xkhGLMuSt4nOF0GVf8M54laloivJ+qOpnGYdO8oyZR38GVjHzQRveAbsh
 4HvxBiGK3w5UYoKbva5pmy1fRgk38IqqcaXBaC7S1pdmHnMfWS+Hbbf/eF2HnFeLfQNe
 2phg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738974425; x=1739579225;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pPck6SLH/Kwo2T9+Ge6JyfzFebpTdKePxgnTBTgjN3E=;
 b=qDLFiebBiITfn9M3pBb1maB/NdSSWTLxwbeMcXGSKcuUQxTinBPc6KkpGKPu64yDFM
 HA6r7kjqdEdSr2pZicimzJPSo64oS19dpSVLVKfuPtpQB43gBc6KANflp7EDF4fVOXNf
 uBAyPAoZZ9dVh2DGadv5xyzdfsfMdpIZHuz3kLVENFZ7msS4jvKkX3oZhpoq0zFoWXST
 4hcdyGDEX9jd0R6mcSwYqRTOeXh/a38myl+5Px7CXf+RchI14pLvkSOt1g9F6RXMjDsW
 tFeTxoWpOuTT+VZe6bI7FhJ8ZjYnRMohX9L61Vjq6A0Rq60Hb/M/3eWTlJ5Ag5p75b3+
 tGBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU47N2lTlJomF1GXqaM4VN8v7fB5J7d8GzxU2r7iEqUoW9AD4ExoQfx+O5aI7d6ufOC0Yxcyleq0mk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFFdjOc3ltstvQmk9dyhFe3kyaWUjgMCfwOJPKk66p7T8U9nLo
 48Q48ICP68P30lwY0tbVWdVjSwHTJz5iPI7JjH1k5NBKrpUQ0NjffmLavZ6dzs8=
X-Gm-Gg: ASbGnctI9/hrd6PtZx3bAs97RRnDfGfzD2+ukRbe8n8a75CCO7DaQ/wzj9AJGNXvDys
 EKJ4s0ep5xPlhVnTiEMCqvvxzE9H9k6VgrAnpu0HhfPMTF6XkyARCAE2RmxH9J8N4hhPgr4spXD
 yhIb1UZPPLofQIGBHb8eIvLaMHtYLlceuq85aooqQgARieIRVpxQvdjzUV09Jbk5pZ9x4cUo8Tp
 VgqflA9Ya9VE6kEXdG12ZyLsN+0AgOzfl+tI/8vHYXVRZNZmyl4sXq3g+fb4Xo+QzZcNvQKcaZE
 FSA6RZ0pOiXftd/hSvX6icw=
X-Google-Smtp-Source: AGHT+IEBWUnGdgBTihhBBAkyF04vqb9ElAFmmed9NZyC5WBK4lMDvBnJVFrimYw2k00iJFDhnkfVuA==
X-Received: by 2002:a05:6512:3d18:b0:53e:37e4:1457 with SMTP id
 2adb3069b0e04-54414adfcdamr1786885e87.33.1738974425074; 
 Fri, 07 Feb 2025 16:27:05 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5441060413asm588785e87.222.2025.02.07.16.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 16:27:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v7 0/7] drm/msm: make use of the HDMI connector infrastructure
Date: Sat, 08 Feb 2025 02:26:59 +0200
Message-Id: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANOkpmcC/3XQy2rDMBAF0F8JWldlHnrYXfU/She2NY4FrVXkY
 lqC/71yICTFaHkHzRlxL2qRHGVRL6eLyrLGJaa5BP90UsPUzWfRMZSsCMgAg9d9jqFMp/AZ9ZD
 mWYbvlLUX9taIcxhAld2vLGP8ubpv7yVPcSnPfq9nVtynN7GpiCtq0C30rmVrgRy8fsS5y+k55
 bPayZUembbGUGGQG+ilYxF/ZPjOWIYaw4XpMGBjgmtG4QNjHhmsMaYwFhFG3xp2RAfG3hlXbXu
 1+296bkrjQNiNB8bdGAtIpsa4vRvbkmNi8qP/x2zb9gfq8n4/HgIAAA==
X-Change-ID: 20240307-bridge-hdmi-connector-7e3754e661d0
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4679;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=pzd5EfhRagUWHzKGw0gU6h0w+hFjAy7c4zRRuPA1AtI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnpqTVDumOccMSbe6uagcDjgDLtQSTsu5Sh618T
 jk8W+JK8ACJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6ak1QAKCRCLPIo+Aiko
 1e0CCACYhiKBTVTw0n4icKg/NJ+BzHJiDtjkspX0paGN5a1wbKuVuZ2P2qiBVxPu3rulSxzkNKR
 v4nuWOQl/8QIFvL0OAtmEdfEvQfPylWx5zFN2T+IO0lbj9j2kW5UNqx4oxJroWKLz6PSbuPlzpT
 1oODBJ0rc8qkINNKT+C7ihDikq3kF432FXlqgDmgJVyES78LLide6BOqYpzWEWsw8wOEcr/GsY3
 g/V2Vpsmvct2V6yod7Sb+KVYOkhhEFttkwThFaaY1zCHmkLjx4mFiQnmB/O15fyeQPncDlx4ZCB
 YCf/8A7p/S9lPGeRadCrLyZ3XChOzobJX3+2PBopP3zBV0uk
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
Changes in v7:
- Updated Audio commit message to mention InfoFrame vs audio packet
  difference (Abhinav)
- Brought back msm_audio_update() calls to atomic_pre_enable() and
  atomic_post_disable() callbacks (Abhinav)
- Moved the call to msm_hdmi_set_timings() to the beginning of the
  atomic_pre_enable() (Abhinav)
- Link to v6: https://lore.kernel.org/r/20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org

Changes in v6:
- Moved HDMI timing engine programming to the end of the atomic_prepare
  (Abhinav)
- Rebased on top of drm-misc-next, incorporating changes to
  drm_bridge_connector
- Switched to the DRM HDMI Audio framework for the HDMI codec
  implementation
- Link to v5: https://lore.kernel.org/r/20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org

Changes in v5:
- Made drm_bridge_funcs::hdmi_clear_infoframe() callback mandatory for
  DRM_BRIDGE_OP_HDMI bridges (Maxime)
- Added drm_atomic_helper_connector_hdmi_disable_audio_infoframe()
  instead of passing NULL frame to
  drm_atomic_helper_connector_hdmi_update_audio_infoframe() (Maxime)
- Disable Audio Infoframe in MSM HDMI driver on audio shutdown.
- Link to v4: https://lore.kernel.org/r/20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org

Changes in v4:
- Reworked drm_bridge_connector functions to remove ternary operators
  and to reduce indentation level (Maxime)
- Added hdmi_ prefix to all HDMI-related drm_bridge_funcs calls (Maxime)
- Made vendor and product mandatory to the HDMI bridges (Maxime)
- Documented that max_bpc can be 8, 10 or 12 (Maxime)
- Changed hdmi->pixclock to be set using tmds_char_rate instead of
  calculating that manually (Maxime)
- Changed mode_valid to use helper function instead of manually
  doing mode->clock * 1000
- Removed hdmi_mode in favour of connector->display_info.is_hdmi
- Link to v3: https://lore.kernel.org/r/20240530-bridge-hdmi-connector-v3-0-a1d184d68fe3@linaro.org

Changes in v3:
- Rebased on top of the merged HDMI connector patchset.
- Changed drm_bridge_connector to use drmm_connector_init() (Maxime)
- Added a check that write_infoframe callback is present if
  BRIDGE_OP_HDMI is set.
- Moved drm_atomic_helper_connector_hdmi_check() call from
  drm_bridge_connector to the HDMI bridge driver to remove dependency
  from drm_kms_helpers on the optional HDMI state helpers.
- Converted Audio InfoFrame handling code.
- Added support for HDMI Vendor Specific and SPD InfoFrames.
- Link to v2: https://lore.kernel.org/r/20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org

Changes in v2:
- Dropped drm_connector_hdmi_setup(). Instead added
  drm_connector_hdmi_init() to be used by drm_bridge_connector.
- Changed the drm_bridge_connector to act as a proxy for the HDMI
  connector  infrastructure. This removes most of the logic from
  the bridge drivers.
- Link to v1: https://lore.kernel.org/r/20240308-bridge-hdmi-connector-v1-0-90b693550260@linaro.org

---
Dmitry Baryshkov (7):
      drm/msm/hdmi: switch to atomic bridge callbacks
      drm/msm/hdmi: program HDMI timings during atomic_pre_enable
      drm/msm/hdmi: make use of the drm_connector_hdmi framework
      drm/msm/hdmi: get rid of hdmi_mode
      drm/msm/hdmi: update HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE definition
      drm/msm/hdmi: also send the SPD and HDMI Vendor Specific InfoFrames
      drm/msm/hdmi: use DRM HDMI Audio framework

 drivers/gpu/drm/msm/Kconfig                    |   2 +
 drivers/gpu/drm/msm/hdmi/hdmi.c                | 120 +--------
 drivers/gpu/drm/msm/hdmi/hdmi.h                |  31 +--
 drivers/gpu/drm/msm/hdmi/hdmi_audio.c          | 124 +++++-----
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c         | 325 +++++++++++++++++++------
 drivers/gpu/drm/msm/registers/display/hdmi.xml |   2 +-
 6 files changed, 336 insertions(+), 268 deletions(-)
---
base-commit: ed58d103e6da15a442ff87567898768dc3a66987
change-id: 20240307-bridge-hdmi-connector-7e3754e661d0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

