Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 369ED6E32D8
	for <lists+freedreno@lfdr.de>; Sat, 15 Apr 2023 19:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED67C10E09F;
	Sat, 15 Apr 2023 17:19:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8239D10E09F
 for <freedreno@lists.freedesktop.org>; Sat, 15 Apr 2023 17:19:29 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2a8aea2a654so4548121fa.1
 for <freedreno@lists.freedesktop.org>; Sat, 15 Apr 2023 10:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681579167; x=1684171167;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m4nST20IPKOcYwIOfUgXQCsK+huSDja+HNRFSncxwf0=;
 b=LgKEaTXc6OQ5SGY4uM0igrni/yv0F72lQYofAl2Jcwh6IQk4EoQIBACu1lv6nrg0oY
 0Vj6Q1gZ21Us7Yc7Mo2cU6MGBMIqILgC+3MVPYw0ztSlfrQirLp5A+Qb6OXqBDRopNEv
 gaeRI3au41K4XeucsIpCmnmPCkPX0X0K9eyNwL0mKyWc3E4gYQnfLshInMAI9zqadQA8
 YBKMK37nlD+9uFH/WFHETV4tMKtZ7AKMu950fXiVt8bXo4P54Yp0xCQuSqwqpxXtmdN3
 UylZFec81EPEBAiZ9LN/f7yLcuPtVK5FF81VW1W1JpbZ3nOuQFyGLapHBhETHbQ4oFUK
 fJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681579167; x=1684171167;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m4nST20IPKOcYwIOfUgXQCsK+huSDja+HNRFSncxwf0=;
 b=N4WsCdYZ5U1t9w2mmUbM4hKkwzmdMC76Rh7BuE8+Kpnx2afNvfzWfsfr4KWt8R/CYt
 CPg48IINoEnOK3QW+GUPjSu5/wRowhYgIUhNYMLMIgFfg9QQHb6n0PXZRoEI/7J4fxn0
 E8pq2Hdipnrco6th+UOOP02lXDEGSbEeCtpr2r3pC+KtnBqMxWYziO1KCzJnb8wj8WuQ
 aiuZS7x5Q2hpyUGY3gxNBPMrpDx0bvPYXxtS+RLUNqwCfhDhqjUE6HxaMYgzHJ2yZDKk
 4iCGw6g40c24U3ZMCVz4HCDMmPNzTqft19RXI9qi4GBzCvOUxybYFliBeeC/QU6KaZKm
 yi0Q==
X-Gm-Message-State: AAQBX9fDvyxk1LMdF6wiO4xVPwtKi2VIv6fo3Io6bvcPYKgt5bmyiSum
 LSnFyNDCBq1RlWDMcFnqn/AQUw==
X-Google-Smtp-Source: AKy350YXm6X841XzMI02HB2vU2HU4LiEUQIdFGYoiHVC1a+x3tyGIIwXZM3o79RTKkgXnv6Rafv5OQ==
X-Received: by 2002:ac2:5390:0:b0:4e8:3d24:de6f with SMTP id
 g16-20020ac25390000000b004e83d24de6fmr677665lfh.14.1681579167425; 
 Sat, 15 Apr 2023 10:19:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a056512096400b004ebae99cc1dsm1355834lft.159.2023.04.15.10.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Apr 2023 10:19:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat, 15 Apr 2023 20:19:24 +0300
Message-Id: <20230415171926.85774-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/2] drm/msm/dpu: enable INTF_HDMI support
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

Since msm8998 and older platforms (wip) support INTF_HDMI, extend DPU
driver to support HDMI output. First patch was submitted about a year
ago, but received some pushback ([1], [2]). However it becomes
absolutely required to properly support INTF_HDMI as both HDMI and DP
should use DRM_MODE_ENCODER_TMDS for encoder_type. Thus dpu_encoder can
not make a difference between HDMI and DP outputs (however they require
different handling).

[1] https://patchwork.freedesktop.org/patch/473871/
[2] https://patchwork.freedesktop.org/patch/474271/

Dmitry Baryshkov (2):
  drm/msm/dpu: simplify intf allocation code
  drm/msm/dpu: add HDMI output support

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 39 ++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 51 +++++++++++++++++++--
 3 files changed, 63 insertions(+), 31 deletions(-)

-- 
2.30.2

