Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBr3IBgFq2nDZQEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 17:47:20 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE03822552C
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 17:47:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A46510ED88;
	Fri,  6 Mar 2026 16:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JpWZnSd3";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K6lmZeSa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3E710ED8E
 for <freedreno@lists.freedesktop.org>; Fri,  6 Mar 2026 16:47:17 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626FquMP549900
 for <freedreno@lists.freedesktop.org>; Fri, 6 Mar 2026 16:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 z5a8jUnPxApIBxmt4U76dukkSArjMceSh/RhKIkdDCA=; b=JpWZnSd3+YfVTzrr
 fMvF5DKn17hwQVZCKb2tu7QIUUkZf41RWGJwyQE29rAWR6Gbwtz1CyKXXWcQGHtr
 SAjh+g5wOM4YVRTDvOPNoczTquipJYBJT8GoRUi145uAtpB7LCZYFLng7e4UbA4o
 WRqYpb9OfgRsmqEB5qR1UhsptVGveXvqa4pvUBxF/C2h2PH+ZOFCYn4kd5U1HHCZ
 CLe3OXCt8uksu95qvNx8u7CTtu8KhQfSr0nwE+gVsHvXIWjgX8skFIZsuAtBmrS5
 +Wcsm3uNB0jcxZguMXyIXDpc9EdPBtqUsFsI2HKvwjRDX6aNrM+1gDa7f9tR9Qj0
 HD/bWA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqruka662-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 16:47:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cd7229b5aeso151625785a.2
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 08:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772815636; x=1773420436;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=z5a8jUnPxApIBxmt4U76dukkSArjMceSh/RhKIkdDCA=;
 b=K6lmZeSa7UvV58jASQH8G3KCc7bmLSJftsZja2q0JxJRRWUdHu99eo4n4coEdW700M
 Hpg8UqmBEiIxyDgJDPCRJZpD2JlHeyEJ4CWcfmrKA4Gau5QbKe2AZEOZ+SFprlQZ2DDb
 ifx0NWl2wgkwhVnyT/bJKYNR8v2kvpYxddE767xa18EFWfPO6XIoKBFJi4zZR7ZtMzoe
 pRiS8ySXUuW/lELEjUxELby5LyOsQTVzJYeKO5YYYSoMtR467vHheZmM0X4DF4B4LpFO
 UMMKoz9SZ08nfghc+oV+NOiOblxThKJXYVMeEdGMFWxsr/BLENhGQWmhTYFC3JAqrd6R
 i+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772815636; x=1773420436;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=z5a8jUnPxApIBxmt4U76dukkSArjMceSh/RhKIkdDCA=;
 b=HDrFYV1fmUbf52zpJp5eLIbkLfEEtMn+ByUaLch6Qv5uijvjJeEkLjbncC9r74N32f
 n44v/4mds2mDAA1Qkewb/KrMtl/V84jK7uubYbTYJ77Y5W0m7SJPcJlfjifhF5aFjPRk
 w05Nf3H1AR6Hya2DsRmeFQzWe+PcSI/uCAmDpE1GALraWoZkdB0qX03v/v75MnrrNZrk
 RNaDrpP/T4TlX8tYNnpvZERUXS6G7ADEwiy1qDQ/dn30lYYWOpUvAzk595ROqVO4BK54
 xJUyAXLF2T4S6wN0LDTYt7C+q7tn4iIXGZAytvTnNuDk/xKuAeYStwbD+SIy9rxYHIcE
 1LbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCMOdvlPzW9ErG8gmnLnLTXZf3HtbEqMggl065jte7x6cW/PKtnKSdgSKlgIdfKSxQR8suqQsv/DM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaDy5iZUm9nQxYOZPei1J0+c1xhMpJvneTipKWtd6LlxH+eYLA
 lmD8+AA60twH8xl25HddtuEPvW2PjAAWpb+t9zv+KBhzz4m2L6YSx2DUCR86wyr/JJSpBhngRhK
 84KbZJ8EUKfQ4xEzU1xCXS5rlvYfxZNkOQ4n9lWK8FgoGrkrvJcxAkBHvO5urSA3+voAd6Zo=
X-Gm-Gg: ATEYQzx+FaHx5+c4U4aI/kKVSY+AbXAURr9DvMbHD8Y6uuDNySG6K9P84KZSEdEszuI
 o+Lb4MsZzGEEvnhY5IFlEEMNCFq+SMzj/Q6Bau+UMBz/M+rZqyybURrr3QlUl0s3U4lWEvyXC4u
 iPipbt3c2Irq4eimtpvyip3/Wnenx4lDbmzAD3z+kSInC9MicFzIKoG16rH/D5cLy+uy4bLhZ4u
 LFLw6SQaBIb/erGn7P1SP4W8ciIU5ZXYJBZKIF9Sb9nRuTh+X8ICuVzzVsPepXHnWmcQbnqmVOi
 sq5q9N7o2igunfBml/vW6R/mBZkT6w1pjzKNM2B5b6jWxiC1/zf2EbWMXTun8Z+Ci/i9UQqFr1n
 m5HaBCb0ZGwEHPyKeab4m41n0BWLbDY13QFYwMk/dgV7n5nd9IPwBUdFd2kzGEQTSyjsV+ieXwM
 HJ732anGbBsvP1hylkEB4YxiQmgZr7NdpApWE=
