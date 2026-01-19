Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A85D3A12A
	for <lists+freedreno@lfdr.de>; Mon, 19 Jan 2026 09:17:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B9110E399;
	Mon, 19 Jan 2026 08:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UkInDYfe";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YKl9+ScS";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CCE210E398
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 08:17:21 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60J5Ixuh1865030
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 08:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 76Smpb7OAuPrJPWLjQuPjMFitzxPMEeAECFWrSbRqDA=; b=UkInDYfeu5xWblOq
 DAVT1XskVc27rpyqoqeSm7p50dCup0/1+iOBuoJxFJWu3V3I0kMagqUm/Jn6aYRr
 EktTEbiVW53DV70B1kx2Auxlr8GFnL0mcWb1ugpy6a7nBHZijAT24gowk1CxwNgE
 2T58ALEVucJ3HZ5QgnNWAo28Hos0n4+yMBrBf6wZLiG/bB4mcavaeLVVhOakuH3G
 DTnazyxp2CO2tFhEvZX4C2KNGghUL/RxasNhWBLZ4Mq0ecMD2XSr0Ln8iwXnMFGk
 A8E6sQ1gbVOnfOO/wxdc2xY+2g2tHzqSLXgSzqZRztwWNM4vhbWLS758k26HMWfk
 R0GQyw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2t7488t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 08:17:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c5297cfe68so758378985a.0
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 00:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768810640; x=1769415440;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=76Smpb7OAuPrJPWLjQuPjMFitzxPMEeAECFWrSbRqDA=;
 b=YKl9+ScSqwngdP+67DbRm6AlL6OVsSfIKXk726PNFn7YBkH8uwCyibx8rVgCdqFKB2
 GKAEMBVngIF+ahRoU6X5XtThje1iIY6zfENSXB9woTTPTGwmP9L60fDvQMMYiSdH5UnE
 YFN9yo3q7efaJpKnKxJymlldV5Cmxz31kE7kRNDu16LbPu1MwJWPBxvY1gYCwnyHxYUV
 fF2NAEh8Fgwu1YPnbmC7nHod0/kZ7L91WeGtwOz3URFeasUFMqhp8B35+dsjAIMb21pk
 FbQUOX3BYD/k5QCTTE5KEpkEuUGbjG5W9l21xxFki8Vd4jPRNgniTvObwT8SI2lgrJgF
 GErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768810640; x=1769415440;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=76Smpb7OAuPrJPWLjQuPjMFitzxPMEeAECFWrSbRqDA=;
 b=VUFv0RhDs6+MofVbmPnRIx3JDxD7vjcYMrqDdO6yL71ieC3jMYd92khdpt155H0yeA
 Na8wi7R/8yhAQN7GlNWBHwKHkzCRjDc+Qds65BT5sjzld63jWfXajH0BmC2q+rTDa8SA
 tSQgVUGgtNeoiaCAE6VdHjJO7h24crtV0bs9TI7t4IsWM8kaeajbRyOJMXX50EHiG13u
 pFYcXV3ayQucTlzwmlRoxjGYZRvsbQ0fWSRwi1u/KUeYKAs4xJdheYFWwDEwldoFV4U3
 sjkyPsiJ65FAVngAneGNJL4ztUM/Nr8Qor3v5cjGQza5fTJ/ve0lOha28rCPoiJsLdRx
 Auig==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoF2pP4bqjKcljV2CE99mV44ahhxmsbw5Hex+eex+bdStlr6h8Myq8hX1J4OAyeydQiiCmUMuZO/M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCZKATCIf9fJVvweKTE3GP++2sQWsttmVwG+UONufFDe8ny73e
 3rSnz0z4OXdUJJUq9Yz9uY2oSf3RCsItsPNBqh2N/xni5LCnVO/oROZYPGzI5Sn7bstlFVZa8ZF
 j/tyqZZK+WpJdW0SR7HZcLEfbmAfliKpfNJ1s1xsyPtUzbA0qVVqtbFKjDAAYCnOYD6PIPQ8HFK
 U5xiU=
