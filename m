Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF7EAD1286
	for <lists+freedreno@lfdr.de>; Sun,  8 Jun 2025 16:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BADF10E069;
	Sun,  8 Jun 2025 14:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jZGHI5nL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D1610E3B6
 for <freedreno@lists.freedesktop.org>; Sat,  7 Jun 2025 14:15:50 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557CvMWQ013414
 for <freedreno@lists.freedesktop.org>; Sat, 7 Jun 2025 14:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 e2nJaAzmCmJpQHSs08XFmrbpQ14EhvsPNPiNTSQUelY=; b=jZGHI5nLZI5hGMaR
 gCxGHxaLP5Y1D1HwZx4aiDNjMae6QwfLi6XgAto57v8VLKsrSKKy9SoH8h5Oktao
 fp6lEIqMepF7jpd7hthOuLbX/BdQsJPvrWBsIfuoAFj9K8TfmuS9jqL8QGNBqqXK
 l0EPCW59iAYf0tYwu5HUujjbGDVLK1dS70Dq2Abw8lArFp2/kfQbYsLX4x94tOmx
 a5u+RAeupT5VKJ4c8/aYfvTMJI6sK3bhWoukt91F2ncPswKdDCYdptPU4Bx2aa+T
 VW3W1AeJsWzU6e6CgZv211VygoZ1F5EzRbb8yQOlW6qfvfvIfJtY1tZYej1dZU0U
 pkg75w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474e6j8m58-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 07 Jun 2025 14:15:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-235c897d378so28424205ad.1
 for <freedreno@lists.freedesktop.org>; Sat, 07 Jun 2025 07:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749305749; x=1749910549;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e2nJaAzmCmJpQHSs08XFmrbpQ14EhvsPNPiNTSQUelY=;
 b=q/7lnTogtU1BJiON0J3X49WvXYPQJauY8EST9CYCvVTI2RpHsLRvh/zq/n0uanlsnJ
 snzMTCtZDryB6MFxkXKRMCaZaekbjeF5TLNeVlbQKMyJLB8SJKi+9f+ux98ted8wVzlR
 QQWVHV+GVE/rkqg8V1H9v6a8fr40podVeWQOVRdw6g9Y478PYZdLnI8lxgRMbxtOqhXR
 ONPMvbXclp4xYvxvJS4qQH6yyOQ9Q28U2SBlVWjKS27cZE76gaK2iPjcO5o9+UwJIbaQ
 v4Cst+Z69o+/BAzM5i2G3+XHVpXimi8pEQXFh7zSB+xWfFkxDvgzgam0b0xouj9ns1nF
 gXkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWb8R4LjcKzEYLScyK65iVfKWh8sBgw7ATh7vYCDrUkTjM4iCauEg10pOasg4AQjGYdKZiTBwrU/R8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywp/2tZh6sDY/3jEzMAUls6ckrRgmVfvPch+wQqaSE1OH1zfla5
 r+0ldX0lQjKoyaYX6z9MYTFYXjelH6ErflBMlR/3DP43eBMERWYYKx3JjQn5O39h6FVjH/ebpCz
 EJvjmMhgGH47u+FcE90F0tn5MqzJfuO4+OPj9aNTQhhG96AyBkl5d8Y+OJ9lQWEzTsoU7/x4=
X-Gm-Gg: ASbGncttXk3VE36lv6hmfcVFF0XR/0kGhRSDDSF+CqQmeIUiUYRhnjKT8HcSU8p53YT
 ZUthgIUh6sJqbE218QkviGRS8hkr5V5C7vxwvsuqKWHF4qlAiD3w7MrJrszbbwxiVPZV3ubcfIy
 Y1RQUIndbLYIKRDefyzqNMEuBv+onw4XHzN9M4JbXmc2ApQJlL0NJME4OuHOExzMAXIeiuXeTj3
 Gk8X85DUxb7OJjAxe4V6A4YbbKkaO04t4LtK/jkKPPwo1M2Gq58hCdYaLwbpq/a93eHi/SLN33V
 N/86+3xsOPUX+0LPpL51qnnxK8Fs05GP
