Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D86DED0DB98
	for <lists+freedreno@lfdr.de>; Sat, 10 Jan 2026 20:38:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA3D10E23D;
	Sat, 10 Jan 2026 19:38:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KO+r+gLa";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fZMbR6NK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1462510E23D
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:11 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60AFefIL4161908
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1CwAZXdBUc9xQFrxwrCs3jtALVbNFxTXbK8oxBBj+5I=; b=KO+r+gLaEzAmAZUp
 PISjftyQA0vDfkJQ4PAEkcDxcNqCEatTKaV9LHRI8ti4JIC8hM3IbF9c6UaIiK6N
 3/pKN1flqLUPGEb1PzQ1FQIGURVnn4kSjpvON/Lb3rjqL4Q5bne+mgg1xDT7wwJ9
 kyvJySLgrtVIxTchbge2b61ujmTPb3VTW28KlDCZD6k/dS4ZxsbNoG6QySDCYjU4
 AiELO3tVdmO4IsJ/hiY1ztSV5D9kpUxWz/KjBGt4I9o0Yhzxq1AU5TKIvNKUCz/6
 ol2nqCSghWhWLvJ1V1ISEoV+r+7skRaFjYXuFQeZp924B3+IzKY56kCdlj8Y7M+u
 WjKaYg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkjvxrubf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8bb3a245d0cso1318397085a.2
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 11:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768073889; x=1768678689;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1CwAZXdBUc9xQFrxwrCs3jtALVbNFxTXbK8oxBBj+5I=;
 b=fZMbR6NKbhlV8IXu0FDRnwL1vupjwSCMAMbLFVD0QLiLSaYLu45y78eptBKKudjEL8
 2IVvLpXcEcW7uLmvb/alTQP0gg2FtvfydxnmMvBIlhmepEV/FKySYQL/WdjG/SZUf92z
 4Lv0fqoK2B8t1hYyuw3o/o8qPFdka6/3zFzys3S8diboCvspu1lHiZGm+mEebIalHrm1
 SLoLkDbdJUEOryXf9hFqaLTK9mFIfJS/ftx+Opdr7sK8X5dHD62F0pZUYl2mX37y/HXj
 OkxcCUqZ38wbnax1IgnvnXWNAMCQsXyiv1mFCna8CCJiVvnA/1UAEOzGpRMPmoX1GpM6
 QjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768073889; x=1768678689;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1CwAZXdBUc9xQFrxwrCs3jtALVbNFxTXbK8oxBBj+5I=;
 b=rRYKLXKCc3Yp+CO6wb4FpuK7hez33LBNcV3sTGJoMVGDNfIIDPAiSyhbhdoFKIstWJ
 yePubPBCHQxp7FsmU+hEQEPESoOSodAVbrjhfS8emtQ52racXiWHq7OJ3Ohx/JA8a0q4
 mG4pe+spu8a2IchYOpUftVzvQpqq+l5o9ZQd5/4Ua3obVryQCutf5LPrRsf8kzZA+AOi
 yVBgB8dLB/7g+Jof/xPwkXx/elp3+VZWdKw1AMy5bzcyGnE4R0fK++oE/YRMRRIWF6IL
 6oNfOkWz+H6QXfgFnKFw8X8kCnC2FAhvApaMoY5V5x+5R9pIcxLnc4kG2z8PmkgMN6wr
 Lv1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP18K8Hf1HzTyhMe4keaO5G2J0BcY5L0GEyhjGuLb/I89OfJNi14HyA48g5OiYGp07EqDhp2msbes=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6CBkF9DTjSMoyhVp9gXyXlqrtXI0alCh148l5TWXNxj6pGKRQ
 VUuzmRQnXE4bhgd6tjh5adXIoihb+Tvha+QmT33Mj6ly8++9iBoXbWdNgtQNJkJs1wyYCDVP5B6
 tbXXH35x982YxNDBqOjrBEepi0CqW9gU+4iFKlBHbxdiErTH+JUCIFR4S7DX6wRY/qFYiq+0=
X-Gm-Gg: AY/fxX64CYXhhNvv+TCNEDmQov9vLbh7UtsRdi2bhLWkRAc0fp/mtseyvRbrTDOQLWD
 BQWRAn2O0T1GHlfrUghzRj0K5tWAFQC2D8IIO2KTye3ZItoxjZelsRkEFAnZu7iE1Qxb3nPnqmK
 4ei1ydqIxYbXxidNAohwO4hdRXiF1+4fCl04i7jbif/LuthkxC3I94dUYPqH0LvbGkjVOYal0x/
 vXsSeahIXevbsMB+qqR3XZvhvKENv4Cl0ObthIGoJ8n0smSG2H1ZsHpk3EgCjwTSbygrpu7Xl5+
 UrodXCtDo/r7QD3krXIGWCJNRVE2IO5/aUdry6XaCZt0YdKLUPCh11sERQw34+3560UkJM3l3hM
 AO+15Rk/Tx69nN8Jda4/6DfOd5KD0Qqmz1i9ttWG00JDVBn51kbARwJy90X3gRnGnwbcHKWO99h
 TPlWS+nmc41dyVnTDFVU7u1og=
