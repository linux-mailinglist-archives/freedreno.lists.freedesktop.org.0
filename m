Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5CA654AE4
	for <lists+freedreno@lfdr.de>; Fri, 23 Dec 2022 03:11:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A212A10E5EE;
	Fri, 23 Dec 2022 02:10:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA2010E594
 for <freedreno@lists.freedesktop.org>; Fri, 23 Dec 2022 02:10:39 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id h7so3387859wrs.6
 for <freedreno@lists.freedesktop.org>; Thu, 22 Dec 2022 18:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vZavQr6k2PeSy9xz8+KrvthbNaKQoAyOMCSTDf4sGKg=;
 b=B7QnemNIR5OCuEq260uL72kCj+SdXlF5J8CtY6xGBSI2NwaNpGDnORFmSDGic7f6ax
 EvNPUDAZ+qWbS3VDISiK6bBDc710d6uUSxH/BO2ElTz40k8d5FOURc1CMrSxIipVxeuF
 kOzDo3Pd9vBDaQUmIw4r/mFWFOIw6BuGYeEt8wysitQcTi6bfNgh0sAUMPsjupdOV8gM
 IcNHEAse0uWJo6bE5CYnRHeWZ6jqYNdqXunBnfFs0rKsfaOIHeuyOtXVQ7f587cRnRRP
 QAO0CBFxxPx45TmnMoQHbnv3vEZi97oem0rPf6V4Gs6H3oynzP3gMsbA78WsBmNK4hVY
 u1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vZavQr6k2PeSy9xz8+KrvthbNaKQoAyOMCSTDf4sGKg=;
 b=7cM3phZojQ5WE5WAsWOQpAS4/c2nxiMux9pCdnXIfALbxQ9S1C5gRZ09mAAxJZYRcr
 FtGQvSYRozLJVGE24HY1oMmWb4ctH3lIZeVNj4sLHrQl+8zPDVgjTHkx0Oe+iByp1h/G
 TP5pa3G3dKrGNIov4SlqT7mIrb5lgaoM+804dN4CV7EQAMoG/NfqvwIAU9FnpnHNM2RM
 pkeU+eTj1rHjEp3tuBBiWjJyc8Jpe/Od6HgFuGxrn6AYuXrMwzsFPZi4tp3hzHR2bJPs
 DkBLGdqJrBRO4Mu4Q+8DWI9x5ASlHeTP5lsmix5VN8Nw3T7VomTC1o7tuV6bCLkYnTS2
 NbBQ==
X-Gm-Message-State: AFqh2kq2ovQLUmFGn8QtGw8MvWMikA8F3sxzF3VqsyKG5GJva7rnBSoF
 ybU4k2qP3WLOTlEm4BuFgdumnA==
X-Google-Smtp-Source: AMrXdXtWB92q8QYqsfmFwfOfE1sobGfz5U0oDcSl1HBVxU96+nDthKhz9lU6GQIoHJLcnkRk/FXmSw==
X-Received: by 2002:adf:d4c7:0:b0:26b:2694:c563 with SMTP id
 w7-20020adfd4c7000000b0026b2694c563mr5813512wrk.15.1671761439290; 
 Thu, 22 Dec 2022 18:10:39 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 j11-20020a5d452b000000b0022cc0a2cbecsm1849725wra.15.2022.12.22.18.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 18:10:39 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Fri, 23 Dec 2022 02:10:17 +0000
Message-Id: <20221223021025.1646636-11-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
References: <20221223021025.1646636-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 10/18] arm64: dts: qcom: msm8916: Add compat
 qcom, msm8916-dsi-ctrl
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robdclark@gmail.com, robh+dt@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org, swboyd@chromium.org,
 airlied@gmail.com, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add silicon specific compatible qcom,msm8916-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for msm8916 against the yaml documentation.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 2ca8e977fc2a9..ffb4ce8935b37 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1021,7 +1021,8 @@ mdp5_intf1_out: endpoint {
 			};
 
 			dsi0: dsi@1a98000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,msm8916-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0x01a98000 0x25c>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

