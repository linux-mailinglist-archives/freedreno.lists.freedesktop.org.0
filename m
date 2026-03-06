Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBMnOB0Fq2nDZQEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 17:47:25 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95180225554
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 17:47:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC9B410EDCB;
	Fri,  6 Mar 2026 16:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WhYq1c7I";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QkUGTpSB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE08B10ED8E
 for <freedreno@lists.freedesktop.org>; Fri,  6 Mar 2026 16:47:20 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626Fr7oQ586449
 for <freedreno@lists.freedesktop.org>; Fri, 6 Mar 2026 16:47:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZDkaGfNA4m2bbYX9iLbxU16Hm29lTm2hzt5lBB0S9XE=; b=WhYq1c7I0Dya7pX2
 E6+6WcL5nlGWe9dEIuoI2IHOavaQ2MYTPptgpV0Hjar7QJElDNf7BaTuIr+VNJlC
 q2DInbHclD0Ppuj4l4qbb9q2zvWMLybeDdaash278t0Xy+/N1tuPFyWNF42SkCKn
 XcyO5BogP307Vex2NxBzdWPsBvVHTdrRzAktlJUBjyaMcxTo6+L3Mz3wYUZT/3S7
 7bbUCUCBmqcp0jfw8YIJmdSWYltlpvtd2YplnLyWAIRf6hi7XtMYoo+dvHrVM4TP
 23NlatTfK+Wx2rZwHlPSkdemmgyimnOmS7zXOtF6S+Ea6OgaKWLsA9f8hLvKDnB7
 lI77JQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqpxdtjde-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 16:47:20 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-89a0a2afc55so227315596d6.0
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 08:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772815639; x=1773420439;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZDkaGfNA4m2bbYX9iLbxU16Hm29lTm2hzt5lBB0S9XE=;
 b=QkUGTpSBn3Lh0KbIgiV6YOIIur9KeZ/2vhzUbLwGCXfKVhggeMl6yrn+1KWoBJ7VNZ
 NEfjcuqMW4l0/cZLvOE1cl472+GXUvMzrWOn66tYO2W7BU+hSWlFPCnq5/5pvE1HED2k
 6tQvPlUT+Onoq8Eqx0M/rSMq/kyRD6hB1V2T3fSPxTFZZn0fi+P2pUhXQy+9yFTqJlFr
 fpo1EcFa5d6NhoM/1MbFC4sdV8rdNta1+xwmuQA3WLfCO6gqHnq2zQP7L7vASpLpKPjZ
 UU77FB3oZ5ogXyxhTgWfESCZ3GtrKaQ7J5uItrk9p7430hI+2WmpStRZF72dMHUbvgUh
 zMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772815639; x=1773420439;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ZDkaGfNA4m2bbYX9iLbxU16Hm29lTm2hzt5lBB0S9XE=;
 b=fSKuHxEZ3ZwIG3TjOn55gyOw0NJsqOndcXww0WAa7yr7omF6MtdrhXMxPFbl5UR3x2
 Lvvy+VOaUf16LTDy/5iC8q2eCuRJ9g9NM7qGVjeMhfjAUHK7+qwOQv0Xy9yc1WHfvuOj
 /T0RNlru+TD/myHf56cxvpa3AUFs5BXNjt6QrWl5E3B3KyZprTCZpLj2TQwQWRGR2a8p
 uRlp8s9EaSPgMD0n2qxc0koaeeK7d5fCoQfekYjvObglZRunVSM0rxVp7P58Yb5LhNkH
 ASiFfYvxB9aBWr84XW2fQDH6EEgvAkYn3at5yuIxrZrVcHtCXdvWx7LRngvNRs3WlCf3
 ewzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz7FNv8osRl0Wxj6brpFBp8K0FZgQotUOEaEuyF2arTZwTIUe626aBvhi2CBNGXvuODFrv3XgyIRM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPJUArUQsaMB3caTeSWqX7CnEBxcVJryJEvenKkCOz0/VxA2jf
 0kylkAhxFYTWgggC0mbgPome6Gkyhb3oUAF1qqVGVKF1VH0mtDjMSekVUq0bc6du1rV48jHZyeW
 ZHmBcGbYcDzRm6aE6+JwwH5QfO1yEtcDGzZjxmOxnnWsT2m0z26Jey4JSxOkE2RYgB0ngHnk=
X-Gm-Gg: ATEYQzxUZ0XGBP4jHfoijQjODEy7G2Se31CFiMu6Cv8rj84Rtw8w/AgMpplufcG7NPS
 yKCSK+x+T2Fy+Z24kfubHRl6Onuy1xrZiwI+izix9PgXTPGP2sCkclVkxO7BtFFlBxJokHNYMgy
 YJHG5W/doGCxoL5tl1Vj/SlUgwxiSXIiEPXxPzUE2FN6DxmKtPasKCBHYw3BJP5YcMOLQAo79PA
 8lVlgKew5IEfa0qgtrVBGYnYSZrkluQQuY6tGnLxeLMg8L+oUXmTmMXCJE48/pjg5Vz+N+NrK6B
 CK/4vH5b4eft1C/81PbpRjwFU8z6TSt349e/9OkDtJNB0YMILNHbp8w1dgwvD9ovtp8txBjUxBg
 1fiFal8dNvfq8rz6uvR0DExLJyY8ZszH6PG27TAK6fsHns0uj0ubVO/TWXxTmBe158AIpA4GvDA
 yp8AOt9oDI28SlPmu4CVtacw/bQJUSTtrEw3U=
