Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1993354BBEC
	for <lists+freedreno@lfdr.de>; Tue, 14 Jun 2022 22:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49EE10F916;
	Tue, 14 Jun 2022 20:39:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733BC112048
 for <freedreno@lists.freedesktop.org>; Tue, 14 Jun 2022 20:39:14 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id c2so15833514lfk.0
 for <freedreno@lists.freedesktop.org>; Tue, 14 Jun 2022 13:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:resent-from:resent-date:resent-message-id
 :resent-to:dkim-signature:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding
 :precedence:list-id;
 bh=A2DR2Qx4EDQ/Qp4WmLClaKDOFaQ1yOvRI7AVkauq8A0=;
 b=Fqqkn5IoRVB/en9nDIF4VD54Hp6MSKmarAFfT0M9nZ/wX6P7kVEFoZhott3LWXdu8N
 ZBb21yjJq3WNdXOhPfkiq38Oc1lvHpi0Od/NerkTA5Ibt0TGnD4c9xjPqTXrnY+DaOsq
 a4FVRWLk0QVlVWvdUvuCKZS19TJaPFDr/jQO4LZqIpvfLlzPtbccyaAeuD7+DxOyo/Dz
 M/P3It/88ZMSeRBzpIdDaH+Ozeln5wzh68hmjo1CXcbyAjORAue2Tj22WguxX2DnotAc
 RVM82e8mMUDGkS8cGUfGQ6AGTHe0BGfmAxC3iidk8BxgbV7r+2WQCSn5usicITHZpkEw
 ru0A==
X-Gm-Message-State: AOAM532nN1CrTJ8ZCkbE9O9QI4RSrPOxVbFD40LqRY+O+x70MK6j4LoB
 BJKZv4oA9y+7rlSQzMcPCdXiIpjKvNXD5xoK
X-Google-Smtp-Source: AGRyM1u1LNLCJIKwGYpoA77wJO1KjHzURigmm1Q9J4Gpgqta8CeFRPBZSbHl9FY0pohHRnlFagg31w==
X-Received: by 2002:a05:6512:606:b0:478:fdce:eef8 with SMTP id
 b6-20020a056512060600b00478fdceeef8mr4014951lfe.461.1655239152469; 
 Tue, 14 Jun 2022 13:39:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a056512114500b0047255d210dcsm1519368lfg.11.2022.06.14.13.39.11
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 13:39:12 -0700 (PDT)
Resent-From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Resent-Date: Tue, 14 Jun 2022 23:39:05 +0300
Resent-Message-ID: <Yqjx6ZA1Ny67XpFt@eriador.lumag.spb.ru>
Resent-To: freedreno@lists.freedesktop.org
Received: by 2002:a0c:e047:0:0:0:0:0 with SMTP id y7csp635114qvk;
 Sun, 12 Jun 2022 02:22:44 -0700 (PDT)
X-Received: by 2002:a17:90b:3806:b0:1e2:adc5:d192 with SMTP id
 mq6-20020a17090b380600b001e2adc5d192mr9377538pjb.223.1655025764670; 
 Sun, 12 Jun 2022 02:22:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655025764; cv=none;
 d=google.com; s=arc-20160816;
 b=DuaJLyCf2aVV7/8ZX8QBW6+Ml4Gn/8X/DznfPpfauT04eCZhymFS8fNfe1Z4+R/dWp
 5f6QLNS/3YzlvPC77xDhp8PfPDx9xPbdW4lbIB0vUerBR2oIYQ1Jqom1G8q4JWrl7n/n
 11kKNRjpl4VsE+LyjIsBvEwa5M9efC4dCwv3t5s0bR1oI22rh3G9m9P9uSzqAKZOw/YR
 Icmd08lfqoayeBCVVOYZB1aR5l6eFCRZfXaIIkWrD5Eo+G6duewyHDJH81c4rPw3HX5x
 O6PYZfSXSE79DDj1el5p5DNk19i9xpQCiPCaoa0p43ZTJZm1ktfA6rh0HIHSoRB1H2kw
 feXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20160816; 
 h=list-id:precedence:content-transfer-encoding:mime-version
 :references:in-reply-to:message-id:date:subject:cc:to:from
 :dkim-signature;
 bh=A2DR2Qx4EDQ/Qp4WmLClaKDOFaQ1yOvRI7AVkauq8A0=;
 b=KyZJi0+O7jw7IUVSRMYVnTfKGFBntLgMKKGeRPC0/4RUp3yeYBWODT1hDLhgQcGUrE
 1DYsInwni4PYsfHPlFJ/5sILoyZn6V3AaephkcE6ojhgm4TF9bpv0ndN5+LNGLDytvsy
 e5HUAaHuumbJ/85EvuHOPwsSnqpjZd1PceEdvnWccJrv/DeFNnRdD9c76a4FzP2B6Y2J
 Y6gwbCnNz+n+bxaw8r6cey9lQVy/dt8/D9b4ZFs4CMk8Fe//Zbx9Na0Z1/tNShisuKQE
 uGeOX2tYi0cUfwwAP87lmjkSqARm/ZRXC29/4o208/Dei57UQe9Jza/QKIvc40XzwmrI
 VqzA==
