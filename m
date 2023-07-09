Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 920AF74C827
	for <lists+freedreno@lfdr.de>; Sun,  9 Jul 2023 22:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB6610E13E;
	Sun,  9 Jul 2023 20:25:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 112B710E131
 for <freedreno@lists.freedesktop.org>; Sun,  9 Jul 2023 20:25:16 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fb9ae4cef6so5806179e87.3
 for <freedreno@lists.freedesktop.org>; Sun, 09 Jul 2023 13:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688934313; x=1691526313;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7cndd2/vN8mxQVPz3p9JPigBgvvmJD7oR5tvQT/hZpo=;
 b=BZNmcrjwoY671k6LUCulctqznIPimA0aujVzqGE1z/1Y3G7VxTKtqrOI3kN4P3bOb8
 hCOdFh5OWC31rF8U5PmhKpVT92ITjCM/uyCc7KFXzffTpe75BpkeFPa3Be/Sv9OB8s+M
 8RcK3f2K8N/zlbsWwX4kBYEr2ldozCPQBX2UESN+/OLASYbhv5dwpcTWR1IGTSFAsgsQ
 qCFcGDWBPbl0GQnRp1eqrDkHS2gGDQLg8pce6gYnx/sAY+6Mhr98X2cMO+unY1aFH0Es
 cLC7kdLYd74Ac2xik06kVe6EOFPyfNCtcllzyIDNJniVLjjY/kSwS68X9y5oDMmIacQs
 eeww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688934313; x=1691526313;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7cndd2/vN8mxQVPz3p9JPigBgvvmJD7oR5tvQT/hZpo=;
 b=bGGgjN4lQtbL0GCxQGXA6/v7yz+ynQmPu11UZzHZ2Wc5BsxYqTlvBz6fW3AH8nLNJ0
 keHmykIPJxsO3Opp+n9RLAd/Isz9jYKKOT1iND3M8hZmExI15Gt/aGpX+mCisPW1h/nF
 /Q84TxCfXIAhohNxQeRcUg8F518v0W/AiSUe2EOqQ7AQjmM3O97MjHleypzFWfvqgwnl
 xVo3bXXk6tWMc2UeolACrpSbSo8kbq8SyLhZplCAvHewvvw1ONHFodVZNr+32caomidT
 TxVu51nX3xUS/o29/DNcYFKPD0tcBHLAmqlqZ1VoSzeVr1OZDdAXmaXaQvmJr6+xMIkg
 ltrg==
X-Gm-Message-State: ABy/qLa+47FLP0Dv96qWzERJx1s+1kwnaHW8Ah1J60kurmX00ZDSXdpo
 zr/yewgmjs6aXP7oHCGUukZkmA==
X-Google-Smtp-Source: APBJJlGTqVrebBJDYVqNBkWa/EbTHWNbbJL+SjsdAlmpBYlGziNNTppbAc5A3pBDgoXxeQfkedRxvQ==
X-Received: by 2002:a05:6512:6c7:b0:4fb:8eec:ce47 with SMTP id
 u7-20020a05651206c700b004fb8eecce47mr8568506lff.58.1688934313030; 
 Sun, 09 Jul 2023 13:25:13 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 8-20020ac24828000000b004fb771a5b2dsm1428774lft.1.2023.07.09.13.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jul 2023 13:25:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Date: Sun,  9 Jul 2023 23:25:08 +0300
Message-Id: <20230709202511.287794-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 0/3] drm/bridge_connector: implement OOB HPD
 handling
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Note, numbering for this series starts from v5, since there were several
revisions for this patchset under a different series title ([1]).

USB altmodes code would send OOB notifications to the drm_connector
specified in the device tree. However as the MSM DP driver uses
drm_bridge_connector, there is no way to receive these event directly.
Implement a bridge between oob_hotplug_event and drm_bridge's
hpd_notify.

Merge strategy: since this series touches i915 code, it might make sense
to merge it through drm-intel.

[1] https://patchwork.freedesktop.org/series/103449/

Changes since v5:
- Fixed checkpatch warning in the first patch (noted by intel-gfx CI).

Changes since v4:
- Picked up the patchset
- Dropped msm-specific patches
- Changed drm_bridge_connector_oob_hotplug_event to call connector's HPD
  callback directly, rather than going through the last bridge's
  hpd_notify
- Added proper fwnode for the drm_bridge_connector

Bjorn Andersson (1):
  drm: Add HPD state to drm_connector_oob_hotplug_event()

Dmitry Baryshkov (2):
  drm/bridge_connector: stop filtering events in
    drm_bridge_connector_hpd_cb()
  drm/bridge_connector: implement oob_hotplug_event

 drivers/gpu/drm/drm_bridge_connector.c        | 34 ++++++++++++++-----
 drivers/gpu/drm/drm_connector.c               |  6 ++--
 .../gpu/drm/i915/display/intel_display_core.h |  3 ++
 drivers/gpu/drm/i915/display/intel_dp.c       | 17 ++++++++--
 drivers/usb/typec/altmodes/displayport.c      | 14 ++++----
 include/drm/drm_connector.h                   |  6 ++--
 6 files changed, 58 insertions(+), 22 deletions(-)

-- 
2.39.2