X-Received: by 2002:a05:620a:4006:b0:8cb:b22c:90f8 with SMTP id
 af79cd13be357-8cd6d4d6990mr360808285a.49.1772815639189; 
 Fri, 06 Mar 2026 08:47:19 -0800 (PST)
X-Received: by 2002:a05:620a:4006:b0:8cb:b22c:90f8 with SMTP id
 af79cd13be357-8cd6d4d6990mr360802085a.49.1772815638621; 
 Fri, 06 Mar 2026 08:47:18 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:47:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:09 +0200
Subject: [PATCH 03/24] soc: qcom: ubwc: define helper for MDSS and Adreno
 drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-3-9cfdff12f2bb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=u+vxmRBv/m3rH6HnQZVzi2jrY6vhcP5vRXG7as7GjtU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUM7N4X6eR3LGLFRjazm2xRzYWjDGnOlOJ8L
 ccvyHvadEuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDAAKCRCLPIo+Aiko
 1Ue5B/4zIgy9Zf4+P1P63mxB7QHWRPliFAHhRZIEXrCrmgJjieALVXacknOmbc/IiOYz0eMz3/f
 9EUgBlhlExw/5HFBhvwLN+/5SuD/TJL0LKkOB2o8b8cIqoIMOuw3BhEw3D88KqB7F9e/CXtZe30
 bh/rKVOMnVqAXvb/jn2GMiaS4AtPKAj1biGmGV6fJPNlUEp3oWaRYG5CBrDXPvWnTfvinG5aSWv
 1qkyoETRISyrvbroMgwWUuZMJKvPo0CPODkEZsHL1MycB9u5fvWIqgwqFnu4XBOV2Pvv9yKGnlq
 6NFNGk7NIwtk+jSdVRv3kunq1dxVGgnIm7c472Stbw/fjKsb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: z3sGtRjD8FlCpusr-bfBYHafxj8ika2x
X-Authority-Analysis: v=2.4 cv=E83AZKdl c=1 sm=1 tr=0 ts=69ab0518 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=UzRrU4X3WlmsSrSSq8kA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX/O0/M8bMDUVM
 zymafw2UoBxVLMZlU3XppmgC9h9juWExRMVBanvw1R2QW//YnG/9J+UKjz250jqnE5gj5W/UPpa
 AGHwWpwNRyCRo6+yApbgATt8Ao52NLkWNfRVFoe5ey25gp5poAbZA2mbdADkq3fdtxxGgWqCUs2
 /dUZ/hNKP7meihvnd6iwcEA2YYTUWJBkP32NqsYZ9Garuf4lFQksfvb7xXCdyceUEp+aniN4j6V
 3Lx/EhB1E66em0Cbf12Na4cEJ6SoRs3SIuXK73obsZN6WBFljITWEuQBuahcnXkQIcqpyQ4/gOw
 iN6U+Usy0pMm/f2n+wZ9ma6Yw8PgLTpgW5lvM314jXLL8n2s0eTgKpdh5FwpKwROLppQMHf1wAk
 uyjpGLNIzt2pvP5edz8ZQkTfiAFkOfLAYENxoIHiyWfzAqCF5qWuHCYdNAkUSxjHaTLUoTSWeSx
 kJur1py5zcjoYjxP5YQ==
X-Proofpoint-GUID: z3sGtRjD8FlCpusr-bfBYHafxj8ika2x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 spamscore=0
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
X-Rspamd-Queue-Id: 95180225554
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
	NEURAL_HAM(-0.00)[-0.985];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

Define special helper returning version setting for MDSS and A8xx
drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 319caed88775..8355ffe40f88 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -100,4 +100,20 @@ static inline u32 qcom_ubwc_swizzle(const struct qcom_ubwc_cfg_data *cfg)
 	return cfg->ubwc_swizzle;
 }
 
+static inline u32 qcom_ubwc_version_tag(const struct qcom_ubwc_cfg_data *cfg)
+{
+	if (cfg->ubwc_enc_version >= UBWC_6_0)
+		return 5;
+	if (cfg->ubwc_enc_version >= UBWC_5_0)
+		return 4;
+	if (cfg->ubwc_enc_version >= UBWC_4_3)
+		return 3;
+	if (cfg->ubwc_enc_version >= UBWC_4_0)
+		return 2;
+	if (cfg->ubwc_enc_version >= UBWC_3_0)
+		return 1;
+
+	return 0;
+}
+
 #endif /* __QCOM_UBWC_H__ */

-- 
2.47.3

