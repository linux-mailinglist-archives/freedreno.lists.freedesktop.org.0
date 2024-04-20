Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A12E88AB8B5
	for <lists+freedreno@lfdr.de>; Sat, 20 Apr 2024 04:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7478310E1E8;
	Sat, 20 Apr 2024 02:33:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tQ4p78wJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CABD10E077
 for <freedreno@lists.freedesktop.org>; Sat, 20 Apr 2024 02:33:05 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2db2f6cb312so48126851fa.2
 for <freedreno@lists.freedesktop.org>; Fri, 19 Apr 2024 19:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713580383; x=1714185183; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IHIy43O0Jlbv9g9HsqpFU0YMmnLVDcwucd3KlxrGMn8=;
 b=tQ4p78wJ9rQRe2DktRiJGbVi/EpBlLAUcHOLqHIhcN9YlNLGagfFTxyDfRungZ5Z4K
 PQsdqwx7+okJAJ9GSYimwE2YnWUDNo+1VAQzMyfdAzHcYufUgpDDAWQykbzI+gJN/XqL
 m+x9V72iJ2dIqbkhhmExHzm9danKXKNCxo7JsIHLaprBOXZLN+ZEaY4YdrKTF6u2gQ/Y
 LZN/DUaHEDf7HC4XTDq7Y6JIHDN44+yiJFsRJtZwFlWoAGMvwvjNrhXE4sshaWxWBJJt
 9KfbSJOG1y9STGiDjkaU3oOGTZRY4jXWKXIXQMM0hVOKUXZ+hUoq1IZqLPwJawbUXLvJ
 JnRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713580383; x=1714185183;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IHIy43O0Jlbv9g9HsqpFU0YMmnLVDcwucd3KlxrGMn8=;
 b=qFWxkws4SpXq5iV1l6cb7LrvmlZAIGxR0QRANrpJ0B4wE2oOz+tfIEMqQPW9uwhTwr
 jxq5CFpNUvfFd0tbYaioyI6pwfAEy4ppCoTD+jQwYiFHm6yhAOPM1xCK5I70IKb2ERBw
 YJfTxKCBJdkKWwexeKD3TVOjao4BgUQ4HzGnwG4CIhQN8sqKuz33bjzJ/N9t4gpOBnEh
 p8yirW4r/7bsHBi+s0xEGE5leWjUHIyhfXJjULPMlKx1AmLr+sVr+jccJpiJVYLj++Ig
 TpL9L5EVZbtjysf6U1pg+F7phAXgkXWNCRxBblFVdSZ2WTw1fR57d7O8l9TXi94rqN/u
 VmDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6xe10YIN7Nzpez/AsIIxoRBUk6XCP+2rXLShZXpFhXZjNvPbjSI2cM5zpSU7i9avjCK1yV50RCEmtNA4olfX+/HzlSNcrIsYQH2bpe34P
X-Gm-Message-State: AOJu0YxTH/pndBUIjLjLhsboidCl1ubFbG/4z7hylnuUGCqgySA0/JVT
 M/oiL9bnX67sUlDJteqe8wQa+wEaykDWFlQ5Ox6Qiudr5vhAUxpri68kn3o9hyQ=
X-Google-Smtp-Source: AGHT+IELY29fR7/hEuxXxHgYa93CB9/GPBcRflN3Wa2OvtdCm+G4fMhzYAJFURm7JCFf2aQJby6sXw==
X-Received: by 2002:a2e:97d4:0:b0:2d6:8868:f1a6 with SMTP id
 m20-20020a2e97d4000000b002d68868f1a6mr2841297ljj.43.1713580383060; 
 Fri, 19 Apr 2024 19:33:03 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 20-20020a05651c009400b002d87e936833sm836843ljq.125.2024.04.19.19.33.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 19:33:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/3] drm/msm/mdp4: fix probe deferral issues
Date: Sat, 20 Apr 2024 05:33:00 +0300
Message-Id: <20240420-mdp4-fixes-v1-0-96a70f64fa85@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFwpI2YC/x2LQQqAIBAAvyJ7TtDVIPpKdNBcaw+ZKEQg/T3pO
 MxMg0qFqcIsGhS6ufKVOuhBwHa4tJPk0BlQoVUWlTxDtjLyQ1VGY/zoUBs1eehDLvSL3i/r+36
 I64o8XAAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=858;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=APWeS2G8ldD8gvmeJXu8a7QBkWaV4iIippY2f6pvmoA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5qyZqzb89RHFa7pqfUzGPasSWcwuHNo8Tw9D+VLbE2X3
 3rN5ovrZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBE9s9m/x+fcoNTLa7dnLci
 t0yoLaKLIXZOWflUpvkL7jCsLfbc6Derw5xJYWLhFdlm961/D6VxfBecPMuQ1ebfb8vwp+X5Xqu
 v1zw8rHRvxnORfce/OzBEx4oLJien3Ln4otbRrFl9U9w54ZA6Xntx0amnMwwTK67EcDsqPLbLe7
 3GPGAqv90fkfY3BU9nqdeW9jYWt6jq1C5aP0Nm/hHbK3XfC7Mtv/pHNH8u49rG2vJYxydi9rS73
 zdkZluFOC2PyCteeIcvZL73y+V5Hy5Eb7niGz75+uml7T3Lxe2L7Jq0rcUdlivcZ5kj+rHntxRD
 4w9VndsPkjfwPzt85kTIKgkT7hMZx/bIJeZvsOGsOX4fAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

While testing MDP4 LVDS support I noticed several issues (two are
related to probe deferral case and last one is a c&p error in LCDC
part). Fix those issues.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (3):
      drm/msm: don't clean up priv->kms prematurely
      drm/msm/mdp4: don't destroy mdp4_kms in mdp4_kms_init error path
      drm/msm/mdp4: correct LCDC regulator name

 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c          | 28 ++++++++---------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c |  2 +-
 drivers/gpu/drm/msm/msm_kms.c                     |  1 -
 3 files changed, 10 insertions(+), 21 deletions(-)
---
base-commit: 7b4f2bc91c15fdcf948bb2d9741a9d7d54303f8d
change-id: 20240420-mdp4-fixes-f33b5a21308b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

