Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF20F4E89FE
	for <lists+freedreno@lfdr.de>; Sun, 27 Mar 2022 22:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E57510E253;
	Sun, 27 Mar 2022 20:26:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D8110E253
 for <freedreno@lists.freedesktop.org>; Sun, 27 Mar 2022 20:26:52 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id t7so10788065qta.10
 for <freedreno@lists.freedesktop.org>; Sun, 27 Mar 2022 13:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j8UVxZLedNpHTbRo7IKHmaBenq+x1GF8T/vpr9/COFw=;
 b=5Xj7QIclTvrgSeXF+IP/WwaPT8yZo0PxRfFAqiZqBjcDNtnjxD0mek5rMxQ0apA6Ul
 bafTXYVSqEDNG8kf1iYuAnOUjXb5qi2oCFDcQE/5uYNK3bZkTgoe0DBepeCXES+YaFHy
 uUSODGqLQGtJQtv5VugwkPgpPVJ7vryhokzOW0Afh5lkxrKh1Fk1xd1uMpw2hyQsccHV
 eJjs0ODSNWhsUCnemc7fZSNqvkCppoEijTCKRkwvwUGlle+EBscLvzxCwIDwQdd1VU4r
 LrHixLpHdso5hm3MW7ETrDT5zUdsZDTsY3q8DSKWsqAUZsobp3QQEeZ78PpeI3s2YU5G
 2c9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j8UVxZLedNpHTbRo7IKHmaBenq+x1GF8T/vpr9/COFw=;
 b=PQsBEocod4fX2sG032szVARCsrRGjqnXdgzWx6uQJ2rEmjt8lxK6GuiCft6sGo7+vo
 wXtnlsaABEsx65FbFcJMN/0lBQW/wa4q3py3efvuJ/aDyyuvCdPoQRRst42Hbp4idRoI
 AmP999imce84vNcngXSePG1xWakdqheuEEhFNpLP0yIswzwEqg1YhCs5FYg/trTuHdeD
 X63guXJPNfSAagi5aqxPE9b8TuWcSPntRfYvoh5BbU4vlblH4KZb322OBTBPiyf+b5L7
 bezrqFHGob2ECaDGWBzI2bP2KJ2u3tzAB+eSHAKQJmblo0WWZJA30VT5lPiwne7T8Rri
 OAbg==
X-Gm-Message-State: AOAM531mbklBSJYZA0XFUyVIb4swt14Scq1LcW6MU/6PE+atNKhJcJLe
 Si4Yjs1MLWUYDLqcLrziL9GFFVc2MnSfJUmB
X-Google-Smtp-Source: ABdhPJwjikefcEW6EE3MzZqkcTWwsp93SdKPjKGmaMKv4cGZBM3L1ZE4fkjaC0trhlqVgv+ImjZTsQ==
X-Received: by 2002:ac8:5e10:0:b0:2e1:cdc7:a73 with SMTP id
 h16-20020ac85e10000000b002e1cdc70a73mr19139444qtx.72.1648412811092; 
 Sun, 27 Mar 2022 13:26:51 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable134.222-177-173.mc.videotron.ca. [173.177.222.134])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a05620a108900b0067b13036bd5sm6720386qkk.52.2022.03.27.13.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 13:26:50 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Sun, 27 Mar 2022 16:25:53 -0400
Message-Id: <20220327202643.4053-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/4] drm/msm/adreno: add support for a730
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
 open list <linux-kernel@vger.kernel.org>, Emma Anholt <emma@anholt.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Yangtao Li <tiny.windzz@gmail.com>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Based on a6xx_gpu.c, stripped down and updated for a7xx based on the
downstream driver. Implements the minimum to be able to submit commands to
the GPU and use it for userspace driver development. Notably this doesn't
implement support for the GMU (this means that the clock driver needs to
support the GPU core clock and turning on the GX rail, which is normally
offloaded to the GMU).

Register updates: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15602

Jonathan Marek (4):
  drm/msm/adreno: move a6xx CP_PROTECT macros to common code
  drm/msm/adreno: use a single register offset for
    gpu_read64/gpu_write64
  drm/msm/adreno: update headers
  drm/msm/adreno: add support for a730

 drivers/gpu/drm/msm/Makefile                |   1 +
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c       |   3 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |  27 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |   4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  25 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |  17 -
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |   3 +-
 drivers/gpu/drm/msm/adreno/a7xx.xml.h       | 666 +++++++++++++++++
 drivers/gpu/drm/msm/adreno/a7xx_gpu.c       | 777 ++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a7xx_gpu.h       |  26 +
 drivers/gpu/drm/msm/adreno/adreno_device.c  |  12 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     |   9 +-
 drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h |  45 +-
 drivers/gpu/drm/msm/msm_gpu.h               |  12 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h        |   1 +
 15 files changed, 1550 insertions(+), 78 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/adreno/a7xx.xml.h
 create mode 100644 drivers/gpu/drm/msm/adreno/a7xx_gpu.c
 create mode 100644 drivers/gpu/drm/msm/adreno/a7xx_gpu.h

-- 
2.26.1

