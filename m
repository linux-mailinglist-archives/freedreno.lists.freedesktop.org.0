Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 485CE677A4C
	for <lists+freedreno@lfdr.de>; Mon, 23 Jan 2023 12:43:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028A710E343;
	Mon, 23 Jan 2023 11:43:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5319F10E343
 for <freedreno@lists.freedesktop.org>; Mon, 23 Jan 2023 11:43:35 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id j17so17758426lfr.3
 for <freedreno@lists.freedesktop.org>; Mon, 23 Jan 2023 03:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3GbB6wB3Q7kYbqCkCi0LuDb6K9XdAWnbZhVdbeXyVKw=;
 b=euUzDyh77XbjLBxvqYV4/STjHROSfHetTRnJl6xQpyjofmEVFqmsXAnLEcoUrVfLDm
 i/V7Wb+c0hIk7vH/JrY4qrniyRVXcaJRnuqL5HSuLWrmuhgHEdNXN1pzLhz1697fZH2y
 JMBCIkICk2emJqy1zpIbTr6+I/+RGd/UoZDCXGIgLJdo0tFWInO9aEFwMRGWmu5ZS7E3
 lnBegGLjmsBzC6AvRL2pwp8870OxRkQnFx5XE8I6Jn2bkaMV6t/0uBGK9L+9stWvGDsB
 UmBfOmWQaJZ47V7fdMP00VJzmCI7rZvndeMY0RZWch1xWxRsqjtLjgLpNAcZMoG2bQv5
 5mMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3GbB6wB3Q7kYbqCkCi0LuDb6K9XdAWnbZhVdbeXyVKw=;
 b=0OXBDcC8vpvqJJjSLU8qa8DhUu6xhOMM48a+TvPrZMHbb2ATekTE5TllZdumzqCT/6
 rsVmktBUdoHAp6ZMktOGp25eytproCpq1gQf6ESzjzZSWsWMHtPZ46/llPQ7lvNQH6wD
 rN5TYQssFcxtO64GkaEpkvgImsJyVbLhqTT3CmQVhoWpejdPB0Xl4DZlVt2/3jT2NwuS
 wfPcD1Cz1jgjzTw49NtLJdUMYd/ZfSazvtNb/uVHXBYOwMRHRCkyNjs3I+qkCORE6VUe
 5eqiX7tosOVg+OIZUZ2KOvYv9s95dUnG15flruX21wmfqAfkOjgEwoKnPyMl4WSQX8iM
 3MSw==
X-Gm-Message-State: AFqh2kokdTUBczwMCrfcRVpnCm4kkCeeHLqIWm08dmbBMjp06toFm0Gf
 Zqewi/Dq/r8wStCRS8Sh29P9xw==
X-Google-Smtp-Source: AMrXdXt+0r8BYLVG7JENVbPsZqidMl+MIQYJ9mrgyx+qGH9pEhcZ4Zm4dc/MFxu6ucdI3dnRbK4Hiw==
X-Received: by 2002:a05:6512:3d9e:b0:4b4:ad67:ea97 with SMTP id
 k30-20020a0565123d9e00b004b4ad67ea97mr7983566lfv.57.1674474213570; 
 Mon, 23 Jan 2023 03:43:33 -0800 (PST)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 b40-20020a0565120ba800b004cc7acfbd2bsm136816lfv.287.2023.01.23.03.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 03:43:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 23 Jan 2023 13:43:32 +0200
