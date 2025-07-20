Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BD2B0B5CF
	for <lists+freedreno@lfdr.de>; Sun, 20 Jul 2025 14:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C31810E363;
	Sun, 20 Jul 2025 12:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MVvYvTWT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B296610E360
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:16:55 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56K5nA4v032459
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RghYj3as/mFUON2I1wz5/fAj1x0bQSOJ2EkHGXZdsjY=; b=MVvYvTWT9/RfiFAT
 mRu0Jvbz2/SOQ/CrUd1Mu1oI0E+n2YTXKicJ2IkAFeIwuVOoaQdV19qqpE3sk6mT
 FrfaEr5UdLhTAlrdCpGFF8IyEUshtjAL0Vt9zkLgoq20I/TKv0FSNxN1OeZZxPpL
 pm6t8qP5RVtz9aYEZLSFMvqdiThbKTcrTaGvZl7rT0M3ZEPzdJbBtdN4qFzG9Guv
 m/yfhQHYi+Um0DquLTB2hQs23iOlvWFsOEfp0gIFv8Qsoa9YnBxmTrU/rDgbOcpi
 tSmpkvGSQGFYP4RGikOok6ahRlS35RMdK9VhaoLjzqR9fuxnfevXNBhQgx2I52TK
 /VtpMw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045vt59h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:16:55 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-74d15d90cdbso3159855b3a.0
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 05:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753013814; x=1753618614;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RghYj3as/mFUON2I1wz5/fAj1x0bQSOJ2EkHGXZdsjY=;
 b=aRM711Z1M0Q4B2jGeoxYk34kL1O6zB21U/I1Q9FRi1VJDviR8rLfwUzEKAOOsfEtND
 fx0aF/tYv9yUg2dNTXlu0nBWIkPeAfbMIcP1z2UUa5+5JLX7tbAy01Y+A7sRqsdb74qq
 zCMOJHb2i8oEpzW1bJa0xbRdwC3f0UWIrBmAEI5qQdTHifBepkbdn4dG9OfGk/yJSaKQ
 RmEh7VbgPWt6UAlw7t6wj3l26CL6AVNqpPdhibXsGbI88O7NhvwWLwocOIrQeEyxSG49
 PhpoTU2muJSy3BANmZeqbi/V2Rx3YdCEYHY252oL9rU3yQKLqs9d3+hmIPf9+esFyMef
 /NmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQppchx1eHtP1vNAwAdTZFkjHz1RwwCyeOSEA41NbTGGJ5eEuip9HBAujKlff9Eh0KCeuZkCDz64Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwI+C5mPJ7ePP9LrOx8C93dL1JwEOUYGf1dbeqWGoFztW53VJ5Q
 G9y+h8Gi0OzFe+H3YQreDLKsKv8v8qfFlD69eD92rSSejYyuk26Hwwrkl+exYpso6q0CeEe9HuF
 7SeSSKu4sifyNfZqXgcasOZ18om4MHw79ys9osaFP2jJI7jdF8xN8nkLd1Wi7ZrQQ5rofkKg=
X-Gm-Gg: ASbGncv8MH9z03jv6qWAkvk+7qvq6qQ3LcKdPFuYcxm0+7Ngp1tGlRja5VLSTxeqGum
 Y9r8xpaNcBo3nsbewFTRPFr8zMjcZnv2/RWZxtgd7/rs+bGcXc8YCCTfjf3+dE3wi0+a8LmGvgw
 hVkhu8E8oA+cX5FhJSIoF0+Dxw0W+StKbveOBFte/pmIJLVZjnBeuIJWxoVXiPdNDPlkW8i1Mp8
 8cNXZJsSO+zY23XScjmea3dsxnf7vh5sJt50FWrK+8G85mHh8zpLKZ5cfsSykQXD14lOiCFW6JM
 hGu9d+va50XgeSYXv/a5IE1ka9BaYWLpSvq4e344zomsSs2ikGiVM4Wvc5wo4BkG
X-Received: by 2002:a05:6a00:2e27:b0:748:3a1a:ba72 with SMTP id
 d2e1a72fcca58-7572427e405mr21973333b3a.20.1753013814142; 
 Sun, 20 Jul 2025 05:16:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHm+33dVG/fds/ip7b4Ih0P+9rPGCwWYA2APgeQY1skgsNIAhOHZiM8LTIZzxoKQic2JN+5Ew==
X-Received: by 2002:a05:6a00:2e27:b0:748:3a1a:ba72 with SMTP id
 d2e1a72fcca58-7572427e405mr21973302b3a.20.1753013813630; 
 Sun, 20 Jul 2025 05:16:53 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 05:16:53 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:02 +0530
