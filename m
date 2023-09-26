Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 321177AF295
	for <lists+freedreno@lfdr.de>; Tue, 26 Sep 2023 20:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D976610E048;
	Tue, 26 Sep 2023 18:24:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3323E10E415
 for <freedreno@lists.freedesktop.org>; Tue, 26 Sep 2023 18:24:41 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-532c66a105bso10866953a12.3
 for <freedreno@lists.freedesktop.org>; Tue, 26 Sep 2023 11:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695752680; x=1696357480; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wRbJzVyzAsF5dK6nn+zhhFn0HQb3v3TAPzMsem2dH88=;
 b=rUoiOwf1gzAow+ZuIgSH+5FuVsPJ+LMnpHmESYOPTfWRWtVOuQdyXyrIDrGhCA5R1w
 nYfsWzcKKSqXgc10lklemCkTtRix8c6gbO7ILr95hPRU98L+463PK8mgjSyMtnTbwrs+
 IoQKzkc2Lr+gg0u+eimarNbZ6vhmAG0tBfMuKOtGLleKOYLQmV3zSD5ROvP1/3yRrfvg
 Ck/jrSpRwIHGcD4jdb6Q8Rfzlgv3E2JbJCimGJ3c0IZQY6F12rANfAIGU/kx7D4KFq6+
 JkrkyFQCV3YCoBXlFIUMfdOWXX8Ci4C0l4TbbMqoEscP/IJjy+40tVQNqVruL9xIyI4l
 K2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695752680; x=1696357480;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wRbJzVyzAsF5dK6nn+zhhFn0HQb3v3TAPzMsem2dH88=;
 b=eY4UV+BMmk45eutlgIwTkhVxBMJ8x7/dMoo37Zf4WxRmFFx56hEYx/Z3dyrThN7JYD
 It3gV/bhArt0RwBTGNiX88zoBUknpgmppU6WF5G7g1RKGo3zr9aGZPtI1AjNJ5H5W4bO
 PofCpht8BqkKJ9PZXeKVaDKn1rPKxcZ6wcKa+8By25CXIk3X0PZaYv7w8qK9FqIsSkZ2
 H1QMEKsdJPelC5j9DAUjUvyDWL9b6Gw8nvU0zolcdRznp/+SyFZPJBU/SLVECGMwKWnD
 PkFt1HD8YXpYOGcOuOcx6IUrvFexvI9G3X+3ACnVddCNt/t+KU6Z43wbhLdFNNhl8tdY
 YSNA==
X-Gm-Message-State: AOJu0YzKrHVMmOFyDvsufM8WBhZyRVIuZZroYHsH5CwXqC6D88PSdGsk
 lWNg+t0dHq6i7Wa5DHltnfPUlQ==
X-Google-Smtp-Source: AGHT+IEvQPOXzH6evT1wU3sw4ZwK7LW3sBAWFWdrUZzq0HmG2Mrdkcf0x6ZDGIfcs2fl1PuQKAMnKg==
X-Received: by 2002:a05:6402:176d:b0:534:7ae0:9789 with SMTP id
 da13-20020a056402176d00b005347ae09789mr875694edb.24.1695752679713; 
 Tue, 26 Sep 2023 11:24:39 -0700 (PDT)
Received: from [10.167.154.1]
 (178235177023.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.23])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a056402151300b0053090e2afafsm7020643edw.22.2023.09.26.11.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 11:24:39 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 26 Sep 2023 20:24:35 +0200
Message-Id: <20230926-topic-a643-v1-0-7af6937ac0a3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOMhE2UC/x2NywqDMBAAf0X23IWYFF+/UnpY060uSBISLULw3
 116nIFhKhTOwgWmpkLmnxSJQaF9NOBXCgujfJTBGuvMaDvcYxKP1D0dUs9+JDOQoxY0mKkwzpm
 CXzUJx7apTJm/cv4Pr/d13Zmw8BhxAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695752677; l=1165;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=EU9teWjPD7h5e92Oew+5MuXdWQG5NKBrkuAcC3oTWG8=;
 b=pEgeFuwL0ONn3mJdwEhg/cTN76w/vQK27DzSYLvcj31+lB+ESvoYMsuidc9PHh2HmEbvyk91I
 khKsQeAIVdrBCc48WPE1MOUH8l5idaZROwlYG37dWiV9yT2/HvWgkio
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH 0/7] Adreno 643 + fixes
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Luca Weiss <luca.weiss@fairphone.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

as it says on the can

drm/msm patches for Rob
arm64 patches for linux-arm-msm

for use with https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25408

tested on QCM6490 (SC7280-IOT) Fairphone FP5

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (7):
      drm/msm/a6xx: Fix unknown speedbin case
      drm/msm/adreno: Add ZAP firmware name to A635
      drm/msm/adreno: Add A635 speedbin 0xac (A643)
      arm64: dts: qcom: sc7280: Add ZAP shader support
      arm64: dts: qcom: sc7280: Fix up GPU SIDs
      arm64: dts: qcom: sc7280: Mark Adreno SMMU as DMA coherent
      arm64: dts: qcom: sc7280: Add 0xac Adreno speed bin

 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi |  2 ++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 26 ++++++++++++++++------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  2 ++
 4 files changed, 24 insertions(+), 8 deletions(-)
---
base-commit: 4ae73bba62a367f2314f6ce69e3085a941983d8b
change-id: 20230926-topic-a643-a7ec9a08a3a1

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

