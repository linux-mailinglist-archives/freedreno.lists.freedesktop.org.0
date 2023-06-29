Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BCD742E75
	for <lists+freedreno@lfdr.de>; Thu, 29 Jun 2023 22:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32CD510E0A3;
	Thu, 29 Jun 2023 20:35:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B06A10E077
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jun 2023 20:35:50 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b6985de215so18600591fa.2
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jun 2023 13:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688070948; x=1690662948;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=roO8YrYj9iIU3EjCKgeaxJFuC8MlkPexoI9WwcBfk4M=;
 b=aL7DwfgqS2nZOiWfMRKgRg8GCSGzlLizCKplh1fLS7f0H0fS9RRyV871dMs8WEpx6O
 w2yXTGUAqCaC4PQ4CyZ6Wc07E/VzuxRZMu5S3YL1y7OHJCBS0fu0DFmco7gDPNyz1XJL
 ZyRB+h+o6KOPBJpUbV/o8vmFXFaH8fLdq1WCNby99S+hpY6hSaYbclB/VXz9P3t3ouKj
 zmCzSJfOkn5Urm2mTYCi6chGG6rBubDwoGWAm3nUK6z6XxAiJuyLFFnK96TKahXHgQzb
 UcYsOdaZonTln2aa+cWXjc+6wBy5uoit5M1ysqAUf8XPnygDkQ0rR5C8qvKO4AHxbnQM
 VUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688070948; x=1690662948;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=roO8YrYj9iIU3EjCKgeaxJFuC8MlkPexoI9WwcBfk4M=;
 b=EiLWnxvLIzy64aluPGKJoxOixxd2WRB2nN9oYQPF9ytyecBX6Tjg1L3yw2m/q2DJn1
 RU5zoc67iG2XCZM6A9BTkxkK++qlgG3Iv9a3Y8RCbZjF3qqkuqhQlLByMpooREp02bi8
 ugAYaNJc2KbMx+y2j+f5owosnbel/UQ53AboddlCMCRSWfxlXuZLm5ZmUkzluUOChh7M
 b1F7+R2exbga1ig7355hwjgNqypOzesT3MvfUOtEjiAb52+IRSuLrK/RvkaRhpb8JKvR
 wYUweDo4b4njCMTEBmYK8iU+RPS6Yn5WiyQySLDEi71O0VOk06tcsaXrSVjeFX4dpcMp
 0gXw==
X-Gm-Message-State: ABy/qLYiue8CmCmhBvNIAw2ZJWTYwA/rSLlhNAqITfFSZb5DviAb6+gE
 KpqG6syUCeqZQob96kCYF4SwKQ==
X-Google-Smtp-Source: APBJJlHmYuIe4jmQmUOHf4LS1a4x4RFAsAsgFkB5nTh0ZJKctX3XwebQ8qIYR4nQuF0TAC/qNt9f0g==
X-Received: by 2002:a2e:9059:0:b0:2b6:9f95:46d9 with SMTP id
 n25-20020a2e9059000000b002b69f9546d9mr545726ljg.46.1688070948029; 
 Thu, 29 Jun 2023 13:35:48 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a2e2403000000b002b6b849c894sm1136008ljk.111.2023.06.29.13.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 13:35:47 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 29 Jun 2023 22:35:40 +0200
Message-Id: <20230628-topic-refgen-v2-0-6136487c78c5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABzrnWQC/3WNwQ6CMBBEf8Xs2TVtEVBP/ofh0OICm5CWbJFoC
 P/uyt3jm8ybWSGTMGW4HVYQWjhzigrueIB28LEn5KcyOOMKU7kLzmniFoW6niLacxdMqCtnbQm
 qBJ8Jg/jYDirF1zhqOGmZ3/vHo1EeOM9JPvvlYn/pn/XFokHrKiqvZV0QhfvI0Us6Jemh2bbtC
 3Xqv2i+AAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688070946; l=1730;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=o6C8T/LQ49ia1cOEpHXglcMRSGrmiGdpXmYAdGtJ7Z4=;
 b=Ex0q08xmxL6AcV018TpSZ/b4gyImH8vj9XCXXL2F+XrwzPusRQOEc3gsYGh6Q8WErt/Xl22a6
 YSziOTXpLASAMFu25y+vL3MkzJtUXbIUQz/3N+4VTUznwyJ2mRR5a7+
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v2 0/4] Qualcomm REFGEN regulator
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
 drivers/regulator/Kconfig                          |  10 ++
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/qcom-refgen-regulator.c          | 154 +++++++++++++++++++++
 6 files changed, 228 insertions(+)
---
base-commit: 5c875096d59010cee4e00da1f9c7bdb07a025dc2
change-id: 20230628-topic-refgen-14fb0b762115

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

