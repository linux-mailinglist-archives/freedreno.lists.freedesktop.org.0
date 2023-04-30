Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 122CA6F2ABE
	for <lists+freedreno@lfdr.de>; Sun, 30 Apr 2023 22:57:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C7D410E093;
	Sun, 30 Apr 2023 20:57:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B523910E0A9
 for <freedreno@lists.freedesktop.org>; Sun, 30 Apr 2023 20:57:14 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2a8afef50f2so19322431fa.2
 for <freedreno@lists.freedesktop.org>; Sun, 30 Apr 2023 13:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682888232; x=1685480232;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EdMs9PnBlFXX1tXo5IXm/xCYeEZWhh1WfqvD9B32TZs=;
 b=wcb9DIiaiQMAeTb56/HFi2Ya2rbjBAZoLAmde+J+JwpOCqEFjy+PPIp1eXJ5vZ05b1
 ZKrKuH+Dxd3TH3TcIvhRPlfcqGl7UlWQJM0RCWBtHJIKm7kw2dnDX+HGFbEjE+7LQZ80
 7Uoo+xk5Mk84ObZ1EBkaBImnfOFFQTcDfDaIH0RghIhLG7F9+xyB5RXQ2akYicsZK3D3
 y2CDfVcP068aSLHujHo58Smlt/AlMFHKNACDgLCiMRNcwpv1Owo2vdhq8maXBVsRso1o
 tNubnfU81EtABUJ18OQg9wM+rEC1y64HXFT4JcJDwkjBxhcu9efd/2l8vEv45hu0cwwg
 0x6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682888232; x=1685480232;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EdMs9PnBlFXX1tXo5IXm/xCYeEZWhh1WfqvD9B32TZs=;
 b=W5jWO+LuH1tIGXetPFQqK+P/ABePHmI1qzU/qL5fJojn/Hxw09u9R5A9GQngJfT8aj
 reXLKmbhGpOJBDmzZB0K/QIRL+dNQUjheUmchjFsumG9DVDN5vPkIfp8VzyVLbWEgG15
 cozPleu1YZGe2110S6h16TS/60BQklJMlTgE6FjtAhkagzC+Eqz4W1V2JTUfDA4VMRvm
 2tNNUFR90hhxQabMgELxQgNXC4rMpoVVGtKfQz8GiEpmQiH7+mlKU9TZ0QcRoSPa+0Xg
 xTYE8Bd5wKVHFpNo1gpnnjwnenanx7WM6c5AxfBQTlpsfI++BOWSWovB3G2LIvVj7gHX
 8tOQ==
X-Gm-Message-State: AC+VfDxa6pI8JCar53GgR91hebvY8LdEfiVSZfm3odYrgKhTvExlrvqL
 b1Eivbr8Imt2MfBMa+tDYfqlAQ==
X-Google-Smtp-Source: ACHHUZ7WHu1hRnO/qgQtmzUhD/QlSVcPuAQZNmO6atBSNNmB7GcSdSpt8XVFQPULV8Voab5EEDNmfg==
X-Received: by 2002:a2e:721a:0:b0:2a7:76ab:c42 with SMTP id
 n26-20020a2e721a000000b002a776ab0c42mr3266826ljc.46.1682888232061; 
 Sun, 30 Apr 2023 13:57:12 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 x6-20020ac259c6000000b004db1a7e6decsm4332749lfn.205.2023.04.30.13.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 13:57:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun, 30 Apr 2023 23:57:01 +0300
Message-Id: <20230430205710.3188230-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/9] drm/msm/dpu: simplify QoS/CDP programming
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Merge SSPP and WB code programming QoS and CDP. This allows us to drop
intermediate structures and duplicate code.

Dmitry Baryshkov (9):
  drm/msm/dpu: fix SSPP register definitions
  drm/msm/dpu: simplify CDP programming
  drm/msm/dpu: fix the condition for (not) applying QoS to CURSOR SSPP
  drm/msm/dpu: rearrange QoS setting code
  drm/msm/dpu: drop DPU_PLANE_QOS_VBLANK_CTRL
  drm/msm/dpu: simplify qos_ctrl handling
  drm/msm/dpu: drop DPU_PLANE_QOS_PANIC_CTRL
  drm/msm/dpu: remove struct dpu_hw_pipe_qos_cfg
  drm/msm/dpu: use common helper for WB and SSPP QoS setup

 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  23 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   4 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 142 +++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  52 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  52 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |  32 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  48 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h     |  27 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 168 +++++-------------
 9 files changed, 195 insertions(+), 353 deletions(-)

-- 
2.39.2

