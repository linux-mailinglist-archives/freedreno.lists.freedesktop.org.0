Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 248FF85A4BB
	for <lists+freedreno@lfdr.de>; Mon, 19 Feb 2024 14:36:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C57E910E22A;
	Mon, 19 Feb 2024 13:36:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JKUO6HE7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6711C10E221
 for <freedreno@lists.freedesktop.org>; Mon, 19 Feb 2024 13:36:04 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-563c2b2bddbso5786533a12.1
 for <freedreno@lists.freedesktop.org>; Mon, 19 Feb 2024 05:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708349762; x=1708954562; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gcUcBFt3N1ktfXc1gPHrIeslPQYkGz8L1uvDW7LPc+w=;
 b=JKUO6HE78hlrkB68rhG1lexq8uOeRNXvKynKJ4nUZ1bz0ubhx0O+KYz9EScAawxGPo
 PHaOW6toUok8weD0lsDFjzPSoq8i2DFEiwZGwZvEeEpO8c/zoB6bi27qqUVVhn1zI4j7
 z/AJh7lf6Pxe2tcGLdvofAG8bMFB5+v5z0MpAsEe8gPhiCL4JHGcJPD2zYt22/GawK3+
 j4043dqSpb1uBW+e4uW4aMCCckJUdqV4lwMTuCb+AsgelqtTSKqF/kvp4CcNajQt9jC9
 DMdJKr4vH9JmyICwfuEOuD6iCnWC+cxNi5z8SfdbKJJ7v5O89LCZfLA3K9hqXkQHnrD1
 3Ofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708349762; x=1708954562;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gcUcBFt3N1ktfXc1gPHrIeslPQYkGz8L1uvDW7LPc+w=;
 b=ZBr4IxfN9aSMyrAx26IT1mJaQqb7cofLoVlgWWfSlWU8oak+s2smD0avbSkbxIY/DI
 Fedlp28Bs0gDm7uT7aYbpf+8NUmRFeowLMCR1h57T8nK6FtKu9CHuM9kOJRv/XSXfv2M
 +iCgZ/o0olwPA5kS2ugFobFcdwq+FKDxO68wqXAzTVpFOntngCFGEYvUISCUyHrtUmPD
 c8sF3dQez6y8ktb3ViE4drEIh4DDE4LPxLF3LXscrHYRgID1gPZ9aN3hnzyZz6+ADdWc
 lIDLrVWkdYjzb+qwvof5+bkNYzDT6XLsryVrOMc4HQvcq8lUIMhBo+dDVulzrfpbp0fs
 8AgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSXlXgwMW9MIkn5PXi/ion/K2XHQ9PKwhUGXjDbRttWiz+oqhhqK6zWrnlHUe3ir8cyrKzp6Io4pZiENR4etR9eQkryt1rDnkIb+HnhPcF
X-Gm-Message-State: AOJu0Yxqbo9PBoT+3tscU1Eq3gnxxp5PpZcseAO5AmUvdm3B0PwiiaHh
 3altQfrNfZYRR+umMYy38V+WZHYO96bTdPdL1OsdDDKiVbfxpNBvXpAB7g/3AkU=
X-Google-Smtp-Source: AGHT+IGXVYgMnspzTGdD5I5yCYByz/Xz0DYxnqQrqWXrukEzL4VS6LpQJbj3an4OOgf2z4QtP93W8g==
X-Received: by 2002:aa7:ca42:0:b0:564:8a4c:6389 with SMTP id
 j2-20020aa7ca42000000b005648a4c6389mr1158711edt.29.1708349762517; 
 Mon, 19 Feb 2024 05:36:02 -0800 (PST)
Received: from [10.167.154.1] (078088045141.garwolin.vectranet.pl.
 [78.88.45.141]) by smtp.gmail.com with ESMTPSA id
 q29-20020a50cc9d000000b00563a3ff30basm2900168edi.59.2024.02.19.05.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 05:36:02 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/8] A702 support
Date: Mon, 19 Feb 2024 14:35:45 +0100
Message-Id: <20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADJZ02UC/x2N7QrCMAwAX2Xkt4F+DKm+ioi0MW6B0ZXUiTD27
 gZ/3sFxO3RW4Q7XYQflj3RZq4E/DUBzrhOjPI0huDC64C/4XpsQavGPqW0YmRKdU3QxjWBNyZ2
 xaK40W1W3ZTHZlF/y/U9u9+P4AeWy2Vh0AAAA
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708349759; l=1949;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=WXBvHj3CA0v2OnyyONM79OOqbce5c/wCncuFj1EY8Yk=;
 b=09HBvpU95Fn5jEyPMGkTjAUJ7bgcBbYWScXmo1xRIJoHiVGqrahpUaQv4TEKCcp57yd+6yD83
 XmQfcZAl71LB20l4ZsL60dx0F34PqpOR8hRCzmP4MVy3+krdyvQCBY6
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

Bit of a megaseries, bunched together for your testing convenience..
Needs mesa!27665 [1] on the userland part, kmscube happily spins.

I'm feeling quite lukewarm about the memory barriers in patch 3..

Patch 1 for Will/smmu, 5-6 for drm/msm, rest for qcom

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27665

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (8):
      dt-bindings: arm-smmu: Add QCM2290 GPU SMMU
      dt-bindings: clock: Add Qcom QCM2290 GPUCC
      clk: qcom: clk-alpha-pll: Add HUAYRA_2290 support
      clk: qcom: Add QCM2290 GPU clock controller driver
      drm/msm/adreno: Add missing defines for A702
      drm/msm/adreno: Add A702 support
      arm64: dts: qcom: qcm2290: Add GPU nodes
      arm64: dts: qcom: qrb2210-rb1: Enable the GPU

 .../bindings/clock/qcom,qcm2290-gpucc.yaml         |  76 ++++
 .../devicetree/bindings/iommu/arm,smmu.yaml        |   3 +-
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              | 154 ++++++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |   8 +
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-alpha-pll.c                   |  45 +++
 drivers/clk/qcom/clk-alpha-pll.h                   |   3 +
 drivers/clk/qcom/gpucc-qcm2290.c                   | 423 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx.xml.h              |  18 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  92 ++++-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  18 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  16 +-
 include/dt-bindings/clock/qcom,qcm2290-gpucc.h     |  32 ++
 14 files changed, 888 insertions(+), 10 deletions(-)
---
base-commit: 26d7d52b6253574d5b6fec16a93e1110d1489cef
change-id: 20240219-topic-rb1_gpu-3ec8c6830384

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

