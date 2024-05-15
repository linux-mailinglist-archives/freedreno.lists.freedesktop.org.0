Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FFE8D8A50
	for <lists+freedreno@lfdr.de>; Mon,  3 Jun 2024 21:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E01E10E3E1;
	Mon,  3 Jun 2024 19:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="YOpRLYnv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9970C10E36A
 for <freedreno@lists.freedesktop.org>; Wed, 15 May 2024 14:27:47 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-41ffad2426eso52728055e9.3
 for <freedreno@lists.freedesktop.org>; Wed, 15 May 2024 07:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1715783265; x=1716388065;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1HxPoa4NQhCeMpVCVW9Zfj831zpXTVZAZVyPlzQIJ10=;
 b=YOpRLYnvtpwih8KoM2Ce38XPteu3BWztctU8heZG+2F+OsCWce0Gn9O5a6lRqrlM2K
 27zEFXDITKx0j3NZqB3IEZqTonWii3rHSAr+bfl1TKeFOJyajGgu0mDvNNmvXuxAFK+S
 Q9UOHtajrxVUVWVcIc85L5MICA1j6k0uudILZ59s7PwJafW3acoYIQuHjcm4/H0pgY/W
 TNRlhaTZXUEQ6kKKojszon+znB4kliO+syRHlXyBY/P8UHPzUCdY8hHSrbY5199zpSzu
 0cKJv1odckpNmzAFzXoRSlGXQPOcdw0SQyt616la/nsGSDT8DCGSvuVC2jV0QBs12+5S
 FPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715783265; x=1716388065;
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1HxPoa4NQhCeMpVCVW9Zfj831zpXTVZAZVyPlzQIJ10=;
 b=Jd01zEKH2V379RA2hcj4Ks31H5XC7b2z4rp5FfsbModRv3A14rVbji5PPTivk6jKfv
 xq1I3i0ks+4eGZDA1FjkkYh3bZNOYH4oiIBIHqwzCo6h1IWD974g7pVhuROsEqnOuPfm
 Xd0K7lsqu6bB3JyJ+4qtYtDVkCFFNJ3YCJy2PCs1CciF1tSsHwITjgtipUrVVWd/R0pV
 ylv98tugJbUvBFweZUpLE+P+axTeGsrFEU2Zv8cAcGAv/WT7fU8QjrHnsQCmECPmQInl
 CjNBuNjG/KcN/c5r08/xuhbPkbL0gIHpWCN738oZmRQfuM8Q8rIHR+/AqInpQOz3G5WY
 zj4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6ohjXKApHNlwX3r2x6QOiG8o5GTcmPESXVQWEShuMKXRAOSYKihCWhVmcbweeKfXlNQvPE7OmS0lwBc8Gcr50wazrykJgpGjWSpjpSrjY
X-Gm-Message-State: AOJu0YyHL0zFhz5ZPFTDOaM5ILWvoXoNXakbS9lhCVjSmxlFM99DcTTx
 tV3+/NzdrSBHclhEef1iSfWwP+QMPEVgz2+eq8b7nQtiGw4K3qXSnZI/Iq+MEJA=
X-Google-Smtp-Source: AGHT+IFIMkUB3jdsXdDaj/pLEq16XlGdkbO55sEQsBTeKbrHyf1fwTl3ZOHdEt2yaaFuYLNWSfBSkA==
X-Received: by 2002:a7b:cbc2:0:b0:41a:225f:becc with SMTP id
 5b1f17b1804b1-41feaa44406mr148324755e9.21.1715783265398; 
 Wed, 15 May 2024 07:27:45 -0700 (PDT)
Received: from ?IPV6:2a01:e34:ec24:52e0:cfcc:f257:b4dd:873d?
 ([2a01:e34:ec24:52e0:cfcc:f257:b4dd:873d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccce1912sm238592105e9.11.2024.05.15.07.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 07:27:44 -0700 (PDT)
Message-ID: <be51d1a4-e8fc-48d1-9afb-a42b1d6ca478@freebox.fr>
Date: Wed, 15 May 2024 16:27:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH v2] arm64: dts: qcom: msm8998: enable adreno_smmu by default
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: MSM <linux-arm-msm@vger.kernel.org>, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Luca Weiss <luca.weiss@fairphone.com>,
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

15 qcom platform DTSI files define an adreno_smmu node.
msm8998 is the only one with adreno_smmu disabled by default.

There's no reason why this SMMU should be disabled by default,
it doesn't need any further configuration.

Bring msm8998 in line with the 14 other platforms.

This fixes GPU init failing with ENODEV:
msm_dpu c901000.display-controller: failed to load adreno gpu
msm_dpu c901000.display-controller: failed to bind 5000000.gpu (ops a3xx_ops): -19

Fixes: 87cd46d68aeac8 ("Configure Adreno GPU and related IOMMU")
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
New in v2: rewrote commit message with input from Martin, Bryan, Luca
Supersedes: <1ba7031f-c97c-41f1-8cbc-d99f1e848e76@freebox.fr>

Maintainers, feel free to drop the Fixes tag.

Failure log:
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

