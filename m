Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJt9ISwFq2nDZQEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 17:47:40 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F19D2255F3
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 17:47:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C031610EDEE;
	Fri,  6 Mar 2026 16:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RUo/ZWRh";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qq+Ix7ys";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E3210EDF1
 for <freedreno@lists.freedesktop.org>; Fri,  6 Mar 2026 16:47:37 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626Fr4m6082541
 for <freedreno@lists.freedesktop.org>; Fri, 6 Mar 2026 16:47:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Aie/7ZFKISr7ex2L2qy7vWj/+PsvZZhXHj0gPDXAjM8=; b=RUo/ZWRh/8xT01VC
 bRYEW5v8dCgJtq+Jio/JoywLt2w5tQffzAwEQYS0dEX00XMymcOxEXbIyL4Xt4jm
 aas/XjwGagNROUYBqF2qn4KMLrctlO5dTIkfTgbkpuTSg6dwxWbxuqQoXGjQ41zK
 yonQti4zSCCn/1iIBcBzTFEJTnmUuRwfXWLhX1OKXjVhfKxJ6pCDYP2Rkw7/WYM7
 iMy9z4APiIWIiJSgXOCyZ5PrYG8pLCf4++K2iLGqhFDvKhFnC9k/VSIH1RtV3Qb1
 PQXlwqh332s+MFRAtQUQQCYH0Em5HONvXNNRXDm+eppn6D0v49AB00dA4ZO3Lv6y
 uk+fMg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv98hc10-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 16:47:36 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-899fa82ebb9so344921626d6.3
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 08:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772815656; x=1773420456;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Aie/7ZFKISr7ex2L2qy7vWj/+PsvZZhXHj0gPDXAjM8=;
 b=Qq+Ix7yslo2LCEHxyCz+J+jIbGnuYwbfb206LQgHZ2DsGyU4VcAXB4XnkRlzkXJGgc
 05KbaeDeGRW69La/yPWY2y6fAXEBQAhzybbc03HAzijQ+NvULujCgI00I91UgBGs5+G7
 GKXQiQOmNxiT+1YoRqF04Wz/soAyBcxCNAIhtVDHeCaenH326KVhJHtUpBzedbjv9nXP
 YbNW+trYCPfU0b+kSskzF/Sw+ouCpHo3JYEaQaZq+qHimdVNcfQSmlfT0z6OmCy4x5WE
 QJhPGTzwp9Ujjnlm+0jYu6iJNa7TyQ3J1xIocO/iBPOeZ28kGHfEil80mBwjbot1z0NP
 vVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772815656; x=1773420456;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Aie/7ZFKISr7ex2L2qy7vWj/+PsvZZhXHj0gPDXAjM8=;
 b=JQIwjL+aL8gZEgpIfmzIxyxQNwDeZuhrEU11Qa6YFyJx/VW+Z7NM7vGhxHSzf8jrHH
 k83ENtaFkTJFLtgAblfamGACPo8a7fCvK271gAQ1bW8FQv+clpqgQP0aXJ9vJG7uwcNZ
 C3UyHMplgmG03rakyLuQLrQntRhSCIgceGQTaVgX3MVAiNwiczandzpx1TJLntlBLb/4
 IwjOxqAigXt9ZOT0uXQI6R5xSE4wG8LsUxLsyHedMkE7qrsMlKxFKdlPdui0hr6a8nzH
 edsw4oV9S1R9okdoaaKUcjz1CmCZl5HWQlwErjP/soA9RLPsgFtPA5A30b0XgY6o6ukz
 C+6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHRo6NaNklVmRUxA1TjD0a8KLHYTuPMETvWNMEBBR/4RFqV3A8ZB/7fORjM6FErX0QCi/ZRziau6w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqTP+ZMuJREbhVd6V7C/aQXX6+ltYfe5bzNNP9ssGDwIDSAEPL
 nwzWfh+2zk+mLhkPilSGaPF3/awI4beCRO3ArfLIXmjoRF9zyXcl4xB7xDxpfjfIG+Aw3as0mdx
 GNowAJKwLBzO69Et+u+qt6V1kOAfWji6lUa+fnBShn0feAkdB/SWN6Mmf/vMri8k45oLOzQg=
X-Gm-Gg: ATEYQzxRc0bYx+hV0XSmQkAduhz2Yfrxpkhe9fx8ZAHTuaHdtIOJhX6d5HGZbOuL9AC
 L7Ww6uW8ZrGZ82zwUx5LotCGsfLH1//sDn5ZV1cKR2Vl1gKf1GCnnjuIsG1ToP/NJ5pHNuVXMIP
 2Wy2gvErIDf7kJhJ5JNhQ/CroWp5343nH1Hg/SZsrqwI7lwNDKfme6XW4hGWSutF4M/D0A2MOkH
 YpoyarU2LVGPSnu44v9gZYC58MgXGNZj+O5F3CeUmLJ+IA7keKvj8Y2UB5/iM8lPAW29yxenDv9
 n7Wl7bEcRhpUzUdYs2iX15Sb6OD25B3wQX0k7YSKqi2DEzDI3C8y6MWp8cBt+mLF+BUk8r1ecDw
 wT7D4ozTk9NNjADkpFEDB9ymD8nDhIBTguFuuJwcBES0SCU+Ienqe3Ue1+R6qgShbVb31aemIwo
 6KwUYa4DV2evK/MIk9Fj0OSp9i8DfRHBWBuaY=
