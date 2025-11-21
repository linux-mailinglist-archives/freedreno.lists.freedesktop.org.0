Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 577A0C7BCDF
	for <lists+freedreno@lfdr.de>; Fri, 21 Nov 2025 22:53:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B8AE10E915;
	Fri, 21 Nov 2025 21:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hfecvUtB";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NP6qVqa8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52FF10E913
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 21:53:27 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ALJOGxI2747146
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 21:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YoEkueyGRAiMfd/Q7doMNmlVs1f6W8VCVBPpZYSbqeg=; b=hfecvUtBDr4xhEUw
 aFCnwq7/tw/e/G28N3fVgJFwHDeRgoY5rsRJragh197nKdDt26NaCEgZzY8IoUBu
 14WyLhNoJcKA9FTTtkolck188g5bdi7n1FqC+jxUer5NoQPNwV27xmosL7P36/Bk
 5WHTzrBH1PnjK0wZHX30e9JV+hHec78of5nBCmavVaIw4VM+nuHODeTjTeEGJ37P
 nKWdvB+b7CKRYtxiPNnNf6Zbzmd3tinplvGKlscEmUTUbUKdga8bdhjbtAVcKqLh
 t92+1lZHdNKH9L/2W3im0XFQ5FeKQGbq/5sOwFgazoHlbpsr4USkHPkU6xpCGur3
 A0WCIQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajgeh38dx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 21:53:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-29557f43d56so33729745ad.3
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 13:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763762006; x=1764366806;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YoEkueyGRAiMfd/Q7doMNmlVs1f6W8VCVBPpZYSbqeg=;
 b=NP6qVqa8X3ztHsol5bY/Mlm6LfGH/7m3a3r+HSiJQvGsbXYXmF6FcuKTZp/DYN747b
 4wSxqkpjaXPVM/UI1qk2bU63pkirEpP3nhKaQEda9Ubxbwq99b+NMACnpgc34EKKjiVA
 fRdNQritUc/z24Ej1vtuMLPiZo0eDtir6jsoAxsAdwxpluJS12inp9V2H+nyn0z8uOqD
 5ko81NkIwZW6Mqtk2A8tPUqs4klyXGqbc7owvVIuamXLE+2ikDXyvymzs7XXgFkgVBv+
 pbw48j4jSUPtMG1N9baqvEDDWJTXWO31qKqgHpEZiUDZYajEw5WYkcvu4p47JuoaNtzA
 xuQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763762006; x=1764366806;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YoEkueyGRAiMfd/Q7doMNmlVs1f6W8VCVBPpZYSbqeg=;
 b=eiU3jo4Ggz6rnEW0EkgXEf8ZiixvlBY4OYm40BfxbQ2Na4eo5ZFmOvEBuLApBlwSK0
 qiLg90qGHAUN9RuxMpkncjLb/v3E5OfSB7avSIfZk/+jZTQCZc6JYUvsaobnV40kf8//
 C0PwKV557l0kKHTbhkturI1JxGTzpVdpn0G9nWxboftQ9nO3G9FWQz7D4gZTdl1Dw3NA
 INaCY2Y8Xw8oEv+u7pzyO0a/D81Tm6TaaiVIWCB816fwlKkTk0RNnv6GBy9iYsgcCXa/
 DmDymqTMHs8aOn5DQ8I5CZzVZL6AfLT8uk1STSdOxBpq/9QYyOcZadvXG7YCIhAan5l0
 6qXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPYxWQ5D6x5xG86u8mPkG5Z9fKtzZaKuU+cQGBqg4K+fWUxEbvA37b5N2KCbXDB0LFjjNmN5AUeI0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1KAr1atVAbOGkgKVvHRKWs+w/dc8FNg6bnI3zXz6WiggTHAsF
 pEk1l3OgHCtCcxXt5z4J+NBKOskpErPZqSt7veTacJH86tEXGkA9KQfLohe2kMDcXL1WLahNkrR
 EqqVvmeFmTkU+ML6NqZFS6OFKpvML7wG6xNkEFDBIQbB3dz8grjUvtiaMaxaX/SoZacAqqlI=
