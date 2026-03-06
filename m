Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4C8xHiwFq2kMZgEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 17:47:40 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BFF2255F1
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 17:47:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F3A10EDF1;
	Fri,  6 Mar 2026 16:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cW81b1BY";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WOXiGwon";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15B710EDEF
 for <freedreno@lists.freedesktop.org>; Fri,  6 Mar 2026 16:47:35 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626FquMU549900
 for <freedreno@lists.freedesktop.org>; Fri, 6 Mar 2026 16:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jqyKT4W/cNuaTzUqSFqRUV1yQx0wbYgJqqv8//555T4=; b=cW81b1BYiUy2ELXh
 BzCE03Hei4NK6Qkx+HQeA9DKgLOTIUxtVkBxK7kZfJta+IAfpVXG8JGltlc2wtrr
 LRdLoM0Xqq5Xl+89uqD3tOQuB1usfHWpVkfb6Npam0mkeJhkD2mJRmvoQab5jn0X
 VHlf0mYp62MCWcynvhLtQ/iYv8AHaeaaYBDBzIXWhvxS/DMj6YTtvCA4HsGuy8VH
 9ENQIckaf1N5O0169V+6olSGSlT0DiJOIYLmwjqGmlSk4PvJWh7YgAj+jQ3ioQX0
 XYeBkrhQ69FNtay535XQNpTqOU+gLBHwt8DnhEa02eRkZAb79/7mRzyfTzdT50MQ
 GD0GSQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqruka68d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 16:47:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb4d191ef1so1258667785a.0
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 08:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772815653; x=1773420453;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jqyKT4W/cNuaTzUqSFqRUV1yQx0wbYgJqqv8//555T4=;
 b=WOXiGwonuQA2gaOT4r4lTnZ8WSCz1Ou7Y5W7Z58/7KxentZ5bVyQkd8+ZS2eHvYDHn
 KqexIVsOyLi4rMu9Fdb7hb6Ob0Iju+aC4JsGMukUQS8UPI75lcmZ2++YbttUKGj2FBQ5
 2AiGYpS0h9DFvx5HZCDKCAto7M6bGId1DAtrp9aLi54Bwj0VyfXDeR9GoCi2qyeDnVWu
 /Ff4tYI90V4Pr/hwKZITn8VzJILQyuwtxs66qY+VEVibXIgJxCWQvlLCgYBbaRHH34lh
 itV5DKsqCmh7mB4DGP9DGF6tAa8RJKjjZzba/dOKPhpUE6RD50H9NqRp17wGZ9NoiImS
 v4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772815653; x=1773420453;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jqyKT4W/cNuaTzUqSFqRUV1yQx0wbYgJqqv8//555T4=;
 b=fqIwWjWjGNTgVXvHrn+s1DF/vZ34buy2Ot+3S8/0SQK9plbjpTj54FtwuCsqyrH4YV
 eITO/fbVsOcA48B2OKGpm+rP0o5l0ytQxu/8FQf8JQfhyKeP0kLum2j3cAVSGiRNV2Uh
 890rrHK4ANdeqEy0QXZmk6vm7hNXB+M09JOpJEYTjU+LiiwDusK5o8YsWW9K0D0JFGzV
 JG5C+ZW1480EvHfbznfLbhzgo423SnlS1lD1l2k/mL0pGH1egOKkxocH69bkz91wn12l
 f1MwdSe1bjelLl+8MvZ3kOembW/gYU85qwnQapCDUJTkHfEZQKXNKyRbC7wRVlOVYpAa
 YLzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMNWLJbwmdFcSIacnE86X3BZ4lp/1p+REiQx0S+ZVlGgdlp4mPib+UnjG7gvN0zSNur5l1BjKO8nA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSVxezePaEFkPhp7BwZas+5q3rcrKDoYMZI6vseCVEKQLAQYy9
 GGHxDccZ1/MQy+5BqM/bVD6ceiwdIk49VSthUbHJJasOCR51+DsBXwAACX2mqv/P2rKmf1wgXUo
 Opw7cL754U478WOKgL9LI5+KToWZ/+q+gbdMb97ikvCagVUYZMelq4nsusMKmYJaQdCbXgoo=
X-Gm-Gg: ATEYQzxy8Ewv9kRgyqqz31x8fUwQAqHWUKgT5OaKEpG7rfqbE4qfxFnjUSOvlcCsZ6V
 GXO05lKE0cbmFanmOrKM+/tKmI0++5KChTplN6CUh6h3Nym1z9OFanNWqYHYPDjnGbWEfSJlRhY
 l4GJgemgOCH2KK8FMI3FDtqytbtod9FxFQmQef3ve/pmyK2ANzMuu1n836GVV/gtdmWfoImaWvM
 e+q56IRC1RTzzNrvfN/XeHK3c7PXLt0hNL756pJX2UCxPTgqAQLihIqpjcUFbwXAbIsh99pA8ZR
 M5qz5AS2+gWNboMBU3IGFm4oRwngTw1nL4WdoppGHRNCprvPx3Kg9BEdnCv+2mClhtcN4XlPaR1
 VFQxmyZytjoj30i4zIGwfIyEITD0TQt3JudAJ3lc3GX2lu7fASfJ2SUH4HUSZVnUHR2upMTYDR+
 z90L0vn4Hjgz3UeiSCi5xinhbvxN7l496yfss=
