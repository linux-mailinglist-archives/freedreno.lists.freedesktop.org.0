Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4VsrMSUFq2kMZgEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 17:47:33 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6C92255A7
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 17:47:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E7B10EDE9;
	Fri,  6 Mar 2026 16:47:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YT1MJ58+";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZgOOFDOR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4A510EDE8
 for <freedreno@lists.freedesktop.org>; Fri,  6 Mar 2026 16:47:29 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626FrQuj3960172
 for <freedreno@lists.freedesktop.org>; Fri, 6 Mar 2026 16:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2imLQEZ3DP0uNNL0l/EieMjW7GOO6W8UDPQGg+15sw8=; b=YT1MJ58+zS/vxieL
 iQToHMG6NFJ7+kvIo5dasQKgmMzRg//1iAV+FAm+/iMgLQKJ1Uk909c/QKTzH9sN
 JhkDTO1nxVAx23B5XgGqSDvzYQZvzSZGfQ/y312ohYTjtOy654y4ww3zxaDRbhVq
 LQvLJDVeRfSnjT9OY/57cnGjdU+ZCu4tqltF0jLho9PFBzkc756zElueWOLoTmfi
 Rr73VKW5qY3qyiWOBr2CvEPMWAKhVXkb9HqgSa8moUloE589Egwpk7phuCsYomk/
 JxnUF96Of8zvS05q5ePWpVCE/3YsKURQktRR8MyTolcn/vSfZzJThJXzWIoBw2pH
 EO3LXw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9u9ca4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 16:47:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb3ff05c73so4800157185a.0
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 08:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772815648; x=1773420448;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2imLQEZ3DP0uNNL0l/EieMjW7GOO6W8UDPQGg+15sw8=;
 b=ZgOOFDORUG8Go/QYpSIWsYzpyl3G9V9qakCKD/0rhFo113LghTqgOIYuWYL+JOS3qz
 tb8rfc+6QsDaO3Bd6JjVshAzs9Q6BXbZNIiLV0mvvraEqCuIaKaxbcpwdXbaVrjr78Li
 JWJMGZ6+efQYifFfmO83Eu/uTMp/pFp/sqYhFtTPLkMSxb+rLW9Il8oGOmaRu5jEro/w
 +L4uj2kLgFhyqI6Lu/m4xH+/26XbjA+AaUNSwvHCF4TLPtlXKl+Wo61T7h8TPqjGpejI
 MCDqtXc5iSs+OEUZjaZunxCZIUVwos0J719ZfwtoYLdRoCjV6yeUN30NkiaMTMvSVo99
 voCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772815648; x=1773420448;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2imLQEZ3DP0uNNL0l/EieMjW7GOO6W8UDPQGg+15sw8=;
 b=jcbjtumt9CLJ1Wi0BfqJWYFqmJMMaxfKCBmX7YUiU2sHBphrGm97mkR+XLYQGPSw/C
 xUczbnNekNInqoRh4ukjoUqQoRXT85+jCCfcC0hZin+6nCNbdVkCR8711QbAESZc5Nie
 7X/dNZouvRD+4sIPopRYC7VisANKAtc0galXb3ZLG47gMVpkjRynzeW0YrUOpUYidvKi
 bH2SvPLeDOOj04FmAOhBlUurFNJPcSQ7cNMEhfg8R6KVcvhC6t6DgTE7RTdMDrYc7Zo1
 yf4imFxL5INC24trtwMSXb/w5WTrAODXqhTkpvXDZHscIYzH4MqMrroscmynw/ZcUGg2
 laSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/Rscmuq4Ly7E+s3V6bVvawm/2MpCr+DnC0WbUYJUd4RTq20TXxQ2Uj3Vqf+JIxLJjYCpLT7Yk7zA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUD0fyx83UjhiLwrRyWKgSKCUWo3QBjDLGCClb38hq8tOcrQYS
 LIGln6KCq++xPaYQgUolpcv91HFM7sq7U1W1BzssZy0f7Uv7FfeuPHp2+vxpBd+F2jF1/TRGS/r
 9lJQmtRtuDkfpPlYSgGWszfA6FdF9rUUHo3Nz3yWDmp+vwALyMKpmNd4E3fPt+xxnFNtYx7U=
X-Gm-Gg: ATEYQzw1ZT8tXKaTo5i/9V4mxVRaSp/tYi5rba0stvcE6lt2OcKdsLW2mYFZk7up6xK
 ce0IOWTnXsgjlSkxZHJuqhAIA4J2bosvcUDlkpr5KyyhorDjOvUTXiw9XjUs4KCVbA8TY6oqjH7
 gdGYvjq4cbrv8Sj0rIjvHpxDtADcLCoBD8C9Z5KRNW1NsjyFE0Mtfy18g5kcXbIOJKvTMdIMJn6
 4jRilOGm9tm5pQsNevvbcIKMDEzuI6a9FA7gJckcopW/OrHsG/Rt3ORCzWtbGQ1na9d5JjqRlrN
 gjsRrfe34vAB4ZA9JgNUdjjOgB3ITu2SbwAzxKEfeYxbPv3Qp+lqHK1+HJeVoGkNYFbEcM/Wwv7
 x7HCRRYiUX5LNXE+qH22SYFv22RTpORS0A5XjRlKd61xb1ol99TnCvgyqm4cOjXJQrNJ2YbYGje
 1djREvjrziPl04MVwzK7IzsfewN5olJOJ/6WM=
