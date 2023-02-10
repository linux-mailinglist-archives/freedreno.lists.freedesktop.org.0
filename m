Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5B6691CCF
	for <lists+freedreno@lfdr.de>; Fri, 10 Feb 2023 11:35:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99ED810E107;
	Fri, 10 Feb 2023 10:34:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD3310E107
 for <freedreno@lists.freedesktop.org>; Fri, 10 Feb 2023 10:34:55 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 j32-20020a05600c1c2000b003dc4fd6e61dso5946881wms.5
 for <freedreno@lists.freedesktop.org>; Fri, 10 Feb 2023 02:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8XZSQeymgbSKF089aMqGe9wzwMVmhXvBiXAbN2uEqt8=;
 b=lzHJBaJl8AJTpnefmvl94FhPLlq5ip7BTHqmKgHyD1SWYoYi7hUbDVVFdYcIfo7zu5
 hCFEn2aLgEx4wJBDAj6ZxoPX6fmiaCxqsFCU2KzGX4ehNSGESszrSq1Sd9MxOlEVb9RM
 L84COcM9LjwmBe/RAeina+Ux+fbWBOXRwlVx49HFay0j5x5lNHDVEoX8L0cQnphTT5I9
 UYoXQN9atsK9aIvcK9fWsk9FhNO49ZnW1wm24VwGEJwJSgs1bkCnZcybWGZ3WXZsKFIv
 cymIySIBkkZgxKYurb8wZqoQSkeBMQkmYKeuHI8R71dk2idM1DqXmkBdzZl05JTf9RA2
 Z6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8XZSQeymgbSKF089aMqGe9wzwMVmhXvBiXAbN2uEqt8=;
 b=uak2oEcGHQw6ke6cMQH39OqJri6B1q8Xh4dSOfhL6OIEVu4i+MWKXkYoR7rq8xBZnQ
 nP/CtTBau4PWU7J9no/KZ9vtlDffULjx8/CjU2CwVdTB7peM901iLrU4loEQnvTCPQsk
 ApY1BN1gDsDpWZzKv2D5ei0nIMDhMpXyH5Lg9jWXZ62d3xKlAPwLSZD4BUg2KLMYVWXq
 QWrqGCSSBtgaL5VQKtVFJcR8sYkX643CRqLg7tAfb1ZIC2U8Y1cMI3+zPPr5oLiUoohK
 p9758fYvNpvSIDHm28XWJzNZPkNAVCvCfIoYlab+/oLdYo+v+3f5APxXctR7CGGGY2F9
 wGSA==
X-Gm-Message-State: AO0yUKX8kS+4jPtaWxaKiz8NbPK06FYVumOHug2/0WyBFJhcRzkluA/D
 Z6T0W6BOInmEovUojZz5FTOncQ==
X-Google-Smtp-Source: AK7set9T2/fE1SAQdTpAMcLuRXTrYLj5mQyAfoiq6FSHMrseUqen3bW1riS3g/jAfnvbHBDI5yAzug==
X-Received: by 2002:a05:600c:993:b0:3e1:577:80f5 with SMTP id
 w19-20020a05600c099300b003e1057780f5mr10366027wmp.31.1676025294226; 
 Fri, 10 Feb 2023 02:34:54 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a05600c4e1200b003e00c453447sm7937958wmq.48.2023.02.10.02.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 02:34:53 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 10 Feb 2023 11:34:49 +0100
Message-Id: <20230206-topic-sm8450-upstream-dp-controller-v2-0-529da2203659@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMkd5mMC/5WOQQ6DIBBFr9Kw7jSA2tqueo/GBcKoJAhkQNPGe
 PdSb9Dle4v//sYSksXEHqeNEa422eALyPOJ6Un5EcGawkxyWXHJr5BDtBrS3NYNhyWmTKhmMBF
 08JmCc0ggOW9q1cuWG2RlqVcJoSfl9VS2/OJckZFwsO8j/eoKTzblQJ/jySp+9r/oKoDDIKq6a
 W8Sjbg/nfWKwiXQyLp937+lTmzz7AAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.0
Subject: [Freedreno] [PATCH v2 0/5] arm64: dts: qcom: add DP Controller to
 SM8350 & SM8450 DTS
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Switch the QMP PHY to the newly documented USB3/DP Combo PHY
bindings at [1] and add the DP controller nodes.

The DP output is shared with the USB3 SuperSpeed lanes and is
usually connected to an USB-C port which Altmode is controlled
by the PMIC Glink infrastructure in discution at [2] & [3].

DT changes tying the DP controller to the USB-C port on the HDK
boards will be sent later.

Bindings dependencies at [1]

[1] https://lore.kernel.org/all/20230206-topic-sm8350-upstream-usb-dp-combo-phy-v1-1-ed849ae6b849@linaro.org/
[2] https://lore.kernel.org/all/20230201041853.1934355-1-quic_bjorande@quicinc.com/
[3] https://lore.kernel.org/all/20230130-topic-sm8450-upstream-pmic-glink-v1-0-0b0acfad301e@linaro.org/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- fixed the bindings
- cleaned up the usb_1_qmpphy &  displayport-controller nodes as requested by dmitry
- removed invalid mdss_dp0 change in sm8450-hdk.dts
- Link to v1: https://lore.kernel.org/r/20230206-topic-sm8450-upstream-dp-controller-v1-0-f1345872ed19@linaro.org

---
Neil Armstrong (5):
      dt-bindings: display: msm: dp-controller: document SM8450 compatible
      arm64: dts: qcom: sm8350: switch to combo usb3/dp phy
      arm64: dts: qcom: sm8350: add dp controller
      arm64: dst: qcom: sm8450: switch to usb3/dp combo phy
      arm64: dts: qcom: sm8450: add dp controller

 .../bindings/display/msm/dp-controller.yaml        |  25 +++--
 arch/arm64/boot/dts/qcom/sm8350.dtsi               | 122 +++++++++++++++-----
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 123 ++++++++++++++++-----
 3 files changed, 202 insertions(+), 68 deletions(-)
---
base-commit: 20f513df926fac0594a3b65f79d856bd64251861
change-id: 20230206-topic-sm8450-upstream-dp-controller-20054ab280de

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