X-Received: by 2002:a05:620a:472a:b0:8c7:1106:1a44 with SMTP id
 af79cd13be357-8cd6d4b5daamr342002885a.79.1772815636131; 
 Fri, 06 Mar 2026 08:47:16 -0800 (PST)
X-Received: by 2002:a05:620a:472a:b0:8c7:1106:1a44 with SMTP id
 af79cd13be357-8cd6d4b5daamr341998485a.79.1772815635488; 
 Fri, 06 Mar 2026 08:47:15 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:47:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:07 +0200
Subject: [PATCH 01/24] drm/msm/mdss: correct UBWC programming sequences
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-1-9cfdff12f2bb@oss.qualcomm.com>
References: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
In-Reply-To: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6916;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=X/lCVaBuy9kW6TT9FJf3ZpTkOHqx73+qmE28wl58iAU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUMJ6tLpaGWdZ4kB2K8/RV8sUbpJpzmtOl0o
 +rInaDMbpyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDAAKCRCLPIo+Aiko
 1cASB/9ZMzti9r6MplOpgi9r9VXlfLsjT0Y5z1+SJf+yK+YN47mzAP1vvpcGwqKESKujP0iQYMA
 B+N2m5uZ432UB//bQ0+TGt20hw9faBKGTsE1mqUSHH06YO2ecJu2/C393xqqS18ehaCUnRI90Av
 +tGVRSjzK6bqAvh0hq52de1oAyfumt8q0Ifo86mWRi3rs9nEGzdhOoLL4AAGvsG2ENjBEvhSlwE
 AGuI9qc3c+ydzsxCe7RH7vW6i9CrNclDTyyb+C8ag0ekDBjnBnV9xgTrReK1cE3q16qvPrtvEaH
 +wfffgvquM7cnn7TVOWWRIwMKlB9jOI7i3xniAjQSckrJ9Kp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX10mrN/J3Tdhu
 IVWdRwY28iUJUwkCFMeloX81+1NmuFAIunv6jr6bo6u3SUHHbyqHNXpoP+IPtmHbTUUifk3r/7y
 xp8+LaJruW/an2QUdJhx/TEqnzwip+dd1LgYPFwhXHcseCpz1T9v35CaL03+MBItKKQsbRmhMKx
 JB7YOCfRFgPdzrSrI6vdURtC4WIXf/IUVJMvmMuYHSCsjf4x7OM9M7+TEo33DQ+oOAZwYGlXj64
 rEMZZqbke6IPvnY22JQFRlAG/7T9FJQKVsm3YdC8lsGMDHV+m68VMkYn4ZZiMWQMUO2xPrJOWKY
 f2L5R2lEBu477t4X6feedYaSR6smfqb5MtBq2f0j6dCXFoUEg0pBj/DGzV/JqlkA/l89HW7VKBl
 EBJhCiXbJvswjOm7eUQiJa+DGqmGe69cUSFl/HFFFur3PimfIdCEQPsdEtICgg18Lm+f9xGorKM
 Fl4Y73RI2m+fKUTKXeg==
X-Proofpoint-ORIG-GUID: -QRuLt4AbA8NU2cVg7IW_Qy_jEkRvcPy
X-Authority-Analysis: v=2.4 cv=DvZbOW/+ c=1 sm=1 tr=0 ts=69ab0514 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=hQCg4X1xv2bm5S_WMKMA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: -QRuLt4AbA8NU2cVg7IW_Qy_jEkRvcPy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060159
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
X-Rspamd-Queue-Id: CE03822552C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:andersson@kernel.org,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

The UBWC registers in the MDSS region are not dependent on the UBWC
version (it is an invalid assumption we inherited from the vendor SDE
driver). Instead they are dependent only on the MDSS core revision.

Rework UBWC programming to follow MDSS revision and to use required (aka
encoder) UBWC version instead of the ubwc_dec_version.

Fixes: d68db6069a8e ("drm/msm/mdss: convert UBWC setup to use match data")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 120 ++++++++++++++++-------------------------
 1 file changed, 45 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9047e8d9ee89..9f81f43283b9 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -166,27 +166,27 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 	return 0;
 }
 
