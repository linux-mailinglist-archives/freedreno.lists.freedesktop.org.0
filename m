Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A17D7C6236
	for <lists+freedreno@lfdr.de>; Thu, 12 Oct 2023 03:29:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F53E10E3BB;
	Thu, 12 Oct 2023 01:29:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FEB010E20F
 for <freedreno@lists.freedesktop.org>; Thu, 12 Oct 2023 01:29:12 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5041cc983f9so598354e87.3
 for <freedreno@lists.freedesktop.org>; Wed, 11 Oct 2023 18:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697074151; x=1697678951; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1LZ/fmrZeDBE6BtfmuHqkriwEyl/J2HH4t6ZgQ8OUD4=;
 b=QhONWUs42N213lP42JA1mz8DhQg7RYZByAKmMe92pugKmrPsyL4UIngL+YI8Eh2MW4
 lVkfzLqIQTrCxw8QpYGL4p45rkzq2Q1e1+s+R6tNnoKT4yDcMQRgG+dIVqYTSFcAWqQe
 exPynZHTf5rHK44gXglez17m1tLWVeIP2IVlHQ4ggGXTOun5Bdzog1rk6SUmh8KFtXFO
 ZFiH53SJy4nkA50jrRVuuHxmStMaujs7LCi8lHMwy6q571rHflifLqcYtG8c2SYURKsQ
 oPAqU6j5zamGedM1hiFlBsfuJQwR9qCBT7K4Nih6IjMMwuM8i1rwQ9BE/slVuhu5g70b
 BLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697074151; x=1697678951;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1LZ/fmrZeDBE6BtfmuHqkriwEyl/J2HH4t6ZgQ8OUD4=;
 b=DsfiNLhQOikAqy3A9WpHMIMgOGJqA/Cx/V+8S6q5PXxDOOz1g7CRYlby5WgjAFbDb/
 USGVmq2bjycv1vot65ayccBLXnnwU7t5WJr+9+DNaNnbXzQMCNgJ9ZJn1wkqMBp7m9qH
 R4jRY/fmoZqMW6dXqOHR4fM7ji44wmwN4CxymveduVqTIEo2yzgj4BYJumIA6UvVdQwO
 S57UKJ6aInmxErpT2T3LrIzYcXOJSJwPceXc6CZPLhbdS+CnC6WpJzHDq7Q8OUoY+FHg
 0rFCLBe4Vgmn77vvuRwVagaleN5vtHR20A6PY0mvylAgbiQMnQkOL7lTp1h/4UCSVZzB
 rf+A==
X-Gm-Message-State: AOJu0Yw6uAJFPbQAnxnJ+vrAXCybn0tweC4krnw0fXX9wgRd3uOfcvRi
 BpHPeVWHv/tmxf4/qIqQwZhLqg==
X-Google-Smtp-Source: AGHT+IGIhydsigk/7G8XsFp+TM/XUj2EU2zE5Yu3YD+5mM3M3/pAT5rjdqpKvpH16nV+s3xX+P+7Gw==
X-Received: by 2002:a05:6512:220b:b0:500:a66b:b189 with SMTP id
 h11-20020a056512220b00b00500a66bb189mr23826766lfu.51.1697074150778; 
 Wed, 11 Oct 2023 18:29:10 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 k10-20020ac2456a000000b004fe3a8a9a0bsm2526588lfm.202.2023.10.11.18.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 18:29:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu, 12 Oct 2023 04:29:07 +0300
Message-Id: <20231012012909.450501-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 0/2] drm/msm/dsi: fix handling of TX DMA
 buffer
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
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Fix two issues in how the MSM DSI driver handles the GEM-allocated TX
DMA buffer object.

Changes since v1:
- Dropped the unused 'priv' variable from msm_dsi_tx_buf_free()

Dmitry Baryshkov (2):
  drm/msm/dsi: use msm_gem_kernel_put to free TX buffer
  drm/msm/dsi: free TX buffer in unbind

 drivers/gpu/drm/msm/dsi/dsi.c      |  1 +
 drivers/gpu/drm/msm/dsi/dsi.h      |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c | 16 +++++++++-------
 3 files changed, 11 insertions(+), 7 deletions(-)

-- 
2.39.2

