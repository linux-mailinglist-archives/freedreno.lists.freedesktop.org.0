Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 681EB20E997
	for <lists+freedreno@lfdr.de>; Tue, 30 Jun 2020 01:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF8489CB9;
	Mon, 29 Jun 2020 23:49:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B21589D2F
 for <freedreno@lists.freedesktop.org>; Mon, 29 Jun 2020 23:49:24 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id m8so4296944qvk.7
 for <freedreno@lists.freedesktop.org>; Mon, 29 Jun 2020 16:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kuWeoCHuc/prOGvBHvvx+Eyg6Z2nKOC6TsX81jgFqt4=;
 b=aak1v9uve4kyxwvd+x7Df+Wf6cXWmrmolKMAuKVWTghvCHOXv6e4A10ENI3HjVU0bP
 fdE32jJE9unnlHaqKcU1ukM5EDT5GxPEeE2Nu3XiiSlZfSZ7z+BPihLMAPzz4dvsC8Xs
 vYFOTsLonPjpRIBTdDDoAomMyt6GdC88yGQ+NnVK9UmVc3lr1WLljWoBoa/HFFeD9EFR
 PCZkK4UGPuPfstmsQnXvzjo9mF3J+cgKol/v0YghliTA8MZmdmeQZEss0NqM8FuPYf9Y
 vZBk10824u4vmj/sT7jLgKWasVPSVO3s7a4OdN7GUipsNh8XGS6nEEVRxzSsEfZ7CnAW
 qcUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kuWeoCHuc/prOGvBHvvx+Eyg6Z2nKOC6TsX81jgFqt4=;
 b=ptEcID/TL60m7l5Y1peV1kW0KiNqEQPSvsyRV7Q1Wnb02bPNPOaCN52zbMn9N1ze3n
 MzXvZWj20lWpSlZw0tzPhPRXx+kYdUuyI9jW56xzNXl7HFstNrFopMolk2PiOkhw2IAo
 RCwd0dCNVMSltmd4K9I+qOevDslu3+Vj5gD/c2plPLShiGMA7L9JudUlwMxqfNsD7psw
 RW0ixOb/7s4PMtAZuG3p0jXntZUTOzpxaZoUmLxIX02Q1i2CjDSjlDi6Fuv2BlC0BQld
 CT6UPg0QIRwCyznSxj7I+mz25u5JMJXG1scjVX6B6KGVlw9YWqurnNkLC+7Fr++y+d1e
 SNXg==
X-Gm-Message-State: AOAM530vXtXLfkmEOrlanlle262lxrrnJlLhXa7v6t162nay149Cj8PC
 wR9VcQMgAvkiE7v/4Yfy5Jr8yi0vkwG29Q==
X-Google-Smtp-Source: ABdhPJyJ2d0tCp5izifxJz64EqQHHdsaCCZq5JobW3wQx1DkNT/z73gSlzRnTXVU5Cqq6pptF4ym9w==
X-Received: by 2002:a0c:f788:: with SMTP id s8mr17077923qvn.169.1593474563286; 
 Mon, 29 Jun 2020 16:49:23 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id n64sm1541076qke.77.2020.06.29.16.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 16:49:22 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Mon, 29 Jun 2020 19:49:12 -0400
Message-Id: <20200629234921.3511-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 0/2] drm/msm/a6xx: add A640/A650 hwcg
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
Cc: Rob Clark <robdclark@gmail.com>, Shawn Guo <shawn.guo@linaro.org>,
 Wambui Karuga <wambui.karugax@gmail.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Eric Anholt <eric@anholt.net>,
 Jordan Crouse <jcrouse@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Initialize hardware clock-gating registers on A640 and A650 GPUs.

I put the hwcg tables in adreno_device.c, but maybe it makes more
sense to keep them in a6xx_gpu.c? (this would allow switching a5xx
to use the gpulist too.. it isn't possible to include both a6xx.xml.h
and a5xx.xml.h in adreno_device.c)

Jonathan Marek (2):
  drm/msm/a6xx: hwcg tables in gpulist
  drm/msm/a6xx: add A640/A650 hwcg

 drivers/gpu/drm/msm/adreno/a6xx.xml.h      |   8 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 140 ++-----------
 drivers/gpu/drm/msm/adreno/adreno_device.c | 219 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   7 +
 4 files changed, 251 insertions(+), 123 deletions(-)

-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