ARC-Authentication-Results: i=1; mx.google.com;
 dkim=fail header.i=@z3ntu.xyz header.s=z3ntu header.b=yHNKr3+s;
 spf=pass (google.com: domain of linux-arm-msm-owner@vger.kernel.org designates
 2620:137:e000::1:20 as permitted sender)
 smtp.mailfrom=linux-arm-msm-owner@vger.kernel.org; 
 dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=z3ntu.xyz
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
 by mx.google.com with ESMTP id
 d6-20020a170902aa8600b00167895fb8f1si5335387plr.137.2022.06.12.02.22.44; 
 Sun, 12 Jun 2022 02:22:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-arm-msm-owner@vger.kernel.org
 designates 2620:137:e000::1:20 as permitted sender)
 client-ip=2620:137:e000::1:20; 
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
 id S235700AbiFLJWk (ORCPT <rfc822;abel.vesa@linaro.org> + 14 others);
 Sun, 12 Jun 2022 05:22:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37400 "EHLO
 lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
 with ESMTP id S233947AbiFLJWh (ORCPT
 <rfc822;linux-arm-msm@vger.kernel.org>);
 Sun, 12 Jun 2022 05:22:37 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 820002AF;
 Sun, 12 Jun 2022 02:22:35 -0700 (PDT)
Received: from g550jk.arnhem.chello.nl (31-151-115-246.dynamic.upc.nl
 [31.151.115.246])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id DDB92CD40F;
 Sun, 12 Jun 2022 09:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
 t=1655025753; bh=a9nBPWablbRIJ2VamdiGHGVcR82c+DSpGM9XWM/NQ30=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=yHNKr3+sIHi1NUiZD6d2dH/oc6q7T45P7rN35jqjHcIj3ci15klE0u0tjTrFpsla3
 sZ/PF+9Mep/PFlnkYKquCEmb4Uljg5Pa9HHMsNaDr9u9UAvUAR3FIgAVrLrgL0Q43T
 3ysLal+7+x97p5SZ9kkEtsFctJKCqxEQ+8dqrl9A=
From: Luca Weiss <luca@z3ntu.xyz>
To: linux-arm-msm@vger.kernel.org
Date: Sun, 12 Jun 2022 11:22:14 +0200
Message-Id: <20220612092218.424809-3-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220612092218.424809-1-luca@z3ntu.xyz>
References: <20220612092218.424809-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
 PDS_OTHER_BAD_TLD,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
 autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
 lindbergh.monkeyblade.net
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
Subject: [Freedreno] [PATCH v2 2/4] arm64: dts: qcom: msm8953: add APPS IOMMU
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Luca Weiss <luca@z3ntu.xyz>,
 Andy Gross <agross@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Vladimir Lypak <vladimir.lypak@gmail.com>

Add the nodes describing the iommu and its context banks that are found
on msm8953 SoCs.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
Changes from v1:
- new patch

 arch/arm64/boot/dts/qcom/msm8953.dtsi | 36 +++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index ffc3ec2cd3bc..961db3e23ee4 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -726,6 +726,42 @@ tcsr_phy_clk_scheme_sel: syscon@193f044 {
 			reg = <0x193f044 0x4>;
 		};
 
+		apps_iommu: iommu@1e00000 {
+			compatible = "qcom,msm8953-iommu", "qcom,msm-iommu-v1";
+			ranges  = <0 0x1e20000 0x20000>;
+
+			clocks = <&gcc GCC_SMMU_CFG_CLK>,
+				 <&gcc GCC_APSS_TCU_ASYNC_CLK>;
+			clock-names = "iface", "bus";
+
+			qcom,iommu-secure-id = <17>;
+
+			#address-cells = <1>;
+			#iommu-cells = <1>;
+			#size-cells = <1>;
+
+			// vfe
+			iommu-ctx@14000 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x14000 0x1000>;
+				interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			// mdp_0
+			iommu-ctx@15000 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x15000 0x1000>;
+				interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			// venus_ns
+			iommu-ctx@16000 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x16000 0x1000>;
+				interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		spmi_bus: spmi@200f000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0x200f000 0x1000>,
-- 
2.36.1

