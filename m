Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 477746110B0
	for <lists+freedreno@lfdr.de>; Fri, 28 Oct 2022 14:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCC910E0CB;
	Fri, 28 Oct 2022 12:08:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FF810E0CB
 for <freedreno@lists.freedesktop.org>; Fri, 28 Oct 2022 12:08:19 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id l11so6375108edb.4
 for <freedreno@lists.freedesktop.org>; Fri, 28 Oct 2022 05:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=TuHMOYtgntRlqrUPHzqn+/W9rCLxqfiv1KR+wOTGa/o=;
 b=qYLOPDk6E5l+vIE4I34Ig+IbPUBMvJLN3+xzmNbGft8VEMPxNPz2AQeynQxL73OhaQ
 J0s/GY3/SM2OQIwylsa59J1MLNDYIw3VlTdD8Rpx5QHsNiBSGjJ4yUin1lkjZ5yhu0Tp
 8SKxBpCGevtEck6cPiHv4I3u6BKSlJBc7u4V9m1ScJygEwUuG5byF9zjNTY1JG0uw36u
 nNJp5k7gZKyreb2Zrd5JkjkByHhVznRXxYW1dTksqL9Ykl/dQdirXJUv3qxgbe8aQ5+n
 4/o7bDduxmC7Si3Ua/eCFAru4hqq5quCw2Ue8osi4Nrfq7vX8PLhpCIh8p6gZztVtGfH
 AyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TuHMOYtgntRlqrUPHzqn+/W9rCLxqfiv1KR+wOTGa/o=;
 b=CeV0PELPUfG2hLO+dFT/LAZSaFXsowctv2DaykC77KveNxvLORDqyNz3ISzs5I1LDW
 pjBCXMFKliNhJxieA/iQejidCO8DsTLOsP952q4NN745iTt2xSWNhDkvQVWDbxxZNOEu
 YxaEXL4yxJg3VzIt1BnDXxzUi75BveT2m2vw4zBz8/OTcr7QOqnK9FFpqMDV2HPE6WN6
 ZbC+TXwqY3sWzHyM3qIwiZluUf58YDQdLdpnxpiMAki20nlNije9eSzAugUpWEvae3Dv
 z2UnDRuxlhkYAs0snXiPF3uGAHxh+0vVKk/8tLUFxQhj7+wN3qOFdiscyRjWM2kZPBYx
 XddQ==
X-Gm-Message-State: ACrzQf36TPDCuzrAYGIMOhoSJN+e3D4oVajP3stQ68PqVcvNHIcv2MZc
 Ljs81h8FnUW2iLfdXiZTwDuUFg==
X-Google-Smtp-Source: AMsMyM5OQSCfAm8WdRuXRXGqKjaB68/quVPLiq+P/+A/qL26ccve+eRNTxZenQ8jGwajbiZeyubHAw==
X-Received: by 2002:a05:6402:298d:b0:451:5fc5:d423 with SMTP id
 eq13-20020a056402298d00b004515fc5d423mr49793579edb.102.1666958898318; 
 Fri, 28 Oct 2022 05:08:18 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a170906124d00b00782e3cf7277sm2067258eja.120.2022.10.28.05.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 05:08:17 -0700 (PDT)
From: Robert Foss <robert.foss@linaro.org>
To: agross@kernel.org, bjorn.andersson@linaro.org,
 konrad.dybcio@somainline.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, quic_kalyant@quicinc.com,
 swboyd@chromium.org, robert.foss@linaro.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 quic_vpolimer@quicinc.com, vkoul@kernel.org, dianders@chromium.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 vinod.koul@linaro.org, quic_jesszhan@quicinc.com
Date: Fri, 28 Oct 2022 14:08:03 +0200
Message-Id: <20221028120812.339100-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v1 0/9] Enable Display for SM8350
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

This series implements display support for SM8350 and
enables HDMI output for the SM8350-HDK platform.

Robert Foss (9):
  drm/msm: Add compatibles for SM8350 display
  drm/msm/dpu: Refactor sc7280_pp location
  drm/msm/dpu: Add SM8350 to hw catalog
  arm64: dts: qcom: sm8350: Add &tlmm gpio-line-names
  arm64: dts: qcom: sm8350: Remove mmxc power-domain-name
  arm64: dts: qcom: sm8350: Use 2 interconnect cells
  arm64: dts: qcom: sm8350: Add display system nodes
  arm64: dts: qcom: sm8350-hdk: Enable display & dsi nodes
  arm64: dts: qcom: sm8350-hdk: Enable lt9611uxc dsi-hdmi bridge

 arch/arm64/boot/dts/qcom/sm8350-hdk.dts       | 333 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8350.dtsi          | 217 +++++++++++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 227 +++++++++++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                |   1 +
 6 files changed, 760 insertions(+), 20 deletions(-)

-- 
2.34.1

