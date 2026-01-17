Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E95F1D38CE5
	for <lists+freedreno@lfdr.de>; Sat, 17 Jan 2026 07:36:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2AB310E250;
	Sat, 17 Jan 2026 06:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jLcE31w2";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dXuSM49T";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED1810E287
 for <freedreno@lists.freedesktop.org>; Sat, 17 Jan 2026 06:36:06 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60H4C2QU3636026
 for <freedreno@lists.freedesktop.org>; Sat, 17 Jan 2026 06:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Q2s2/Y+rMi8EkXfWOzNwWPKg5Sl+rEgH1nG07NabTws=; b=jLcE31w2IBpt0At+
 bSqTZkfYMVmDjqiDGwxdmFUD3RXLSvubWclXzxJI/RuGrSFeYYMVpUS0xFTA/S2n
 vDz6zji4Qfk/t8FKzkLPr+U5PqeZ22kRKHR2W4eMDhsfmfqbTw7v4Jmq2lvqUKsm
 J/LopY85UWUt71jhKzdFyRgZBKMVRlUFmT6QLRYoQKBtT9LANSSBAzfN3hY1svEr
 H2LjS7meoDvxjKHT4j3E2RqkYZ95MadpYCzAwvfhxMOsSKXKL5rJu3f/KuFEuiwH
 54885+EzmjuN6ONWGEwhGHNriU4uJFPmUME5Q45Gg7xlIDqjU2zVrY01QLL6ceAE
 1Abo1Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br36d882j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 17 Jan 2026 06:36:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8ba026720eeso870831685a.1
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 22:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768631765; x=1769236565;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Q2s2/Y+rMi8EkXfWOzNwWPKg5Sl+rEgH1nG07NabTws=;
 b=dXuSM49TGBz5pxSFmsYw16W4XQocN6Ae8ohGitbgN9MAw3Eb0mpBhydEBX2CwP/1AS
 m0HXYjPSlqCjaND0bPm0GThoajPIUI3+LRaYeZq1jZpIcQc7o6LYOGs+4Ej/M3sjSvZY
 Quo2Dez+o7eKP8mHfTG2spFIAf6nwfTvnBWke14TyqBWVBV92p0iz1DLxgpC3NSm5l3N
 k1clVoFV3pYCg7I00jn/nXP7XTEl5KTJYudmagYfV8bWB6FZscSe9mWT/4aYPy6O8a03
 y+4T4a6Xh+3K4r2bkwd0PHqnfDhBfU30aE07aVGRaXfPrefUT8s4dsrI+GokkrlFt5ZZ
 rNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768631765; x=1769236565;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Q2s2/Y+rMi8EkXfWOzNwWPKg5Sl+rEgH1nG07NabTws=;
 b=HcAa2jkzW76rly5v+9K+U/BkC70HK3Hdayp5ocINeX0zRFrRYEwskLvDpHECQi9STM
 1UcfMFcr2i+JWP0h2tBuzpaBSg66rG4z80IjZzGgTDPY6Oig9fgUxBnGF+fWJ2esvmpP
 4dmAzz9BGTuGoPtMu7+U86O14AHl8XHlMxZFBftLxPhdOTheNiW+JQ1Ef2v7izq7+hKy
 y//I5ChNY1vVAuy3SfGECed/J9WtbdsAu39Iv8Xdg0u3HgQjiPCgdZwQulRt2G6W6sZB
 zefV8FrXyJbmlJi27oTUrUATGAo3x125Q8eAUelKj+RWWvQrPaaq+LZiSm5L1Mw9SsLv
 n4Bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/wcgPfOAMXtmhks8P/yRK0UsiUdyWBtG7xNXOzJnATnZv6v61akhZJtp/zAKlZ19UFRzFmXriWWg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTJdmu/npgxTYclhdu3WUasXDu1KCFSruBVHkUk2TlpKRNh4wn
 XYKJ9+XhKwWHm1buoCuFjHYhemQhfSXUOd6QAgnARgofMBD3uMlpwgRne24ps6CulxDB0g8VP59
 iQzjy6178gi781YDZIpKAKsd2xGSjoZ1AGR71s+ovwinJ9fo1qlOshGxoohcQDEVEyy9m94Y=
