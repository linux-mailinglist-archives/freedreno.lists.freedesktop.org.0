Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FkOLDYFq2kMZgEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 17:47:50 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 642A722565C
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 17:47:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D2410EDFF;
	Fri,  6 Mar 2026 16:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="d+iW9e8B";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cuft9Ds1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F58B10EDFB
 for <freedreno@lists.freedesktop.org>; Fri,  6 Mar 2026 16:47:48 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626FrPTe550620
 for <freedreno@lists.freedesktop.org>; Fri, 6 Mar 2026 16:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0OCwYQ2Sg4X39o+2p54LoIZKEdb8rGR+XgJMOS0WD3g=; b=d+iW9e8BFoL4xh7j
 FCnltjm/CNSaq7IrNakHc72lQ9UK6c+bFMQaRjVE6nlL1I1HA6Caa9efRaQHSRtm
 3Q/G73wDHAFWbJff87TIN3H6ixBbikfTQ48wz+h4biWgWhMGMSjuCFxTUXKEDdU6
 7/jpTAKiN2YrDs4+su6xKcr5vpqcPQev8hvGHNAJbTIixetMaDAdVWInrIH6wgXY
 V7qj9enuvWw8JbGtvqLLEIS6UpCq2yhPF60pLYhD6zGhEf1xW1pTbVWGmCYm6hIe
 klJe+3uU9ltejgx9AnzlshyBJyP+kQQlTxyTwIRo3OIE3CQpy+jcmRm3y3qHRMLd
 5Vjqqg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqruka69k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 16:47:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c71304beb4so1548889085a.3
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 08:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772815667; x=1773420467;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0OCwYQ2Sg4X39o+2p54LoIZKEdb8rGR+XgJMOS0WD3g=;
 b=cuft9Ds1ng00miK6k9IMD193dxP4crXGlT1c0rQGqExFN3OfYZapMuqdkVA/NQfBO4
 ZEfgI+ZAFmdyrO3SGiksXH81B6wGpsA4D5lh9cyqaTD6q5kvFy6SHM0yM/vTawn72PwR
 eat0Rhsw3EAwUj0hOiRiXhfJPn4hHfH1peO/ua62w9vwbeyMKsPHiVGe+awIl9XD4gkM
 nZiyKlOWUrk0rZ8iZg9DIwd7AhToJBXcJzLeqiW9oZnLvKiyPZY0RV/mtQN75uRvxld4
 yr+41YGZusHFRW7Guc8gvhvgkmP+EJa0s838hogMbAxhmxczjusyg8kIq8K1Kcc9f8cs
 Q/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772815667; x=1773420467;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0OCwYQ2Sg4X39o+2p54LoIZKEdb8rGR+XgJMOS0WD3g=;
 b=v0fLKD0/xBqx01mHOvCuQ92aQzIKT3juQk0cF9u8S5aoKNjMRpsHWJ/kjD4+h7U9Yh
 5W5J8yOGYJ6FZMsv2j7uE1aVQ4/vqrkVuWouIZfG2j6grZtPMrcxgUEXZSQMABLKZ6uC
 SWs4lzgijxWyRA3Ssto/805PFBMcHV/3EPSAbZdtQS+NRVkF0DsDhLB+JijtTp6HelCw
 WkIZwozts4T9CzcumwRm6+HeadwrHOHdcYOy7SOJvRu0sEQlwAOES/6Bu7SqTigN+UlJ
 OGUIB2XxgW+piUKam9rq/WyXVl6uT4Vrq+2ItLjX8DJbYrZJ03NQ3BE1GzZ0unkvAzWr
 gkfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaVEnuRQvr2/9q8PYsIngwLzCQPPHR30hNdQykpUMGEAIZaSiEOai0VXqxM0szWwQ/zFLr/8kW4Wc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9LqNn3q0U8sBio7dOGS4jEPDEtS43DHQtuSVszKH/Nj9m7e17
 V5R3k2pXWVwc0s/mYN8PGMClsD340KiByg2yhPI8JRMDF7bLNLtyrTCOEholHdXabYNamjL0d52
 z1WCHpecL8VW7SsY810Do/V25uQkR1TTeVQux44TTf85TmbWCYrUxFx4vZtTjig0FKzvZCPw=
