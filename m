Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A646ACE9ABB
	for <lists+freedreno@lfdr.de>; Tue, 30 Dec 2025 13:34:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A76810E8DF;
	Tue, 30 Dec 2025 12:34:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OEFFuAyE";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NOfYXecW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396B110E8DF
 for <freedreno@lists.freedesktop.org>; Tue, 30 Dec 2025 12:34:24 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BU9iKbh2392639
 for <freedreno@lists.freedesktop.org>; Tue, 30 Dec 2025 12:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aEVGgk43InWXkMlLBp7TeOfwGrquzepV3s4rSmf6aYs=; b=OEFFuAyEu7bJS70j
 bzvtz8ZbQct21UjEyrooakqrq/RColVR96ir5rpwryYthuhoYskAimiy0KUcDJ4v
 CB1ZaRlaMZQm57L7Xb9CDim6OpD7Kr+l3q+TSLMPb/+MJrZlApgIQrF2yfbFnsH1
 KIXZ9AxZPeCM4pIUqPCm+pWeZEiag639mhuzJhLavRVjHWN1eVZReqD2ipuSf51s
 6aTNfxUwOpRLAY3qBh9nkscwciObwroleFYYuJgEe7LYUQ18qqDNLz9QmNUqBUcV
 MKyE4cL94ggyfNJInCv5uvJRuDdY/Zl3K8PhvlD7AhKsgRL9tEt+dBxGvhZE0zla
 1n/GAA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbqk1b4t5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 30 Dec 2025 12:34:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2a0c495fc7aso143533715ad.3
 for <freedreno@lists.freedesktop.org>; Tue, 30 Dec 2025 04:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767098063; x=1767702863;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=aEVGgk43InWXkMlLBp7TeOfwGrquzepV3s4rSmf6aYs=;
 b=NOfYXecWiv0IaPG4YD5eFvMRPoR2Yn1oa9D9xUg3fYlA4I9nYrUL3QKYo7Xre+uyrb
 d1fIVYFHqj5BLGGuICdJSxBx+lCIsQOPxa0iPJEHRvAbNcYalgC/dfvGiKE/0VxHqdtR
 O9Ie8IKVvw5NZ82Bigur14VyeAuyfH0MXmaCzyNRLxzN2E0soBN0hu63S/YtpU6ptQen
 NYGfGY7ilXFuasCOGLjvlppCSuSv905WnRIhGrDWjZFncz0clgKiR/7nosJbrOZK1nDO
 NpdCibB2Ab2Ce++6q8/N2w988gymQauOwXtNiy/0NHLCAfubzIHVpVE636LIwsNAZx+i
 TCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767098063; x=1767702863;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=aEVGgk43InWXkMlLBp7TeOfwGrquzepV3s4rSmf6aYs=;
 b=aVccTX6jo6gLQvIvtv4Pi7SqXjTk0KUDTA3ToIraVqwR5xedf5+ys7Qx/qSdxrxa22
 AIdhAL3pF8x0/Wf1qXKSMvsw+2dEuTBanLNIM3hb5IwFdzBvOLLfGp1/4X7vOrq7pBEP
 MBLQvwatq1lVTS3WY6kM8dBawKvc+a4ov5AfoXCRIkyXOfyADYo2d202cKs/AEa8x9eQ
 QIxq1bQibFGK7vACh3EoCT+uA9/fmZaN94ybv6yyZvmG3eekdVK3DeeIcR+uhKHmHpKt
 qblnoj2HH5XXeAS/HTv9Ttm5WIiP2+uwmtu77iWG474s6YH76oItYGNw+F32zx4dAglK
 oupw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNAupXAwpzoAHfN7jzy1RxjNWnJzlCW8/1eoKBgnf26cHUK1EfsR3P3Xo8HxRIF9ePlqZqVkgDpTQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyl/mypTG9L8DnwT29zB7dqkHAPvQ9VdBJ0Qh8V3eWPBkwdxkeF
 tgsg9U6gjFx1Y4dV77VEw0OoXyIb+7pQFsl5Ro/fOjCImkwOYwEBZ3NCPFW+C0JR61XHL7MTzCY
 8rJa0ee+xgGat8WcLRoIIvyzu3dKqXCyT+uvpP9R6n9oUeQnhqPv9AVVDQVAE5hITx8bEans=
