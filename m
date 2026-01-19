Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD62D3A12C
	for <lists+freedreno@lfdr.de>; Mon, 19 Jan 2026 09:17:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9669C10E39F;
	Mon, 19 Jan 2026 08:17:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="A42zWdUY";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R23YK5sL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D61810E39C
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 08:17:23 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60J82HFp3151927
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 08:17:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xMzeLdH4gkDYQXE3MEX/WwUYO0IiYwGQ9/Yw/tKZcNI=; b=A42zWdUYIYOrD0G+
 /o+bZvDph2WavJ8bAhIZL6ZX1FVFRPS0a3jaHqzOQfe4pUsOoawGVTqkQsk9w/60
 ExxdQNpkttSKJnFn/3vRFnCy12LbkPEvR3+GNITGU72xPwBi6UGtCG8/3bllcCgw
 mVcpF4pzQFGSpmSs8oroY/HmM2eoSzQG5w3GRNBvGT9Y08YKI527qj/8QLI2qK0I
 A+2316rAmX2mCAENp4x+TWitxl0y7j8p/f7xagPzhTVrsv2xuxrHZZTBMm18pAEv
 3YzeRG14qpS9E24mxZ90tea4/ahE+1VTpaLfL6Hvb7eRUqAMBAXcVQYWL6aSrVXY
 JqO/FA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bs7881ab4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 08:17:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c5311864d9so878376885a.2
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 00:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768810641; x=1769415441;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xMzeLdH4gkDYQXE3MEX/WwUYO0IiYwGQ9/Yw/tKZcNI=;
 b=R23YK5sLh8iCjETUqOg9gOLf8l1V8Tg2QZK08cUphtoX/wlC9Psy1otUCYMPIiE3qd
 RfvzTFrvDTrL2herQ0QXMTedCF2BPykYRT/luefQmCMgSQeEMvYa4cF4neHz9Of8pCal
 Nng6rLUnBGtpnkMx7eYXuSD8kZa+AvLn7xgkhe6H/J4HV656LiI9w5aReA+TfZlHIlqL
 kwtdC6xUemCKZFJ5y7c4tBt9gDH45+xzX18sdhxoAPJt/RdJkOH7Q/v2jb5VZ2oG0LgL
 Jlnpe57Tbi16R4S8ca1kxtSQBDZHQxSUs+Q80AaVOrlzvWnMMntQ+XUq3UKYuSXGRocm
 wcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768810641; x=1769415441;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xMzeLdH4gkDYQXE3MEX/WwUYO0IiYwGQ9/Yw/tKZcNI=;
 b=SU/uSB7jlRWmt74yqotrPUj+qPIIMOiyro/qwNgXNsegv6UbZyW/iihxdDVad24hr0
 b7JcHIZHTRxgrcFUWcvgKNt1t8ZP7+J2trQreXx5CIoOV7CVdealTecr/2nA320HTdCX
 f7+oJ7tncfAs4sT+lLyV49j5g/Ofq+HTGPmuH9yrgsG/BxTqS+XUnh17qHizji9d78KS
 2mBPuPbbeaIQo++ByRZR51+GEMcLZr6QDqKCoB/Yo4LiJw4pu4hIXT8d4/9+uj4wZMUg
 hM2ukOtGXE1VkztCnnu8pWaqOUoF+IWaLFdu3ncWiWTBWgf/Uta/S6A3NQ4Yiz9FVuKQ
 19Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIZ9bDBwet6dZ92sssn0NctDmoAsoHzCwYpBgrV9jQa5O2RXZUTctdHFdFCbglsGUyenMQMquBDO4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFmtHHnEszDZt3gAPkIu1NZicv8Hl4rXy/G+U6J+gIttKOmWa4
 19wdwmTjq5t8fL9jhRohPzlkDkcCWV8LYUo6nbbp3j+GVCTZ+sxePF1JRKMou1mHEDZD0n9pocw
 g60wqoazIPX3b4k+qaYKgQKtpTy2djKK1W+peq38vb/6Rrbz7krrKHtSciKPSqT/4tSc8cEzJjU
 7EXIY=
X-Gm-Gg: AY/fxX70D0AbVarT6MiGmkI3L3KZMUPpiHD8q93c5IRVwGO6gbx7krg8SwyOZfMWVsl
 72xI8vrVKuhJZmdUNkULWXf3wF2FghhhAeNiXi4VOi2uAzH5h6A5HKfJJuSJoBgUy+bbFt3g2uy
 xX3EyiBkM1RetXs4YN9ejWE3FB7DeKU9Simv6IiR0Uw+D5XTkl6gIMEFYgQiJiFtWThB4M8ihML
 m0v1R0rKobSJDIaIcuE9rfHZO77LAsD3F1TgOI83MOaEaKtMbpDJ8e5gIm5hinAhpgkMxWwZ9f+
 +2KYhBV/e5rwg/QyyoCsSkPwBKYr5TKzaBB1/NBL4sBqDNh2FCXlJfjYB2heHEPNT2Tnd1+EiJP
 P3frl+WKpv0BeuHbolQoQ/l8kUMRit1xORpRTMFcr+/ByggxSNlTUMhXfut29jKgy+Zfa1LUPrC
 eUdYqkzfKfc5oyC+ODujiqEI4=