-static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
+static void msm_mdss_setup_ubwc_v4(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
-	if (data->ubwc_bank_spread)
-		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
-
 	if (data->ubwc_enc_version == UBWC_1_0)
 		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
 
-static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
+static void msm_mdss_setup_ubwc_v5(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
+	if (data->ubwc_bank_spread)
+		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
+
 	if (data->macrotile_mode)
 		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
@@ -199,11 +199,12 @@ static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
 
-static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
+static void msm_mdss_setup_ubwc_v6(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
+	u32 ver, prediction_mode;
 
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
@@ -211,45 +212,42 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 	if (data->macrotile_mode)
 		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
-	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
-
-	if (data->ubwc_enc_version == UBWC_3_0) {
-		writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
-		writel_relaxed(0, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
-	} else {
-		if (data->ubwc_dec_version == UBWC_4_3)
-			writel_relaxed(3, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
-		else
-			writel_relaxed(2, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
-		writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
-	}
-}
-
-static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
-{
-	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
-		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
-
-	if (data->ubwc_bank_spread)
-		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
-
-	if (data->macrotile_mode)
-		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
+	if (data->ubwc_enc_version == UBWC_1_0)
+		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 
-	if (data->ubwc_dec_version == UBWC_6_0)
-		writel_relaxed(5, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	if (data->ubwc_enc_version < UBWC_4_0)
+		prediction_mode = 0;
 	else
-		writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
-
-	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
+		prediction_mode = 1;
+
+	if (data->ubwc_enc_version >= UBWC_6_0)
+		ver = 5;
+	else if (data->ubwc_enc_version >= UBWC_5_0)
+		ver = 4;
+	else if (data->ubwc_enc_version >= UBWC_4_3)
+		ver = 3;
+	else if (data->ubwc_enc_version >= UBWC_4_0)
+		ver = 2;
+	else if (data->ubwc_enc_version >= UBWC_3_0)
+		ver = 1;
+	else /* UBWC 1.0 and 2.0 */
+		ver = 0;
+
+	writel_relaxed(ver, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	writel_relaxed(prediction_mode, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
 }
 
+#define MDSS_HW_VER(major, minor, step)	\
+	((((major) & 0xf) << 28) |	\
+	 (((minor) & 0xfff) << 16) |	\
+	 ((step) & 0xffff))
+
 static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 {
 	int ret, i;
+	u32 hw_rev;
 
 	/*
 	 * Several components have AXI clocks that can only be turned on if
@@ -275,43 +273,15 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	if (msm_mdss->is_mdp5 || !msm_mdss->mdss_data)
 		return 0;
 
-	/*
-	 * ubwc config is part of the "mdss" region which is not accessible
-	 * from the rest of the driver. hardcode known configurations here
-	 *
-	 * Decoder version can be read from the UBWC_DEC_HW_VERSION reg,
-	 * UBWC_n and the rest of params comes from hw data.
-	 */
-	switch (msm_mdss->mdss_data->ubwc_dec_version) {
-	case 0: /* no UBWC */
-	case UBWC_1_0:
-		/* do nothing */
-		break;
-	case UBWC_2_0:
-		msm_mdss_setup_ubwc_dec_20(msm_mdss);
-		break;
-	case UBWC_3_0:
-		msm_mdss_setup_ubwc_dec_30(msm_mdss);
-		break;
-	case UBWC_4_0:
-	case UBWC_4_3:
-		msm_mdss_setup_ubwc_dec_40(msm_mdss);
-		break;
-	case UBWC_5_0:
-		msm_mdss_setup_ubwc_dec_50(msm_mdss);
-		break;
-	case UBWC_6_0:
-		msm_mdss_setup_ubwc_dec_50(msm_mdss);
-		break;
-	default:
-		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
-			msm_mdss->mdss_data->ubwc_dec_version);
-		dev_err(msm_mdss->dev, "HW_REV: 0x%x\n",
-			readl_relaxed(msm_mdss->mmio + REG_MDSS_HW_VERSION));
-		dev_err(msm_mdss->dev, "UBWC_DEC_HW_VERSION: 0x%x\n",
-			readl_relaxed(msm_mdss->mmio + REG_MDSS_UBWC_DEC_HW_VERSION));
-		break;
-	}
+	hw_rev = readl_relaxed(msm_mdss->mmio + REG_MDSS_HW_VERSION);
+
+	if (hw_rev >= MDSS_HW_VER(6, 0, 0))
+		msm_mdss_setup_ubwc_v6(msm_mdss);
+	else if (hw_rev >= MDSS_HW_VER(5, 0, 0))
+		msm_mdss_setup_ubwc_v5(msm_mdss);
+	else if (hw_rev >= MDSS_HW_VER(4, 0, 0))
+		msm_mdss_setup_ubwc_v4(msm_mdss);
+	/* else UBWC 1.0 or none, no params to program */
 
 	return ret;
 }

-- 
2.47.3

