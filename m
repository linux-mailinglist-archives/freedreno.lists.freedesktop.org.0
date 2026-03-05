Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OC/FFDRYqWnW5wAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 05 Mar 2026 11:17:24 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E4020F8E3
	for <lists+freedreno@lfdr.de>; Thu, 05 Mar 2026 11:17:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AEF810E237;
	Thu,  5 Mar 2026 10:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bx134pFA";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J1MR5FoV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAAE410E23B
 for <freedreno@lists.freedesktop.org>; Thu,  5 Mar 2026 10:17:21 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 625AFsoJ861854
 for <freedreno@lists.freedesktop.org>; Thu, 5 Mar 2026 10:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5cQdZ+DABz9LopV0AgyKuyhJ924j8aV6F+NmfVtqb8E=; b=bx134pFADRihHxDA
 Gck74i1X5wl+x6EkdgH49k3O9iQe+29n7eyI6F61iBjwa3g76icAdVOTJQOj3R2Z
 VFUQkNt1Tw5a1qXnwU+70sQ/a623WOE7GCbUjf2lN98zRzkKgCXZ/GopXNoLGzB5
 OQ8t/P4jRjJJ8XJ/NDefhFw9tFp+u/v73T530YDGscAENfVqR/x6YxRu3e3wqpYU
 MYKr7SRSZB1Sn/qM4OyErn5uW3Mbiq8d6yvSevA5ZyB59W3FsGytavgis38ywh08
 CAaGXcU8O5aRPJt5M+hIdcU+hRkUjX+YGqavil810y7Ymy+3udB+Yli/9L2zyqUT
 LtoeQw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0wau7a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 05 Mar 2026 10:17:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-506c0231e63so747538821cf.1
 for <freedreno@lists.freedesktop.org>; Thu, 05 Mar 2026 02:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772705840; x=1773310640;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5cQdZ+DABz9LopV0AgyKuyhJ924j8aV6F+NmfVtqb8E=;
 b=J1MR5FoVhBxg8YJgVir1GkQ1afWIXBzLe7Vp5Kdl16WU38DH2W6h7XDCvNHuTiEfWg
 QV3G6kBolt+uAXGYRNyKy++QOp7JMuIj3YZ2sHs3or3XOewZnIbepvn8g9tqub9+zGhs
 jMsLOkXkjTvjnLPdxrVLd3iTDSHJmrXtDl6CVC4FQns/G67nOQnhSQE5hEMoyptOFsRT
 bC08fcgirAr9cYrNfz2IK1KK/H+gs2weftbiOcSpxZ/3PItxPWo9uoGx+Pv8O3/kWF2t
 3xfMgEYn/zeELg9cslVI90fCuOhc50tSCbvD0UTRgieebT0jRqKVv/iM+LIDIg5QVpR5
 fRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772705840; x=1773310640;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5cQdZ+DABz9LopV0AgyKuyhJ924j8aV6F+NmfVtqb8E=;
 b=ikf80WCvTnI5rEURLx5pdCLcmLEnLqJPpelzNWwhNDNOSADcOrg8gBbyYSqxwFmsuG
 dQK8ZU9zhzYEfhdvijn9mXXhz5bbGcuZVt29A4MSomkWHHyBoseLdXO3/6Hl8g6C5VU0
 rn4hwdQvbnyaxfe4ui//Suwf9oV4/amkCBBjW/Co1pDsGUFdazTPppLKJDfh60ZvR3z7
 ut+1Pozup495tb4UQJX/3vBZO9JsUwMbS6r/b+53wOOvEpjs97NWtBSuO+pkGdTj0AmD
 iB982PAdOtuowcApo8tjtCCALxztTmJlXfrmuXDRItllfQ6WvG1fvZexxiXaqr1aKReY
 v74A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6BogvbyEYSriXJv0DIHIwLRMeDR6J6ZwrfvXFzyO5UGugGumIf2UiyaxdG86PP6QBlzau/y06EMg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNtvKffQKA0UVA8V+eCgxUsLzzhw8/rgAoD5/bzhJrSbg8Fq8k
 kL/Bx86/NccbVINYE8/RsF319rNzmqaLTBNZDEnAuKA9J9zelmqBNViu+H10zrF+22761U2ydSS
 ekcqyru9Lq0SQt4GnuEH1DWE0PqfFNsdRAyDVZyXD1+lM5v2BCdAGDZnYJBFCGLtk+ion8Ro=
X-Gm-Gg: ATEYQzyPS70YMTQoIdMAdRU5zkusVnNo9l9RIVN4veDm/D6bLlfEtUbawGtN6hPcGCT
 bJ3PRjjKIDd0WCUncd417izvvm/jPq3+6hJTYc7pfhz9Z1BnmpIQwhd47T7r7/aZDiVetQWqgPw
 AEnALUIgFriEOydKivkzjw8jrj/fu8vdld88X0Hgu/gJh9WxPP3sxEBdCVlrbBkUHfMPbyN4zIO
 4fUm14Wncmqwk4fu/jwkgQtuq6F3hIpni6mrbgWOu8Vc9IheF/PRe30ZE7l0Qt8JQ50bXWYDDDi
 3ygtLjgjS7tIe7gAqRYtAN0aOuMA4tF5O0C4brXOZnuFxsm/+QVC9GQ7D9YNc90fA/BwHUxBs0l
 ZRtJ+RoXoJmPFsnpKjORx8hBa7SlsiqmgnkrCde/YszA+/nahpnnZc6fl9L81H+FmVjJUClA4t8
 OnmaTdwbk=
