Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F108D450F
	for <lists+freedreno@lfdr.de>; Thu, 30 May 2024 07:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A620011B375;
	Thu, 30 May 2024 05:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PEXbzLcF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E18E611B375
 for <freedreno@lists.freedesktop.org>; Thu, 30 May 2024 05:56:48 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-6f8eba8dcfcso417878b3a.3
 for <freedreno@lists.freedesktop.org>; Wed, 29 May 2024 22:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717048608; x=1717653408; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Wg+y31xl/RmeIgpL0Di9SmbXiRyE56ZbIno+aBs0ekQ=;
 b=PEXbzLcFGBfinFiJmfffRLdnCrf7kNY1d1SVC/qh+AY9nh8b9DtVWiT5vzrYK89u0f
 bdXm4n2bQBwHMQgLM/0drgfK+Bys2aHqAcG8hMcGrGFeLUxH3gMcupvqbTLZiqxlbEEW
 jWbb+oNTo5RdxuGchOspkb2H/60ASD4Xq1Rodedm2wMsyd7RjnXQ1IloY6TrK10DH4Q/
 XQ3rkiXXypyykWnwhds+W51JQrKZIrrU58yy6IufgET0X5Atj18o9cmqJtKJay+Lk64r
 cWjJXDRtd2BwAyx3TH9aemdEvDsyZoRoQPaj70UXtEVF9hFzeo+xOlwQ+eX488pqjTb2
 ipqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717048608; x=1717653408;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wg+y31xl/RmeIgpL0Di9SmbXiRyE56ZbIno+aBs0ekQ=;
 b=JX/h3adi70gdeQv0v89ikBT7W0fxs6qhdQv1Rdhewq76WiHPpU2o3Y4SshuXj31T9E
 jsSSj5oWwZeE5b9P74zrnz1RFOb4HlthTL+7o2sQoFmbaFfS21c7MkAa9wuCWmSOLqQE
 Xj6JMZHXBKFVF7Ud9Lwi7hdIqlgZnTECH0E9CzbTqVLimUoUkDCukmHJdi2vWcKy83zZ
 BX7Mm7Q7kqN2b4zn7Cssk/2+dcdTofbgTpBjXNo9ANyqnJybaMoM6S3UAKQcprrsyzOc
 h5YxkyMvzW3+aUJFvOtsIhVRFlIn7JUv+0c4FvqR3wZ+hVHxNQHDCozjJifotGmFE32n
 9VNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNLDom2ArTAKvIK3UdTgDWVhaKnhWZd9z/qdXpT5ne2+tQUxDiTZFXDny2PpG9zduOm+W4sF7TY0DLppoLiopE0ajZFSOFXRUOcu65UzBK
X-Gm-Message-State: AOJu0YwGLj+7tH9DzfKgk9w11faE22jhzQV32VERWxC0QJ8URPjH1lcU
 7ocqgiDnXPCxcKtoQev8MBJ17BbLBydN0r5btDy5WszKbkd8N/zuY9V/h1YJSQw=
X-Google-Smtp-Source: AGHT+IFomuY8PNK14qd7ZuhowVwq4GZWAnuqj0py5ACiE+WTKY8mq9b+tz73xLwbr4TfRr5YJ609NA==
X-Received: by 2002:a05:6a20:4313:b0:1af:d033:d66d with SMTP id
 adf61e73a8af0-1b264523619mr1354733637.9.1717048608215; 
 Wed, 29 May 2024 22:56:48 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.67]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c75ffc6sm110006705ad.9.2024.05.29.22.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 22:56:47 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v6 0/6] Add DSC support to DSI video panel
Date: Thu, 30 May 2024 13:56:44 +0800
Message-Id: <20240530-msm-drm-dsc-dsi-video-upstream-4-v6-0-2ab1d334c657@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABwVWGYC/5XNsQ6CMBQF0F8hnX2m1ragk/9hHAp9hZcIJS02G
 sK/W5h00+EO9w7nzixiIIzsXMwsYKJIfshF7wrWdGZoEcjmzgQXkishoY892JATmxyCRBY9PMY
 4BTQ9SBAChdDa1VidWGbGgI6e28X1lntHcfLhtT0mua5/4EkCB9SHhqta8qN1lzsNJvi9Dy1b9
 aQ+xfIHUWXRlafSudpIXYkvcVmWN3pbwKsjAQAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jonathan Marek <jonathan@marek.ca>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717048617; l=2232;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=D0yrkfxxFHdMRbEH4oMP9hMkymQbCeCPPCiYJsAX4O0=;
 b=GanMoNSM63YmKMLyUezYQhUPp5JSKvRAoKAwiC2PMIKEvIQQ5fqI8A/2Ev82ionXNQOrohpnj
 lrtROQuig5RAXovSraCexeLYMuje8Vm9wyd6nio3//0ZSDYnHybGhGW
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This is follow up update to Jonathan's patch set.

Changes vs V5:
- Add hardware version check for compression bit change in cfg2 register

Changes vs V4:
- Polish width calculation with helper function
- Split cfg2 compression bit into another patch

Changes vs V3:
- Rebase to latest msm-next-lumag branch.
- Drop the slice_per_pkt change as it does impact basic DSC feature.
- Remove change in generated dsi header
- update DSC compressed width calculation with bpp and bpc
- split wide bus impact on width into another patch
- rename patch tile of VIDEO_COMPRESSION_MODE_CTRL_WC change
- Polish warning usage
- Add tags from reviewers

Changes vs V2:
- Drop the INTF_CFG2_DATA_HCTL_EN change as it is handled in
latest mainline code.
- Drop the bonded DSI patch as I do not have device to test it.
- Address comments from version 2.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
Changes in v6:
- Link to v5: https://lore.kernel.org/r/20240527-msm-drm-dsc-dsi-video-upstream-4-v5-0-f797ffba4682@linaro.org

Changes in v5:
- Link to v4: https://lore.kernel.org/r/20240524-msm-drm-dsc-dsi-video-upstream-4-v4-0-e61c05b403df@linaro.org

---
Jonathan Marek (4):
      drm/msm/dpu: fix video mode DSC for DSI
      drm/msm/dsi: set video mode widebus enable bit when widebus is enabled
      drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC
      drm/msm/dsi: add a comment to explain pkt_per_line encoding

Jun Nie (2):
      drm/msm/dpu: adjust data width for widen bus case
      drm/msm/dpu: enable compression bit in cfg2 for DSC

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c         |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h    |  8 ++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c    | 21 ++++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c         | 17 ++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h         |  3 ++-
 drivers/gpu/drm/msm/dsi/dsi_host.c                  | 10 +++++++++-
 6 files changed, 56 insertions(+), 5 deletions(-)
---
base-commit: e6428bcb611f6c164856a41fc5a1ae8471a9b5a9
change-id: 20240524-msm-drm-dsc-dsi-video-upstream-4-22e2266fbe89

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>

