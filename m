Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1C134B27D
	for <lists+freedreno@lfdr.de>; Sat, 27 Mar 2021 00:13:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C2B6F4FC;
	Fri, 26 Mar 2021 23:13:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2543F6F4F9
 for <freedreno@lists.freedesktop.org>; Fri, 26 Mar 2021 23:13:07 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 ot17-20020a17090b3b51b0290109c9ac3c34so4949394pjb.4
 for <freedreno@lists.freedesktop.org>; Fri, 26 Mar 2021 16:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RTdHDCHlxXS8HeXSDnDZD3RZIWu2U1jLMoVFhKk9uuM=;
 b=tqk+vNwsyxyoPrT/4uwLsfPSsJfJLmHKaH2sFf9Sm0hHUaMOyD0iGRPb0pdRxQTDX+
 jnhfqs7rmr5I0Ne93LEoZRDLlsVEgYIZrGkawQMhANhZVdN6pCpoEglXU8xepaaz8X7g
 MVT62FH0HE1RG6WK7INy6F8iFN5yeyIN69xGySnE9/aTSYQ6lBcJqhYyqWgCMHGVtePP
 OIlOWe4srTlGGGaFZvawZAIRQ7+3UsfykJqdrI2X+PqRhny5h6W9vd3wGGi97x2zOVR3
 AK+ULm6tEVndXhLQOBXx7PBOOvscFNj2wXezcU9dbJ2JnnIz8gEYnygRABk64icizlQI
 nDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RTdHDCHlxXS8HeXSDnDZD3RZIWu2U1jLMoVFhKk9uuM=;
 b=ANhsiuKQBEXhLYNchm9aolH8kGF7gisSCw7Ns2es794MuS99FoZdJ68ppfzdfQ9D8S
 FpZe/jeudoZLqJhO1TAsQuB1d02maZ/c/pbY+bpwMhIzTM79wJszjn/dXR+CYCvzwZpG
 kLcjaLXAdvG3P7tpyZ71Ema6E1RbsBgxZX9eel5BXQmt3T5MJuP2GyHImGIMrFWb+zle
 qLtKhmP/ULX2HeuVfiLPLY+/iTYn9zDvSN3eAsmcvMzEQ6s+/Vl79MZx05RoWRCnVOlh
 79xh+dEygpWpF1NtQ1tcwntKx/n+CD74oCN2rXo9u+aKKhRznK6/yywclkANNIIi9MGh
 Jzbg==
X-Gm-Message-State: AOAM532LqMdixQeEbdrM8+RUHDLpC3Lr7MF/k7qaFfdc+G0hJhkEqAHl
 By+GPqbKPprt5DZtcOVCtwvcmA==
X-Google-Smtp-Source: ABdhPJwrLBWoDVJESET9o3RwESKcoXCf5vFjRT3X//QluFNvOGifh7lmWXe8XeObhYGuwGrnT5VyHA==
X-Received: by 2002:a17:902:b40e:b029:e6:837f:711 with SMTP id
 x14-20020a170902b40eb02900e6837f0711mr17334986plr.2.1616800386711; 
 Fri, 26 Mar 2021 16:13:06 -0700 (PDT)
Received: from wildbow.anholt.net ([97.115.138.77])
 by smtp.gmail.com with ESMTPSA id a144sm10289325pfd.200.2021.03.26.16.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 16:13:06 -0700 (PDT)
From: Eric Anholt <eric@anholt.net>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Jordan Crouse <jcrouse@codeaurora.org>,
 Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Date: Fri, 26 Mar 2021 16:13:03 -0700
Message-Id: <20210326231303.3071950-2-eric@anholt.net>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210326231303.3071950-1-eric@anholt.net>
References: <20210326231303.3071950-1-eric@anholt.net>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 2/2] arm64: dts: msm8996: Mark the GPU's SMMU as
 an adreno one.
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
Cc: Eric Anholt <eric@anholt.net>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This enables the adreno-specific SMMU path that sets HUPCF so
(user-managed) page faults don't wedge the GPU.

Signed-off-by: Eric Anholt <eric@anholt.net>
---

We've been seeing a flaky test per day or so in Mesa CI where the
kernel gets wedged after an iommu fault turns into CP errors.  With
this patch, the CI isn't throwing the string of CP errors on the
faults in any of the ~10 jobs I've run so far.

 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 6de136e3add9..432b87ec9c5e 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1127,7 +1127,7 @@ cci_i2c1: i2c-bus@1 {
 		};
 
 		adreno_smmu: iommu@b40000 {
-			compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
+			compatible = "qcom,msm8996-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2";
 			reg = <0x00b40000 0x10000>;
 
 			#global-interrupts = <1>;
-- 
2.31.0

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
