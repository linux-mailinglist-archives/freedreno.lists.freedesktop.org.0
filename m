Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A8A381AAD
	for <lists+freedreno@lfdr.de>; Sat, 15 May 2021 21:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E896E435;
	Sat, 15 May 2021 19:09:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3CE6E436
 for <freedreno@lists.freedesktop.org>; Sat, 15 May 2021 19:09:13 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id o8so2448673ljp.0
 for <freedreno@lists.freedesktop.org>; Sat, 15 May 2021 12:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rgptk4zfD1UjWZRJ8uUQEHx7TiTyQTE7H5OVd2DkG60=;
 b=DZXPnV+7cp07USVBDxPNsQSDAQcbXeBtFnPiPmtUs1FVNFiHZnmE5BeJ56MzPKKnEP
 huncXXEHdg8do/0+MFTrbjriceN7dGGRsz5RxFIXRhR/EEWBQ3vZD7WWTFePnlfYoAye
 BEENqjHKMN9OFrPfiElWHJg/OyH4o6JVyaz8y5s6FLwbBD8bALvqNCVmN/3al0iMEPEy
 6zsERYljx+CzrXhof3tHymxtgtkHHGijnfhnfnGJURTD7xM0AXzJL2+95fFdLzZAMseH
 6cH3E2S9Ly/Rz5KXipy4LHBjmZ8rXZJbZBI9vf98xgG1RfAg1xWhZdxcVi4o/LRDT5Qi
 vqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rgptk4zfD1UjWZRJ8uUQEHx7TiTyQTE7H5OVd2DkG60=;
 b=cLhce8lTVaXID9kV7AgQZst5UJBUgXfXU2V9YjDDA7ASWhKTwpJQUryiZ2H7LNf4Bk
 34kryCefWT98AtjfDGEczgV2ZDTSeAGEMHqMsWQvBxyeTD0N1gcQrUqTia9iRlAaK7za
 hT+28qLszA4kSYPM6DDMQW6BqLbBsaVNLp+eRT9Tkbl/GzopC2LXPkm6IOA6ajwWCRKk
 A5QiJ8hkMkUA2wcDIPpVp2Ml0nMDO5LLYygSL1n1hwu8/Zsy8CP0wAix3TNUFiQe/Uei
 +pQDEiDrvGx6PL057qaV23nzSvRw1OIxfO1NiLWKcsQfCb0kE+Hkbvmdr87FxAfgeVj/
 PZuQ==
X-Gm-Message-State: AOAM530JrlZXrmStd/Tr0dpMyTeYkzIqF8lneLYlOCXiSG8CZfNBPqcB
 fsFP3Fu0kkhmpGXpdac9pLsUaA==
X-Google-Smtp-Source: ABdhPJybhGBkhSOoLMmdl7jWqtaX8sVUhBq8jWadgwVD3YoqKGaWEzdFMqUSyALcHXXzI2e/3vBThQ==
X-Received: by 2002:a2e:8041:: with SMTP id p1mr19801831ljg.213.1621105751654; 
 Sat, 15 May 2021 12:09:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id t15sm2184107ljk.99.2021.05.15.12.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 12:09:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Sat, 15 May 2021 22:09:05 +0300
Message-Id: <20210515190909.1809050-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v3 0/3] drm/msm/dpu: simplify dpu_hw_blk handling
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Drop most of "extra" features of dpu_hw_blk.

Changes since v2:
 - Include a patch to fix compilation issue with merge3d id handling

Changes since v1:
 - Make dpu_hw_blk an empty structure
 - Split this into separate patchset

----------------------------------------------------------------
Dmitry Baryshkov (4):
      drm/msm/dpu: remove unused dpu_hw_blk features
      drm/msm/dpu: drop dpu_hw_blk_destroy function
      drm/msm/dpu: use struct dpu_hw_merge_3d in dpu_hw_pingpong
      drm/msm/dpu: hw_blk: make dpu_hw_blk empty opaque structure

 drivers/gpu/drm/msm/Makefile                       |   1 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c         | 139 ---------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h         |  22 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |   7 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c     |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   4 +-
 14 files changed, 10 insertions(+), 220 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c


_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
