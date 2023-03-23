Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BF76C64D9
	for <lists+freedreno@lfdr.de>; Thu, 23 Mar 2023 11:25:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65FCD10EA70;
	Thu, 23 Mar 2023 10:25:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B85110EA6A
 for <freedreno@lists.freedesktop.org>; Thu, 23 Mar 2023 10:25:34 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id v1so13758890wrv.1
 for <freedreno@lists.freedesktop.org>; Thu, 23 Mar 2023 03:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679567134;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FaktxrHqSVBJvgr5m72rtimmU8b1rgEPNt97tFbcEsI=;
 b=RA/Lgk4VwDZLxmXqWCBeVhDkzv9+CRUnqPoo9qv4UtG2XacS8baIy+fTIVEV82opdv
 CAjK2Ah7Dy9KSx5k2zPAgeq2dxSnBLeGXdmEf6/8/VZU0eTtKhmridKEGg/n2wWxlFVF
 pH68Xtcbv5kZXA82o/cTGLfrcXJIPqgeBLsOdGqziepgcUDnC0IlmjLXgsrIjUvujNKy
 ATRzK4Chla46roFSYqSZ9kQ1tl1zVSDCzmU5m/eael73KeqBOf1HLH4Mlam0PHYF2S7s
 MZj+/aYc1u6miyHQ4A6newI6jdqIkfLsMq0vtI8rqmqe7vJz2KYOzrcRo53ggOdnlW/a
 QhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679567134;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FaktxrHqSVBJvgr5m72rtimmU8b1rgEPNt97tFbcEsI=;
 b=xDs22cAJwB5Lporyns/HyorXclokHSOaIA9RtzWWFKxkwRvD+YMSv6aSVorEShxG/N
 DngarPU/w/ec95NMOr7nVdmbJlMH398IS/i5/mWPoa5iwW0eQr6BaL0+Ev1HExLKHPrc
 XRCXa9Hoaw9czI+eB3F35lv6F9Et9U/VMsbwVYTjz7lCuci/LkILRfwbemk3SbOxDanW
 HrpIF51mgA8x3jWRaAZpqX8iEmv1q+33kFjLDRsMDh8J/lQwQAu+6qjOHVsnsEnrTYsr
 gQap0jwINapUlePRKy9l2j2tFiJRwyUqlXZb+2OwDvJveqmYGx+v+1ua9ozi2ZSAKtwt
 21eA==
X-Gm-Message-State: AAQBX9eoITUKzEP6ht6BZPX62qKUYdnHH7xXBKCUa17yKyYytIJs3crc
 FoyLADiHJS6wFQ2Bf9Vu1Q4poQ==
X-Google-Smtp-Source: AKy350YQA+jMkbW6mQuuJtWYSx09at+iDrv03avXAv4uZ7HMAI6MrP6YJqgswmSR4K9JmG855UqLyA==
X-Received: by 2002:adf:ff8f:0:b0:2da:53e3:57d1 with SMTP id
 j15-20020adfff8f000000b002da53e357d1mr2029999wrr.62.1679567134135; 
 Thu, 23 Mar 2023 03:25:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a5d5957000000b002cfefa50a8esm15753530wri.98.2023.03.23.03.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 03:25:33 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 23 Mar 2023 11:25:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-7-3ead1e418fe4@linaro.org>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
In-Reply-To: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 Bart Van Assche <bvanassche@acm.org>
X-Mailer: b4 0.12.1
Subject: [Freedreno] [PATCH 7/8] arm64: dts: qcom: sm8450: remove invalid
 reg-names from ufs node
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
Cc: Rob Herring <robh@kernel.org>, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzk@kernel.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Fixes the following DT bindings check error:
ufshc@1d84000: Unevaluated properties are not allowed ('reg-names' was unexpected)

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index ef9bae2e6acc..8ecc48c7c5ef 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -3996,7 +3996,6 @@ ufs_mem_hc: ufshc@1d84000 {
 				     "jedec,ufs-2.0";
 			reg = <0 0x01d84000 0 0x3000>,
 			      <0 0x01d88000 0 0x8000>;
-			reg-names = "std", "ice";
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
 			phys = <&ufs_mem_phy_lanes>;
 			phy-names = "ufsphy";

-- 
2.34.1

