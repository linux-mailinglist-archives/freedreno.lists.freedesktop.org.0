Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE7C147525
	for <lists+freedreno@lfdr.de>; Fri, 24 Jan 2020 00:59:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015016E18F;
	Thu, 23 Jan 2020 23:59:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-xc64.google.com (mail-yw1-xc64.google.com
 [IPv6:2607:f8b0:4864:20::c64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA9A86E195
 for <freedreno@lists.freedesktop.org>; Thu, 23 Jan 2020 23:59:35 +0000 (UTC)
Received: by mail-yw1-xc64.google.com with SMTP id d7so47725ywl.12
 for <freedreno@lists.freedesktop.org>; Thu, 23 Jan 2020 15:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brkho-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xrSo2+pGduAw292a0r+TdBhJS9mLgXGxwVlVbyCbpLg=;
 b=D7OYHpFLgk97teU0zZSRPPccfqMZUapF8TpobPPhIx/gWfpISr+LuVI6MDdnJDhbs4
 apMzxOnEd3+jzgIMs070Vk+xjc6o+5gb0ZBitQOL2ahu20wsHITfv4+aW8aRmiJmh1wc
 X8RIjb4s+cPG5CghTJHdXKgkuR5GSh1hrb9/twhckyMLrxupMtCJ0/9IkEIn6l0I3xXc
 LSx1unKEneXQbbOETIQOHpnbCvX+y5yyKBvVoAvwQbe/AxUJ/cnuLNMKDF1FklNC3hsf
 zYj6M9WePrwvnY+mhcncUZYDXnAXRSxHgb7XVYlLn3kGv7uWwXRruiT8Y0GO4JFyzjUv
 1QVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xrSo2+pGduAw292a0r+TdBhJS9mLgXGxwVlVbyCbpLg=;
 b=XcKfEMOB1NjrZ4WSX/bvdUpPNPevrePHPx2G3vKVluQNtla/hSoylPSIoJO4f++5qB
 TpfiKxguGfu3u4wEUHPIOypF5oOj+jm1rPVw+o0MVElH8LnSqKiraVlOz1A9Gem3/jvy
 jKbo01bfbPUYShRxoK5u2fEzj2HjhKd7Wrt/04Lq8tJ9+2v1CfeQmkSpZViZxR5jsaXx
 mK9UHNkMetM5UsYv+W2o3D/2BnPM0/cn4PNNMq6IgiV6xEQfc75eombjIfgXvhDIJH5W
 3mDTZNodPAbMBf+o02iF6mRLa3x0bS0zwBSDhIlZqu/lgDudTcnEdZ9buwvghqZ3lhO9
 qojg==
X-Gm-Message-State: APjAAAUKbX13lXzfd9OZJWTotGXIT+Zsk1Fgkevw5Uaz+7iT/cYkS96X
 Xdg6mG4HQ8b5RWRpaiLMTkyyrwOrbV3fgPKmDYmbTeiDbTftFQ==
X-Google-Smtp-Source: APXvYqyitskCyEXAQcqS53IPFPyVLU9xyT5Uc39138IvOAogcA8kZveFb67zLpleAblvQ8kXm3+zAJJzhtKV
X-Received: by 2002:a81:9c14:: with SMTP id m20mr163298ywa.143.1579823974817; 
 Thu, 23 Jan 2020 15:59:34 -0800 (PST)
Received: from hob1.nyc.corp.google.com ([100.118.32.120])
 by smtp-relay.gmail.com with ESMTPS id i82sm591239ywg.11.2020.01.23.15.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2020 15:59:34 -0800 (PST)
X-Relaying-Domain: brkho.com
From: Brian Ho <brian@brkho.com>
To: freedreno@lists.freedesktop.org
Date: Thu, 23 Jan 2020 18:57:36 -0500
Message-Id: <20200123235738.48182-1-brian@brkho.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v3 0/2] drm/msm: Add the MSM_WAIT_IOVA ioctl
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
Cc: robdclark@chromium.org, Brian Ho <brian@brkho.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 hoegsberg@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This patch set implements the MSM_WAIT_IOVA ioctl which lets
userspace sleep until the value at a given iova reaches a certain
condition. This is needed in turnip to implement the
VK_QUERY_RESULT_WAIT_BIT flag for vkGetQueryPoolResults.

First, we add a GPU-wide wait queue that is signaled on all IRQs.
We can then wait on this wait queue inside MSM_WAIT_IOVA until the
condition is met.

The corresponding merge request in mesa can be found at:
https://gitlab.freedesktop.org/mesa/mesa/merge_requests/3279

Changes in v2:
    * Updated cleanup logic on error
    * Added a mask
    * 32 bit values by default

Changes in v3:
    * Fixed a bug where the mask was being applied incorrectly

Brian Ho (2):
  drm/msm: Add a GPU-wide wait queue
  drm/msm: Add MSM_WAIT_IOVA ioctl

 drivers/gpu/drm/msm/msm_drv.c | 61 +++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_gpu.c |  4 +++
 drivers/gpu/drm/msm/msm_gpu.h |  3 ++
 include/uapi/drm/msm_drm.h    | 14 ++++++++
 4 files changed, 80 insertions(+), 2 deletions(-)

-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