X-Received: by 2002:a05:620a:4093:b0:8c7:106c:cbd4 with SMTP id
 af79cd13be357-8cd6d324021mr353873785a.12.1772815656015; 
 Fri, 06 Mar 2026 08:47:36 -0800 (PST)
X-Received: by 2002:a05:620a:4093:b0:8c7:106c:cbd4 with SMTP id
 af79cd13be357-8cd6d324021mr353869385a.12.1772815655528; 
 Fri, 06 Mar 2026 08:47:35 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:47:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:19 +0200
Subject: [PATCH 13/24] drm/msm/mdss: use new helper to set ubwc_swizzle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-13-9cfdff12f2bb@oss.qualcomm.com>
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
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1997;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=qsOpdLggOXLMpfbLwFYg8PlGDKmsRsIEs54oYjYlw/0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUOwmtRsGD4tC9puPqHYNiohxXzcLjDEA5Uh
 CAgwY2R9lSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDgAKCRCLPIo+Aiko
 1dcOB/9RSpFMP6nY1bR64RNcJvTiVkU2qOr2TrLnNTTJdrKYmebkWCnVJR4OawMqK9lHX1rn1QK
 oZwfQDrzMkq7vhgODaLuZwp9Lz+zZcLVBcS3QbxMSUtQXvFw/DewIC2Nllol7BQ2iH0vndNjg2M
 m7fEzvOEKpZz23v2ndm5pM9L4omgJZzSnYo7ueL1glzcdLBH6CdBK7er1EnEY5Sw2pqFjqb4zr2
 AMHgLiltIygWZWI9zOZe7jGued11wULPqYWI6NzkKZd77RCFz94sL0NKXKRMy3YyodMHq0DU6tC
 pKBBos0H9ueHjLKhp79Q39DtztobCoXWvzSIeP1IuAxjciSM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 7dU3ZDDa65Jk1yoUE874J1NSZrflkluz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX5CcnkSwZOuoG
 wLA8s0NpwKLgg4asJkSCSkzBe6vGFGPweKyB7uhWO+adpGz9vtPrEPozq8M4nwGLcKfPb34u74S
 eNQFjYKErlB8FyxgJE5DpqPPw9iqHsetW35vUQAfipwGyP6Q40p4DaW7MRTpsJ1cayOMwCa2848
 aMomUzkDfx5EwGyfEv0wTDhDTVYP/uBzA8AWM4mWKp8evOoFbx1nIUDHjLJLNN+nXKPcfABSvsy
 YL5LoQsWALYD8fe/jAjeq10dLvTqS1v9YuLzVAKgBjHjYiyeQpMrLitpMznkTSaKzclCPTTuGhL
 UlXEbkCwRFJSEBzkY2ory0b9COEz+Qe1uLUWpZZob+QcF2VfoovxlFkPgqEt/oVBPZ+J0JYv9T8
 k43K/EYCgbCleYEQxAzgNUrK0MaQih3R3oknoA8qpEP1cOHpyX7eqtyiNshC4sIyIBNf5N/YJs9
 5Vsj7UXd/EmyhjA7BUQ==
X-Authority-Analysis: v=2.4 cv=LbcxKzfi c=1 sm=1 tr=0 ts=69ab0528 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=o1f3_DkCrcuZBLJIWnwA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 7dU3ZDDa65Jk1yoUE874J1NSZrflkluz
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
X-Rspamd-Queue-Id: 2F19D2255F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:andersson@kernel.org,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Use freshly defined helper instead of using the raw value from the
database.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 90a4b579776a..2c2cfefe9b9a 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -169,7 +169,8 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 static void msm_mdss_setup_ubwc_v4(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(qcom_ubwc_swizzle(data) &
+						  UBWC_SWIZZLE_ENABLE_LVL1) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
 	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
@@ -180,7 +181,7 @@ static void msm_mdss_setup_ubwc_v4(struct msm_mdss *msm_mdss)
 static void msm_mdss_setup_ubwc_v5(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(qcom_ubwc_swizzle(data)) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
 	if (qcom_ubwc_bank_spread(data))
@@ -200,7 +201,7 @@ static void msm_mdss_setup_ubwc_v5(struct msm_mdss *msm_mdss)
 static void msm_mdss_setup_ubwc_v6(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(qcom_ubwc_swizzle(data)) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 	u32 prediction_mode;
 

-- 
2.47.3