X-Gm-Gg: AY/fxX4wpw+kRQecjobgsUMFAsiUhSFjNv5QeW+cscq4j3pv2zwCzTdxJ3QKwDPj5r9
 8D27zcbDA+2G47aqvsQAvCvVE4PFJ3rfMTY85doAywAX3xO4MZeuvLvkf1TKWQh1NfLZ5rnIQdz
 r35/QHUt+bRWFchd+Y6Y2zh6S4OQvtAYL2XWRj9rEfKp/8nyR4rMGKSqm1jM4gfVFxum7BapiZY
 QIlEFr4fs/9eLU8yfsEBuD6ArNZa+FxNLt3+G74aFUAfR255WdmJtokwlXlM8hEqUUqD5seE7BH
 HNlHQJHSQYVzo6HMhRrep5Iw638dhpO2Nz97QB+imI+Ho/tPAGZL9KoLCziG/cTJyX1T5WvxGX3
 mptKB86PlndBYQXzwukU2Ob+s7fnLNiatdFTjfeTT2D1oDqw8UYlpl6QX3Gf3vUq/KzUIDoAAR4
 hxZUt51rAQayeaM+MDEI81IUo=
X-Received: by 2002:a05:620a:2699:b0:8b2:de6a:ca with SMTP id
 af79cd13be357-8c6a6764a8dmr777937285a.52.1768631765273; 
 Fri, 16 Jan 2026 22:36:05 -0800 (PST)
X-Received: by 2002:a05:620a:2699:b0:8b2:de6a:ca with SMTP id
 af79cd13be357-8c6a6764a8dmr777933485a.52.1768631764752; 
 Fri, 16 Jan 2026 22:36:04 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384e790fdsm14049851fa.23.2026.01.16.22.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 22:36:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 17 Jan 2026 08:35:55 +0200
Subject: [PATCH 2/4] drm/msm/dpu: offset HBB values written to DPU by -13
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260117-msm-ubwc-fixes-v1-2-d5c65ea552c7@oss.qualcomm.com>
References: <20260117-msm-ubwc-fixes-v1-0-d5c65ea552c7@oss.qualcomm.com>
In-Reply-To: <20260117-msm-ubwc-fixes-v1-0-d5c65ea552c7@oss.qualcomm.com>
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
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1982;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pAwvHUCEcXNpm+LDy8SETL5I47IZwg6IMDS0FVV1308=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpay3LwLtC+kj2HBoDxcWwc+QhCyCWUb0ECl5wO
 d89f5P+uvaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWstywAKCRCLPIo+Aiko
 1XrhCACVi4wbYAVIcssEV3/mLOyF3vso5kep+hgNtASJMx/eNsD5wt/+iZRV8Q1XNOfcPViiQ8Y
 OPdGumJpMcoPhXkkmxMJ6yWcFSWmZu90i165KrX/iUssDk++S4UwhqBWnp6RGxhTr4hnhS9xNQl
 kHc2bjThbFxBTSWpyperO3O6sZuJih1IEDCeedXq9AJxKwmFzEw/UCQYLQ+MBm/f0/rZR5/27+s
 7rc1GO8L3+KWKXb/1FqL3Ids2kLd957fdGtr2o18GBY1rIkR6p/r9Z0W5ZwFBrfo2lGsxI4Cq/F
 0yEOxI3POI8B4USsdj9seca0a3LcJznUlIG6rp2XliYvnCm7
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE3MDA1MiBTYWx0ZWRfX/v/nZrnZopBs
 geEYGmc7vDq7MtjzJ/ay/dFEW5UdvKvql6Nxpef4fcSOmTlUnrPzWIepl4ORSA1WhkbUb+wc7cR
 U0i58FdTD7OIFQn3iBeb1Ejp0OwQcIJd5dpbGWPKkFEDggsC1WSqL4GEyKN3jFeTCEkw0HKm6hp
 OQfHJw5tN0qc6Oo+8Jx95bROrTnM6Kk75HabRbvRLfCwP2GD56utyLdGjqeesUtgmFPpAmcoL+g
 uY1cEiHRbwhdW2OSOxvPCnyeht0IrEqQB/r0PoNz7VhTfEV3IzSkZH0oA4ikuObxmkVxVy4J2ad
 jlUMntAbAIGQPyFKC7DLseYxXrlitc0fXuXhoTaKAWA8eK1uHxyrLfdnPnwMQ541guMXQXhiwf+
 DRYxsdWQMUYIYc/yGz3Gttxtk+rLGJLKXPT3y75U/T0k3XME4qOOXJu7spRQuxsVN+yy4h5aBbT
 grz1n2B+XSTGv+9EQUQ==
X-Proofpoint-GUID: A7u8SYE-kOgLsST6uTexMpe8Tbbbi3qJ
X-Authority-Analysis: v=2.4 cv=GJ0F0+NK c=1 sm=1 tr=0 ts=696b2dd6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=iGWu5DhtBPyiFZBs7r8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: A7u8SYE-kOgLsST6uTexMpe8Tbbbi3qJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_09,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601170052
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

