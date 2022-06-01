Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 394A453AAC4
	for <lists+freedreno@lfdr.de>; Wed,  1 Jun 2022 18:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0BD10EED1;
	Wed,  1 Jun 2022 16:13:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A4F10EECB
 for <freedreno@lists.freedesktop.org>; Wed,  1 Jun 2022 16:13:53 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id z13so2523450ljn.11
 for <freedreno@lists.freedesktop.org>; Wed, 01 Jun 2022 09:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j9xbAye+km4e1PFapdp7FfBArJEJLR0pC6Qj/2+Uu54=;
 b=P7c8bft7rzjQmuIK3eBPro9p+e63zwRCElPjHnhF9iB7WH41V0omjYi3+HJMoY3xoR
 MOrT3j2gYj2ueX/pl397yjMwen+IKdat+8lI3MMBAp+bJPvuxVorswttzrWQQpnd5Y1F
 X3E/jdWGJyTvQNwYgrncj38RZ/Qa90YlnpQGVedR70DXYU3OiSRDyOEywl1gLf27NDuM
 8W7b5S9JHUhnZOdpP8rd4tdMyXJzawK6DrUVP5wQgSJT4YX/q4fRsxMJznhS7wUxtzho
 N4WTuu8/6hBS/AdEXefMcSm23fML1u8BAVKT6Jqdw3vPc0L1UyYVsWiwrH62TpSa+OCt
 /B4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j9xbAye+km4e1PFapdp7FfBArJEJLR0pC6Qj/2+Uu54=;
 b=IyifMpAfEuZwEnPsUBwmVcRT6v/9qJ7CQB5pjgsY2rq8QSu97+KPyV2oquOHCCTV3Q
 B2na3MWJmU2DhXsWd9DAfG/WI+VhM9xFkT1Eh/5QZAAlno0DaMKv5UwV4zpkuOr1t7gE
 Q8tq3xr7/bEOLocjgN8YxTjjBoJk05v6UoooQKP9Nuylg74QZ3W1e4YKhehM4szCd5oO
 5QsAHHQNpwy5/8cGpIHR3HgoBRR7v7JqsV+vU0YwUQQA9UdqQjHOdnYvrc/L2HazimOz
 7F4aFv0PT3dz1o2D0963PmDfYBPsMVV1esV3dVCtGMHN6vrPtIM1tRQCovr/tvdiCU26
 bLTA==
X-Gm-Message-State: AOAM5326CmqmNhmbfxERmvRVsldaa1YQKFs4oAglArrjjwaMoQFTMWcz
 XRMgtqNaTTOsF2oiphxStxxwBw==
X-Google-Smtp-Source: ABdhPJxS0sYSzLqJcAZ0oz42b/ywmKG4qFCHR1ER0yMVDC7xpxE4M2h2VUeS01TFjENuq/NLzDiuoA==
X-Received: by 2002:a2e:b812:0:b0:253:e6c7:259 with SMTP id
 u18-20020a2eb812000000b00253e6c70259mr31169131ljo.487.1654100030380; 
 Wed, 01 Jun 2022 09:13:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 k2-20020a05651239c200b00479066d45bcsm339545lfu.214.2022.06.01.09.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 09:13:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed,  1 Jun 2022 19:13:45 +0300
Message-Id: <20220601161349.1517667-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v1 0/4] drm/msm/dpu: cleanup struct
 dpu_hw_blk_reg_map
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Cleanup the fields of struct dpu_hw_blk_reg_map, remove unused fields,
merge base_off with blk_off into blk_addr. This patch series depends on
the patch [1].

[1] https://patchwork.freedesktop.org/patch/488001/?series=104613&rev=1

Dmitry Baryshkov (4):
  drm/msm/dpu: drop xin_id from struct dpu_hw_blk_reg_map
  drm/msm/dpu: drop length from struct dpu_hw_blk_reg_map
  drm/msm/dpu: merge base_off with blk_off in struct dpu_hw_blk_reg_map
  drm/msm/dpu: move struct dpu_hw_blk definition to dpu_hw_utils.h

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h      |  1 -
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h    | 25 -------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c   |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h   |  2 --
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c     |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h     |  1 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    |  4 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h    |  1 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |  6 ++---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h    |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  6 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   | 18 +++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c   |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  4 +--
 26 files changed, 28 insertions(+), 85 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h

-- 
2.35.1