X-Received: by 2002:a05:620a:4043:b0:8c6:b14e:655d with SMTP id
 af79cd13be357-8c6b14e660fmr970511085a.74.1768810640912; 
 Mon, 19 Jan 2026 00:17:20 -0800 (PST)
X-Received: by 2002:a05:620a:4043:b0:8c6:b14e:655d with SMTP id
 af79cd13be357-8c6b14e660fmr970508285a.74.1768810640371; 
 Mon, 19 Jan 2026 00:17:20 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384dbec4dsm29636391fa.20.2026.01.19.00.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 00:17:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 10:17:15 +0200
Subject: [PATCH v3 2/4] drm/msm/dpu: offset HBB values written to DPU by
 -13
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-msm-ubwc-fixes-v3-2-34aaa672c829@oss.qualcomm.com>
References: <20260119-msm-ubwc-fixes-v3-0-34aaa672c829@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v3-0-34aaa672c829@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Val Packett <val@packett.cool>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2055;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HWBT7H+ACSNaTYDAPUtOQBPmeUobbB01ZGnKJJ3+Wc8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbeiL3Nd+yf7puUGMY7KuxkWqmbU6DWV2RZ773
 F67oFji852JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW3oiwAKCRCLPIo+Aiko
 1SRyB/wKRd14DtwJro7LaLDkuj2jMns/ytO0vlhsDsFlv+Q/Fqae9x88klP0cZGKJ8lo8VuVhBx
 1aZbO/P1jnM15YO1zOpdxhPSIFdSvm2jNocHZw/cD9jQNX7j8TboVeyikDRGRlHz6kyrVLAG94j
 JT97VDxWjGhJXEsMb9VX71mmJ/wKPSwEhLcwvt0UYOXxk5b+OdzCN1Wzgt3xtjc01CDv4uH2spX
 ZnDAX2JIrywtMjgNJBgDKIMWEp5asWACxVF2TAClZJ+jM6z55sC+as3fARVyYl7H7UnGuV0BE4J
 jsEAzASMscpw0+tuedB8HbdmUQYyhY/6oJfB2BqY3YTTPrTW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=KLVXzVFo c=1 sm=1 tr=0 ts=696de892 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VBuLEOLxEfejlaYavu0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA2NyBTYWx0ZWRfX7I9jDR3ntCvJ
 IRa54MY82jcnCvck+T6Peeo1lqiwUAUNDtN19PpBc1C+NuOtMRVY4n7GyWYSBgrnI26fwZjpUts
 L9Prdw6htmfQSUJBshYb1v+JMKvr/UK8euT+vTHzztbK9aDULJBHSbeNPmoDY60Id+IVFFKGAFm
 MV5sFkd36Rc5A1RteioMv6QOs3wDyUkCb4WdsT+ZCOXE9KS5BRFpZQZ4D40NvrxhOgGXR/dEN8o
 DIfdyty10q3/QSkeiRy4FozOk1wV4gLHVIHdoWuGhaRLVEDJ02XRhW+Zn8F9X8M1iQl7gycbYq4
 26HsXzCpnl32cUqsHUJZUTf5jokEupn3YTslPqClVE/dYbZFvSvpKmJGffBw67a2Irmp76pqxNK
 CS2L6UmZJRflWbswYZUbfcFWeHNBtW9twGwqMCPCf26cYysd5z7/XeC2BSvDNSpfmZNE0LUXnpR
 irbuyVc4eVkdveIzAhA==
X-Proofpoint-GUID: LdiH4JUNV3C_Z42BntrXr9NCyxCwQp5C
X-Proofpoint-ORIG-GUID: LdiH4JUNV3C_Z42BntrXr9NCyxCwQp5C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190067
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

As in all other places, the Highest Bank Bit value should be programmed
into the hardware with the offset of -13.  Correct the value written
into the register to prevent unpredictable results.

Fixes: 227d4ce0b09e ("drm/msm: Offset MDSS HBB value by 13")
Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 6f1fc790ad6d..b66c4cb5760c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -270,30 +270,32 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		((fmt->bpp - 1) << 9);
 
 	if (fmt->fetch_mode != MDP_FETCH_LINEAR) {
+		u32 hbb = ctx->ubwc->highest_bank_bit - 13;
+
 		if (MSM_FORMAT_IS_UBWC(fmt))
 			opmode |= MDSS_MDP_OP_BWC_EN;
 		src_format |= (fmt->fetch_mode & 3) << 30; /*FRAME_FORMAT */
 		DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
 			DPU_FETCH_CONFIG_RESET_VALUE |
-			ctx->ubwc->highest_bank_bit << 18);
+			hbb << 18);
 		switch (ctx->ubwc->ubwc_enc_version) {
 		case UBWC_1_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
 					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
 					BIT(8) |
-					(ctx->ubwc->highest_bank_bit << 4));
+					(hbb << 4));
 			break;
 		case UBWC_2_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
 					fast_clear | (ctx->ubwc->ubwc_swizzle) |
-					(ctx->ubwc->highest_bank_bit << 4));
+					(hbb << 4));
 			break;
 		case UBWC_3_0:
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
 					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
-					(ctx->ubwc->highest_bank_bit << 4));
+					(hbb << 4));
 			break;
 		case UBWC_4_0:
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,

-- 
2.47.3

