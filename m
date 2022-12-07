Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC0464512C
	for <lists+freedreno@lfdr.de>; Wed,  7 Dec 2022 02:28:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD78610E169;
	Wed,  7 Dec 2022 01:28:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B69010E167
 for <freedreno@lists.freedesktop.org>; Wed,  7 Dec 2022 01:28:06 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id bp15so26364277lfb.13
 for <freedreno@lists.freedesktop.org>; Tue, 06 Dec 2022 17:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bfrgb8LmygfZn98WhFUeywPOLMjR7f+hzTMKV7Woi74=;
 b=mdd8dfqV16Bi1k3ovMs3c2p2XNU0oKk3XwBCg7DQfxE3iHVPJBGVx73xkZPw+/F1qj
 vlIjnCbRLHq8wy8yeldNalMGRS5VkJD9TuEgnPCrz1CvUau+pwoGDK3ZYQB4Uq2QSGi0
 6Yef2o0wwf8wMDZwAiFx1JlBNNYClSB3NdV0yIIz0/DPH/13nTP0qhB6LbhZh2pwMGSZ
 DRTHUSWzVdoMUdlfD2upZlxtJCEif+EzGOG/YcOyA2YFmm7LcYlFNVeXqV1BOjK8eJLf
 D0G97OgPyp8FAueY7rNw92IdrLRW3qRk/tnbZISITRyKm/K3aHqif68ivdJfCRYxXbdi
 p8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bfrgb8LmygfZn98WhFUeywPOLMjR7f+hzTMKV7Woi74=;
 b=W2c3RlKIHpc1v7mZbQvxq1uMDY9tg93eJU+Uf5peUULpVx/fTT3fNn+Q2UGQyp1WOk
 Yz8V59BIpOpJB35OTf5FQIYUMp66z0tOw2RwUVgMnZl2UmFtABvx2DjnmTV2/pNmTho3
 22kyVheTS0zpg6kPWxUFZFzuCj9pkmJG/C/JfrKzH96Bvsf71u1fMzLEcQMRBTEjCVV0
 oGJ42/Gf0L+qxGmR/+RlIWvAECb/QlzP/lQ8oH/tyVJrtvx2WWadaxBgW0MlhiWcuznr
 3Oh04RQBbWe2uLVsRyrY+ua9+7ScISMLqvC9yaM7zlEzjAiPY747/wxVtwbhUb8SKYTH
 FKtw==
X-Gm-Message-State: ANoB5pk9JhSitNcy9tdCOETlHNVTT473oXW7+uL5eh40ZXUYKZ9ifcJC
 p2csdkvz+YsdtdYyrCtb4K7R+g==
X-Google-Smtp-Source: AA0mqf4RwQzhEUSeU7ewYGfbNrc0S+6QgfPge42Yi9h+mSEhUzs8nFr/i4pnZuGpqSazHuu+/x1ykA==
X-Received: by 2002:a05:6512:340d:b0:497:456d:890 with SMTP id
 i13-20020a056512340d00b00497456d0890mr22844683lfr.687.1670376484641; 
 Tue, 06 Dec 2022 17:28:04 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 n26-20020a05651203fa00b004b5626ef9f4sm1461157lfq.262.2022.12.06.17.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 17:28:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed,  7 Dec 2022 03:27:58 +0200
Message-Id: <20221207012803.114959-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 0/5] arm64: dts: qcom: sm8450-hdk: enable
 HDMI output
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

Add device tree nodes for MDSS, DPU and DSI devices on Qualcomm SM8450
platform. Enable these devices and add the HDMI bridge configuration on
SM8450 HDK.

Changes since v3:
- Renamed mdss node to display-subsystem@ (Krzysztof)
- Dropped empty line from the patch4 (Krzysztof)
- Renamed HDMI connector endpoint to hdmi_connector_out

Changes since v2:
- Dropped clock-names from mdss device node
- Fixed pinctrl configuration used by lt9611uxc (Krzysztof)

Changes since v1:
- Reorder properties, making status the last one
- Rename opp nodes to follow the schema
- Renamed display-controller and phy device nodes
- Dropped phy-names for DSI PHYs
- Renamed DSI and DSI PHY labels to include mdss_ prefix
- Renamed 3v3 regulator device node to add -regulator suffix

Dmitry Baryshkov (3):
  arm64: dts: qcom: sm8450: add RPMH_REGULATOR_LEVEL_LOW_SVS_D1
  arm64: dts: qcom: sm8450: add display hardware devices
  arm64: dts: qcom: sm8450-hdk: enable display hardware

Vinod Koul (2):
  arm64: dts: qcom: sm8450-hdk: Add LT9611uxc HDMI bridge
  arm64: dts: qcom: sm8450-hdk: Enable HDMI Display

 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 117 +++++++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 303 +++++++++++++++++++++++-
 include/dt-bindings/power/qcom-rpmpd.h  |   1 +
 3 files changed, 409 insertions(+), 12 deletions(-)

-- 
2.35.1

