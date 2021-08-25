Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4363F7F0F
	for <lists+freedreno@lfdr.de>; Thu, 26 Aug 2021 01:41:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA706E43C;
	Wed, 25 Aug 2021 23:41:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9898D6E43C
 for <freedreno@lists.freedesktop.org>; Wed, 25 Aug 2021 23:41:21 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id p2so2112107oif.1
 for <freedreno@lists.freedesktop.org>; Wed, 25 Aug 2021 16:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Dx5vF0RqdLQjKJyPbr0mwPJrCUoUq6AgUSDYu1xpnE=;
 b=e7Gva60om5ucDhwZOW154dizkM8QmCNpiJ/Qbr79PMm535sbqo6YqM+zRhkqrjfMXo
 KDci4/QsIf3DZVC2Nhufj3KE6G2Mdu7KVYB6rAGHkrKXrQXgpLKEPW0lZXrL1Xv6adVQ
 qUljemQJxfqBMTDwS8itfC0dAtkcAjygQAhY2FO8qbuhZc2cCuv1ze3MxI/azrfRXl8n
 gxVdbNf5raqo9a5nKrwO53lvhL3P+SsjNRgiQLkpuvL7oimlUIYHqBt0Q6Af7Knp5CZQ
 T0GYM6vZErrwUuIIFgOoIjheeXAcRAMBz2XaYqutgURo7G0PYFYGlCClSmmXNEYeSIic
 SJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Dx5vF0RqdLQjKJyPbr0mwPJrCUoUq6AgUSDYu1xpnE=;
 b=aePdJsLucX59R66fwlukxGQMJzjy0sEHmQ6U2NluUjHOqNU4fbZo20bXY6so8upmuX
 eta937YSbTaDJkm8qGTYneNQOn73LXfajPuPvikKNde+pseaHY14tYuhhjmwqvI+xJj+
 /j6e6aOlzFTqwlWsjwMTlfQreCgN9Fvgnul825BLtcQ7phYo6S5tcz5KjGbiiWnQSdoT
 zibXomdo/RA55TUaOTi4tBDS9qBuJ3lOS0RUN+CK57Z6KV9Li6bsGXZ9bNHkMTlWBJ5y
 vOu0q5X3et5WYRLuIo2w6qcmFMRt3wpurCrAl4ElylzTw8xkyldXZL9evMHOmBj8syth
 HHvg==
X-Gm-Message-State: AOAM5331F/wpmY2VuZBWJDXYOfUKh760EFj75CjRTIc8htT2yen9lVk7
 qy4Kiyroixv8lw18mqG9IUostQ==
X-Google-Smtp-Source: ABdhPJw9zn3NtnBd0n8a1m0/bwKf1FTtVx1BLiPe2ubaNrtSNOf+Gyfx6CGQTdtFmU1GTT991d4YDQ==
X-Received: by 2002:a05:6808:10c8:: with SMTP id
 s8mr8954414ois.175.1629934880914; 
 Wed, 25 Aug 2021 16:41:20 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id g10sm267136oof.37.2021.08.25.16.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 16:41:20 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Wed, 25 Aug 2021 16:42:28 -0700
Message-Id: <20210825234233.1721068-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 0/5] drm/msm/dp: Support multiple DP
 instances and add sc8180x
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

The current implementation supports a single DP instance and the DPU code will
only match it against INTF_DP instance 0. These patches extends this to allow
multiple DP instances and support for matching against DP instances beyond 0.

This is based on v4 of Dmitry's work on multiple DSI interfaces:
https://lore.kernel.org/linux-arm-msm/20210717124016.316020-1-dmitry.baryshkov@linaro.org/

With that in place add SC8180x DP and eDP controllers.

Bjorn Andersson (5):
  drm/msm/dp: Remove global g_dp_display variable
  drm/msm/dp: Modify prototype of encoder based API
  drm/msm/dp: Support up to 3 DP controllers
  dt-bindings: msm/dp: Add SC8180x compatibles
  drm/msm/dp: Add sc8180x DP controllers

 .../bindings/display/msm/dp-controller.yaml   |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  23 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  60 ++++----
 .../gpu/drm/msm/disp/msm_disp_snapshot_util.c |   8 +-
 drivers/gpu/drm/msm/dp/dp_display.c           | 138 ++++++++++--------
 drivers/gpu/drm/msm/msm_drv.h                 |   2 +-
 6 files changed, 132 insertions(+), 101 deletions(-)

-- 
2.29.2

