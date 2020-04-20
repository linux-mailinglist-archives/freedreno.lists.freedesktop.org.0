Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC321B0DB0
	for <lists+freedreno@lfdr.de>; Mon, 20 Apr 2020 16:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2A26E58B;
	Mon, 20 Apr 2020 14:03:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E43A6E58B
 for <freedreno@lists.freedesktop.org>; Mon, 20 Apr 2020 14:03:33 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id s63so10601772qke.4
 for <freedreno@lists.freedesktop.org>; Mon, 20 Apr 2020 07:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+uJP02crOew/6piJGjDZZ8ataMcsy0CG2veIisF/EH4=;
 b=QU3kfSgz+g49ClXHVYGl1g2g5tXeevKVVvVbiuNgOJNpfKxaILq+3zV9oj1HJKUJx6
 bvk/ZQfEzwtw2ddw7p8CJ7fDoPhpQDh5jCc5chhh0gP1ao+fParSmxZSqsACdgRUY0d5
 R8l/V9PATbLWUVDoBoeP1BUnJth2amooHUmLm7NPI2XHGrEqLRtcs4kEEVO1WvF3CGVv
 mfaeQLVwODzoRNPM1LVVJrvN8MZi9DolEeUj4NgaKZA6bzS6589wcDBVtswH7Idf3MU7
 ihfDC4bh1oWR+m4CzAycBaQuhfa4oetuYayDEx2Gngh7+WBMFmTYkLmVsYCq18NvETDV
 dY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+uJP02crOew/6piJGjDZZ8ataMcsy0CG2veIisF/EH4=;
 b=eqU2CgXPLGgh+1SF1WS/+ijHKJiC2v031drDhwZle1OQbc+pZ7748UZSFlUQFKDnly
 e5/8WZNA3JvZbmurQKG8A3pndGRJ1HHh1/kjqKE1QvK+hG9yM/nyu/9M/2Ds0L2o7zs5
 gLPuAyTf19zXpG+7anNH5aWG1Jj5NGrUEtcd2PNig7aFzyxxD0Is91yTysYBrf9IBiCO
 kGPoa81+8twI5ZtFmq2OLW0Ec4H4JckZnoIXRDVRfJ+/wfZ35mVBwO3yGqUcPPOdE/M6
 qOeo8kwHMbacSG1NNW2bOsvvBFrfVwzRzoUM9iF86CwaoJepORX5EaxGOxzpb+XNFGfT
 n9UA==
X-Gm-Message-State: AGi0PuYMzy2Mph3G7f0Nha/VGNUiJ4/fyWY5nrI4pzuh4LNxLMJx0ABT
 dmRVCEc9qyXjeM19b1+PV5qxDYRqc1A=
X-Google-Smtp-Source: APiQypKl5HWf/3b0+psYfLnStYw3T+D6Q/UjoS+72OfTNMoMA09UckKkaZoK6Fn8281Kg83LNoesnA==
X-Received: by 2002:a37:5647:: with SMTP id k68mr16894254qkb.33.1587391412345; 
 Mon, 20 Apr 2020 07:03:32 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id t75sm609424qke.127.2020.04.20.07.03.31
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 07:03:31 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Mon, 20 Apr 2020 10:03:04 -0400
Message-Id: <20200420140313.7263-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 0/9] Add support for A640 and A650
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

Jonathan Marek (9):
  drm/msm/adreno: add A640/A650 to gpulist
  Revert "drm/msm/a6xx: Use the DMA API for GMU memory objects"
  drm/msm/a6xx: allow allocating GMU memory with a fixed address
  drm/msm/a6xx: HFI v2 for A640 and A650
  drm/msm/a6xx: A640/A650 GMU firmware path
  drm/msm/a6xx: add support for A650 gmu rscc registers
  drm/msm/a6xx: gmu_pdc register values for A640 and A650
  drm/msm/a6xx: enable GMU log
  drm/msm/a6xx: update a6xx_hw_init for A640 and A650

 drivers/gpu/drm/msm/adreno/a6xx.xml.h      |  14 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 426 +++++++++++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h      |  35 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h  |  48 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  62 ++-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c      | 117 +++++-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h      |  50 ++-
 drivers/gpu/drm/msm/adreno/adreno_device.c |  24 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  10 +
 10 files changed, 672 insertions(+), 116 deletions(-)

-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
