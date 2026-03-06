Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHDYAjwFq2kMZgEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 17:47:56 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9351225697
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 17:47:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3DA10EE03;
	Fri,  6 Mar 2026 16:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LiZ2bxYL";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JWXCAZRa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C30910EE01
 for <freedreno@lists.freedesktop.org>; Fri,  6 Mar 2026 16:47:53 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626FrMOe083012
 for <freedreno@lists.freedesktop.org>; Fri, 6 Mar 2026 16:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cZb8eZw+Q83o+RlHHgWXaiw17CCH07r6st3FY/t2sq8=; b=LiZ2bxYLzVssMrjQ
 dwtQ6ZtcQ4t6ddMaCjo4d7gdEsCbn9iR82OtxuasTZtEIhnfQY6/RIGT/N2yEFNp
 6qj2VIFaMWgAEnYoJfW9rxw3lerXUmkrEziC0DTWV28eBoOEz4U4lhYiXHKj3ArS
 csoLIY5O3spFkHqNw9RwO/8rtViW7PAU9CAjVps/YGg0t6zMTx49zH1RCCgfbBfD
 KyiFo2rHTC9KwlwMjWE1JRCaZHn02tYfSOM7OiPGlhq/Si5lW5FJ4Nj2gluxSNuq
 Z9RBMxl/QfP3gtdafRSldV+SAuWtsGVhi4AiA0Ejo3IX1HH8b/3p5kG6vyv9Okla
 BFIFDw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv98hc2c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 16:47:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb5359e9d3so5628187385a.2
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 08:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772815671; x=1773420471;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cZb8eZw+Q83o+RlHHgWXaiw17CCH07r6st3FY/t2sq8=;
 b=JWXCAZRarJcPiFj2IjuwO5pMp3XxXUIZrR9I2HBnEqlT1g0k20RDmE6hNsstJNOB5d
 0h9uPuDI+PL/E6+lyiU2tUjyEytN12isXr/NpwzWZwY2cIudlqVDPIx4EOK49Uuyf7tk
 xjW/Q0JztYyxq3FqjFIisV35y2FAedjNtD4vQB0xcBnaucC7vn48YKnK0aQGnxYHz3tl
 ZQxoeJrBZrX/XVL317qC/ynopwbDOR+nrBHNfsMoeg4W5YHlrw2neTwaE/KeCnZuOFsc
 CncE7umM91MFfcU4+rsCwl/S3ukRcuIHUa3IofcqDLMWpG3UDbuNpQApaCTLue1mp7lg
 vutg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772815671; x=1773420471;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cZb8eZw+Q83o+RlHHgWXaiw17CCH07r6st3FY/t2sq8=;
 b=LbPpyroAXNKaf+FNij/31cEBlOWDmHQ8B8O/C0S6a2BRObx/nGTyYxz42kzTeoNHWc
 OZDkhPxL068qp0h+wijY1pIKSzWXMRZ4L+k/YnIdhF5F/Cwl2qbOm6bzKebGhpC0s21R
 q4IPyAdNWvon9Em77DjtY4rlwKYW52CVcasCL/elHQU5I83rRgbT6gbMWacQrE/KhWh2
 fAoHb3XYo5hAx9OuiCM58J4PapCHIYo2ElPVno3FZ4NKf/erYEFauvrkyvtkiD+R1Q7x
 a6i2H0xp9ZpEnHJh8hjUUVoHdAe1NfzSaYIXj+m7mZsdK1qVhRAfI6dHgphzDyJTBnWB
 khAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWU9wHp0kcsMHCnXsA4E+5fjqdkVE5oOegd2xEok45IwJNco+gN+G3rChwdklTWVyIoOI9T5+qdDqY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztDpGbZ5rqqjWjBY1ujGCtcppYq2NOLeAo9AQXwJ8NunbtSxva
 96jc4cbiQqcYImPnndNmuCj3pSYxRj/p558JrpFM5s9w26HwPvgYlms+y+yPRQ/pMuJiWIg4mAo
 GCahnxN/OMTThbqN/Ufs02gbvc3G7t7G24+9AFIJI/6sBD34XjJwmD6eNldMB7drfIeyLfFU=
