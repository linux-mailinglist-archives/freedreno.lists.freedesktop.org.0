Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA1A74C0D7
	for <lists+freedreno@lfdr.de>; Sun,  9 Jul 2023 06:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD3110E19D;
	Sun,  9 Jul 2023 04:19:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1549E10E040
 for <freedreno@lists.freedesktop.org>; Sun,  9 Jul 2023 04:19:30 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fb7589b187so5161131e87.1
 for <freedreno@lists.freedesktop.org>; Sat, 08 Jul 2023 21:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688876368; x=1691468368;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EV4gjfG2h9+eMvOMzJqwLX08mwvLdctC3KQGCJDlteI=;
 b=oUe1HSUEOwKt3tiPcKQxZTqky8YJ/J+TVVTVJj49EcfWUiAmpnIpIL4mSIlM+26kN1
 7FytEkFeH+4Dk8yENbCXnUWqPEujUkFqs8dkiJ34/aNjAc75DlS/CZH+/AyUsm0JNMW/
 tbREqo3Bq+zUlRHLAvNnXxU0ZwRfPWhQta25cLhr+QrIhmcb2PX4p80IfDodhXaPBTiX
 /PNWNGwg36b6LybvKeFPpCQE1IFLxwV84klPqcxO68hzFf7D6tSmGwmfE09sVu3YrUPY
 tr76tP/441urfBW1eIl2NKwvZEQECSL6WTNVQhQZQ3iJFhZ9UbS8QE4FiIemR42K4C/V
 IV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688876368; x=1691468368;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EV4gjfG2h9+eMvOMzJqwLX08mwvLdctC3KQGCJDlteI=;
 b=e3/g04puzMWRBiDS6zOyF5tE2nggnj1+Q2cdAJmbmQlRF1XRWylPNN+WWxdqy7DYMg
 FmU0KvHhm1opneUclw3Bo51ZjeuWQppn34ZdCCC6tCws403fSD9RKp2yo8bvlEvJyeWh
 y2QuTv0Usk9KaHs/fWjwt+HRZcmbE3+fEVwD6VXPU9Oc6KUdTwJDCH5QmYhdWnmeNVwN
 Q1/8PputJYnJeedoVv9+6P0UzSCY5aInYQ3bIRudIjydSiPxNwyr9eMxyTvVXzRUHVvu
 r5EoVSx80AuWovrYnPw52o2m5ehjU4bdFaiwZbj0bOY2shjHYNSPuR7U1fm2XR0nFnQl
 8EcQ==
X-Gm-Message-State: ABy/qLbh/7sJh0XGSrZ0nDGR5lzcrTV945nIG4oekpoOspMofNA609jd
 c+insesZXvJnW4hJ1Ebg8qJjuA==
X-Google-Smtp-Source: APBJJlH1hMwnX24K5ue0eNJ38qb9anodescAmVYDk03Umy+uJIqB4CCuAZUizF0XtCaD0pLclhdRKA==
X-Received: by 2002:a19:655a:0:b0:4fb:7cea:882a with SMTP id
 c26-20020a19655a000000b004fb7cea882amr6224939lfj.3.1688876367751; 
 Sat, 08 Jul 2023 21:19:27 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 r11-20020a19ac4b000000b004fb8603f6e0sm1205851lfc.12.2023.07.08.21.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jul 2023 21:19:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sun,  9 Jul 2023 07:19:21 +0300
Message-Id: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/5] arm64: dts: qcom: qrb5165-rb5: enable DP
 support
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Implement DisplayPort support for the Qualcomm RB5 platform.

Note: while testing this, I had link training issues with several
dongles with DP connectors. Other DisplayPort-USB-C dongles (with HDMI
or VGA connectors) work perfectly.

Dependencies: [1]
Soft-dependencies: [2], [3]

[1] https://lore.kernel.org/linux-arm-msm/20230515133643.3621656-1-bryan.odonoghue@linaro.org/
[2] https://lore.kernel.org/linux-arm-msm/20230709034211.4045004-1-dmitry.baryshkov@linaro.org/
[3] https://lore.kernel.org/linux-arm-msm/20230709034808.4049383-1-dmitry.baryshkov@linaro.org/

Dmitry Baryshkov (5):
  dt-bindings: display: msm: dp-controller: document SM8250 compatible
  arm64: dts: qcom: sm8250: Add DisplayPort device node
  arm64: dts: qcom: qrb5165-rb5: add onboard USB-C redriver
  arm64: dts: qcom: qrb5165-rb5: enable displayport controller
  arm64: dts: qcom: qrb5165-rb5: enable DP altmode

 .../bindings/display/msm/dp-controller.yaml   |  1 +
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts      | 72 +++++++++++++-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 93 +++++++++++++++++++
 3 files changed, 164 insertions(+), 2 deletions(-)

-- 
2.39.2

