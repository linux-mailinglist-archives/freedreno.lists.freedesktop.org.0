Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AE9C36C71
	for <lists+freedreno@lfdr.de>; Wed, 05 Nov 2025 17:46:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3105D10E2EC;
	Wed,  5 Nov 2025 16:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jnQv5Fds";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dk4cRrPk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943FF10E2E5
 for <freedreno@lists.freedesktop.org>; Wed,  5 Nov 2025 16:46:36 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A599tvX356835
 for <freedreno@lists.freedesktop.org>; Wed, 5 Nov 2025 16:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sJFOrjhFJZHkN7hWb6jUgTkGNx4wTKXUTuj6Z9f24XU=; b=jnQv5Fds5DZ66Zry
 IvEzoBTbpAmxm3Blk120fyRbtP0En3+vWCNKbpcPwQX1Fj+O96uxXgs+LB66h4lf
 6yHEDzMzedtzY0DTKt22ScHUDXr45zH6TeU9NxHGwbcPeZSBdw33j/5fz7BxiQwS
 WjfFtovv7k4shYJj2uiTEdpJi3PwLo40h+Npnl+XYeHLDn/+un/Na1CtWAy3+iIr
 OoBuXOQq2zS0fLg8arQlmt+u5NVsP10Tp3T1rVrkTxl4czG1MMnu90djVWXamARR
 //kE+VxVSM3+7n0/wi77orDia9+SYl4nePF4qLcd+QNUhSWEGsH4295dTv7TpT/L
 WMIPJQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a83q5h98c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 05 Nov 2025 16:46:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-277f0ea6ee6so821095ad.0
 for <freedreno@lists.freedesktop.org>; Wed, 05 Nov 2025 08:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762361195; x=1762965995;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sJFOrjhFJZHkN7hWb6jUgTkGNx4wTKXUTuj6Z9f24XU=;
 b=Dk4cRrPkheje7JdTNZD3tFh5ZdSXaMZCF4OPzuy1GPOK8llPqdUXY2Y4pDQ2WqY1J0
 0im7P13xsSUtuf3fHD4cN7lnkz/8xFR+v3kPBjjqrSGMlnCLdMncPpngiPWt1ZlwDTMX
 QkFMixni0915SSl1Ov5dVkzBucaPltglkPDimXayLJJPc8vEYUQubvVY7afamb7hYDu/
 +4S0KqqgDVKt4BH1IKYma3ydqas2NYSHIHEKzg4g7qWDDpONRGg1q7C5mmxv9PdZAJJC
 iTNElEvBROS9Ub9Z0pzFbdRf62a0sw/48+5BZxsgEnObW4Y6/gI4kEUvfBDI1BB/Zg2w
 G/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762361195; x=1762965995;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sJFOrjhFJZHkN7hWb6jUgTkGNx4wTKXUTuj6Z9f24XU=;
 b=uGjl/cPCBwC6PUZZ8KR4QOC+GEXSamGjSG9sXQ6CNlhtKPYhHbY9RamcxYbv6p6zuM
 d2yPyxhPtboKm82zIFSMFOZTBTDpsWWQ8Qi/uRpaKUReInj5rSUs9n0fFvpLSH/vfJtC
 cMMZGRFBgzeqLnm0D7kRF6Ehm5PY3JAmHamv8xXC54CZ/oPdtTz444cMsmU9wm5sRHLz
 Ty2HvhtmS3GkFXTV6GdtiEXhmQ7N61BHVyS/m8ouo3Wd6koOkxk3G3tsOrJFR/bGfhdn
 6u6d0vdl5I8M1zNkxuI475t5ZPDWaMVt2FERCRYrO2TO99muXR99A0P4MAJmG1b29f0q
 Fisw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJDo7iQGObY+iYkcHDRSAOzczcWdIfQlk4lsRPZ2QE/Z17Bup1KtW7R0xNLurUe5ekFD2of/DanM0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysT2/fQqcAGRixfda88mVUI8idCSjLtN5qCbyzgpyrBrCQrXl5
 FwuZWTlTwj6ZCqa9iGvVpqx3uiDsIYeoNQRuWVwUqN0kXJmJ+fVeSQw4CLcYsd3ll3mNtTjeFuO
 r9YKhutjlCcYDiLYCkKjpcLkzI4CmNPlM5Ij26eh8i2yshHE5vJ/irEH9W9D3XPKmrm+VC6o=
