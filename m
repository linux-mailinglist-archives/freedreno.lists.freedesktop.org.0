Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C228669145
	for <lists+freedreno@lfdr.de>; Fri, 13 Jan 2023 09:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FB610E9C5;
	Fri, 13 Jan 2023 08:37:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8088110E9C3
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jan 2023 08:37:41 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id b3so32113842lfv.2
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jan 2023 00:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vfkoFa2aWXIMsvEye5R5adifXz0BMNct0gxornememI=;
 b=AoAqetfS3RLSABRWAprBoSvGGLyiZySm4fIcetmApEPKeEHb9Xb+CUSZd4monuRWN3
 cv5N99BpPaHPXosXS9WhmAbXBtgyIC6L7RyZhzV6M+GmZW+viutz8TDEsm65YTurvDJo
 Q6uVHe5eaP+gbVMRA5W9XCvMdh9kLaJGWR12rzYbN7AA/pZbg41VnQDe0DvG1qpaCK4q
 jhhzqL6HhHAOspmYHEvbaBJQO/WeV+a8y+Ho+fSMtN5uzgyl+opY4O5iHAnor+MOSWcv
 /1Fmj7mfg4DW3mnCq5K23O+r30+VvXB3t6KNbSSTYgyAO3bJpoIqKUnwbwiNeB8LU/eB
 Uuuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vfkoFa2aWXIMsvEye5R5adifXz0BMNct0gxornememI=;
 b=ESBUMEmwIXfMPZKXlfIzxCS5vKUapt/PJNNlu3ppdN/TSNJJCnJOw5Z1cLn2wc4ShQ
 TshwuJw0vJds/XgruIjOypVU2Sl8fEe4wkyq0aDdcFSabX2jt6n/fFSP7r/dgJWR9noQ
 qknyyoiigv4XWTDRCTJ+6R3I+0jZ+6qxg7GvZSnXUc3jKHsZ+qDLVOnJsM11XC5BXFid
 w41UHz+4re5UxdjelEdV9BjuDvnv+lap9aSmpWWLKa0poVWDQpB8CEl6GWQX3KBkgquV
 r4hCfU7jQDOzbjysH/p2q0cb7j/5QjfJM5REoFAbgMy1xwWNPal7aKnIpeMptrk9EQOV
 yetA==
X-Gm-Message-State: AFqh2krdtMtI/+ww5VDGKPkLGxr8Qxbd/bst4AVEZi78Cj8HWYxdo2wR
 gFo1AMcuHmoOlZ7Bze9Rv0Q2Rw==
X-Google-Smtp-Source: AMrXdXv50Vl5IXHjr9MKDidF5CnW105R55HzZ4q3U0nm6Zs3daEjfdbXxBNi+8HL79VJDe0zZLBeJg==
X-Received: by 2002:ac2:4bcb:0:b0:4bb:8d56:d859 with SMTP id
 o11-20020ac24bcb000000b004bb8d56d859mr23664966lfq.6.1673599061082; 
 Fri, 13 Jan 2023 00:37:41 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05651205c600b004994117b0fdsm3748038lfo.281.2023.01.13.00.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 00:37:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Fri, 13 Jan 2023 10:37:20 +0200
Message-Id: <20230113083720.39224-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 11/11] ARM: dts: qcom: rename mdp nodes to
 display-controller
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

Follow the schema change and rename mdp nodes to generic name
'display-controller'.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 2 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index e045edeb5736..95705703fe8f 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1493,7 +1493,7 @@ hdmi_phy: phy@4a00400 {
 			status = "disabled";
 		};
 
-		mdp: mdp@5100000 {
+		mdp: display-controller@5100000 {
 			compatible = "qcom,mdp4";
 			reg = <0x05100000 0xf0000>;
 			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 2e46a8b6bb14..3c725ada52c0 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1577,7 +1577,7 @@ mdss: display-subsystem@fd900000 {
 			#size-cells = <1>;
 			ranges;
 
-			mdp: mdp@fd900000 {
+			mdp: display-controller@fd900000 {
 				compatible = "qcom,msm8974-mdp5", "qcom,mdp5";
 				reg = <0xfd900100 0x22000>;
 				reg-names = "mdp_phys";
-- 
2.39.0