X-Received: by 2002:ac8:7dd0:0:b0:506:a290:70d6 with SMTP id
 d75a77b69052e-508e67f62a1mr18988181cf.6.1772705840317; 
 Thu, 05 Mar 2026 02:17:20 -0800 (PST)
X-Received: by 2002:ac8:7dd0:0:b0:506:a290:70d6 with SMTP id
 d75a77b69052e-508e67f62a1mr18987971cf.6.1772705839870; 
 Thu, 05 Mar 2026 02:17:19 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-507451cda0asm194096731cf.24.2026.03.05.02.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 02:17:19 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 18:17:06 +0800
Subject: [PATCH v5 1/2] drm/msm/dpu: Update the intf_type of MST interfaces
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-mdss_catalog-v5-1-06678ac39ac7@oss.qualcomm.com>
References: <20260305-mdss_catalog-v5-0-06678ac39ac7@oss.qualcomm.com>
In-Reply-To: <20260305-mdss_catalog-v5-0-06678ac39ac7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mahadevan <quic_mahap@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772705829; l=6579;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=7gkeiNxNKl6gMrOjBVvmFXUTc3giYW+5eNzAKZhEaVs=;
 b=A8H4tWgvmJewMNXWSG04jyIvgQM7r1m6IOYyhw9oxURvmv1BkwCmfPm2SSkPpj/roCAEB9c21
 P9leAg1bb42Bpgzo3bJxNQZle/xESKkGn90+6OBaxOtuO7jZkqpAu5B
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: I3qBAd1e-qmmsQIvfC_byaLSX4Xf_xzi
X-Authority-Analysis: v=2.4 cv=BNK+bVQG c=1 sm=1 tr=0 ts=69a95831 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=4tyZmZgPP5sb52DUGSkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA4MiBTYWx0ZWRfXzH2a2FiXmzn4
 +biqCNF46wX4kbvx82Y3d2W0HjtTS8iagVIGDvdOTcfTdAmi5rSgPnqgENZfEVq9p/Qqmjfw5P/
 qM/0lhddNv0u1vKUW2dWo+CHIiiAGkbWnuwCTwEWabjFCSC+hTm9RBcBporLDrtksFAtRy6jjn2
 lEdDU/KGOf6W/3vOQk8tQAM3We85nSEG3Dz0awmDZVN8ZsczY2+bQj/1wjZaCmN7EbbDTh/u4mx
 Zo/3ulRIsWgxAhgpVKOFJ+LnXNfx/d6C0jAvnKPYicXB6KL6EZHYVJXCh2fJP6DLQVU26OCyo5k
 BxFBlX1mSKnUy3S/fHupeg92gD1MwyydlaPk59rug/Nyez6ZzAem3rULFQPHkwrd/xYH6TROtXp
 IN7s3hxJY30d2PgBEePfGKj6P10Z1dMe3/9WOUksmlxSYCyHNu9KscxnreIRBmfui2nnkWLBcc/
 J8ixZy55cBUZ3m7Q1wQ==
X-Proofpoint-ORIG-GUID: I3qBAd1e-qmmsQIvfC_byaLSX4Xf_xzi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050082
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
X-Rspamd-Queue-Id: D9E4020F8E3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_mahap@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:quic_abhinavk@quicinc.com,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Interface type of MST interfaces is currently INTF_NONE when MST is not
enabled. Update type to INTF_DP since will enable MST in the near future.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h  | 6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 6 +++---
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h
index 13bb43ba67d3..a3b590cca21d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h
@@ -426,7 +426,7 @@ static const struct dpu_intf_cfg glymur_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x400,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
@@ -458,7 +458,7 @@ static const struct dpu_intf_cfg glymur_intf[] = {
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x400,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_2,	/* pair with intf_6 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
@@ -466,7 +466,7 @@ static const struct dpu_intf_cfg glymur_intf[] = {
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x400,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_4 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 9f2bceca1789..89bc5b44f668 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -319,7 +319,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
@@ -351,7 +351,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_2,
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
@@ -359,7 +359,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 0f7b4a224e4c..6b24e9e84dec 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -347,7 +347,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
@@ -363,7 +363,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_6", .id = INTF_6,
 		.base = 0x3A000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
@@ -371,7 +371,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
@@ -379,7 +379,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_4 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 52ff4baa668a..b35ad618ff63 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -335,7 +335,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
@@ -367,7 +367,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_2,	/* pair with intf_6 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
@@ -375,7 +375,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_4 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),

-- 
2.43.0

