Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CAF36812D
	for <lists+freedreno@lfdr.de>; Thu, 22 Apr 2021 15:08:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F04189BFD;
	Thu, 22 Apr 2021 13:08:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E456689BAF
 for <freedreno@lists.freedesktop.org>; Thu, 22 Apr 2021 13:08:08 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id y4so31857742lfl.10
 for <freedreno@lists.freedesktop.org>; Thu, 22 Apr 2021 06:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wEnNcZ4YZn2akcChwcsrQFitFibcc6kwO8ISCLJGqG0=;
 b=GKtLLcujei8TL1I3EJdhDRWnqyC1FBYBWcEeYtuWY/CqdDctF6P5guWCKpGI7NLQQk
 Oi6pMXUTrllt/6XzrP6Ae0D5Azi3Aa06ZWjwIVx4qcpuCp7Q1cHVtLntk+vkafrFKKPe
 GFvBrtt7Ph1NrBaqU2LNMhFdrCf6cGcbdhonSoc62Q+6uhl3V4ymjQ8YslEGnd1LKpqk
 b2mV8JwSCkfqL7z/SRi/nRfkKZ5VuN4AQtg99qd/vFQqXRwLxv9ks0qVAgeTKBQtvYW+
 ES0Qj5pFOJCNYna8VT0Bw32TF+aRBX0a/LPVH4eOBmof4ir0RqluZrvDjbn8b/w81DSx
 pEpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wEnNcZ4YZn2akcChwcsrQFitFibcc6kwO8ISCLJGqG0=;
 b=ly1UI1T0IV5e3m44/EVWBt0pJgpNOPDKg+1TzIjVE7h+N9zYGSKyaY0lXZ3PVe33A0
 fRAEHCziTpOg9Hpu+kHVgr0RQ8cGRGAIRMLrZAZpWnxO2N9ll3DA7R/wQoeUIQNLOM43
 q985dKndwEEo7KSgBgFPLKmJlaoMbbreJ62SqO2L540qymqIjEvXcpD6XoGeh8S3XI+g
 eTJa2ancf3jJWc2AKdmNJ24HPT/sPFHA26LAb8CrZ0lxQrXhgZ+7oYt8pSkWa4GozarY
 BqE4GMG25Ud5C3RI9HPnPUW9Lj8HRDDjVgd2mj/NzGK2eYcsV+JxuOfNmA1FTbPPGGmB
 Z6/Q==
X-Gm-Message-State: AOAM533FqDank21rGtun5ZxQGiM2SE+kwxW2Be7Y0v6+/P0PtZklfS71
 zlJiyqche/CD9D313DHDlPZPEA==
X-Google-Smtp-Source: ABdhPJzGgQFoznmNTBQ9/rQlpMhfABUJv6A8npxZRm6v0OqaCxsaGafnvy+KlHXAz7IUWqpQf1fRzA==
X-Received: by 2002:a05:6512:3a8c:: with SMTP id
 q12mr2534714lfu.129.1619096887234; 
 Thu, 22 Apr 2021 06:08:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id v17sm259833lfr.35.2021.04.22.06.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 06:08:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Thu, 22 Apr 2021 16:08:01 +0300
Message-Id: <20210422130804.825030-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 0/3] drm/msm/dpu: simplify dpu_hw_blk handling
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

Changes since v1:
 - Make dpu_hw_blk an empty structure
 - Split this into separate patchset

----------------------------------------------------------------
Dmitry Baryshkov (3):
      drm/msm/dpu: remove unused dpu_hw_blk features
      drm/msm/dpu: drop dpu_hw_blk_destroy function
      drm/msm/dpu: hw_blk: make dpu_hw_blk empty opaque structure

 drivers/gpu/drm/msm/Makefile                    |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c      | 139 ------------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h      |  22 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c      |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c     |   7 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c     |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c       |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c  |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c     |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c      |   6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c          |   2 +-
 12 files changed, 2 insertions(+), 211 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c


_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