X-Gm-Gg: ASbGncvAdMa+R9CmoGLvnu8QIPGzH2CmfhNXjLAWqwv4oGonYNKJEeW5PM1cDvX2YgX
 Ph4WlJtEWjiH6DCnUmkz1hDwtOIifcnAZtpMc7R8GTL7rab2ziNK55/DaFbU2T8cKGeHtgT2l0h
 4oEoQzyYTx3HjrIt2Qf1i4wmJc2B9XeZuxEJFzZ5nN7jEYxKQwealRcJ5fOa1o+J9hEuxqJgPxs
 I5xcZqqtRViBpNV08Vlhk1mvdZiwCB9BoPVKHBmzYDSrNYqHD3Czx1sUcl7NmyCzrsZp8mgckFG
 kKRP7Dv93fai7GN68wTSrqtvpriE68u77ywpbMTkjDaI0YLEvGf7Jpt3Bubxd+Ua83oK2gr12/f
 s9oF0tgTHgHsOJJSYbGBT2MzHwtEoa2aYVA==
X-Received: by 2002:a17:902:d508:b0:295:7f3f:b943 with SMTP id
 d9443c01a7336-29b6bf3bce7mr57333115ad.28.1763762005978; 
 Fri, 21 Nov 2025 13:53:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/BZzIAWj9eYtoZjfdFhYq2QQUL0Yy1J7PWU+USKHwk6VLoY8JPIN8Q5g/Xze3sjEhINVm4A==
X-Received: by 2002:a17:902:d508:b0:295:7f3f:b943 with SMTP id
 d9443c01a7336-29b6bf3bce7mr57332775ad.28.1763762005503; 
 Fri, 21 Nov 2025 13:53:25 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bd75def6314sm6399270a12.7.2025.11.21.13.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 13:53:25 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 22 Nov 2025 03:22:20 +0530
Subject: [PATCH v3 6/6] arm64: dts: qcom: qcs615-ride: Enable Adreno 612
 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251122-qcs615-spin-2-v3-6-9f4d4c87f51d@oss.qualcomm.com>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
In-Reply-To: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763761959; l=818;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=G0zTCxAvZRtlsdP6kfDAlHz0/SPT4i0igeosXxhSpIs=;
 b=UbZP2+u7xwSxifbmFhS00jQ5//QuBFBJ3iJG36yuYizPabimYaRuDuTVZlieh8B8RWujVwS4X
 02z5wPC8isCBS4Kn2o58wioIRiGaRNFvL5AnTCMusCeanbW/ZlUnlI6
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE2NyBTYWx0ZWRfX3qCEndlW7u4Z
 cffA4evv/EG/LPtktIupsSwB8esy9F9Fvm3c5YzTOo/p6i2o5TW8Yb/GkogN7mU2DJ+yCe1G4xo
 AcspJZ+z5iXVbfvJcybVd4yPqs60XJrWFD2VCUtUpeoxiSb7uYyCTY5GIrAZlQGBXx2eF9jQVFt
 hdlT9U/lM/GggXWB3+nontmXtfU6Q8FbDn9PQoJUZ7fNbixzxvbWQtJQY3VTRK1BXaU3HvB7M9S
 u5WxZqShFnv8djKygwrQ9O+xD7z9U4d+oS8nO1S7w1+X+NUA+kxg5ZTmZnSX9rxjokj1Y3HvZqo
 HljD66SnCBVQ9u+ytyrTkWu9yjcCwQlIJ163pdWykVTqRD3C4Lhnex2MTaz3scoePFxeIhTblVO
 Uwl1z1Wf1uLa7c/SyQM/hidWUZ8Itw==
X-Proofpoint-GUID: WdKpVXcErtr1uO4IJQFII7qaLkZSXFd4
X-Authority-Analysis: v=2.4 cv=AubjHe9P c=1 sm=1 tr=0 ts=6920df57 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: WdKpVXcErtr1uO4IJQFII7qaLkZSXFd4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_06,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210167
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

