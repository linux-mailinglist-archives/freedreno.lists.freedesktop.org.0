Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 655647AC542
	for <lists+freedreno@lfdr.de>; Sat, 23 Sep 2023 23:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B09110E041;
	Sat, 23 Sep 2023 21:49:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F33210E008
 for <freedreno@lists.freedesktop.org>; Sat, 23 Sep 2023 21:49:15 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-50435ad51bbso4679011e87.2
 for <freedreno@lists.freedesktop.org>; Sat, 23 Sep 2023 14:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695505753; x=1696110553; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0mKikz6iQlf/2X/8udeNvqptmCav0BXWVkbR1ppszpA=;
 b=HBoeRZsnjtnC9ixRKA4jXNVh7y+H5GZiCqMSSpMqoNNB4AcqIFsfq879tVhZypQ8Aa
 6AWTdQVWNM5OTyWQtxlDpCuY+SO+9nlXaq4c8/7b+l4d5+uEN+ImKN5HDiC8yjNtDtK6
 SQ1wB/JjlTHrU2h549C42FV2voysr8u5Fd/nLjdLyYp+uMGZn0PRlffQOStUhrZBWt+C
 w93cVnfEK0QjRYYKnMev23uFuOiYnoJMi1RNrhBFW/NqwfVRGHK7T4VGy5NaN8rpTz0L
 N6mV469sxgMS+8/zNQlgoWEUelsttlyED8nU/t6UWZf12iWsNKieCQ6d1uv9DtghVXCj
 DYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695505753; x=1696110553;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0mKikz6iQlf/2X/8udeNvqptmCav0BXWVkbR1ppszpA=;
 b=V/Wjy2Uq6XDjxB1xWhbfheKEfqoFWYi3SSJ4Mc9di9gG9n33NHnIr/Vv+vloyIGSYY
 BGEDDR9OGOX1cKb0NjNIMrVurN/s8tssJLSHsAvGfF6qM24mVdDcrHcsmO94JoEb3EZg
 WUkEF1ocxHDLnSkEsv+JQRw8cjo4iYb1wJScxGNoCT2vvUqcmdkC8bZgXoBI8GNo8ut/
 6MIwNkX/E9FZZqjnhmCX6nLKcrTJX1+fxnk69w7Z95CW13hP6S1jq7JWXyZKFvSUuhjR
 S6Pr2w8wFwl6z4IE2AIxg6KCAV+16HY3OFmnhOwRLwQm7Yp4Vl0KwkcsjYXfXBJ5ErKh
 CJhg==
X-Gm-Message-State: AOJu0YyY2dCFMAt8speQyLty2ku6rWnizfn5VsuDtsikMaeEU4/EB1cV
 tqCvMrcoVbiWOm5GpUL66KzqkQ==
X-Google-Smtp-Source: AGHT+IHfMWz0YFTxERDUiIQgVQVWvbsVCtLPEAqGh68CRmNrR2JB/mBEc7E8zYr1iE8TPrS5PMEC9w==
X-Received: by 2002:a19:6905:0:b0:503:26b0:e126 with SMTP id
 e5-20020a196905000000b0050326b0e126mr2010709lfc.59.1695505753532; 
 Sat, 23 Sep 2023 14:49:13 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a19520c000000b004fe0760354bsm1196590lfb.275.2023.09.23.14.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Sep 2023 14:49:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun, 24 Sep 2023 00:49:09 +0300
Message-Id: <20230923214912.1095024-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH 0/3] drm/msm/dpu: convert even more MDP5
 platforms
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

Extend DPU driver with experimental support for even more MDP5
platforms: MSM8937, MSM8917, MSM8953.

As with other MDP5 devices, one has to pass `msm.prefer_mdp5=false`
kernel param to test DPU driver insead of using MDP5.

Dependencies: [1]

[1] https://patchwork.freedesktop.org/series/123294/

Dmitry Baryshkov (3):
  drm/msm/dpu: add support for MSM8953
  drm/msm/dpu: add support for MSM8937
  drm/msm/dpu: add support for MSM8917

 .../msm/disp/dpu1/catalog/dpu_1_14_msm8937.h  | 213 +++++++++++++++++
 .../msm/disp/dpu1/catalog/dpu_1_15_msm8917.h  | 190 +++++++++++++++
 .../msm/disp/dpu1/catalog/dpu_1_16_msm8953.h  | 221 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  14 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   3 +
 6 files changed, 644 insertions(+)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h

-- 
2.39.2