X-Received: by 2002:a05:620a:4041:b0:892:25d5:2ec with SMTP id
 af79cd13be357-8c3893a234dmr1932595385a.27.1768073889500; 
 Sat, 10 Jan 2026 11:38:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6ysYkEyuQS4NY1Y9cW0IM7svB4+OFyFxciv6hGR04XoHyoO6I5rv4ARjmqrh1JNhc4LMfRQ==
X-Received: by 2002:a05:620a:4041:b0:892:25d5:2ec with SMTP id
 af79cd13be357-8c3893a234dmr1932593085a.27.1768073889029; 
 Sat, 10 Jan 2026 11:38:09 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jan 2026 11:38:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:38:00 +0200
Subject: [PATCH 08/11] media: iris: don't specify max_channels in the
 source code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-8-dd70494dcd7b@oss.qualcomm.com>
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2155;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lI206RAn0syEtBGFIwrCzvGuezMwS8kPobyiNnHRo80=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqUI7DjMqRDpb44hymmYSc9xyQvDtas5hO6J
 cWUmBCd9USJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqlAAKCRCLPIo+Aiko
 1df+CACXImUz2ySv1msEZJwL6Ka6JPcxHLReOA/dClhjty+PYdqgvVJ5ZfLYM7kVWz8v9gSFaRu
 Gnid5ffysQBsRAElRVdk00CChludfgaNTK3uvEKKpUuYMtP1nQaD3srkYbKYcKz3F+tBizbdMGd
 QxYTIYRX0FNv3mllLrabqtS2I3ISuB2mUHyfvWkXbxX9McRIx5vvuAwpcV/Eqqlc9rC8xif2muL
 uqcF/mVLo33H1pgpSympcmy+spPtKqgxV9f+dCpcFcK+PsbQanoq5VDYX01eRhDLdrf/QGPR3pU
 RGK1Loia19tUJWTN+mqNlA8RkMETtppag3hq8BaZVAA4j9A9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Wrsm8Nfv c=1 sm=1 tr=0 ts=6962aaa2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=rTy9geyXzX0TkIcb0cAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: mxgXmgPpVNUoickbx4IbZfXxD-yCZJqu
X-Proofpoint-ORIG-GUID: mxgXmgPpVNUoickbx4IbZfXxD-yCZJqu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX++x7W50KDf6f
 da9hP23jir6fIn0DMcbH0IRH1IpRLO9ATtpIKkqQfHAk0y1pMViY+klAxnWyxWqsVEOBwE/aEhx
 mXTONa3TukF3Ltq2SZBWdxOOM4/mpCo0DobqeGHlliMq2+c7OrJAAtdJAAPWJYtd9iNEmKSHREu
 beg6HBrlBQCvi9ut58X36Tsq4zaGmOOyI9JWRk9fsPeV4Bte5EDeeENKJUL43BiXLXWxbJW0MTG
 biYyX1ibc3zsNr8loIuyEOSeruTvsYZcxeij6uf6zfsbEthexkb4sJhdjZPo7MY7St6fGi14DJ+
 XzirVNGV4FQ+aKzvv6b2h8Job1jBUveNJ3/5i+X1JovdO3YgOP/AqqfVmSMDzOjWhTY0qwgFSh8
 sc272OU4EjF/djBPELWGd5M+fykn7mO24PX5G6g2TWkza8eLwdIspgQ1xh+E66828+cPzFVa95C
 9Rv8l7kICnAyuOliVjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601100173
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

The UBWC max_channels spreading is specified in the Iris driver, but it
also can be calculated from the platform UBWC config. Use the platform
UBWC configuration instead of specifying it directly in the source.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 9945c939cd29..91dbea4c6664 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -139,7 +139,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->max_channels;
+	payload = ubwc->macrotile_mode ? 8 : 4;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAX_CHANNELS,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index f99fcbb8fced..4abaf4615cea 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -72,7 +72,6 @@ struct tz_cp_config {
 };
 
 struct ubwc_config_data {
-	u32	max_channels;
 };
 
 struct platform_inst_caps {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index c967db452dec..e78cda7e307d 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -632,7 +632,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 };
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
-	.max_channels = 8,
 };
 
 static struct tz_cp_config tz_cp_config_sm8550 = {

-- 
2.47.3

