Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 212E4C3D69A
	for <lists+freedreno@lfdr.de>; Thu, 06 Nov 2025 21:51:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B4610E9D6;
	Thu,  6 Nov 2025 20:51:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5xvYBJW";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F0TmmmRL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B7E10E9D2
 for <freedreno@lists.freedesktop.org>; Thu,  6 Nov 2025 20:51:08 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A6H3vpd557751
 for <freedreno@lists.freedesktop.org>; Thu, 6 Nov 2025 20:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YoEkueyGRAiMfd/Q7doMNmlVs1f6W8VCVBPpZYSbqeg=; b=A5xvYBJWCbow+CpC
 jzLRB/rLr3dmskeydY4gCfFWVkQo9mis7dUvKnt87XPjyb8Hg2ItLB/B/VwGp36V
 jPcpD4WwxstzgFBIkimLC/UKbNeEUU2Ii2LFYd4t0Qjm9UDRTUvTCjPPmxlymVwm
 Mjp75dKdHjCW3VYNiQnFGwEwgPCa/Mhs6fGnLM3+MmXM295LfccqdrBXMUbInvRd
 gUgz/64Nen7UzJ2Z8fwxGfoJbco2c2DA9Vpeoay6N3p7NfFZbiiSB6Ehz5uz1ZTL
 oA1QIwNyned7xvne+UjIfzkdBNpchtcEhX1WcSwfi49M7SGoaegAp5RvAUFuRNao
 MawqbA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8yr9rmtn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 06 Nov 2025 20:51:07 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b5edecdf94eso139333a12.2
 for <freedreno@lists.freedesktop.org>; Thu, 06 Nov 2025 12:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762462267; x=1763067067;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YoEkueyGRAiMfd/Q7doMNmlVs1f6W8VCVBPpZYSbqeg=;
 b=F0TmmmRLgs0smXy8SFK371R9LrBIjuuKyXfBIOq0zm/KoQffXSLvooe+wcJB6ERX1T
 9GFaq7H20ZArbAXHoF583nTE8ujz5LmO4SBQ44bA8NqAubt4ggg0ODq/b06zVEg0Us+n
 YPrIYDY/lIJjOwutqicIKEuDsRlhc+1z0JF/85oY04SFEPbsgHhESfpliiJoGG9zMtb9
 ZDkEZFzm8IljusrJCqvrVIYx+oQrxOP5XOfBLYIB/QiLetSYP9htacV09an1l5sE+Z4d
 /ItSnEXIzL3t/f0l5STV0sKGXgfzNJWxrlgub+2jJNCZf4d3VFtFOG49cSMwc97+oqW1
 +e8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762462267; x=1763067067;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YoEkueyGRAiMfd/Q7doMNmlVs1f6W8VCVBPpZYSbqeg=;
 b=NQzO56sVCqXukESSPoumnKjk1RPNPK3Gamn4NkY/4+abCw9Mi5RpE/eUA02JadNDpL
 JZwong0OVVkW9FWFmXG+8nlgHWj+sRUceD3lWMYMrIkIQ6vsV/L0JekvuWxzljSd2DPw
 OeaWLKSfgxWmas4ih1W8bL0rZCTFam7KE+Bt669A+EsUCRlp3eMAGqlCj5ruiiUjfj+f
 2n2MxE8iteRFsop7B9mPWTTbBVLnVZFIaJ6s8VPHKitZxhiCUHtvB5ytFrWKNkMa35db
 sHRrca9pxzp6Jshjvs2gHzB456jsRpAscBEh21tSkYAHItubEz19so/d13YkQ64HVlpr
 r2/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeA1/QHPiU9kHKIdtifeLZw8GJl5O6jmJ2FQbRSUNDGOFmPjOF5ZIV2UeZ893ldjxTwV0wqIHxfcc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzlht+1YO0hdoUWqdMgZKqeJuc0GSAtVIlt73UN4pS/3wh4L2yO
 lgkY/8XU8ENYHkIk5cvMgq0vemTGIGlU7Ok5QAbHQ/JjtBEf0Hc6MLQXr9gSBTUQSnLNHZ1KFYc
 dfjLbaqCPjBUT0BUtRdz55ijkVn1zv8Brgkvpn7Hy1/INlggjHoXAT7Afh2FDV96ctThyQ8w=
