Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF1380B767
	for <lists+freedreno@lfdr.de>; Sun, 10 Dec 2023 00:21:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C717110E2FA;
	Sat,  9 Dec 2023 23:21:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD5E10E2FA
 for <freedreno@lists.freedesktop.org>; Sat,  9 Dec 2023 23:21:35 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c9f72176cfso39933701fa.2
 for <freedreno@lists.freedesktop.org>; Sat, 09 Dec 2023 15:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702164093; x=1702768893; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WmjCJiespktfDpoHlO6IxPKfMmv43AjbntGQXxXslGE=;
 b=CtkHAhp8tp+pj9g+CUYjDtrSYiR+fT+T1ADnl17Hnio9+62+tSZp/5S7HK0r0qE3Ei
 Ei0YHUJaMz9jt0NRF/hwYPHp03ThB20QZnLyRdgLBg5RiJ6KF7Z7NpWktVlTc6G4W3qK
 8PhuuTywnWs+SppJR3MfIkjW1r+ltyX3s8XjC2iyK/bBzI/cD1X+AnaA0B7i1fWXOZ9x
 E/hGhIKqgZLtIFEH48HnZEANlO36T2DFACOsUJWfWaCD4buXM2z26wbR+rvXYLLyf9ad
 WHb15U6P4vK+OHOZWaCmVfidaF77mevUmJbheruEUm1niyGyUgY6jGGTGK8ar7UniQrT
 tQbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702164093; x=1702768893;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WmjCJiespktfDpoHlO6IxPKfMmv43AjbntGQXxXslGE=;
 b=q+DsVSu0cKbR+qUuVQQ5uH3uz/96ZztSx+NgVj5sK12cQ2f2tQaQio8eH6a3DFan6D
 xMr6gMqq58onWc0wmysiDSjFK3zQj1x+aytiCnHGrtH6wjXmhOL0e0OSngTOjND5rCp0
 DZG/xW7weuKbk6rJ2GkBEWtBzS51Xn1HvO1lUPHIh6XizVHwNMpenUtk4tl1OfruLZx3
 fXeXa6Y5jDik3H9f/Qir/pFdqPARFl9LrmUdCQWmFC1Ra1Sx0RPOSaOuoCX0Lt5JEn3p
 tD7axsNRSoZHHhtj9IMn59Y+UJkbUbeCFwLahIxmDnBmyuuke+wJ546tDn75zfYgCg6/
 uqJw==
X-Gm-Message-State: AOJu0Yxhkx2lurEioZKK1wuuHr9ykis+/Jnmtb3cavzfoqAx3eX2CFE6
 yCvPma0jRrlRRwBS/Aai0aruIcLEiWE0ZM7ANx8=
X-Google-Smtp-Source: AGHT+IGGq2lLBGaUklgidwDghWHWXSX4KmawDyQTinlUpnhVtTR24EqdEW5gXak3WOlH/CMagOvxjA==
X-Received: by 2002:a2e:9012:0:b0:2c9:f427:9e52 with SMTP id
 h18-20020a2e9012000000b002c9f4279e52mr351296ljg.134.1702164093633; 
 Sat, 09 Dec 2023 15:21:33 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a2ebe12000000b002c9f59f1748sm685258ljq.7.2023.12.09.15.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Dec 2023 15:21:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 0/9] arm64: dts: qcom: sm8150-hdk: enable display output
Date: Sun, 10 Dec 2023 02:21:23 +0300
Message-Id: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Enable display output on the SM8150 HDK device. This includes HDMI
output through the onboard DSI-HDMI bridge and DP output on the USB-C
port.

Dmitry Baryshkov (9):
  dt-bindings: display: msm: dp: declare compatible string for sm8150
  arm64: dts: qcom: sm8150: use SoC-specific compat for RPMh stats
  arm64: dts: qcom: sm8150: make dispcc cast minimal vote on MMCX
  arm64: dts: qcom: sm8150-hdk: enable HDMI output
  arm64: dts: qcom: sm8150-hdk: fix SS USB regulators
  arm64: dts: qcom: sm8150: add DisplayPort controller
  arm64: dts: qcom: sm8150: add USB-C ports to the USB+DP QMP PHY
  arm64: dts: qcom: sm8150: add USB-C ports to the OTG USB host
  arm64: dts: qcom: sm8150-hdk: enable DisplayPort and USB-C altmode

 .../bindings/display/msm/dp-controller.yaml   |   1 +
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts       | 264 +++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8150.dtsi          | 132 ++++++++-
 3 files changed, 386 insertions(+), 11 deletions(-)

-- 
2.39.2