X-Received: by 2002:a17:902:da8c:b0:234:d7b2:2aa9 with SMTP id
 d9443c01a7336-23601e7f4eamr98882315ad.29.1749305748854; 
 Sat, 07 Jun 2025 07:15:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHd4AhO0+uyFenbxz5BoU1UkltM+5rAvhX1ayslAlVrN/dKMNnxfksMZHw0Th/YAjYimUSGQ==
X-Received: by 2002:a17:902:da8c:b0:234:d7b2:2aa9 with SMTP id
 d9443c01a7336-23601e7f4eamr98881805ad.29.1749305748452; 
 Sat, 07 Jun 2025 07:15:48 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23603405732sm27500435ad.155.2025.06.07.07.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jun 2025 07:15:48 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 07 Jun 2025 19:44:59 +0530
Subject: [PATCH 1/3] arm64: defconfig: Enable X1P42100_GPUCC driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250607-x1p-adreno-v1-1-a8ea80f3b18b@oss.qualcomm.com>
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
In-Reply-To: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749305735; l=768;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=IqnVoqmB8d59JEJdsGY4n78aKgioKIUNfsYGLkBpCCY=;
 b=orMoZgj6M4ufoVDkueL+fO7/LhI5JIhY3qZdqVDmIqEE50/Kj3kw5xT+6x+14Co9K5qyeq0t5
 mqNkL9pGnTGCbInzyOTHDsuUrJiX9j4N5pxuICrEcKGcCO12weAfn8F
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=Id6HWXqa c=1 sm=1 tr=0 ts=68444995 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=1cELwbfB7FenbO21xW0A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: uhgy5wy4MKmG6OoyXTOZ1vp9nXYyFz_S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDEwMiBTYWx0ZWRfX6AGpVR19OAdP
 +uhtBZI8RbX+JIEaJzdPnsKL9WkYkPsx6U4uYHU9C+CdmweSI4qlHwdXZ06pAdFpP/HB9gNiTvo
 JmZGASh/foPwrO69Vd6S14cumn9QMIBoDWLRLHyiQe17NU3DyGhvyrxvKJR28VHzXw4c8vMaLeW
 RIBysHqJ0lcX89pEQKjTiIhRfuIDhXDFBrtyRAptxiAHQw8s+a0KkqY6Pf9whnIWSvAKV5OIOrK
 bvCEylRig42Q5IlJ51dspM/NcqsMY+T6oTDrb2vaEf1IvYJ+EnDFkIF9QNOake6sun9rfYWQxHq
 eCvsuFbwG7EC/i7qjLObucys0Ebymv+7+3CDlPj3rOY+qhOJbd/RLo++N4BLwzvLnsXmuAm4faP
 dXh14zWe8oo6u8MloDCJ9rrxH6MoSOITFYB6xvicqgQPKDH8m+ajUfd0Pl/YYH8i+b79L4GJ
X-Proofpoint-GUID: uhgy5wy4MKmG6OoyXTOZ1vp9nXYyFz_S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=614
 clxscore=1011 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070102
X-Mailman-Approved-At: Sun, 08 Jun 2025 14:06:41 +0000
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

In order to enable GPU support in Snapdragon X1P42100
(8 CPU core version), enable X1P42100 GPUCC driver as a module.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 62d3c87858e1817bac291780dff3823dacd72510..9cc473fd0d3308f7869d00425e17b114c87093b2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1350,6 +1350,7 @@ CONFIG_CLK_X1E80100_CAMCC=m
 CONFIG_CLK_X1E80100_DISPCC=m
 CONFIG_CLK_X1E80100_GCC=y
 CONFIG_CLK_X1E80100_GPUCC=m
+CONFIG_CLK_X1P42100_GPUCC=m
 CONFIG_CLK_X1E80100_TCSRCC=y
 CONFIG_CLK_QCM2290_GPUCC=m
 CONFIG_QCOM_A53PLL=y

-- 
2.48.1