X-Received: by 2002:a05:620a:4607:b0:8b1:1585:225d with SMTP id
 af79cd13be357-8cd6d4a6d76mr316671985a.82.1772815653063; 
 Fri, 06 Mar 2026 08:47:33 -0800 (PST)
X-Received: by 2002:a05:620a:4607:b0:8b1:1585:225d with SMTP id
 af79cd13be357-8cd6d4a6d76mr316667885a.82.1772815652532; 
 Fri, 06 Mar 2026 08:47:32 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:47:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:17 +0200
Subject: [PATCH 11/24] drm/msm/adreno: use new helper to set ubwc_swizzle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-11-9cfdff12f2bb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2707;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Dp+N+Bk8UMYAX+OsWFRzXnJ6xbH9DAMBa3dOlN5rF0s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUO+cW8IttvRxZ7kZaN6gVeCBanRcrfHvEmx
 kmoALrut5GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDgAKCRCLPIo+Aiko
 1YJ4B/9qW5rJ1SwBReASY5/KyLYyVFXtnjWwxBXVf4i7cC5e28xYc9gm8NT7GoRPB20/E0y2ou6
 0GNyzRYWdMTmAECPm6+7kmuGlYLCc5pGOZCdyhIFOKESeIfanckIhENp8b+6Tq/yZivgUKeVs40
 XTV7DyLtlZ7TRwDGcnSwwwtQtF1hBVIF6+mxyJdVnpor3bs6u7FY949gj6rzXaKozsCRfcbaPWf
 n6uccbmnA3zHYVmh0W/CDobRy2tS7xp8HGf4NdA4ewB8t7dM6q/tkP3cSuqulcoU5fSRIszdYaJ
 HctLR77k44CBc/zt3DPSj6H+8Oz22e73q0GvlOKyDpLXo1WK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX08y3qmKpyALH
 ugJFUtAvUKpeVA1s9yvriY3w90/SlKLy0Ybu4GYbFdl8Sf1lTotVtUFxhAEQMW/XBDS8d2HLshp
 ea6zaN7J5PKJvSTJ98WvZA/hyrb6AWgWWkDoZ7PqtlAShBQRV/NlKMH+2JxvQPH1wrT2oJGvJmN
 CbSN5H/J29H0gcBxgDkJQuKS2859Nm09TPUbFVq5ZrspGAfPaSyR1IYMpxH83nylrDv7tYEEUsi
 KWEvDHXqFU1cIlQwWiLFOJaHek/QWJd0y56hOMunOPQwewI05P+UuXbySttRdkraocE5r7qvt7U
 IhxSn6DStSOhlP835pEwPRLpsqTGdHvc6sJyGqSZTNF7gpj6iBNakwTS2YiQzEZIlV8IhmgAaLa
 1Os0aqW/NEbbdomIIrBPg8ZngaGKqbOAUaDtLH1irQl6GO+aVmT5RSACzckZhbVnx00eYx++LAw
 BbgGd72g8PAdAYt0IrQ==
X-Proofpoint-ORIG-GUID: k2pEU6sXMFV0wrNIlm3KR6gDhUX5MJx5
X-Authority-Analysis: v=2.4 cv=DvZbOW/+ c=1 sm=1 tr=0 ts=69ab0526 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=0JjmiBfSQHijSEXDZO0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: k2pEU6sXMFV0wrNIlm3KR6gDhUX5MJx5
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
X-Rspamd-Queue-Id: 27BFF2255F1
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
	NEURAL_HAM(-0.00)[-0.984];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Use freshly defined helper instead of using the raw value from the
database.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 2 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c   | 4 ++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 56a820ffa613..7be31de3b525 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -741,7 +741,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	BUG_ON(cfg->highest_bank_bit < 13);
 	u32 hbb = cfg->highest_bank_bit - 13;
 	bool rgb565_predicator = cfg->ubwc_enc_version >= UBWC_4_0;
-	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
+	u32 level2_swizzling_dis = !(qcom_ubwc_swizzle(cfg) & UBWC_SWIZZLE_ENABLE_LVL2);
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
 	bool min_acc_len_64b;
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 6dc1d81fcaeb..680f0b1803a1 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -265,8 +265,8 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	const struct qcom_ubwc_cfg_data *cfg = adreno_gpu->ubwc_config;
-	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
-	u32 level3_swizzling_dis = !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL3);
+	u32 level2_swizzling_dis = !(qcom_ubwc_swizzle(cfg) & UBWC_SWIZZLE_ENABLE_LVL2);
+	u32 level3_swizzling_dis = !(qcom_ubwc_swizzle(cfg) & UBWC_SWIZZLE_ENABLE_LVL3);
 	bool rgba8888_lossless = false, fp16compoptdis = false;
 	bool yuvnotcomptofc = false, min_acc_len_64b = false;
 	bool rgb565_predicator = false, amsbc = false;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 4814233d8dba..cc21b41cae26 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -432,7 +432,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = adreno_gpu->has_ray_tracing;
 		return 0;
 	case MSM_PARAM_UBWC_SWIZZLE:
-		*value = adreno_gpu->ubwc_config->ubwc_swizzle;
+		*value = qcom_ubwc_swizzle(adreno_gpu->ubwc_config);
 		return 0;
 	case MSM_PARAM_MACROTILE_MODE:
 		*value = qcom_ubwc_macrotile_mode(adreno_gpu->ubwc_config);

-- 
2.47.3

