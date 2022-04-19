Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4292C5072DC
	for <lists+freedreno@lfdr.de>; Tue, 19 Apr 2022 18:20:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9267510F0E9;
	Tue, 19 Apr 2022 16:20:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B4110F0E0
 for <freedreno@lists.freedesktop.org>; Tue, 19 Apr 2022 16:20:33 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id q14so21152895ljc.12
 for <freedreno@lists.freedesktop.org>; Tue, 19 Apr 2022 09:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AwPSlRbjlhsy8XFCXSj+BcLSd4AXUjJASAh7ilneiRU=;
 b=LxdPW1NK9aTlMMY3y8zztnSiSCdrno4Eg3+/on48i8bx8yZqlbJseBoHRliPiJI0ZV
 VHndrv3Xj34dfQs+LxcvozbhSgSJGkl1K1Qnf8uEMqlwRt4pLuFDoXMBMwhN9se4LfJ8
 1EGIAmY0tL83XbcYW1+9/peYz/LJS4Ibwwjsxt4QppAD7E9fK9Q838nI27zmVoo3MytN
 6eFqjnpFPlOJ1KP8SBJyJSVYLXpgYBzSYBK8IZHYLZb6GQ2H3D0labkpwmtfdVCPpgHu
 6VDx6Z5EK4UYuysge6MZX9fLp2n/tlo+FuHPTtX6/Z8RBpXsEgT/bIEf5ieYF82PExm6
 97sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AwPSlRbjlhsy8XFCXSj+BcLSd4AXUjJASAh7ilneiRU=;
 b=2kcM8jErbpkB717T0cRReDl/B2mJaunxwEOFTXIoB3J0v0tGzHgbnwH7yxTTHRm2d9
 +ybvgZB7KSKhedppke0yRbtkb+MWHUkILAML9hckEzOQ4phjkHggRVQWxZBfQKUZR0mo
 X6q0Ah7BCr4PjvflulpVkJ59BUiONxuplBT2PI31Rj6CdWFUQ4n5VQ5dvmRzMaLW/jed
 ndvrwW6AYhM/MosP7Sm6T9cZGuInASmFgn5WzioCkn6622cJ0+XbTEDbea4FCWhjMZJG
 pm1xT3t39EiJnAuhs+2QVunGL2VX+CKLojfEWrOSYQz3OBBy1fm27Ms420iB60xA496i
 PMyg==
X-Gm-Message-State: AOAM531/HvSZTsZIfPTq7dmFpi6KyPda/tyRwLPxpyPSiZCg/ZJyGby5
 3FToHD0yxVfFC6Cp2LWMv+8vnpTyyC9/+g==
X-Google-Smtp-Source: ABdhPJxJ360RfODzF6vg6Cq8E0E3Qkq7x42CwaLCqbDfnV3nE8JOv6m9pA1PpS3y5AMLEGK6od8/2A==
X-Received: by 2002:a2e:bc05:0:b0:24b:212d:7521 with SMTP id
 b5-20020a2ebc05000000b0024b212d7521mr10295661ljf.243.1650385232033; 
 Tue, 19 Apr 2022 09:20:32 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 k15-20020a2e92cf000000b002493cc687f3sm1495153ljh.45.2022.04.19.09.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 09:20:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 19 Apr 2022 19:20:27 +0300
Message-Id: <20220419162030.1287562-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 0/3] Simplify VBIF handling
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

As suggested by Abhinav, rework VBIF handling, simplifying the code.

Changes since v1:
 - Fix array index comparison in patch 1 (as noted by Abhinav)

Dmitry Baryshkov (3):
  drm/msm/dpu: index dpu_kms->hw_vbif using vbif_idx
  drm/msm/dpu: fix error handling around dpu_hw_vbif_init
  drm/msm/dpu: drop VBIF indices

 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |  6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 14 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c      | 65 +++++++++++--------
 4 files changed, 46 insertions(+), 43 deletions(-)

-- 
2.35.1

