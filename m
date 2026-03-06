Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNd9Mj0Fq2kMZgEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 17:47:57 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0F72256AE
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 17:47:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB39510EE05;
	Fri,  6 Mar 2026 16:47:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RaJH+McP";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HBYOYrH7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B3310EE06
 for <freedreno@lists.freedesktop.org>; Fri,  6 Mar 2026 16:47:54 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626FrT7H1425283
 for <freedreno@lists.freedesktop.org>; Fri, 6 Mar 2026 16:47:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Kc0CUSfqNxkAu0RnvxpVDUQEcmtNJShHwAZtVe0NfAI=; b=RaJH+McPRDZR3nFP
 oUP+Ye6Ookspvrk3Ou42479ZpuB+v7sBAWJ98SpTgkS2eEkWngJk51d1Hh36k9Wv
 fXw24IiEHBa5Wdh1sdRDiUkM6jESruR4YhSlp2Kc+4JKI0shqMNrmd3RHiFFhtNZ
 Xi39uxYuOX/1BuoXes/lXA2kM+1V/X03L6qRI+GZtfnJKXTmHsoLZebP9qMX656i
 ZLzuTlmwu+WgcXqIN3gMlJh4joq0uRO2PEPw7XDwdZSseLoxXcJcEB/DF1ZYES5b
 +xE/aE4vYZ+2NqRJ2r6xdHghiulCWz9EkTq7tVUWgQBpDsF3udgyiARA4kNOdbE4
 E7v6ug==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqrf5t802-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 16:47:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c71655aa11so7477925885a.3
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 08:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772815673; x=1773420473;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Kc0CUSfqNxkAu0RnvxpVDUQEcmtNJShHwAZtVe0NfAI=;
 b=HBYOYrH7p/ID1s4vShDFqBnrJIuwaxv6gLDzz5c0/mbQqyWdb75g/TpDnZLZi/nr6j
 +ioq6+O5/yCxLAtf3nCyrrDqUEz8Z9Gtbmn9L0DUp1wiNp2H0ihGhq0wdkjYx2iz2S1l
 rsEEVb4Ut/Wt8EouKp/j1VpM4NWvgPcfuq3doVo7n84SkoMiNCo+tAl2N/9mPkHfczH2
 nJVRspGhFrWFFe3oE9kHviMp04VQbo0xemlT6BT/woSW8B88bo6Ydq6nFG7fVD3Y/jzy
 Ygrw8Q1rhtooAzpJYNWZnklopE/TlfgPBKIIg5FP8ZI/gm/uh50biv2BfZ/FVMzyBMx+
 mBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772815673; x=1773420473;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Kc0CUSfqNxkAu0RnvxpVDUQEcmtNJShHwAZtVe0NfAI=;
 b=KHLNHuOzEMPeRDhHP9vWoQJGQ2xcOlsekAJL4jLxVbaTgUVqvqXgOZ9g9uAIrhzfEq
 m35oVrIZH5dox6mSpY5OtKubHL8UQXEOUL7QqjobqCLssC9oVds2ICtu62eDRHIP1GjW
 nEokl1KQWs2HqZ47pqEx9jSd+LMnUf4Yio3dBoyQT+pjJ9Z2nxjtZPG/KTZiABjNW6e2
 fss6OgY7br1bB3rd0zIhBwtj5YUV+7+qhztvBJbX/EuDfcHXixxbVGPpYNPLtENy3SCg
 NQE6KIEqPvK4tMbKHpuwtH/fBBCG/TaRR26p2U1v6o1E0fU2lLAYXjAN+vjMTqCz6+A7
 YYWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqHv2wH23d73jWtxUXeoF1CrC7+n1+D9EN/c+VT1zPnTW0li/93YliAMqCA018UehRGzSSbbrRCLM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwH1xGOKcxNuOVrjDe+ANhCw4NmACRf3T8CO02v5MmhlsGwp5XN
 HSumFPbNYBV+yRz1YiKn7duaSlJBR4RSi3dwXBG6ejwWxD5koO4K/8oZZY7ftOKM3diQZf3OcaJ
 BOuh3WHUCkAtou+NGgXczJ6c7EkRTNIwZROiXn7ozlyBSpsUyPKdaK0wRM9MbJf8ij85fAUI=
