Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7A56F2AA9
	for <lists+freedreno@lfdr.de>; Sun, 30 Apr 2023 22:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13FC10E093;
	Sun, 30 Apr 2023 20:36:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7786F10E086
 for <freedreno@lists.freedesktop.org>; Sun, 30 Apr 2023 20:36:00 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f11d267d8bso595954e87.2
 for <freedreno@lists.freedesktop.org>; Sun, 30 Apr 2023 13:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682886958; x=1685478958;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wHm4YQoUofQiTjhT70T+V8A+AOnK8cLSZsYSqcgfAFc=;
 b=b13gGh/IdYRhF8N0/ngxwbhkC/rkyBSdidkZm133Ux2/SKVL/0CmOtyQ0k4lgv6EBn
 xSUllTTqFzapOOxUATHCEmHqyz0wbi88nLAxrIgTzirfOUdOcH3tcq5tl1wV8bEouc8A
 ytKcSslF2v6C41R3GpLlyWnahUK5MvqzYx6ozGzpYnTi1485Fd10Ans9dNApdTrPyf9G
 dapx9LCaqwOnEvbVk4Y4V9AjaDbIZE3HWJx0EHPFr62g1YiB6+XxISQKKh9RL2Qsk0lZ
 n3098JkuBJFlRWR3gxIQvx5IyYhGnQsyKmYwuwqxDAxANRBJgKdQ6jKWFgl6WCk46SYK
 BVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682886958; x=1685478958;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wHm4YQoUofQiTjhT70T+V8A+AOnK8cLSZsYSqcgfAFc=;
 b=X/ECzMqm79pVegyEXa67rSIbX749EgU69vlj88qo2axa7tCl4QnAZPDFogtkWaQZFj
 YA25h2OVtSCAezl7RK3I/6Y3W+NpLojvEbGukmU/Rb7UTsrNBXtrnbPMn7YVn3p6JLs9
 vzzM4TJvpTMnC9WGI9I+0QEf/fc2QQSNlWrKQNBSmfV6SKAqWpmIwsFYOUG3rj5Am7Dq
 Iyvr/zdByi0dPMM3ofEyIk+Etmv11FIWdIjz4mAywqX1Uk5/gfU23XVENFuZV5AZLkGe
 V96EZTn9gQIJ/STYUVSJPJBCwQzEmlrxSpD45y0CG6xpKcEXWpo8fP6Vwlh75BgrlGeY
 7qGA==
X-Gm-Message-State: AC+VfDy/xlYZlJCjosAU/EaI+urfv9+tazdTuJDGvMqPziWbOugsJFRk
 7RqREDVbWwRZv9XbysWZITIzaA==
X-Google-Smtp-Source: ACHHUZ7ajIaCaDx8E/n0HBrHerHj1ZEqCZlCY4XmdMIYYb0aCufR12WEAo03BgpZAvJCXKZBF3aveA==
X-Received: by 2002:ac2:41cb:0:b0:4ec:4c2f:1c85 with SMTP id
 d11-20020ac241cb000000b004ec4c2f1c85mr3142739lfi.31.1682886958156; 
 Sun, 30 Apr 2023 13:35:58 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 b24-20020ac247f8000000b004edd4d1e55dsm4324634lfp.284.2023.04.30.13.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 13:35:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun, 30 Apr 2023 23:35:52 +0300
Message-Id: <20230430203556.3184252-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/4] drm/msm/dpu: simplity RM code
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

Implement several small simplifications for the DPU resource manager.
First two patches were suggested by Marijn.

Dmitry Baryshkov (4):
  drm/msm/dpu: replace IS_ERR_OR_NULL with IS_ERR during DSC init
  drm/msm/dpu: remove futile checks from dpu_rm_init()
  drm/msm/dpu: use PINGPONG_NONE for LMs with no PP attached
  drm/msm/dpu: move PINGPONG_NONE check to dpu_lm_init()

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  4 +-
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c     |  5 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 41 +------------------
 5 files changed, 12 insertions(+), 45 deletions(-)

-- 
2.39.2