X-Received: by 2002:a05:620a:1a9b:b0:8cb:4c23:3de2 with SMTP id
 af79cd13be357-8cd6d4fc41amr337642985a.76.1772815648320; 
 Fri, 06 Mar 2026 08:47:28 -0800 (PST)
X-Received: by 2002:a05:620a:1a9b:b0:8cb:4c23:3de2 with SMTP id
 af79cd13be357-8cd6d4fc41amr337638085a.76.1772815647750; 
 Fri, 06 Mar 2026 08:47:27 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:47:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:14 +0200
Subject: [PATCH 08/24] drm/msm/adreno: use new helper to set macrotile_mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-8-9cfdff12f2bb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1533;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2pmZHdByL6nsS8Ik/InzKdBxSCO/78Oop/N0tOJ6bIw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUN3jF8qXyArrCcHGzumnoU/rLkRvcjzIeeW
 u3qt/YDcJKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDQAKCRCLPIo+Aiko
 1Y7oB/kBzsVGYGRPO8u6SXF9W5IddIs+b2Kkr6+hZ2mQBAry76g7CM7RK16IvDydZ5Oz0QWS2co
 F4m6FvQpl9umm6E5jdlKnyWijC6NERW46twWfyKw5Za7W14lI/dvgJEtUJzni/tVTfoBAFj79lb
 0/tbqV9/co5GDj9wmVKJXOPOPgezW7ZqPWsAC84yIfifeoXnm2s6MtO1iCIK62ai2Fhbo0oeeke
 rwJz2JaxIe5xch9IztaFL7uo6SXBkoHQcqiDol+v9AThjfxel1nZcoqUos+8nuV3CU1IRRETm1M
 OSy0rXgqC6Kn5y6PfOuSaswu34+aYvBWPDJam3SpRRs8yslg
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX++0sFaTAIHty
 CPzICcQsWvfTZyy7uGVHHSS1Ss++aApvIlqVS7/77f7ytVLgj8QhmfeAvboxcjXm2AmMV+IQJ8W
 /nE287DC8EY90nR4aKDlotvYNQO9KMeWMy97YC3SEKPCnOnnNQ6AxXkOcIHMqbDe65SuGUHG09a
 ZZtrurB/DT66XD/cfE5mOcj8rnsdIdvOpTuYjaHBliq3dpeCZvLA9JBQP+CR+tM30KWIBKrUlFf
 /Hl2a6Wb80t5D+AABxsAVjZy7MTGCZE3b6jAlw4fx9gfynKcriAWEmZ49SRl56B6mgeu+CISyO9
 m7C95l41ji5ViKnLKV9nixl6CBR5ogD8KZapt0AQ3fG3geSj4eyD5Dx3wvv1DNGbFqg4bmDuF7m
 MnsR66W1WfpIdU09KO5MSXtrr8JhRDyTU1sbuuo/5YUWPjsiihZVJNN8GBVGWtax1wyXZIFpZCk
 RKWm7Kwsk9tNQlzokqA==
X-Proofpoint-ORIG-GUID: PmhLWP3MOk8zJydSBci7xLVksONWKSAK
X-Proofpoint-GUID: PmhLWP3MOk8zJydSBci7xLVksONWKSAK
X-Authority-Analysis: v=2.4 cv=eJoeTXp1 c=1 sm=1 tr=0 ts=69ab0521 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=8BxV0iZMnHvn5dZpj2MA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
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
X-Rspamd-Queue-Id: 5E6C92255A7
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

Use freshly defined helper instead of using the raw value from the
database.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2027e479d5b1..56a820ffa613 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -787,7 +787,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 		  min_acc_len_64b << 23 | hbb_lo << 21);
 
 	gpu_write(gpu, REG_A6XX_RBBM_NC_MODE_CNTL,
-		  cfg->macrotile_mode);
+		  qcom_ubwc_macrotile_mode(cfg));
 }
 
 static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index d5fe6f6f0dec..4814233d8dba 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -435,7 +435,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = adreno_gpu->ubwc_config->ubwc_swizzle;
 		return 0;
 	case MSM_PARAM_MACROTILE_MODE:
-		*value = adreno_gpu->ubwc_config->macrotile_mode;
+		*value = qcom_ubwc_macrotile_mode(adreno_gpu->ubwc_config);
 		return 0;
 	case MSM_PARAM_UCHE_TRAP_BASE:
 		*value = adreno_gpu->uche_trap_base;

-- 
2.47.3