X-Gm-Gg: ASbGncvBo1GMTXSFy5mlvNFMcbxVTCgBPlf/FU+Jq2PasSo5Q7iubLcBMdlIQz2Bx5F
 qeUqkdSgjoL6+609T8WHqn0apQMMe4lePS6tbh5PfOM3n9JqUVRSUbDTgyTmbknHnCGQrAv31dz
 pA3SILLLvyBtAI9gzl3uSbTBEEl1IDaMwRp2VWMgJBlevYC+dNm8MMx+Hv0lIyy3FVtRv/V4ZEC
 dkQhUp71eEBG97PuPfNP6mL6bIBj0rXiM/t/J0GGBXFYCGlzPXMfd5ey34owSNS5rrqUkgpjzxj
 MHxLIjKv6V/d3khWyiEbxc+/EJSp2D4ccl9pJ5oYJttRvl5kbzbHatKZlCWzE28LKgE0KyWZu8E
 U2S4TBS1DOWMT6q/Yf+gF1wM=
X-Received: by 2002:a17:902:c947:b0:295:7b8c:6622 with SMTP id
 d9443c01a7336-2962ad10486mr59682465ad.11.1762361195380; 
 Wed, 05 Nov 2025 08:46:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYVpEn9p7yDIsAYp1aZP87Bdl/2uK5TgZtdjIwNg03NFpwQ20p/nGpKGX/x/FLTLX8/vHeGw==
X-Received: by 2002:a17:902:c947:b0:295:7b8c:6622 with SMTP id
 d9443c01a7336-2962ad10486mr59681825ad.11.1762361194676; 
 Wed, 05 Nov 2025 08:46:34 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-341a68c822dsm3426249a91.8.2025.11.05.08.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 08:46:33 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 05 Nov 2025 22:15:48 +0530
Subject: [PATCH v7 4/5] arm64: dts: qcom: lemans-evk: Enable Adreno 663 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-a663-gpu-support-v7-4-1bcf7f151125@oss.qualcomm.com>
References: <20251105-a663-gpu-support-v7-0-1bcf7f151125@oss.qualcomm.com>
In-Reply-To: <20251105-a663-gpu-support-v7-0-1bcf7f151125@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762361159; l=804;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=QygCnmXl5Esc5BPNyYe6tgH6/RC9PgKmXDBI3B/5l+4=;
 b=kkr/m55E2zuEnA2RDfM9Hl+ewlE6yBtGv8M1mz14zrUkkvyLGc1oQRrfOQuIGcFm462YtTEbc
 +q/796q/1FHCFP/yO+/k9iCY1uPTdpFDahQ0z7BN/arcIQwhtr7ayCa
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: JZ2fnpleWYnCGcnNs-HCFyntdk0n-x31
X-Proofpoint-GUID: JZ2fnpleWYnCGcnNs-HCFyntdk0n-x31
X-Authority-Analysis: v=2.4 cv=YZKwJgRf c=1 sm=1 tr=0 ts=690b7f6c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEyOSBTYWx0ZWRfXyaI//743wP5X
 zCiPNNq3gT2VI6M7Emk5ftJsk7KtVW7syaQlYK31U2WR5jeDioZtzzuOVY2YmExlQ52IVzWmUMf
 /uUhamKphkjT0BDwBL+nrF7Les5jcppejoP9yZ7a/xfp7mvOKOLzffz1RDUxd4guGufMIFHXB0P
 mSewqYtV+73jNSfLCLUGoGWfwcpOundlRYCJTlU9UuPA8g++Xh+x/qxBnHPscZ73bnD1TcFCzB7
 NMJxtXWgJKAD8HLg8nS0t387QhL9e11TTNH6Hs/j351GaI4InIs6DgvbOvW9Se2YKe3Bj1ePf15
 dDWTDIJFwZUd/YjXcDHiKMHKX1bg3aT9RzE8Fd01NDVmdAycqCpKaMOiSX4KH4L1ChWUV1BEIqa
 swPN1q9jOhYXRV6k6A/n5aiWjui1Mg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050129
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

Enable GPU for lemans-evk platform and provide path for zap
shader.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index b40fa203e4a2f080f501140fd1c68b72d797fd00..28bf152f5fa8e8d7779904986da1a5c2f06a5909 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -454,6 +454,14 @@ &gpi_dma2 {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sa8775p/a663_zap.mbn";
+};
+
 &i2c18 {
 	status = "okay";
 

-- 
2.51.0