X-Gm-Gg: AY/fxX5ajJFlYnhyJddK8txazncd1M47b3iCD0+16imC7hWpZMzWIOCNE8ctOT34zBS
 F6LjUJ235MdZBHN2+XhU20lVndAUm7WtPsME7tT+8cOoFpLTLbQfp4YVH0JCNjOaBPwIVfZON+v
 wyrTa3KTA5ZMagIxRGIk5Q19j5y7QxPMjo4BvDf8/Ujpy22V7lJTNIqciYSOE9aBoH0UbrAY+Yy
 n7E++E7Ig3WfZofqumKNLO7uc4seRufLBxEPvWkbnwGGdhcaGyCP83/SBMObqKsBe450VxvvvuB
 zUyeCbZPFrP1fX5tIOTZDbHeR/fYtEqlfdn9I34iDQUnQYpcx4o32fY6yuB3/341DXK7uX9yjlv
 nevh306qtsk4Esbe/oXYKILkSUOFONlMAvUStrjoZG4CUB20t6WflEPr0rNwgTe0acxCm1JdY5a
 x/APUxLvVf31O7n8cevv3JNlc=
X-Received: by 2002:a05:620a:bc2:b0:8c5:310d:3b1e with SMTP id
 af79cd13be357-8c6a66f6bb5mr1518898885a.33.1768810639767; 
 Mon, 19 Jan 2026 00:17:19 -0800 (PST)
X-Received: by 2002:a05:620a:bc2:b0:8c5:310d:3b1e with SMTP id
 af79cd13be357-8c6a66f6bb5mr1518896885a.33.1768810639275; 
 Mon, 19 Jan 2026 00:17:19 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384dbec4dsm29636391fa.20.2026.01.19.00.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 00:17:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 10:17:14 +0200
Subject: [PATCH v3 1/4] drm/msm/mdss: correct HBB programmed on UBWC 5.x
 and 6.x devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-msm-ubwc-fixes-v3-1-34aaa672c829@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1187;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rvlLamNB1d8AxWI8yQdhDfj/WRXPqvKE6wjpg+ZGkfw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbeiLRc6MfZfjLwLgU9ZLO+AmHQLpKNEG53lTe
 uFIrNKomZ6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW3oiwAKCRCLPIo+Aiko
 1ZiYCACKIFBdBuVY28Simiz9YBlSWLg7vfCkIdbVslZHYkeWy+BmVuv0O1Ne8FFUiw3KIWTX1C+
 Blz4BoZakElqDCeCKgu/N63/gkM5NPFytkeUQ4cHgHtcceXl4bG47umALc9V1NJAfM1tDOb5/0c
 VX7JYAynZSWnkpn//AVfb4bweJ/n71hPBkUZWjtO8+BI6A4c5FCLxyw+hfAhkEyFzj99A6JIX52
 mNtQgQuTjMgV9j9EekWH2LxvKeWItXo9Kr/LhQQZjCPCye24ph6NJAQZmEk83C5w7/e2f88sbUO
 TP0dvVar7Di6T9yZf38+ThRugmLsSv25DeTeKGA8k15VJmcQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Fdc6BZ+6 c=1 sm=1 tr=0 ts=696de890 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VBuLEOLxEfejlaYavu0A:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: HM05nzBvOlgjSbYmVWXZyoPpT_JJLJg9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA2NyBTYWx0ZWRfXwcHd76lXTjTV
 QwYqcjLSIIgNlRUEZAlJrAWusKVrK161iHpygNUTQH3s8f+coJY5zSHka7sPkZk40dYK1KoY7FH
 ofRZehUw/iz67bkfENhqlqABh48OQjeMKZ4ZNYuWvsetbLqPQcqVObRmvZg/oovuEhk3eb+QCNC
 Yyc+5yTfvrcYtnUtWDQIdjB67ISqSDaMDQIxu8wYzmm+Me3B9mVEO9dKAgnu9wS+jnrEabGUgoQ
 j/+/o/jsr+NCIdB2r7fd0zwun4CapqBeLzlJttksJgj7N+liRkLwml4v07OBso4Xfr1qiPLIbkr
 R6Lhne4+2CWPz02hBVhjYViSFQeTSbaXE3issCjoST4LNPGofZrfHXS8cdZr3/YlgWlRfWDbMgG
 9g68xSNtiJbXjaLeq3wHZ/cIpTxqDi4zAAG8aLsTqbnswy6jusDJc6igavW7kZYgmUvZoDNZYtz
 Q7Xd+2vg3e02HK+6OHw==
X-Proofpoint-GUID: HM05nzBvOlgjSbYmVWXZyoPpT_JJLJg9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
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

As in the previous generations, on UBWC 5.x and 6.x devices the Highest
Bank Bit value should be programmed into the hardware with the offset of
-13.  Correct the value written into the register to prevent
unpredictable results.

Fixes: 227d4ce0b09e ("drm/msm: Offset MDSS HBB value by 13")
Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index bf9a33e925ac..910242f5a71f 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -229,7 +229,7 @@ static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
-		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;

-- 
2.47.3

