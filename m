Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B017F8B49
	for <lists+freedreno@lfdr.de>; Sat, 25 Nov 2023 15:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C4610E070;
	Sat, 25 Nov 2023 14:17:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B0E10E00C
 for <freedreno@lists.freedesktop.org>; Sat, 25 Nov 2023 14:17:42 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9fa45e75ed9so393271666b.1
 for <freedreno@lists.freedesktop.org>; Sat, 25 Nov 2023 06:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700921861; x=1701526661; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OPB29h8XgdVf8/Mj7J0oGuHQzVyt4cdj+mVXkBfm3j0=;
 b=VS+g3x8t651CuG8IgvieWi0gDidLA/w/8GRqMD3NHfw5Uuk51l5k2teJTgYQuNwp1Z
 PVAinIfdulp35LmhzoZUxV6b3iypFfjHYBbXHPQrtJy1OGUQ/p72MNUhrfQS8Wc8Xa7O
 idJxryhgvLtwQgxFjnvtmkT9QeA30IzgBNeb1TB8E1Tdd2CAwRpR3CmgCazgOBM2lQeG
 YbdyuT0YBpZvjnzbNQ7mYA4VN8p/Xy428/ReE8YYvGs2xeX2uWLKcZyOJR8yXTGM5dwP
 /a8KeaQ8xvLBlAn4oTciZJkGfZLYu5WOa+TscZ277dgAoesWRCnfPdRiOUAcEoB/Js5W
 uiOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700921861; x=1701526661;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OPB29h8XgdVf8/Mj7J0oGuHQzVyt4cdj+mVXkBfm3j0=;
 b=lp9V6JnyKyida27ylms+QFMsM1cX17JBzKWeXuzXuuWN4iSKBFnYO+7YiNX2ZLrI8D
 PmBlzUJACw5wIDovd/pOqkBL/ptQnRElRyUwkmkpWuxm+BBFicV6/m22/Q7EQ6KtNOV3
 9o9hdGGhEgRy85YfeSCsdcPOLH96rUm/jpPPFWcG3V++1SPXGY1cP8vPjVCoc52zfUnF
 ilAJRsYtvP5zJANTXwJ8Z/v0qn5gu8wPIwDn91BGOKRnkvfYBbKzlyrsu92jYRdmT8VS
 NpkK973urgAjcdd3ZfYL2c4rMtuEkeLD9j6AghxKAiqFsY8rgy8bvYiyNnbKi4n3nXxv
 4vkw==
X-Gm-Message-State: AOJu0Yy+YkcBC1/XWpHxtoIk395p2k75QgDHLihS52MOEE//S7SgP8FQ
 A1zfzGIm+UJp3YDOxfcsqPXyiA==
X-Google-Smtp-Source: AGHT+IFshDaGZpoZ0UPNN73yo2NyaQpJ6p9P/hDNUi+51RGYJObtCtzb4JKAHb0PVhKI46jF5+kwvQ==
X-Received: by 2002:a17:907:2da9:b0:9fe:38b7:4278 with SMTP id
 gt41-20020a1709072da900b009fe38b74278mr5932250ejc.16.1700921861162; 
 Sat, 25 Nov 2023 06:17:41 -0800 (PST)
Received: from [10.167.154.1]
 (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
 by smtp.gmail.com with ESMTPSA id
 19-20020a170906319300b00992b8d56f3asm3500345ejy.105.2023.11.25.06.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Nov 2023 06:17:40 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 25 Nov 2023 15:17:28 +0100
Message-Id: <20231125-topic-rb1_feat-v1-0-11d71b12b058@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPgBYmUC/x2NywqDQAwAf0VybsBEtof+SillH7EGZJWsLQXx3
 w0eZ2CYHZqYSoNHt4PJT5su1YFuHeQp1o+gFmfgngciDrgtq2a0RO9R4oalBOrDwHemBB6l2AS
 TxZonz+p3nl2uJqP+r8vzdRwnnFqtGnUAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Georgi Djakov <djakov@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700921858; l=1962;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=qqo1HkU087mhGcmOMVz6Ckg9V4Z4NTeii2LcjxJBNPM=;
 b=o1M6AdcRS2Gq88RD4ObPcOl1SXOsPSOZLeS6wO63F2KLCgkoaV13h/mDN9e0icg6ZaSnsLQtx
 31OcGhoRmcSBrN5eyR4Y9Mh5bTUkFIRHMYG7GFIXZPhZa5DwwDHyDfD
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH 00/12] RB1/QCM2290 features
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, iommu@lists.linux.dev,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This series brings:
- interconnect plumbing
- display setup

for QCM2290/QRB2210 and

- CAN bus controller
- HDMI display
- wifi fw variant name

for QTI RB1

and the necessary bindings changes

Patch 1-4 is for Dmitry/freedreno
Patch 5 for Georgi/icc
Patch 7 for Will/iommu
the rest are for Bjorn/qcom

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Dmitry Baryshkov (1):
      arm64: dts: qcom: qrb2210-rb1: add wifi variant property

Konrad Dybcio (11):
      dt-bindings: display: msm: qcm2290-mdss: Use the non-deprecated DSI compat
      dt-bindings: display: msm: Add reg bus and rotator interconnects
      dt-bindings: display: msm: qcm2290-mdss: Allow 2 interconnects
      dt-bindings: display: msm: sm8450-mdss: Allow 3 interconnects
      dt-bindings: interconnect: qcom,msm8998-bwmon: Add QCM2290 bwmon instance
      dt-bindings: firmware: qcom,scm: Allow interconnect for everyone
      iommu/arm-smmu-qcom: Add QCM2290 DPU compatible
      arm64: dts: qcom: qcm2290: Add display nodes
      arm64: dts: qcom: qcm2290: Hook up interconnects
      arm64: dts: qcom: qrb2210-rb1: Set up HDMI
      arm64: dts: qcom: qrb2210-rb1: Enable CAN bus controller

 .../bindings/display/msm/mdss-common.yaml          |  18 +-
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml    |   8 +-
 .../bindings/display/msm/qcom,sm8450-mdss.yaml     |   4 +-
 .../devicetree/bindings/firmware/qcom,scm.yaml     |  15 -
 .../bindings/interconnect/qcom,msm8998-bwmon.yaml  |   1 +
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              | 462 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 109 +++++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         |   1 +
 8 files changed, 594 insertions(+), 24 deletions(-)
---
base-commit: 8c9660f6515396aba78d1168d2e17951d653ebf2
change-id: 20231125-topic-rb1_feat-dd510532621b

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