X-Gm-Gg: ASbGncugyAQy5XtcgvZSg2htfuUcPbcEksXZ9aLI84fkc9XRmtdQC0LPa9vCJfUBl53
 wdvLUMVfRlPi95291hCKG9Tp0btLpo5zoR2lp4udqAEacHD8eOl3Mt5NX9DYCjs3ZYq3BAXmr1b
 bPNJ9nODRtO99u7lXlkoVzehPsJELbUzsnaQSqa9Fc0YWV2vbw0IYNHjXIRoY8nuIb602ff3/pW
 u1Fj70QdTYurgcZK1N4ZKfySP5PisndqDfDa+GxpW2l+K7JNzN0IN215dUfH1JvDu+Fyu8I8SPp
 qEJqsgKppf6pFOpwowEueDG7eTKIc2Mdtm5avMVXuqLPALAh/IPK/wGhyKEoArRTCjMmGY23qLL
 XF4ueVl3pesNwE9zTwCNgCEo=
X-Received: by 2002:a17:903:1a2e:b0:295:810d:df46 with SMTP id
 d9443c01a7336-297c038986fmr11173315ad.3.1762462267084; 
 Thu, 06 Nov 2025 12:51:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUnykgTd4vSRne8AYjvHJFdmuR43flNPlXDxQA7vKQ4GlH5pGw+W4vj6jT3OxMKHe3MdZiZA==
X-Received: by 2002:a17:903:1a2e:b0:295:810d:df46 with SMTP id
 d9443c01a7336-297c038986fmr11172885ad.3.1762462266561; 
 Thu, 06 Nov 2025 12:51:06 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29651042c24sm37408815ad.50.2025.11.06.12.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 12:51:06 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 07 Nov 2025 02:20:11 +0530
Subject: [PATCH v2 6/6] arm64: dts: qcom: qcs615-ride: Enable Adreno 612
 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-qcs615-spin-2-v2-6-a2d7c4fbf6e6@oss.qualcomm.com>
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
In-Reply-To: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Jie Zhang <quic_jiezh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762462219; l=818;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=G0zTCxAvZRtlsdP6kfDAlHz0/SPT4i0igeosXxhSpIs=;
 b=PHjlK5g55w0Vljmvd6L93DbkLlZ0jrruKXyjXDXNiFm9PcnV56qBp1QBFr2VB4n2Yv9U/GRVH
 CW7BSn4O84rCWgrOzB+qMcRbsbXntYcRqK6aEbUq/bRxSPUfdidq1vZ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=DrpbOW/+ c=1 sm=1 tr=0 ts=690d0a3b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 2OLlVaKVls8OGu42ORAqyk1-24vC8Jk3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDE2OSBTYWx0ZWRfX73bQgue4TIlC
 1QdCQ0f0nhB/LrNvKayOuXFaQrWY4X+q6xRzkQJO9YVQuDouh8DO2vPzu2yL78+lgoGKzFPczEI
 wvt4tIeDf1RxuVDtLzZjA+VsrWOKkYIV0JEJEpyvTuK8JbaPbvbFT5S6nY54sCpWmA5nGdAniwJ
 EcqX/ZxtpE1DeokwH8NIErcXSPLZSi8Q4ivlWeXIhpPBC7D7WVRj9PCNfA6E7/IrSZZ4XQAXqir
 LnvtCF9gmz+dsv7tnQzomdR65fjeLHYxsXL8MqVJ/UfTws0cONrC7ZVR0YFeVZQfU0LmqfRXOlV
 C2ZJ1jCTR4ldqMw/05DEzI2HWHT4PDt3imt+MF60K5r2Htw3qF2yS+ORJFgzZuzRXhaAxcWojfm
 8/Zub/8e29Bfy9LldF7JarKvpycXhQ==
X-Proofpoint-GUID: 2OLlVaKVls8OGu42ORAqyk1-24vC8Jk3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060169
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

From: Jie Zhang <quic_jiezh@quicinc.com>

Enable GPU for qcs615-ride platform and provide path for zap
shader.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index be67eb173046..33e33aa54691 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -358,6 +358,14 @@ vreg_l17a: ldo17 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/qcs615/a612_zap.mbn";
+};
+
 &i2c2 {
 	clock-frequency = <400000>;
 	status = "okay";

-- 
2.51.0

