Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E732A998E
	for <lists+freedreno@lfdr.de>; Fri,  6 Nov 2020 17:38:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E7B6E059;
	Fri,  6 Nov 2020 16:38:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8EB6E059
 for <freedreno@lists.freedesktop.org>; Fri,  6 Nov 2020 16:38:38 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id i7so1166837qti.6
 for <freedreno@lists.freedesktop.org>; Fri, 06 Nov 2020 08:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l//k+DSsx34Nc1jx/NivWPrPdB1Y2U4G87NDV4sY8fM=;
 b=J+dH50Ir6c9uH6K2wDO7IcS4bmFe8lOV8q7+I16iVL9sjS3ctqlKrze3+q9Dn3fH/p
 RpMwzXUMrzNbJyPmx+TInGqyYah2NJUHYeomnGj+eemuaR379i/7d8r5X8giuFbGhR7y
 wrM6ajU8PG6oJDbIPQ9ERXxj/66peBmKJWpqMXvriAry6Z3WSgCMRWZe9tfZ3T9X9y9j
 QTQwPL+nomvaHWeZlEFoV04dF9gYsCCXTk8CeYNMv10M/BfwBV6pZXPdNV9t7LDRtRoO
 6lEJFo7vdOQFlmWWaJ8vZA+GtzvCwj4m3nO1x+NSb0nhaMaTJE3zVpMpDnJ4erK0/xQF
 ZzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l//k+DSsx34Nc1jx/NivWPrPdB1Y2U4G87NDV4sY8fM=;
 b=mqmpp8OMWVGYpK61jcaKlT4hDDXFzQdnXYKMrhUzm3YoInckCgnaz9eMgIrMjIGYii
 9Ck1ToMYy26a2qMiYydFe5phF3jsdztGbuMNlAtaHoZwjfJg12RR78nkdub6Y7DOAe6Z
 X+5pD5TmGr7L0WKOEbHnHo4vSIQoFZ4ga9Nag19p+bbxrwQeF8U5/XFGKMnAbnBjdpjg
 /KEhz/uwBtpxuJU7TLDYsQcBVbGyn/7rVtNf668rTxWzkv7aef48gtD8qIKKaN+c3eQy
 3PW5IQqVmp5MqYG1q6R4VE1ymwV+N/ryt85ojB6yj1Y+l8okSuE3FlZE1L3Y9ymZxWdw
 GTSg==
X-Gm-Message-State: AOAM532Br52/ddApOH0hrYJiZ+3GqaagKdeLPecXitWdZlLSKZhWQBcU
 Kzm1PbObRwwLVLc7d/nl23H929QBw6OITKec+RM=
X-Google-Smtp-Source: ABdhPJxHUWgYZ4frcBST4WltJsrhWPJrimgJHKRjTXKm4KGGNoJ82BuMMEXhzlmb3W3E9MA/bng0Qg==
X-Received: by 2002:ac8:5748:: with SMTP id 8mr2284612qtx.114.1604680717401;
 Fri, 06 Nov 2020 08:38:37 -0800 (PST)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id s3sm860000qkj.27.2020.11.06.08.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 08:38:36 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Fri,  6 Nov 2020 11:34:29 -0500
Message-Id: <20201106163437.30836-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 0/5] drm/msm: support for host-cached BOs
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
Cc: Sean Paul <sean@poorly.run>, Rob Clark <robdclark@gmail.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawn.guo@linaro.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This is to support cached and cached-coherent memory types in vulkan.

v2:
 - added patches 2/3 to enable using dma_ops_bypass
 - changed DRM_MSM_GEM_SYNC_CACHE patch to use dma_sync_sg_for_device()
   and dma_sync_sg_for_cpu(), and renamed sync flags.

Not sure I did the right thing with for the dma_ops_bypass part,
this is what I came up with reading the emails.

Jonathan Marek (5):
  drm/msm: add MSM_BO_CACHED_COHERENT
  dma-direct: add dma_direct_bypass() to force direct ops
  drm/msm: call dma_direct_bypass()
  drm/msm: add DRM_MSM_GEM_SYNC_CACHE for non-coherent cache maintenance
  drm/msm: bump up the uapi version

 drivers/gpu/drm/msm/Kconfig                |  1 +
 drivers/gpu/drm/msm/adreno/adreno_device.c |  1 +
 drivers/gpu/drm/msm/msm_drv.c              | 32 +++++++++++++++++++---
 drivers/gpu/drm/msm/msm_drv.h              |  3 ++
 drivers/gpu/drm/msm/msm_gem.c              | 31 +++++++++++++++++++++
 include/linux/dma-direct.h                 |  9 ++++++
 include/uapi/drm/msm_drm.h                 | 25 +++++++++++++++--
 kernel/dma/direct.c                        | 23 ++++++++++++++++
 8 files changed, 118 insertions(+), 7 deletions(-)

-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