X-Gm-Gg: AY/fxX4dWWqPAW7CRCtItTrlJ0Vg/yZVtJGFzBzZTl4puywVLaOzAhmS2TMetofiMV8
 AxSMSebWBTvj8Qa7DOoc9kaGyJEpZX9IOHTnH4XlGeNlA+Yta806/WURLQNxim8HoQR3kt+Itn2
 bjOc4N2/HbX4tEL4w+xsPYHa2pDVscmkdYDzOvKRSQ805tMe+K+FErv+HIsOTo14mlDRBZt9Fb4
 JPGBvgZZ14vjJFbYvqqHhtEqZlppkaDYU0cmtLs0h0QFBD9dPjyYpneBT03lCT+pH9fUxQ8qAH2
 yaK1TYzfu4w7fwjbMUwFuRCtlF+DcmsXlY5OnBhkdoZTzEI2CXhDTaJyC2ILKLPNr3XNGuKfjOf
 NPtjx2W0Epg5t8h1OLXiVqFp6OFilc89xSw==
X-Received: by 2002:a17:903:2a8b:b0:29d:975a:2123 with SMTP id
 d9443c01a7336-2a2f2a4a33dmr253486565ad.60.1767098063070; 
 Tue, 30 Dec 2025 04:34:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmUlMjN0jkXXsLDM0SUj4DZctVdikMsb13RbrT2rvJj3FRqIOh6cgbO6/abhTatzQ9x/L5Dg==
X-Received: by 2002:a17:903:2a8b:b0:29d:975a:2123 with SMTP id
 d9443c01a7336-2a2f2a4a33dmr253486345ad.60.1767098062600; 
 Tue, 30 Dec 2025 04:34:22 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3c6a803sm295748695ad.6.2025.12.30.04.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 04:34:22 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 18:03:27 +0530
Subject: [PATCH v9 3/4] arm64: dts: qcom: lemans-evk: Enable Adreno 663 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-a663-gpu-support-v9-3-186722e25387@oss.qualcomm.com>
References: <20251230-a663-gpu-support-v9-0-186722e25387@oss.qualcomm.com>
In-Reply-To: <20251230-a663-gpu-support-v9-0-186722e25387@oss.qualcomm.com>
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
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767098036; l=748;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=3NuLQ7ILP4nX4v4WKID3hOQ6idOK6brJb8aAZsNOqx8=;
 b=wUjP9BE+EXI92DFSQNDKgSm4uzwATlh0dVGWbBXws19VW6ZI1MhWCZLGxCpMCy9LMdlKGJ+tJ
 z/PjNhxzyJIBHB0iAm2tYl7SXz949/61j2aCy/sdteGpxiL7YyXzmdr
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: cZuiZaTw3L2jvQqp9dIJXWlffpO8Stj9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDExMyBTYWx0ZWRfXxKUW6EJUoQfK
 TLko+sakRNezXsaQjRL4hyVdnLb+Zps1IaGLLV81JV0dJTAo7Eque0xDgYaelfjaxXcPEfnCM7F
 2iW5igKz1/UwRJPIXokAJQrf9lpDsEeVMkkIEZAnU+JemEgWS5ChinVCOgi9yiHVg6rgldbRCIY
 72WsdR9lGmPYYAgGuymXaHfK3PkePWNl7MfrXJsMV8+g78CVPrX+p4XqZoz4PGrJlvwcGwM6b5T
 rbbmyZkDdwX7TS0SJz+lG078nFntw/faGM8sL+DTc43dkG6zZNAwHHuuA95hq4qpGWHZHEOfsy5
 bZEC+wivTWSAYWjq3oP9WqGUGzLjYXErwDlESa4GIfXLwEpZCe6wE4dvKU6B91CS4gtiCGrhf0g
 +2E3I0t5iF/vOj+UJZosIvYm+uMfgqQGS/b6aCc57jl9+mbIvmt90bX2oEaXEqMmcfgrCwlyRpW
 bDxwQp/O1pd1dH4Lwdw==
X-Authority-Analysis: v=2.4 cv=Tf6bdBQh c=1 sm=1 tr=0 ts=6953c6cf cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: cZuiZaTw3L2jvQqp9dIJXWlffpO8Stj9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300113
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
index b40fa203e4a2..28bf152f5fa8 100644
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

