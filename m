Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5A1430537
	for <lists+freedreno@lfdr.de>; Sun, 17 Oct 2021 00:17:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465E06E8B9;
	Sat, 16 Oct 2021 22:16:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F280C6E8B9
 for <freedreno@lists.freedesktop.org>; Sat, 16 Oct 2021 22:16:55 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id g125so18678413oif.9
 for <freedreno@lists.freedesktop.org>; Sat, 16 Oct 2021 15:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9ujg6PKfSs2XOzYYHdPfFh++V/EwomxD0QVcYgfLZXo=;
 b=bWLopzPXV0sZJ2LSwu41r+EPZMlLquM8s17awzNbFsWQAvNQP3ysIA6BjXqDaOvT07
 FoPsOPzBGSkErL9hZs5bUhmBVFlFlw0BEXx1y6vSadNWxyp0syScVEP7xfzYUiKYUcb2
 XMHDLAonIuvWwiVjsNMWyOc1aNN8Ew1DwZqg79F5xfAFZ5N7w7l68UJ2HoUyDsuXRDGB
 uTwKq6tDfoTcNb69w6wKA1shhumJFyxEWUfGqJZ+QvJMa7dD5DFIHzkgVlm1sWqtPVyX
 mDQif9GoD6HwjyWYozcLLiaQQoSKGclDteZbep0MPD7RzQaxsLgAwke+Zm1v0563lals
 d9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9ujg6PKfSs2XOzYYHdPfFh++V/EwomxD0QVcYgfLZXo=;
 b=uKzLe4h/B+TttbQD/aO2bVtuwvaPI3kTQUxya1+VaZGRIELNIbMJnoIm3fWZA5a3Vy
 5zwsViT2h3bEExG0HhBulaWLYFeZyi+KMpJCiIjpEoqJvXMuJGmXL3+z7PkYMGF5RnoD
 tXtFJkwPEmoRel6KAjdwjSTOayMGMJS6F6O3pDrPaSL0feib6dfQHh3SDijnf1MuIz5m
 uJPgCjLlaXD9bNGDPbioJt/gCLHQIJFtTUHGPXgOAyga7JcLXfKctVgs4UmVrRpAFAaS
 eI+GL1JqiFvb2ObKQQGOz4MLQNpCqA3HZTRO8J9IbY6RUvBZ0S7pf6fnxmbizBnqu1zL
 kKBw==
X-Gm-Message-State: AOAM531Kx+AvfJKZOCyAalDV/VafVbRzc7/SKywIqaRYXLHcHdTjX3PV
 OGijkbyok292ck4Jwa0pDvLuWw==
X-Google-Smtp-Source: ABdhPJx7Ixjt5pToz+8Du+Kf33f+u70q+ZoT74guovCjf5YAM7lolr8SqhxQm3rOVRMfvryCj1ruRQ==
X-Received: by 2002:aca:5dc5:: with SMTP id
 r188mr22884478oib.160.1634422615143; 
 Sat, 16 Oct 2021 15:16:55 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 d15sm1747058oic.32.2021.10.16.15.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 15:16:54 -0700 (PDT)
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
Date: Sat, 16 Oct 2021 15:18:36 -0700
Message-Id: <20211016221843.2167329-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 0/5] drm/msm/dp: Support multiple DP
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

With that in place add SC8180x DP and eDP controllers.

Bjorn Andersson (7):
  drm/msm/dp: Remove global g_dp_display variable
  drm/msm/dp: Modify prototype of encoder based API
  drm/msm/dp: Allow specifying connector_type per controller
  drm/msm/dp: Allow attaching a drm_panel
  drm/msm/dp: Support up to 3 DP controllers
  dt-bindings: msm/dp: Add SC8180x compatibles
  drm/msm/dp: Add sc8180x DP controllers

 .../bindings/display/msm/dp-controller.yaml   |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  23 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  66 ++++----
 .../gpu/drm/msm/disp/msm_disp_snapshot_util.c |   8 +-
 drivers/gpu/drm/msm/dp/dp_display.c           | 153 ++++++++++--------
 drivers/gpu/drm/msm/dp/dp_display.h           |   2 +
 drivers/gpu/drm/msm/dp/dp_drm.c               |  13 +-
 drivers/gpu/drm/msm/dp/dp_parser.c            |  30 +++-
 drivers/gpu/drm/msm/dp/dp_parser.h            |   3 +-
 drivers/gpu/drm/msm/msm_drv.h                 |   9 +-
 11 files changed, 205 insertions(+), 112 deletions(-)

-- 
2.29.2