X-Gm-Gg: ATEYQzwXzrxMS1cNKUQugmiHhVrNpbtJD6/EA1fbVb9bskz9wl69/rSsfs1tutacOkQ
 Ix5GtdAqMF1tNIAJl3scgvwSbnKVmkTjeC4vWATsqV313gx8J8qS4+RFJ8Dxz9ef04he0INx8eo
 ukAJI4ELgpp6SBHD7eyt/+u9FBZCwu0OqxsSvqYM5GQydp0PerEMLIy5WaYqJl14J8C4JC34AAS
 DI+sehjm7F3GQxWKUBnKM7W4YPS61TQ+wQc4ORv3isPY+YDvEh+YjzSMb+SocfRn9o3BMtxMlrH
 JbcdpZ+PH/z828x/NGwZ46Cvive8EsuyMukkBorNp4fJRnmNeaRynE+d+N+lGy2lATK5rIMRU/e
 sehhAb7Pl37SoHF/n6sA13eQwzsPNqK0iKpTj+Zb2TqD1/pFCAVi0t7r7esqtaR/0/g3V2CbPTi
 XuxMrMgeyGoOPSsKBe2yaZ/bLVtX2U45aoraQ=
X-Received: by 2002:a05:620a:450e:b0:8c7:19f4:b585 with SMTP id
 af79cd13be357-8cd6d437e12mr357961285a.43.1772815671532; 
 Fri, 06 Mar 2026 08:47:51 -0800 (PST)
X-Received: by 2002:a05:620a:450e:b0:8c7:19f4:b585 with SMTP id
 af79cd13be357-8cd6d437e12mr357957685a.43.1772815671045; 
 Fri, 06 Mar 2026 08:47:51 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:47:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:29 +0200
Subject: [PATCH 23/24] soc: qcom: ubwc: sort out the rest of the UBWC
 swizzle settings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-23-9cfdff12f2bb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4110;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8WidFnFU6pX9ecJLzeiZrTJ8KzhlV2H6Mjpf2nc28Pk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUQAZ+0aWPY3IVYykrhRri6p7g+LTvnjvKP6
 ufdhY52g+yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFEAAKCRCLPIo+Aiko
 1WrJB/0eS0DHsvjpFfzh4DNP0t5Gk/kPiCgl8jnqQExo+9O/doJAZffcqd/dT4qe22aibnWMn6E
 VTgdGYhjRrKycFpmz/JpnDz+5YABXYX6ABlXi55nugrW1JVtxQUmhRSDsRn3aCEtf2zafBZlBq7
 OuDu67brybndsSHN4tV/NERdu/ww2CF8HaQmPBM+6Kv741dx8X0pMWWcI3ImuhE4uzGwai3iMuH
 +9aWnuJUYxjrHaHKO7fT4UFV/HFFVx1gD9EyMTr9/khOokC8QlQZXRbiSQPbLDxVrtLqqbRYQho
 vD2z9Fi+LabuDcuYVkaLHIm3RpLEmgyqoPGuQa6BjuTNAVs6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: u8bpHeBiSaKiBDFRm3EjCfFuh32KJOpT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX8xjgFKVbgdrl
 qN4R9+sGLzB8hEsHlDdqjRC0RnMpkuofW0vGgLBzQu/XerRy+5xhtL6M8JsDZsBhmCPCNQKTjNq
 427+814YJHppD9qXci66DP2kR9QtYeKP6T4pezwJoFFkwXAIMI1TS/EWfAlKoRr9HXOyy3APMIo
 lECghIH9jmVtws1lLiy4wyb5gP/j9GVpTVFu9akarTFibvw27oLzD6SgDlo3sqqoCpIkBtgWKEO
 y+9DBij6f6ugf0KXupldE/HU/lyK5SMJ9M+dyM0JjoXYcdFjtpiJiAOR9m6TQC2cX7EBFMig6BN
 rVbIKqlRh38KNEos21jN2Q4YX+pZmYlSO0wA25+9ZeywSHM5H8D3hC4k0KOa26RSc+LBwaNKHBG
 HkAHrVfynWiZXg1U02Z9pv6E3iNH3pKtiAfEQ+SOW5VAOMWkSUGnedwLPtNw4PXqm/1oiIQNror
 Q2CYPRiAax4qm4eFrNg==
X-Authority-Analysis: v=2.4 cv=LbcxKzfi c=1 sm=1 tr=0 ts=69ab0538 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=SdgSTUjA-qPM3NZmnp0A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: u8bpHeBiSaKiBDFRm3EjCfFuh32KJOpT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
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
X-Rspamd-Queue-Id: A9351225697
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
	NEURAL_HAM(-0.00)[-0.988];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Sort out the remaining UBWC swizzle values, using flags to control