X-Gm-Gg: ATEYQzxTwNPv/5YaIPptBg6SnFWGGnjofTHSzKzI+CJFk3DnMsPwYdDwnt0A+9sxnva
 DMqk7y6WWTupOWyy+5qdPmq1KjrWhUyVRppsrf8XH1xgEtEs3XWy096jlmTVJNMkGnO91MZidSZ
 ofZoX3wDOfvcaks9nB2/x9ZgQJnVZmVLWHTG8Kur5V1Rc9iFAVseC/Iq64k11kLe032VqPQJH/J
 0LHnAJhKc4lrA0GI9WxYrImAz2MHy1zwpRr4jVy4IT/smxlyLu4LY5kkrmI+xz3EUDtiyUq2qYa
 GXDj+LRbXY68BA4UKhsbTlkPPoGjya7pZNyICxXq7Ey57PkNGyfQDGu//pNvE8rjUhoeKvGQlKS
 X/XlfuTIHv1qlz/xfz87yfazbkgK1aQB5Ax1g2dkm/RaUlXZOVMsUEJWyDB6jwoL5isvdwbjkmO
 7fDQ0fjGWVKlMDT3tq62kHeN+K0aFN4gnTwjw=
X-Received: by 2002:a05:620a:25cc:b0:8c6:abc5:f169 with SMTP id
 af79cd13be357-8cd6d4a8e8amr359971485a.73.1772815673018; 
 Fri, 06 Mar 2026 08:47:53 -0800 (PST)
X-Received: by 2002:a05:620a:25cc:b0:8c6:abc5:f169 with SMTP id
 af79cd13be357-8cd6d4a8e8amr359968385a.73.1772815672532; 
 Fri, 06 Mar 2026 08:47:52 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:47:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:30 +0200
Subject: [PATCH 24/24] soc: qcom: ubwc: deduplicate UBWC configuration data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-24-9cfdff12f2bb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11041;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/BbDUKCz/O5KmFNyRz0+9nN5/pGmPXixxn1sr+yj/UM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUQ/tteObGEMjsi7b2r8xJL56ZQfGZyKnIDh
 2aBbGt7G7aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFEAAKCRCLPIo+Aiko
 1X3pB/sF4Dh+COqQRMpVibvjeOIpX3Uo1z1aJukR266gLx4TmlUr70Ww+iioMG2y8oznCbLTc5A
 UP5D/w+z0fVI5Pc++uhwsdgPOkv5EFjZ2i+ttXtXYz7mIeNjKJ0CgwXe8rJYS9hZshT8PTXl7IP
 xfvAsCJ3l83KET6tD+JnwsQluN7wak3sjLrrhGOLqm4ezVMpJd2hY1KvhdYUkR4Wm/Gd5UEL6aP
 yWaeqfyECHIOOYo3uLbWYVyAXJJ3Yl+6zgCTvTDDl4jGqweeT4+MGarIy1+zFtignwdOavE6McJ
 Q6Lt8b97wUzK6QQ4HMCY44I8SF3hdsyWwgstKaRxHFCXXe5r
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: MMG_boAm6GHrwSw9aGKJ3Irp92TImpwR
X-Proofpoint-GUID: MMG_boAm6GHrwSw9aGKJ3Irp92TImpwR
X-Authority-Analysis: v=2.4 cv=L+oQguT8 c=1 sm=1 tr=0 ts=69ab0539 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=f57iFBScQPT45aafJKQA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX0jQazHw2Etb9
 DGh0WkQzHlBjNLXw+WHWZK1ekVfcE6dqj5sTn571jMgXg8A3REJNaXPWEviwjzie0naak7o1jSX
 q6fCmTJdmPJUUEUWs5Dhnx8YWBO45tqdHpuat48NEMf9YIQRj0yLn6vY03FSie0nyg8tCDayLmN
 41GHkt790lWbLfw0lZiYTvBbzejc/KWV3iQtniWWjAWp4/JqmVyGnTKmfzZI0SPSI7F+Gr/bueI
 VIZ7lh5++TDxOzGkvXIUc7K/KStT3wWco38CGveCrbCpLe4BpOgbGxwtnlsu3cBi+G4XLxZMP6P
 GmqfxvNsyBLpPRZWWv7i8V9C9CW++t88mN3Y4eVwl5GBSB7wQceFWBsHSmOXQWRxABdSsk1frRB
 wsevnvDy0+CeF3HxksNMUSBhcphSt1Koqr1FChgZVgay+mJ2hr5aGBRCxF7U80El9OXotPQX+1T
 mjs49JwjbRy50aU9bfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
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
X-Rspamd-Queue-Id: 7C0F72256AE
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