Message-Id: <20230123114332.3096562-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PULL] drm/msm/dpu: rework DPU HW catalog
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This is my current attempt to restructure DPU HW catalog. As it depends heavily
on all small cleanup patches that I've sent lately, I decided to send it this
way (while it's still an RFC). This way if one wants to give such restructure a
try, he doesn't have to pick up individual fixup patches from the list. If the
overall idea is found to be acceptable, I'll send it properly once the
dependencies are cleared up from the queue.

There are several items to be sourted out. I'm pretty sure that some of entries
are not correct/optimal. Any help with these items would be appreciated. It
will speed up the work (please synchronize with me before picking either of
them).

- QSEEDv3 lite vs QSEEDv4. I started looking at this at some point, but I think
  never finished it.
- LUT tables. All sorts of issues here.
- DSPP versions. We do not used them now, but it might be vise to fix them now,
  while we are sorting things out
- Reg DMA. Also not used currently. I think we should either drop it, or put it
  to use. Otherwise it's too easy to get it wrong. For example, I see that
  vendor kernels have two reg-dma instances since sm8350, while we use only one
  of them. And moreover different platforms ended up describing different
  instances.
- ACTIVE_CTL vs SPLIT_DISPLAY.
- Other small items, which include irq masks, etc.

I think this should go together with the INTF_TE rework. I can rebase my work
on top of that series, or we can do it other way, but my feeling is that
further cleanup of PP and INTF configuration should be performed only after
both series are landed.

Regarding 'base' files. I have attempted to separate common headers where it is
feasible and logical. All the comments in this area are appreciated.

Regarding UBWC configuration. I have moved it to a separate structure, which is
still a part of the catalog. My itent is to land both series and then to make
DPU request this data from the MDSS driver. See [1], [2].

[1] https://patchwork.freedesktop.org/series/111751/
[2] https://patchwork.freedesktop.org/series/113208/

The following changes since commit cd987f97938b92811b2cedeaa85c2b04d5cbc32a:

  Merge branches 'msm-next-lumag-core', 'msm-next-lumag-dpu', 'msm-next-lumag-dp', 'msm-next-lumag-dsi', 'msm-next-lumag-hdmi', 'msm-next-lumag-mdp5' and 'msm-next-lumag-mdp4' into msm-next-lumag (2023-01-21 12:23:35 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/lumag/msm.git dpu-rework-2

for you to fetch changes up to c41c1f3dfd1d39385f3bafeed7208a796ed9889e:

  drm/msm/dpu: move blocks common to sm8450 and sc8280xp to common header (2023-01-23 10:33:19 +0200)

----------------------------------------------------------------
Dmitry Baryshkov (29):
      drm/msm/dpu: fix clocks settings for msm8998 SSPP blocks
      drm/msm/dpu: don't use DPU_CLK_CTRL_CURSORn for DMA SSPP clocks
      drm/msm/dpu: constify DSC data structures
      drm/msm/dpu: mark remaining pp data as const
      drm/msm/dpu: handle UBWC 1.0 in dpu_hw_sspp_setup_format
      drm/msm/dpu: correct the UBWC version on sm6115
      drm/msm/dpu: sc7180: add missing WB2 clock control
      drm/msm/dpu: drop stale comment from struct dpu_mdp_cfg doc
      drm/msm/dpu: disable features unsupported by QCM2290
      drm/msm/dpu: add missing ubwc_swizzle setting to catalog
      drm/msm/dpu: move UBWC/memory configuration to separate struct
      drm/msm/dpu: fix sm8450 CTL configuration
      drm/msm/dpu: split SM8550 HW catalog entry
      drm/msm/dpu: split SM8450 HW catalog entry
      drm/msm/dpu: split SC8280XP HW catalog entry
      drm/msm/dpu: split SC7280 HW catalog entry
      drm/msm/dpu: split SM8350 HW catalog entry
      drm/msm/dpu: split SM6116 and QCM2290 HW catalog entries
      drm/msm/dpu: split SC7180 HW catalog entry
      drm/msm/dpu: split SM8250 HW catalog entry
      drm/msm/dpu: split SC8180X HW catalog entry
      drm/msm/dpu: split SM8150 HW catalog entry
      drm/msm/dpu: copy sdm845_pp as msm8998_pp
      drm/msm/dpu: split SDM845 HW catalog entry
      drm/msm/dpu: split MSM8998 HW catalog entry
      drm/msm/dpu: remove dependency from sm8150 on the sdm845 data
      drm/msm/dpu: move blocks common to sm8150 and sc8180x to common header
      drm/msm/dpu: enable DSPP_2/_3 to be used for LM_2/_3
      drm/msm/dpu: move blocks common to sm8450 and sc8280xp to common header

 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  205 ++
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  204 ++
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |   83 +
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150_base.h    |  160 ++
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |   80 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  132 ++
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  149 ++
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |   89 +
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |   77 +
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290_base.h   |   51 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  176 ++
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  150 ++
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  150 ++
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp_base.h  |   50 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  166 ++
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  179 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 2007 +-------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   24 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |    4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |    4 +-
 21 files changed, 2158 insertions(+), 2002 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150_base.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290_base.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp_base.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
