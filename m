Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCACD1B337B
	for <lists+freedreno@lfdr.de>; Wed, 22 Apr 2020 01:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BBAD892A5;
	Tue, 21 Apr 2020 23:41:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE05892A5
 for <freedreno@lists.freedesktop.org>; Tue, 21 Apr 2020 23:41:43 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id k12so273692qtm.4
 for <freedreno@lists.freedesktop.org>; Tue, 21 Apr 2020 16:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r6qbLBM8oG9i4c7OukpPxqjAyziSPwrNEFmnyet3u1U=;
 b=DWDUzkxKXrNNdv6lM9hE0T72H8bem5wpEuYJzKaYnTednWCRfdfnfZ9i5q4AIWeFdj
 ThZNlXcILZ9+VnhTfWXSWrm+cbAnEsbTXdrtK1H0aMwus82yCdBa/9/QbqRMjmHfr+e2
 xKFkQLTnPxs8qhLq06N/QYp5fNtsKK9la7jH7daoBHlgcgGKJ78CuACTz1Ps3ObmpT1+
 hdogpzwWduGuqH2Vf1zTJE1wkii09g/15WOUT3sBX7IIwBTBw0XzK4tm7fw2jdIj+cN3
 c+l4onYo8pgLYTeQjOD1FL8HjKG9KxgrwigAd+k7bKSmDlqKxGCRdHc8iBwr6Ug0Eker
 AzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r6qbLBM8oG9i4c7OukpPxqjAyziSPwrNEFmnyet3u1U=;
 b=qGUaEzLwEnywdjJ2iOGocfWSQYrj+JVt02Q6Xrt2ooifFGRlyVn5DN+jkGExn34iQw
 YICXAv5LeohTBSd9UPAcXbH1bzfPezRiwV1BB4D8bAq4X8cgvEjMu2RMlzmOAohSy2T3
 zwVOGLh41t0sGXLIa9V9lev2eyHK3nd6N3wCLUzQOL/8kHcDH3dbARH6EsN0+HVq+9t/
 th5Raq4brXmjJKKoErYb0VR1CS15WOo6U0Er8lDBaNBJ+1xY9b9mG2frchXJQPHoLLvy
 A4lvW4tOdBDYSIJa+ZnyE7lrgeWmDuqn96KliYrCCiG2QX1iBUXxjztR15EXcI3NeHxG
 ajrQ==
X-Gm-Message-State: AGi0PubwkwK6BpsmeyDRmtbs7RBiR5qfGBEDD77JHApVQXTGli9thU+X
 e52y7qEHQoys3ItoxPhGS6DRu8Nt8F0=
X-Google-Smtp-Source: APiQypK5pXwu7DxhCY3tlw0l3B1OxzarKE5MhCWuzfR4ZMyJ3f5+4AD4f1zRrLYRy+xMAuF0+Xd9oQ==
X-Received: by 2002:ac8:70d:: with SMTP id g13mr3950166qth.91.1587512502716;
 Tue, 21 Apr 2020 16:41:42 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id y17sm2664010qky.33.2020.04.21.16.41.42
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 16:41:42 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Tue, 21 Apr 2020 19:41:18 -0400
Message-Id: <20200421234127.27965-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 0/9] Add support for A640 and A650
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This series adds support for A640 and A650 GPUs.

Missing bus scaling, hwcg, and UBWC config, but GPU works without those.

Changes in V2:
Use msm_gem for allocations (first 3 patches are new)
Squashed pdc/rscc patches together
Removed unnecessary "WARN_ON"s in "HFI v2 for A640 and A650"

Jonathan Marek (9):
  drm/msm: add msm_gem_get_and_pin_iova_range
  drm/msm: add internal MSM_BO_MAP_PRIV flag
  drm/msm/a6xx: use msm_gem for GMU memory objects
  drm/msm/a6xx: add A640/A650 to gpulist
  drm/msm/a6xx: HFI v2 for A640 and A650
  drm/msm/a6xx: A640/A650 GMU firmware path
  drm/msm/a6xx: update pdc/rscc GMU registers for A640/A650
  drm/msm/a6xx: enable GMU log
  drm/msm/a6xx: update a6xx_hw_init for A640 and A650

 drivers/gpu/drm/msm/adreno/a6xx.xml.h      |  14 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 409 ++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h      |  38 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h  |  48 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  62 +++-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c      | 123 ++++++-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h      |  50 ++-
 drivers/gpu/drm/msm/adreno/adreno_device.c |  24 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  10 +
 drivers/gpu/drm/msm/msm_drv.h              |   6 +-
 drivers/gpu/drm/msm/msm_gem.c              |  31 +-
 drivers/gpu/drm/msm/msm_gem.h              |   1 +
 drivers/gpu/drm/msm/msm_gem_vma.c          |   6 +-
 14 files changed, 675 insertions(+), 149 deletions(-)

-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