X-Gm-Gg: ATEYQzzO7MCxZKJ/ZvBlzQq/sfUC49mxRSWrRYU0ABEhoq6ByjrLyCwMHyxZCBlM5Xc
 CT6Zjakocm6NLcBUmkGUIq/ZkDWPVYjYrRfM92woqhmPcLFfhsgm1Nl0zvu//LJBgPdKANKorpe
 fOvwxh2leppJvKEdvgcg0DYm1w1WyQOLfJ5qETEh1aAhIBrx+DWxSWLj4ydSZCT+4xGONYdw/8X
 5OmX6+p9AnZv6hW+6iDiaqdjwjqaiwO8ImRWsYuArJ7megwYRuaTyWTWnqXo3nqSmJ4lmQla8o0
 gM2eXSTr9ayxRkFwzGRR3FtnYAuT4OO+8Va+jCatSpNsnjCjFr4ZCndswFaYk5/kMTNrfZPkzjG
 +M+JPhJnIIAsgPEuzX9EaJ5eoNszWv2hjFz7q6WrRwOoBNN1Q7MSQqONVT11U+o6Z824H2mc6wJ
 2SLkaiPt/jMBjh8tn2lOEClEXeAXnK953U/xk=
X-Received: by 2002:a05:620a:4586:b0:8ca:2ba8:b988 with SMTP id
 af79cd13be357-8cd6d44053dmr354355185a.41.1772815666912; 
 Fri, 06 Mar 2026 08:47:46 -0800 (PST)
X-Received: by 2002:a05:620a:4586:b0:8ca:2ba8:b988 with SMTP id
 af79cd13be357-8cd6d44053dmr354349785a.41.1772815666266; 
 Fri, 06 Mar 2026 08:47:46 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:47:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:26 +0200
Subject: [PATCH 20/24] soc: qcom: ubwc: drop ubwc_bank_spread
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-20-9cfdff12f2bb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5229;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mDvAIGusOne0ET0zqDfmYH/uZpA3s+5yjk3GrtdImQU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUPFtY6u5zVLvLenx4CUnulpHnNP6pHdDvS2
 9vT2ZvTUjmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDwAKCRCLPIo+Aiko
 1TlnB/9VSPpVHj4eq2C76Ph/xyzmxPrCnKrdpIAWV5wSf9C8Pbg3OjbUiUkj6t5GMkzeblM6Vrb
 eerbaQyi9IpBjeF13fKvFv0TXxdlbDjq8yr0Svyo6LTQGnl0X9pYNA9/Kx3LEVU8xG0pKDG3spM
 W36kseSYDPCxH/h6k6pm9yfE5YsRGRfStCHAehsO2lN8yRjzrRoZ4jNCQ30mbC07D5D0YKo0Art
 T6C8eCw1afRpqoSb9qbnYqYmpi3e0486K/VUelYJAjLPe2y4y2fpfZbIv+3tZ5MTPecMSvyzdZE
 Ss1Bwc/O3lDPC5zQqtZcKCcO7mjOEJBoz1yHLRYH47snTNJu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX+DyHcw4yC/Mn
 cTGWtMLyEzMGjnXT8aekPJXiMO+A9e0w6hGphQpLNWMis/rCnCSNDY5ZFQxjKobsaviaeuMmJ7E
 VneZ/X4ttN+VwRvlNO3bKZjYOtn8LuBUfYci8R/IECDKpC0Rvjf/UedOCI5oa7tB5NBzQ0PhlhD
 zQynBqoGCQmNl2CAjf8LHhGn18SLutF5vA49jNiDW76lJNKsdOduZrgt+XNneWjZXOokmDmOwWq
 fUhva1voqBN2Ayoaho3fCpwHotNuKxvQrK1pDV61vEbx9uPwHKcPuRPD0bcHP36dyXn8xB8JLx6
 Nww0DwPLv2WYX5IK/Fu7iJQ4OP8rKNHx/kANe6klQi5HAO/DwCW2cHc+gZbOJRY7Y6/RAZRm6IJ
 YB7Ka3cI1EGyXBu6YskrdJooR1pERVMTk4kXaYNPrnGlgB5+IoWg3t2dVek1bB0/pdZJ1xGsjdB
 JXrSIfqBIYwuRJ7yMwA==
