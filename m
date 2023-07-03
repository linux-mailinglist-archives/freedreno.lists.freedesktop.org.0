Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA8D7461E3
	for <lists+freedreno@lfdr.de>; Mon,  3 Jul 2023 20:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B971510E220;
	Mon,  3 Jul 2023 18:16:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B5CD10E0BA
 for <freedreno@lists.freedesktop.org>; Mon,  3 Jul 2023 18:16:01 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b69923a715so73406061fa.0
 for <freedreno@lists.freedesktop.org>; Mon, 03 Jul 2023 11:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688408159; x=1691000159;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QTb+nXJp46q8JDCpV9EvFgYbL4krB6DdNBmj86VEcFo=;
 b=XuZ6q3VRsc5ysNSSfsmGf3gsLeCvE1lGP2VNQwr+GWLbH8tuBgj7maui1ViU+F5QnS
 a4nwNpK4WsD5x/XEw/yyC+NHBu5be9jZpSd7SBcJYsEeA4xiBua1PIfBd2sw8N0p0s/9
 WKUczo7kHoFvD6ea02hfGzGC0caphZjYO8Xmmde4RvG7RNV/XFlcqtJ9FcRotHD6z+NM
 xLYFJWCq8bCkogJ86G6z5RwbVjuL02LBOLHRMswnUfFTzXvZT0lJrkjpZ8nAo6WCDwIc
 kzwDeuWb3kXyK53ee3e3SgMoJZFikYmbsZKsOopOkx2AnjQyWLRDOv5nZMRYnqgoq3zQ
 xzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688408159; x=1691000159;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QTb+nXJp46q8JDCpV9EvFgYbL4krB6DdNBmj86VEcFo=;
 b=V2onclJ4O9IfBek6bas1DbwhJYVtko6OeJ3H3yUlXC1c2hoAOiCdgRukfHrMOb9biJ
 bUbe1EyIkQW3DVmBr0su0uC1U5yy1XxpT6hYMwyqA//Q80loY61u6rtlgOMfoDI1426y
 xC5FRyVLKT2pX8V0RmNk1j6FE4LEZMJNST/fe760+FBRYCmIdQ1AF8mw73fPWupubtru
 wYnzK4GgkGiZVh3/fSzPvuqsu6HT/mD4b66utAhRADgOC2aGdEP4GbSBquKwoqSeVoub
 i1app2DqtCW5pXGwAywUSkGzqaHptnazRrWivJq0jd9yrT5VFj9eXVZe8SAq7FKlEoS5
 g/Xw==
X-Gm-Message-State: ABy/qLbqOTIEVRZxevrP7DQupda5IWNOWYhAXkVmiZzKx+XK4dKKGwRU
 I93calOYSgYZStz3G7pv+GaAmg==
X-Google-Smtp-Source: APBJJlG0xwPkH81x0r1EHWM3a5V/GX1Xj4goSnJifgUtJ4oyaEqa+JWCs3kuS1MhflC4Xn2C133tSw==
X-Received: by 2002:a19:2d05:0:b0:4fb:8e1b:ba05 with SMTP id
 k5-20020a192d05000000b004fb8e1bba05mr7952874lfj.11.1688408159219; 
 Mon, 03 Jul 2023 11:15:59 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a056512390600b004f1383d57ecsm4633034lfu.202.2023.07.03.11.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 11:15:58 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 03 Jul 2023 20:15:53 +0200
Message-Id: <20230628-topic-refgen-v3-0-9fbf0e605d23@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFkQo2QC/32Nyw7CIBREf8WwFsOjQHXlfxgXgLctSQMNVKJp+
 u/edudCl2cyZ2YhBXKAQi6HhWSooYQUEeTxQPxgYw80PJCJYEIyLVo6pyl4mqHrIVLedI45owX
 niqDibAHqso1+QCk+xxHDCcvhtX/c7shDKHPK7/2y8i39sV45ZZQLDeqsjARw1zFEm9Mp5Z5sS
 1X8swXamkvdtMab1qsve13XD8P2byn8AAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688408157; l=1915;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=3ESCbgZ3PrD9wdJUC4E4i1ivhrr8hMCGWLtTU5VEbiE=;
 b=lVsR+3/ZTGKIrLGUE+kXfNb+uXPVJuPxZnKBT6Vi1scMbUIju2H2BmbC+EPLt8/QOISbRw6xR
 0GP4K7edxsvAYyTe+5BUX/I6zfBEYtpiezeRluPx78MvRquvBpGgf0t
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v3 0/4] Qualcomm REFGEN regulator
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
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
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
Changes in v3:
- depend on HAS_IOMEM (s390 build failure, meh)
- constify regulator_ops
- Link to v2: https://lore.kernel.org/r/20230628-topic-refgen-v2-0-6136487c78c5@linaro.org

Changes in v2:
- Remove "|" from bindings description
- fix 'renegator' typo
- define number of 'reg'
- adjust reg= to size/address-cells = 1
- fix regmap usage
- use C++ comments for the header
- remove now-unused struct qcom_refgen
- use common helpers for sm8250 refgen (simple bit ops)
- add missing FIELD_PREPs (small brain forgot regmap_update_bits
  doesn't do shifting)
- pick up tags
- Link to v1: https://lore.kernel.org/r/20230628-topic-refgen-v1-0-126e59573eeb@linaro.org

---
Konrad Dybcio (4):
      dt-bindings: regulator: Describe Qualcomm REFGEN regulator
      regulator: Introduce Qualcomm REFGEN regulator driver
      dt-bindings: display/msm: dsi-controller-main: Allow refgen-supply
      drm/msm/dsi: Hook up refgen regulator

 .../bindings/display/msm/dsi-controller-main.yaml  |   4 +
 .../regulator/qcom,sdm845-refgen-regulator.yaml    |  57 ++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |   2 +
 drivers/regulator/Kconfig                          |  11 ++
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/qcom-refgen-regulator.c          | 154 +++++++++++++++++++++
 6 files changed, 229 insertions(+)
---
base-commit: 296d53d8f84ce50ffaee7d575487058c8d437335
change-id: 20230628-topic-refgen-14fb0b762115

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