Subject: [PATCH 01/17] drm/msm: Update GMU register xml
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-1-9347aa5bcbd6@oss.qualcomm.com>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=2416;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ji+f74TQTXhSJNywxVcexEvz4zhxi/UIu3IXlExTfoA=;
 b=DzsW7cZ/8jSLmGH8hgbMy+4u7Cb41SK7Sn6nWDaSM7JFVA89fFUVKAqxE9i28wKmCfy1N64KW
 xs8lQx1uahLCy34eKdSSDxVvUFlIXiaM0Kf1ehSyEE7hj7qDtvNcXvD
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=LL1mQIW9 c=1 sm=1 tr=0 ts=687cde37 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=FORX3M3cBL6yUa9eRaQA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: KwFo-lpIIpE6Me8NkP_i3-GgIus7OEU4
X-Proofpoint-ORIG-GUID: KwFo-lpIIpE6Me8NkP_i3-GgIus7OEU4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExNiBTYWx0ZWRfX8ipVVGob5hNE
 VnSUT3bjGtM8jqHJbGLkjTE9nJZnuBeJHzlaMJAWkKBE5UJi0fVcuAVwkngqFxMYefRpj7ohjsz
 A7ItmVlsGO/LXAsxwn4aYIMMZvFXCGvCG7IMeV/G6xs30xRvs6VM7sFUf19dnJaslMm5OVsQ2J/
 q+qX4fWk9A8V9saNT3sYp0bxsZcB35RgmfwFwG5y5Nv0ENrJJ4+qPlMGdflJfuP3dck0Xzh9OxX
 sFcUdcOOWAdPGL8V5HO3u8KDxzh0HkwYvGN+ZPQBmoGiwYL3eyey8sKWfb3IGmw0Jhyg8v4rlth
 qMlmTFV3jBDFNddmtlOy16fF0lDFk79wKHHsav7mMHR8l+dhGYmRHGHjMZom3t5EdwlO1WnWSwv
 /wS5tnGtB4wKlCt42JY7vT4lBETYQa9JsA3m3EurbC11ah0ZDNrAWAe50/G5hexjyZv75YIQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=909 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507200116
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

Update GMU register xml with additional definitions for a7x family.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
index 3d2cc339b8f19c8d24b2c9144569b2364afc5ebc..b15a242d974d6b42133171c8484d3b0413f2d3a4 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
@@ -99,6 +99,10 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		<bitfield name="GX_HM_GDSC_POWER_OFF" pos="6" type="boolean"/>
 		<bitfield name="GX_HM_CLK_OFF" pos="7" type="boolean"/>
 	</reg32>
+	<reg32 offset="0x50d0" name="GMU_SPTPRAC_PWR_CLK_STATUS" variants="A7XX">
+		<bitfield name="GX_HM_GDSC_POWER_OFF" pos="0" type="boolean"/>
+		<bitfield name="GX_HM_CLK_OFF" pos="1" type="boolean"/>
+	</reg32>
 	<reg32 offset="0x50e4" name="GMU_GPU_NAP_CTRL">
 		<bitfield name="HW_NAP_ENABLE" pos="0"/>
 		<bitfield name="SID" low="4" high="8"/>
@@ -127,6 +131,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x5088" name="GMU_ALWAYS_ON_COUNTER_L"/>
 	<reg32 offset="0x5089" name="GMU_ALWAYS_ON_COUNTER_H"/>
 	<reg32 offset="0x50c3" name="GMU_GMU_PWR_COL_KEEPALIVE"/>
+	<reg32 offset="0x50c4" name="GMU_PWR_COL_PREEMPT_KEEPALIVE"/>
 	<reg32 offset="0x5180" name="GMU_HFI_CTRL_STATUS"/>
 	<reg32 offset="0x5181" name="GMU_HFI_VERSION_INFO"/>
 	<reg32 offset="0x5182" name="GMU_HFI_SFR_ADDR"/>
@@ -228,6 +233,12 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x03ee" name="RSCC_TCS1_DRV0_STATUS"/>
 	<reg32 offset="0x0496" name="RSCC_TCS2_DRV0_STATUS"/>
 	<reg32 offset="0x053e" name="RSCC_TCS3_DRV0_STATUS"/>
+	<reg32 offset="0x05e6" name="RSCC_TCS4_DRV0_STATUS" variants="A7XX"/>
+	<reg32 offset="0x068e" name="RSCC_TCS5_DRV0_STATUS" variants="A7XX"/>
+	<reg32 offset="0x0736" name="RSCC_TCS6_DRV0_STATUS" variants="A7XX"/>
+	<reg32 offset="0x07de" name="RSCC_TCS7_DRV0_STATUS" variants="A7XX"/>
+	<reg32 offset="0x0886" name="RSCC_TCS8_DRV0_STATUS" variants="A7XX"/>
+	<reg32 offset="0x092e" name="RSCC_TCS9_DRV0_STATUS" variants="A7XX"/>
 </domain>
 
 </database>

-- 
2.50.1

