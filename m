Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C71F96AAAF5
	for <lists+freedreno@lfdr.de>; Sat,  4 Mar 2023 16:55:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B823910E1AA;
	Sat,  4 Mar 2023 15:55:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D47410E185
 for <freedreno@lists.freedesktop.org>; Sat,  4 Mar 2023 15:55:46 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id bi9so7365779lfb.2
 for <freedreno@lists.freedesktop.org>; Sat, 04 Mar 2023 07:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677945345;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jvBErRoqm3lY280h1zXnp9L55kLV0ZvERd9QGERMZk0=;
 b=O530C15Dk5P92Jyc3p754/LTxJVuxXzxfVdSo1CceSiZ/uBmenRkTTdU83CHpJ/W8S
 pGGCOnbWB8HZJjqI5XMICGE79iumctyUb2u0wWzDhAmfgf/CVQouUXTbrxnIHh12rWwE
 n0jtCTrElZ4nZdboOkfB9EAkx0c4vFPUN9Gnxan+pS9t0VGfq8vcGour3VzFPa7LGrrI
 sBhkopkkyhIxvWEidc7Bt+gR2W3dTMt7JSieXjp03D6JexqKMs+sHCkbh5wZNek8zBti
 +fZqPsfnEydAVqe+LibzGtxO02dR/nocuUoG7xzM9OgIlvTH8XB7dyIXI+zqef4ZD4ZD
 umkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677945345;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jvBErRoqm3lY280h1zXnp9L55kLV0ZvERd9QGERMZk0=;
 b=DfMTmFKxjE9miWDho1+kNKczsmwpKRTfPFanFDjueoqHgp/9z8s1pBOM+8JjvAD7PG
 uHiIoVRb+Nmquqmu7Lr4E4NcaolN+9hvfigQvdPDxO5HVxkVfryzypu7CKrF74t5tw6W
 wHpAmJKqX0bnxXokuXYqoZdO5089nOoa63xkza1PCruKbcrsL0wSiqepzu1RI9ypXyLp
 DJtW+JLUsE4agb89ZaIAMCJ/676yJoYJ8IgkP7lVHA6oCJU0DWNj6CZ2mh6M/bZSV/Xi
 fj9yyPdk8/COzm1QUPsGo0PLIYsGC0xVepqtQC1oomwr2l+KtaRlAILxD/Hv2wO3utvV
 EPCQ==
X-Gm-Message-State: AO0yUKWRevwL+Q11kWDfP1Yi1EbaOJslV7nLO6Lo5zYwYSfWfVVTcrDu
 941EeW8pN9qOVkeMhSbuP6Mgdg==
X-Google-Smtp-Source: AK7set8KOZTcrEgSViYUT8+/JuiRsQF2/CWi9cU07gaiHA9gzo1vPwHlvZYKzCpHuhYNq0l4GhCh8A==
X-Received: by 2002:ac2:539a:0:b0:4cc:b784:c47e with SMTP id
 g26-20020ac2539a000000b004ccb784c47emr1347925lfh.62.1677945344811; 
 Sat, 04 Mar 2023 07:55:44 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a19550a000000b004b40c2fccfdsm864128lfe.59.2023.03.04.07.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 07:55:44 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 04 Mar 2023 16:55:33 +0100
Message-Id: <20230304-topic-dsi_fixup-v3-0-b8565944d0e6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPVpA2QC/x2NWwqFMAwFtyL5NlCsKLgVuVz6iBqQWhoVQdy7w
 c8ZznBuECpMAkN1Q6GThbekYOsKwuLSTMhRGRrTWGNNi/uWOWAU/k98HRkpuMn4aH3f9aCVd0L
 oi0th0S4d66oyF9L1dzP+nucFYN0nX3YAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677945343; l=977;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=sojen1tNSazgZyI7QKDlibLxXXzdkvEAKi6a519TMNU=;
 b=DKUQEnpcLchWHA3fR4VGAWDLMwMgmJZgjmhoXi4gGhRHfaX1rBfihIbshAJ1iH2WVCqIUs2bIqh5
 U+rtbkY2AE/yWv+BKxOOkjb5jk+DIae25uRNI8senvOGM+qPizP9
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v3 0/2] Fix up Qualcomm DSI bindings
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

v2 -> v3:
- Deprecate "qcom,mdss-dsi-ctrl" correctly instead of removing it [1/2]
- Remove the note about separate driver logic, as it's gone now [2/2]

Depends on:
https://lore.kernel.org/linux-arm-msm/20230213121012.1768296-1-konrad.dybcio@linaro.org/

Link to v2:
https://lore.kernel.org/linux-arm-msm/20230217111316.306241-1-konrad.dybcio@linaro.org/

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      dt-bindings: display/msm: dsi-controller-main: Fix deprecated compatible
      dt-bindings: display: msm: sm6115-mdss: Fix DSI compatible

 .../devicetree/bindings/display/msm/dsi-controller-main.yaml      | 2 +-
 .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml         | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)
---
base-commit: 9a33780f72f64c1cd151d84a9959f58a13b0c970
change-id: 20230304-topic-dsi_fixup-ecaf0bd3b767

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

