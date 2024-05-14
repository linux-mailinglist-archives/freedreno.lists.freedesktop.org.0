Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF7C8D8A5A
	for <lists+freedreno@lfdr.de>; Mon,  3 Jun 2024 21:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A3610E3EA;
	Mon,  3 Jun 2024 19:38:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="is+PnQFH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7248E10E2BA
 for <freedreno@lists.freedesktop.org>; Tue, 14 May 2024 17:04:06 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-350513d2c6aso3229267f8f.2
 for <freedreno@lists.freedesktop.org>; Tue, 14 May 2024 10:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1715706245; x=1716311045;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jYQY0YoKnLOnzqTN5xdIK3wHHJXxqITzL2nxzY6rvdE=;
 b=is+PnQFHTO7U/bt9c5b22nygix1TMwHVxI5+byw/oI2vUYZf0+zAdRm2eKtuczMN1Z
 fLCVIC0iJAxSm76wXeaws61yRrJ1kHlG6pHiD6NNb/KrqEZuVSXpPVis7JGkgGuSqw2n
 bANBNn9/u7KJXTNM9LqLesvz6qtnXkPHMsKqW1MDrkuujYswAK6UZCqm4XoQenDnVQle
 P0ynqKIApwbCoihCRL34Vhrot+2+reCYHC451os8x+MC+tvki/1kAXaDx3C0dXFO/I8E
 xRvJ/b3CRddaKN85uDkl4aid5rKS1J5t6Ohta8NueU6GxpNyQlSJ4ogcK8zeLJj/7pdQ
 bDHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715706245; x=1716311045;
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jYQY0YoKnLOnzqTN5xdIK3wHHJXxqITzL2nxzY6rvdE=;
 b=Fj9mhIsby94VKIqExmoAAaFdoq22WVkfgDdhrO02n+fEI2L5rfeMJrV5wgoN9Zblad
 heoi+sazi79opp89fwELnm1Q0fbmNfeY22NKrEmDzhlZ0ti6vNTcruDOu9a6gikSl6f0
 QfM9P91z9N7g7ocwR9Ds0UTTe54/Uo2VwgW/A5Tmov60CsrlzeVVhL2xf/pwJ+EOIBJc
 ptCEw7HgsaICtSyEOSjnItgPnblxqlw0QFqh83NAgfRZ2Q+HJjKR1S3eQV68+ZExdy1O
 SPoyp1mem+zcN9u4rXGykWgbpYfDrKGmqvMXkrYhserLyDBL4iGwRe2QzMgMKlmxZ6G8
 mcfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyQLPw4jEipzVf82UEDDz3OiDiAlX7vMyy4a3RcmEbwY4b6FA+wVh01HT7N3WodKJBkaa+lOVf2A5mXm0NUlckawsPaODPgkyF98B/M0KB
X-Gm-Message-State: AOJu0YzrjB2CZuuLOMFKlHmSU+DzGwU5ysCzh6nNE/zdHMSeoThzTyJN
 Tzu2YRInRgs0Djtg4Va5uhXunR4f0STQP8Ie01Xyziom2T/KZGEZ/xLkgcAzMDw=
X-Google-Smtp-Source: AGHT+IEV3CCALGxg1n6GpD07zE47h29gJ/oYpBfSqhV831Pj4Hs51H7xJtLjez+Zby19gXdTsc4jOQ==
X-Received: by 2002:a05:6000:180e:b0:34d:b1c2:65ea with SMTP id
 ffacd0b85a97d-3504a9689e9mr9656408f8f.54.1715706245266; 
 Tue, 14 May 2024 10:04:05 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b8969f0sm14216276f8f.28.2024.05.14.10.04.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 10:04:05 -0700 (PDT)
Message-ID: <1ba7031f-c97c-41f1-8cbc-d99f1e848e76@freebox.fr>
Date: Tue, 14 May 2024 19:04:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH] arm64: dts: qcom: msm8998: enable adreno_smmu
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: MSM <linux-arm-msm@vger.kernel.org>, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 03 Jun 2024 19:38:24 +0000
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

Right now, GPU init fails:

[    2.756363] [drm:adreno_bind] Found GPU: 5.4.0.1
[    2.767183] [drm:a5xx_gpu_init]
[    2.767422] [drm:adreno_gpu_init] fast_rate=710000097, slow_rate=27000000
[    3.003869] [drm:msm_gpu_init] ebi1_clk: fffffffffffffffe
[    3.004002] adreno 5000000.gpu: supply vdd not found, using dummy regulator
[    3.008463] [drm:msm_gpu_init] gpu_reg: ffff0000819e4000
[    3.015105] adreno 5000000.gpu: supply vddcx not found, using dummy regulator
[    3.020702] [drm:msm_gpu_init] gpu_cx: ffff0000819e4180
[    3.028173] [drm:adreno_iommu_create_address_space]
[    3.054552] [drm:msm_gpu_init] gpu->aspace=ffffffffffffffed
[    3.058112] [drm:a5xx_destroy] 5.4.0.1
[    3.065922] [drm:msm_gpu_cleanup] 5.4.0.1
[    3.074237] msm_dpu c901000.display-controller: failed to load adreno gpu
[    3.082412] msm_dpu c901000.display-controller: failed to bind 5000000.gpu (ops a3xx_ops): -19
[    3.088342] msm_dpu c901000.display-controller: [drm:drm_managed_release] drmres release begin
...
[    3.197694] [drm:drm_managed_release] drmres release end
[    3.204009] msm_dpu c901000.display-controller: adev bind failed: -19

adreno_smmu is required, so it must be enabled.

[    3.220381] msm_dpu c901000.display-controller: bound 5000000.gpu (ops a3xx_ops)
[    3.235503] [drm:dpu_kms_hw_init:1053] dpu hardware revision:0x30000000

Fixes: 87cd46d68aeac8 ("Configure Adreno GPU and related IOMMU")
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 3d3b1f61c0690..edf379c28e1e1 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1580,7 +1580,6 @@ adreno_smmu: iommu@5040000 {
 			 * SoC VDDMX RPM Power Domain in the Adreno driver.
 			 */
 			power-domains = <&gpucc GPU_GX_GDSC>;
-			status = "disabled";
 		};
 
 		gpucc: clock-controller@5065000 {
-- 
2.34.1