whether level 2 and level 3 swizzling are enabled or not.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 14 +++-----------
 include/linux/soc/qcom/ubwc.h  | 26 +++++++++++++-------------
 2 files changed, 16 insertions(+), 24 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 49edfabb5e18..ccee20913115 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -18,8 +18,6 @@ static const struct qcom_ubwc_cfg_data no_ubwc_data = {
 
 static const struct qcom_ubwc_cfg_data kaanapali_data = {
 	.ubwc_enc_version = UBWC_6_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
 };
 
@@ -40,7 +38,7 @@ static const struct qcom_ubwc_cfg_data qcm2290_data = {
 
 static const struct qcom_ubwc_cfg_data sa8775p_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL3,
+	.flags = UBWC_FLAG_DISABLE_SWIZZLE_LVL2,
 	.highest_bank_bit = 13,
 };
 
@@ -111,38 +109,32 @@ static const struct qcom_ubwc_cfg_data sm8150_data = {
 
 static const struct qcom_ubwc_cfg_data sm8250_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 };
 
 static const struct qcom_ubwc_cfg_data sm8350_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 };
 
 static const struct qcom_ubwc_cfg_data sm8550_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 };
 
 static const struct qcom_ubwc_cfg_data sm8750_data = {
 	.ubwc_enc_version = UBWC_5_0,
-	.ubwc_swizzle = 6,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 };
 
 static const struct qcom_ubwc_cfg_data glymur_data = {
 	.ubwc_enc_version = UBWC_5_0,
-	.ubwc_swizzle = 0,
+	.flags = UBWC_FLAG_DISABLE_SWIZZLE_LVL2 |
+		 UBWC_FLAG_DISABLE_SWIZZLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 };
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 0cbd20078ada..953094b73459 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -14,15 +14,6 @@
 struct qcom_ubwc_cfg_data {
 	u32 ubwc_enc_version;
 
-	/**
-	 * @ubwc_swizzle: Whether to enable level 1, 2 & 3 bank swizzling.
-	 *
-	 * UBWC 1.0 always enables all three levels.
-	 * UBWC 2.0 removes level 1 bank swizzling, leaving levels 2 & 3.
-	 * UBWC 4.0 adds the optional ability to disable levels 2 & 3.
-	 */
-	u32 ubwc_swizzle;
-
 	/**
 	 * @highest_bank_bit: Highest Bank Bit
 	 *
@@ -30,6 +21,10 @@ struct qcom_ubwc_cfg_data {
 	 * DDR bank.  This should ideally use DRAM type detection.
 	 */
 	int highest_bank_bit;
+
+	unsigned int flags;
+#define UBWC_FLAG_DISABLE_SWIZZLE_LVL2	BIT(0)
+#define UBWC_FLAG_DISABLE_SWIZZLE_LVL3	BIT(1)
 };
 
 #define UBWC_1_0 0x10000000
@@ -101,11 +96,16 @@ static inline u32 qcom_ubwc_swizzle(const struct qcom_ubwc_cfg_data *cfg)
 		       UBWC_SWIZZLE_ENABLE_LVL2 |
 		       UBWC_SWIZZLE_ENABLE_LVL3;
 
-	if (cfg->ubwc_enc_version < UBWC_4_0)
-		return UBWC_SWIZZLE_ENABLE_LVL2 |
-		       UBWC_SWIZZLE_ENABLE_LVL3;
+	u32 ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
+			   UBWC_SWIZZLE_ENABLE_LVL3;
+
+	if (cfg->flags & UBWC_FLAG_DISABLE_SWIZZLE_LVL2)
+		ubwc_swizzle &= ~UBWC_SWIZZLE_ENABLE_LVL2;
+
+	if (cfg->flags & UBWC_FLAG_DISABLE_SWIZZLE_LVL3)
+		ubwc_swizzle &= ~UBWC_SWIZZLE_ENABLE_LVL3;
 
-	return cfg->ubwc_swizzle;
+	return ubwc_swizzle;
 }
 
 static inline u32 qcom_ubwc_version_tag(const struct qcom_ubwc_cfg_data *cfg)

-- 
2.47.3