X-Proofpoint-ORIG-GUID: _BIDnyfF0PtTv7Hl2rkTv37uBBljay3P
X-Authority-Analysis: v=2.4 cv=DvZbOW/+ c=1 sm=1 tr=0 ts=69ab0533 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=j0qWcOM9GDCbVNQ44DEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: _BIDnyfF0PtTv7Hl2rkTv37uBBljay3P
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
X-Rspamd-Queue-Id: 642A722565C
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
	NEURAL_HAM(-0.00)[-0.987];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

According to the documentation, UBWC bank spreading should be enabled
for all targets. It's just not all targets have separate bit to control
it. Drop the bit from the database and make the helper always return
true. If we need to change it later, the helper can be adjusted
according to the programming guides.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 13 -------------
 include/linux/soc/qcom/ubwc.h  |  3 +--
 2 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index c5c7fcb4d013..070bf97e134e 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -20,7 +20,6 @@ static const struct qcom_ubwc_cfg_data kaanapali_data = {
 	.ubwc_enc_version = UBWC_6_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	.highest_bank_bit = 16,
 	.macrotile_mode = true,
 };
@@ -49,7 +48,6 @@ static const struct qcom_ubwc_cfg_data qcm2290_data = {
 static const struct qcom_ubwc_cfg_data sa8775p_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	.highest_bank_bit = 13,
 	.macrotile_mode = true,
 };
@@ -58,7 +56,6 @@ static const struct qcom_ubwc_cfg_data sar2130p_data = {
 	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	.highest_bank_bit = 13,
 	.macrotile_mode = true,
 };
@@ -67,7 +64,6 @@ static const struct qcom_ubwc_cfg_data sc7180_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	.highest_bank_bit = 14,
 };
 
@@ -75,7 +71,6 @@ static const struct qcom_ubwc_cfg_data sc7280_data = {
 	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	.highest_bank_bit = 14,
 	.macrotile_mode = true,
 };
@@ -92,7 +87,6 @@ static const struct qcom_ubwc_cfg_data sc8280xp_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	.highest_bank_bit = 16,
 	.macrotile_mode = true,
 };
@@ -116,7 +110,6 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
 			UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	.highest_bank_bit = 14,
 };
 
@@ -139,7 +132,6 @@ static const struct qcom_ubwc_cfg_data sm6350_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	.highest_bank_bit = 14,
 };
 
@@ -161,7 +153,6 @@ static const struct qcom_ubwc_cfg_data sm8250_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 	.macrotile_mode = true,
@@ -171,7 +162,6 @@ static const struct qcom_ubwc_cfg_data sm8350_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 	.macrotile_mode = true,
@@ -181,7 +171,6 @@ static const struct qcom_ubwc_cfg_data sm8550_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 	.macrotile_mode = true,
@@ -190,7 +179,6 @@ static const struct qcom_ubwc_cfg_data sm8550_data = {
 static const struct qcom_ubwc_cfg_data sm8750_data = {
 	.ubwc_enc_version = UBWC_5_0,
 	.ubwc_swizzle = 6,
-	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 	.macrotile_mode = true,
@@ -199,7 +187,6 @@ static const struct qcom_ubwc_cfg_data sm8750_data = {
 static const struct qcom_ubwc_cfg_data glymur_data = {
 	.ubwc_enc_version = UBWC_5_0,
 	.ubwc_swizzle = 0,
-	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 	.macrotile_mode = true,
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index c5f049eab07d..405d83f8d95b 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -33,7 +33,6 @@ struct qcom_ubwc_cfg_data {
 	 * DDR bank.  This should ideally use DRAM type detection.
 	 */
 	int highest_bank_bit;
-	bool ubwc_bank_spread;
 
 	/**
 	 * @macrotile_mode: Macrotile Mode
@@ -88,7 +87,7 @@ static inline bool qcom_ubwc_macrotile_mode(const struct qcom_ubwc_cfg_data *cfg
 
 static inline bool qcom_ubwc_bank_spread(const struct qcom_ubwc_cfg_data *cfg)
 {
-	return cfg->ubwc_bank_spread;
+	return true;
 }
 
 static inline u32 qcom_ubwc_swizzle(const struct qcom_ubwc_cfg_data *cfg)

-- 
2.47.3

