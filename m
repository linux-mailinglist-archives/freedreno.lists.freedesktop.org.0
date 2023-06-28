Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6666C741663
	for <lists+freedreno@lfdr.de>; Wed, 28 Jun 2023 18:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF97310E371;
	Wed, 28 Jun 2023 16:29:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880BB10E36B
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jun 2023 16:29:49 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f95bf5c493so8383873e87.3
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jun 2023 09:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687969787; x=1690561787;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Fv+nnH2B7s3Kiy0RTUWblii9XdXfwfCtrzuvTKHkpeU=;
 b=CZcejYtHPILXXQToUbqjBhLbjLUpOKCuKoNjV3bSegFYY/Vt0r+4lVQyemyBzgoo61
 uzPQZbDZituIdChBvflV0LBSBDeaUOuXp6uBD2Qcr8UJbCiePE+jfktc01SFzcVvzISL
 5HSX4oNYw3j9btjxkiIgqdSvqiirIKmIescYShQ3ODKkP1QyN7y1RLzovz8paKLEi4Xi
 uhKeJqliTAnLodjQuUlJOEuTdmL9qn1CcuxHcF/aBeXD+m9OrMMn3NfEzypldmpcHMcf
 DmOW5Q7Pl9zfbykk7J/Ij2f2g9K4x9QmWkJz+Wm9c3/r0RElF/lhxdV4akvGlTJEBuaI
 M11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687969787; x=1690561787;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fv+nnH2B7s3Kiy0RTUWblii9XdXfwfCtrzuvTKHkpeU=;
 b=UGIktzmaNV+sU3eHc7v2l5igWTDp/SsbiJ5TLUrcpd5pJ48y8ddGDH+PZwtyDQg9Ed
 sp49qVwQR5BtcVhYt8S6BwhN7G7GaFHWwyW2nRSBZ0jjXQapWKVDsFnS+tr0q2VtRg6/
 3UZbclBQpG5QCbcOWO4Qe+fy+nD1um0kCXFpArGUXJvqI2B0pqjbE1LakAR7dJ1/47DY
 jzUCRFVPfvbzAhtJxXxMl9swX8f6KpAq/qWXZrO0DAEfUW35kyLHhxbCp3U64d1KuXvB
 zACdIQawSnXRxc1rLNWRGFcHH8IBkP1vmSt2IgKhjU29kw5kZzxfzgrTPGctLUVFE7B3
 IfYg==
X-Gm-Message-State: AC+VfDz7ETeIfVtxw126b1Vuwp0KtRdJAEpVpwYwaA3Se9uh5yuqdhQt
 FSsUbmNMdd7RInhtvhK0ixkabA==
X-Google-Smtp-Source: ACHHUZ7NMzvXP35Yr8l/CMTU4UY0aUmkhMEQ89vTtZYdjgV08nImSjfbvDaWNhHOfv1D56iCp3DsTw==
X-Received: by 2002:a05:6512:3b1e:b0:4fb:976f:c3ed with SMTP id
 f30-20020a0565123b1e00b004fb976fc3edmr344569lfv.69.1687969787104; 
 Wed, 28 Jun 2023 09:29:47 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
 by smtp.gmail.com with ESMTPSA id
 v28-20020a056512049c00b004faeedbb29dsm1678783lfq.64.2023.06.28.09.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 09:29:46 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 28 Jun 2023 18:29:44 +0200
Message-Id: <20230628-topic-refgen-v1-0-126e59573eeb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPhfnGQC/x2NSwqEMBAFryK9tiGJv2GuIi6S2GqDtJLMiCDe3
 cZlFa94F2RKTBm+xQWJDs68iYItC4iLl5mQR2VwxlWmdR/8bTtHTDTNJGjrKZjQtc7aBjQJPhO
 G5CUuGsl/XVXuOubz/eiH+34AX5jDUHMAAAA=
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687969785; l=1224;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=UePCk4lk29C4m1NxcwF4mvfWHL33pC6ic/uMKeTErak=;
 b=1+YjJdCXaHWqHIJzXWRTL6yHKudHs5qrlQHXSCz/uTdOGv6PoEUPTid8RoPtf8Le0vRoEDv2Q
 ZjKIU6O+0BlD1xHOIUN3oFp4+RmQ4co4kDHo+em0s6u+S5NeeU/V8Qd
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH 0/4] Qualcomm REFGEN regulator
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Konrad Dybcio <konradybcio@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Recent Qualcomm SoCs have a REFGEN (reference voltage generator) regulator
responsible for providing a reference voltage to some on-SoC IPs (like DSI
or PHYs). It can be turned off when unused to save power.

This series introduces the driver for it and lets the DSI driver
consume it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (4):
      dt-bindings: regulator: Describe Qualcomm REFGEN regulator
      regulator: Introduce Qualcomm REFGEN regulator driver
      dt-bindings: display/msm: dsi-controller-main: Allow refgen-supply
      drm/msm/dsi: Hook up refgen regulator

 .../bindings/display/msm/dsi-controller-main.yaml  |   4 +
 .../regulator/qcom,sdm845-refgen-regulator.yaml    |  56 ++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |   2 +
 drivers/regulator/Kconfig                          |  10 ++
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/qcom-refgen-regulator.c          | 187 +++++++++++++++++++++
 6 files changed, 260 insertions(+)
---
base-commit: 5c875096d59010cee4e00da1f9c7bdb07a025dc2
change-id: 20230628-topic-refgen-14fb0b762115

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