After removing all extra entries from the UBWC database it is easy to
define generic entries, common for all machine classes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 189 +++++++++++++++--------------------------
 1 file changed, 70 insertions(+), 119 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index ccee20913115..2ee40a26ec68 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -16,119 +16,70 @@ static const struct qcom_ubwc_cfg_data no_ubwc_data = {
 	/* no UBWC, no HBB */
 };
 
-static const struct qcom_ubwc_cfg_data kaanapali_data = {
-	.ubwc_enc_version = UBWC_6_0,
-	.highest_bank_bit = 16,
+static const struct qcom_ubwc_cfg_data ubwc_0_0_hbb15 = {
+	/* no UBWC */
+	.highest_bank_bit = 15,
 };
 
-static const struct qcom_ubwc_cfg_data msm8937_data = {
+static const struct qcom_ubwc_cfg_data ubwc_1_0_hbb14 = {
 	.ubwc_enc_version = UBWC_1_0,
 	.highest_bank_bit = 14,
 };
 
-static const struct qcom_ubwc_cfg_data msm8998_data = {
+static const struct qcom_ubwc_cfg_data ubwc_1_0_hbb15 = {
 	.ubwc_enc_version = UBWC_1_0,
 	.highest_bank_bit = 15,
 };
 
-static const struct qcom_ubwc_cfg_data qcm2290_data = {
-	/* no UBWC */
-	.highest_bank_bit = 15,
-};
-
-static const struct qcom_ubwc_cfg_data sa8775p_data = {
-	.ubwc_enc_version = UBWC_4_0,
-	.flags = UBWC_FLAG_DISABLE_SWIZZLE_LVL2,
-	.highest_bank_bit = 13,
-};
-
-static const struct qcom_ubwc_cfg_data sar2130p_data = {
-	.ubwc_enc_version = UBWC_3_1,
-	.highest_bank_bit = 13,
-};
-
-static const struct qcom_ubwc_cfg_data sc7180_data = {
+static const struct qcom_ubwc_cfg_data ubwc_2_0_hbb14 = {
 	.ubwc_enc_version = UBWC_2_0,
 	.highest_bank_bit = 14,
 };
 
-static const struct qcom_ubwc_cfg_data sc7280_data = {
-	.ubwc_enc_version = UBWC_3_1,
-	.highest_bank_bit = 14,
-};
-
-static const struct qcom_ubwc_cfg_data sc8180x_data = {
-	.ubwc_enc_version = UBWC_3_0,
-	.highest_bank_bit = 16,
-};
-
-static const struct qcom_ubwc_cfg_data sc8280xp_data = {
-	.ubwc_enc_version = UBWC_4_0,
-	.highest_bank_bit = 16,
-};
-
-static const struct qcom_ubwc_cfg_data sdm670_data = {
-	.ubwc_enc_version = UBWC_2_0,
-	.highest_bank_bit = 14,
-};
-
-static const struct qcom_ubwc_cfg_data sdm845_data = {
+static const struct qcom_ubwc_cfg_data ubwc_2_0_hbb15 = {
 	.ubwc_enc_version = UBWC_2_0,
 	.highest_bank_bit = 15,
 };
 
-static const struct qcom_ubwc_cfg_data sm6115_data = {
-	.ubwc_enc_version = UBWC_1_0,
-	.highest_bank_bit = 14,
-};
-
-static const struct qcom_ubwc_cfg_data sm6125_data = {
-	.ubwc_enc_version = UBWC_1_0,
-	.highest_bank_bit = 14,
+static const struct qcom_ubwc_cfg_data ubwc_3_0_hbb15 = {
+	.ubwc_enc_version = UBWC_3_0,
+	.highest_bank_bit = 15,
 };
 
-static const struct qcom_ubwc_cfg_data sm6150_data = {
-	.ubwc_enc_version = UBWC_2_0,
-	.highest_bank_bit = 14,
+static const struct qcom_ubwc_cfg_data ubwc_3_0_hbb16 = {
+	.ubwc_enc_version = UBWC_3_0,
+	.highest_bank_bit = 16,
 };
 
-static const struct qcom_ubwc_cfg_data sm6350_data = {
-	.ubwc_enc_version = UBWC_2_0,
-	.highest_bank_bit = 14,
+static const struct qcom_ubwc_cfg_data ubwc_3_1_hbb13 = {
+	.ubwc_enc_version = UBWC_3_1,
+	.highest_bank_bit = 13,
 };
 
-static const struct qcom_ubwc_cfg_data sm7150_data = {
-	.ubwc_enc_version = UBWC_2_0,
+static const struct qcom_ubwc_cfg_data ubwc_3_1_hbb14  = {
+	.ubwc_enc_version = UBWC_3_1,
 	.highest_bank_bit = 14,
 };
 
-static const struct qcom_ubwc_cfg_data sm8150_data = {
-	.ubwc_enc_version = UBWC_3_0,
-	.highest_bank_bit = 15,
-};
-
-static const struct qcom_ubwc_cfg_data sm8250_data = {
+static const struct qcom_ubwc_cfg_data ubwc_4_0_hbb16 = {
 	.ubwc_enc_version = UBWC_4_0,
-	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 };
 
-static const struct qcom_ubwc_cfg_data sm8350_data = {
-	.ubwc_enc_version = UBWC_4_0,
-	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
+static const struct qcom_ubwc_cfg_data ubwc_5_0_hbb16 = {
+	.ubwc_enc_version = UBWC_5_0,
 	.highest_bank_bit = 16,
 };
 
-static const struct qcom_ubwc_cfg_data sm8550_data = {
-	.ubwc_enc_version = UBWC_4_0,
-	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
+static const struct qcom_ubwc_cfg_data ubwc_6_0_hbb16 = {
+	.ubwc_enc_version = UBWC_6_0,
 	.highest_bank_bit = 16,
 };
 
-static const struct qcom_ubwc_cfg_data sm8750_data = {
-	.ubwc_enc_version = UBWC_5_0,
-	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
-	.highest_bank_bit = 16,
+static const struct qcom_ubwc_cfg_data sa8775p_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.flags = UBWC_FLAG_DISABLE_SWIZZLE_LVL2,
+	.highest_bank_bit = 13,
 };
 
 static const struct qcom_ubwc_cfg_data glymur_data = {
@@ -143,59 +94,59 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,apq8016", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8026", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
-	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
-	{ .compatible = "qcom,kaanapali", .data = &kaanapali_data, },
+	{ .compatible = "qcom,apq8096", .data = &ubwc_1_0_hbb15 },
+	{ .compatible = "qcom,kaanapali", .data = &ubwc_6_0_hbb16 },
 	{ .compatible = "qcom,glymur", .data = &glymur_data},
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8917", .data = &no_ubwc_data },
-	{ .compatible = "qcom,msm8937", .data = &msm8937_data },
+	{ .compatible = "qcom,msm8937", .data = &ubwc_1_0_hbb14 },
 	{ .compatible = "qcom,msm8929", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8939", .data = &no_ubwc_data },
-	{ .compatible = "qcom,msm8953", .data = &msm8937_data },
+	{ .compatible = "qcom,msm8953", .data = &ubwc_1_0_hbb14 },
 	{ .compatible = "qcom,msm8956", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8974", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8976", .data = &no_ubwc_data },
-	{ .compatible = "qcom,msm8996", .data = &msm8998_data },
-	{ .compatible = "qcom,msm8998", .data = &msm8998_data },
-	{ .compatible = "qcom,qcm2290", .data = &qcm2290_data, },
-	{ .compatible = "qcom,qcm6490", .data = &sc7280_data, },
-	{ .compatible = "qcom,qcs8300", .data = &sc8280xp_data, },
-	{ .compatible = "qcom,sa8155p", .data = &sm8150_data, },
-	{ .compatible = "qcom,sa8540p", .data = &sc8280xp_data, },
+	{ .compatible = "qcom,msm8996", .data = &ubwc_1_0_hbb15 },
+	{ .compatible = "qcom,msm8998", .data = &ubwc_1_0_hbb15 },
+	{ .compatible = "qcom,qcm2290", .data = &ubwc_0_0_hbb15, },
+	{ .compatible = "qcom,qcm6490", .data = &ubwc_3_1_hbb14, },
+	{ .compatible = "qcom,qcs8300", .data = &ubwc_4_0_hbb16, },
+	{ .compatible = "qcom,sa8155p", .data = &ubwc_3_0_hbb15, },
+	{ .compatible = "qcom,sa8540p", .data = &ubwc_4_0_hbb16, },
 	{ .compatible = "qcom,sa8775p", .data = &sa8775p_data, },
-	{ .compatible = "qcom,sar2130p", .data = &sar2130p_data },
-	{ .compatible = "qcom,sc7180", .data = &sc7180_data },
-	{ .compatible = "qcom,sc7280", .data = &sc7280_data, },
-	{ .compatible = "qcom,sc8180x", .data = &sc8180x_data, },
-	{ .compatible = "qcom,sc8280xp", .data = &sc8280xp_data, },
-	{ .compatible = "qcom,sda660", .data = &msm8937_data },
-	{ .compatible = "qcom,sdm450", .data = &msm8937_data },
-	{ .compatible = "qcom,sdm630", .data = &msm8937_data },
-	{ .compatible = "qcom,sdm632", .data = &msm8937_data },
-	{ .compatible = "qcom,sdm636", .data = &msm8937_data },
-	{ .compatible = "qcom,sdm660", .data = &msm8937_data },
-	{ .compatible = "qcom,sdm670", .data = &sdm670_data, },
-	{ .compatible = "qcom,sdm845", .data = &sdm845_data, },
-	{ .compatible = "qcom,sm4250", .data = &sm6115_data, },
-	{ .compatible = "qcom,sm6115", .data = &sm6115_data, },
-	{ .compatible = "qcom,sm6125", .data = &sm6125_data, },
-	{ .compatible = "qcom,sm6150", .data = &sm6150_data, },
-	{ .compatible = "qcom,sm6350", .data = &sm6350_data, },
-	{ .compatible = "qcom,sm6375", .data = &sm6350_data, },
-	{ .compatible = "qcom,sm7125", .data = &sc7180_data },
-	{ .compatible = "qcom,sm7150", .data = &sm7150_data, },
-	{ .compatible = "qcom,sm7225", .data = &sm6350_data, },
-	{ .compatible = "qcom,sm7325", .data = &sc7280_data, },
-	{ .compatible = "qcom,sm8150", .data = &sm8150_data, },
-	{ .compatible = "qcom,sm8250", .data = &sm8250_data, },
-	{ .compatible = "qcom,sm8350", .data = &sm8350_data, },
-	{ .compatible = "qcom,sm8450", .data = &sm8350_data, },
-	{ .compatible = "qcom,sm8550", .data = &sm8550_data, },
-	{ .compatible = "qcom,sm8650", .data = &sm8550_data, },
-	{ .compatible = "qcom,sm8750", .data = &sm8750_data, },
-	{ .compatible = "qcom,x1e80100", .data = &sm8550_data, },
-	{ .compatible = "qcom,x1p42100", .data = &sm8550_data, },
+	{ .compatible = "qcom,sar2130p", .data = &ubwc_3_1_hbb13 },
+	{ .compatible = "qcom,sc7180", .data = &ubwc_2_0_hbb14, },
+	{ .compatible = "qcom,sc7280", .data = &ubwc_3_1_hbb14, },
+	{ .compatible = "qcom,sc8180x", .data = &ubwc_3_0_hbb16, },
+	{ .compatible = "qcom,sc8280xp", .data = &ubwc_4_0_hbb16, },
+	{ .compatible = "qcom,sda660", .data = &ubwc_1_0_hbb14 },
+	{ .compatible = "qcom,sdm450", .data = &ubwc_1_0_hbb14 },
+	{ .compatible = "qcom,sdm630", .data = &ubwc_1_0_hbb14 },
+	{ .compatible = "qcom,sdm632", .data = &ubwc_1_0_hbb14 },
+	{ .compatible = "qcom,sdm636", .data = &ubwc_1_0_hbb14 },
+	{ .compatible = "qcom,sdm660", .data = &ubwc_1_0_hbb14 },
+	{ .compatible = "qcom,sdm670", .data = &ubwc_2_0_hbb14, },
+	{ .compatible = "qcom,sdm845", .data = &ubwc_2_0_hbb15, },
+	{ .compatible = "qcom,sm4250", .data = &ubwc_1_0_hbb14, },
+	{ .compatible = "qcom,sm6115", .data = &ubwc_1_0_hbb14, },
+	{ .compatible = "qcom,sm6125", .data = &ubwc_1_0_hbb14, },
+	{ .compatible = "qcom,sm6150", .data = &ubwc_2_0_hbb14, },
+	{ .compatible = "qcom,sm6350", .data = &ubwc_2_0_hbb14, },
+	{ .compatible = "qcom,sm6375", .data = &ubwc_2_0_hbb14, },
+	{ .compatible = "qcom,sm7125", .data = &ubwc_2_0_hbb14, },
+	{ .compatible = "qcom,sm7150", .data = &ubwc_2_0_hbb14, },
+	{ .compatible = "qcom,sm7225", .data = &ubwc_2_0_hbb14, },
+	{ .compatible = "qcom,sm7325", .data = &ubwc_3_1_hbb14, },
+	{ .compatible = "qcom,sm8150", .data = &ubwc_3_0_hbb15, },
+	{ .compatible = "qcom,sm8250", .data = &ubwc_4_0_hbb16, },
+	{ .compatible = "qcom,sm8350", .data = &ubwc_4_0_hbb16, },
+	{ .compatible = "qcom,sm8450", .data = &ubwc_4_0_hbb16, },
+	{ .compatible = "qcom,sm8550", .data = &ubwc_4_0_hbb16, },
+	{ .compatible = "qcom,sm8650", .data = &ubwc_4_0_hbb16, },
+	{ .compatible = "qcom,sm8750", .data = &ubwc_5_0_hbb16, },
+	{ .compatible = "qcom,x1e80100", .data = &ubwc_4_0_hbb16, },
+	{ .compatible = "qcom,x1p42100", .data = &ubwc_4_0_hbb16, },
 	{ }
 };
 

-- 
2.47.3

