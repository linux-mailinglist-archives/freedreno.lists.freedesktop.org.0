Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 689F7519187
	for <lists+freedreno@lfdr.de>; Wed,  4 May 2022 00:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B7910E1E7;
	Tue,  3 May 2022 22:40:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 023A110E1E7
 for <freedreno@lists.freedesktop.org>; Tue,  3 May 2022 22:40:51 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 a15-20020a17090ad80f00b001dc2e23ad84so3594799pjv.4
 for <freedreno@lists.freedesktop.org>; Tue, 03 May 2022 15:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z4jQqLRjT5d2UYQiVLjONfc4f34INRSeov1NA+mVkes=;
 b=CR3c66gXlI7dp0GBAFTU6S4A96UiPfse88KiZYhRAnyvdsiEtq5+rIgzLTXLBAgAFL
 rU4spHhLilzT+XqFo07FtFJT+O0In8w0k8D2zdB9Dgl1tea50Azb8JKw4BpEBlbhl6BQ
 P8/vwL4+iRR/6ZBfz77yKapJZq/VOVXeRz+5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z4jQqLRjT5d2UYQiVLjONfc4f34INRSeov1NA+mVkes=;
 b=3BeM4HJBCK/ncv7PaVwZAjJDb6LylfAtgsMxN1y6TTkMQZeQNycWZLuvJvEoEvwImX
 Yls/i3rfaOdLwYFJy6uyeCW02LyUp+Hf7lr5LyMT1k46kIQ63NTZvnZm1gQkVFy/l8gI
 v+k0QH8iwi5YzMnKcrZTcKg6dtMggFvv1P8AhHw40X7Shhr4rastplFPVqdR0QaTf6oL
 6/fgAWyHupVsJAL+ABoE1tdwRNPMQbWfHMFwS6lin4xJI6iIsRg+s+vMrR+7ATMMnDpc
 5JF3kblP8v+9OQCawY/33ciB2V6Vlv5F/DfiIasUe6l7KEbVUwTgIIo4bk/b2+J7hXJg
 ZOsw==
X-Gm-Message-State: AOAM530qjK2CvRlwYb07JyXohHpM0J/JTDd9Pivvr+rOriUlcvdSQ7je
 YddRiZaHLEyj4S9pcknJNkT2YQ==
X-Google-Smtp-Source: ABdhPJzYaUyozHYiMHueXIGD9R5owe6Q0eQLyLYo/8TUtTmGnNhSX5JUoZ8jDGchkO1aSnwI/fJfAQ==
X-Received: by 2002:a17:902:d1cd:b0:15d:1483:6ed6 with SMTP id
 g13-20020a170902d1cd00b0015d14836ed6mr19614970plb.58.1651617651626; 
 Tue, 03 May 2022 15:40:51 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:93ca:84cb:c452:c0a3])
 by smtp.gmail.com with ESMTPSA id
 az12-20020a170902a58c00b0015e8d4eb27esm6803778plb.200.2022.05.03.15.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 15:40:51 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Date: Tue,  3 May 2022 15:40:27 -0700
Message-Id: <20220503224029.3195306-1-dianders@chromium.org>
X-Mailer: git-send-email 2.36.0.464.gb9c8b46e94-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 0/2] drm/dp: Make DP AUX bus usage easier;
 use it on ps8640
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
Cc: Douglas Anderson <dianders@chromium.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, Lyude Paul <lyude@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This patch is v2 of the first 2 patches from my RFC series ("drm/dp: Improvements
for DP AUX channel") [1]. I've broken the series in two so we can make
progress on the two halves separately.

v2 of this series tries to incorporate all the feedback from v1. Hopefully
things are less confusing and simpler this time around. The one thing that got
slightly more confusing is that the done_probing() callback can't return
-EPROBE_DEFER in most cases so we have to adjust drivers a little more.

The idea for this series came up during the review process of
Sankeerth's series trying to add eDP for Qualcomm SoCs [2].

This _doesn't_ attempt to fix the Analogix driver. If this works out,
ideally someone can post a patch up to do that.

[1] https://lore.kernel.org/r/20220409023628.2104952-1-dianders@chromium.org/
[2] https://lore.kernel.org/r/1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com/

Changes in v2:
- Change to assume exactly one device.
- Have a probe callback instead of an extra sub device.
- Rewrote atop new method introduced by patch #1.

Douglas Anderson (2):
  drm/dp: Add callbacks to make using DP AUX bus properly easier
  drm/bridge: parade-ps8640: Handle DP AUX more properly

 drivers/gpu/drm/bridge/parade-ps8640.c   |  77 +++++---
 drivers/gpu/drm/display/drm_dp_aux_bus.c | 215 +++++++++++++++--------
 include/drm/display/drm_dp_aux_bus.h     |  24 ++-
 3 files changed, 216 insertions(+), 100 deletions(-)

-- 
2.36.0.464.gb9c8b46e94-goog

