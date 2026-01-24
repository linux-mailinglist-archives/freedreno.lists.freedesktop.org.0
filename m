Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOHvIV4adGnS2AAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sat, 24 Jan 2026 02:03:26 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB6C7BDAB
	for <lists+freedreno@lfdr.de>; Sat, 24 Jan 2026 02:03:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812E210EC12;
	Sat, 24 Jan 2026 01:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oT3Lvl7H";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SEj2Ey5J";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8093810EC12
 for <freedreno@lists.freedesktop.org>; Sat, 24 Jan 2026 01:03:23 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60NKCrjl3593407
 for <freedreno@lists.freedesktop.org>; Sat, 24 Jan 2026 01:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=8TWxFj23kF3n8FLcjstGhh
 zu97rN3Hd0V4bM6JRXgac=; b=oT3Lvl7Hj1NUiTPoP3BPp9iWYpRibITaEKBxhF
 7FlcS80LgDHw0y6jMVkmX6RMv7Trb3MgnJPfZGUnO1WaDN3zojt80Lir7FJVmOu9
 tjW3kJbR5cmiMa34AbQaxgL22AFjmo5AQwKLrxj9LVUFG8YOgIlw6EQbDGjRbRBk
 C86IAZwRkdz3P6LDmnWhwSghhMZvy5VYGnvqK4KB8Y9UPODQXRnwJgdRAgRAqBzn
 jbSBjjhmi4Zs9k6+qo7coaXgUnyvpqjv4xkBLxC05RFO71nzgQGDm8y6DLM474cF
 htGu4PYdkH6U8Irx0L9DIHOLH4px3Kh2c/LuDrWz15TdaNPA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvftyrhtm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 24 Jan 2026 01:03:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-34c48a76e75so2482428a91.1
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jan 2026 17:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769216601; x=1769821401;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8TWxFj23kF3n8FLcjstGhhzu97rN3Hd0V4bM6JRXgac=;
 b=SEj2Ey5JRZVLbZHdCKgPHsbiU0HPx2uxo7X4L03C1lXL6rXUDfc2WaWATCC1wvLR4O
 sE8EACBZzLMHmEsiqhzElivlqs/S883PXsoLlQIg/uQ5EiqEyOp4jvlffIYHi67Gly5B
 HoLpQbO9aGAm7LRtmY2GN4UT3dOnHAiIMLpWJd/vu6dl1lrsEONb+COytrl231/394sn
 RO923Lx0XU6wCEKrra+nwxqqTnYuWPJosa1GInEj+Tk08YBJvql0zD5gk0eMsAi4LGnE
 O2wCnvUAOFhbcejWkDza9m63/UKjjs37czZ9Xz7pHFzBPU6RtmMbnUaVjPsBrIjD8PW+
 Td9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769216601; x=1769821401;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8TWxFj23kF3n8FLcjstGhhzu97rN3Hd0V4bM6JRXgac=;
 b=R3UdkrmjPz+2k/zsdmSLGhnwNfS80MEsnaBU/dm0BwC2sSrJ7/g/BCIBBKxicFk7La
 9DQosB61BBVsEI+8sQfZwYO7KbSlpdSBcV4hDyfMryUem4wRBLVCOsnO8TaE1MywC1FN
 qA7l9Q1i1fVgWNpd1cLcfAGn08BYYR6FGRw++bw9d1r6I5GKvJ/nNblCFM2PfV1g4HpN
 renqAXzqqv5fgNZIubl/RIAIQgENZosazXw4KVJu3ADbG3bkYJSaF0khbN3+T9ue2Vff
 Htww9veUhS23e2+vmiyUV2FKpULaQRQQaEIohebXPFXedf3O89pvwjyd5uXSsniY1Yq1
 2fdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9uEdRMoOhW7jFhyskchpUYiOHrgYONhibNP2e9xKELrWYLNH/i4ArvLwCcGWdwakWNGpIkzPKDhc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxknMx2as7UQ4BjQw9O2QwqYCxMRpEfpK0h3t6uOuupGhXyN0Z9
 4J76MELuwRmG/5/YrO90VX9gq4Kifvbc+YMoIW2/oIhrPRFrltbDchpbcleUeHNT8DXXIanmHnE
 b5ohHaEBq8EHpmqW1ZqPSJ/UWWyzpYSeSrjvLNpBvjVTJoD4PvPvkTnvvMgPLEhLylrCJcuhvfg
 WpctM=
X-Gm-Gg: AZuq6aKuuSqSwtGa7NgCyOmWmFSMNlN9RW7jMFrNUKFmY1quqjLBCyQxd+Bkx6Nzkix
 SOig2Bx36V3zpEMmUf8S/H70qJPneho6LaeG4wplWB+j0oUzmPyPhtFOnduQVA6AM5CpKcik+Y8
 05S/kGgFRCQsQaHkDNhJy2aazcb/sxz035NiS19y4X6i+fjlKE86tdhEw9gw/6bqJkPVVgBxUlL
 z5Xk9h9rSip/OozKSwn0C1zfGOH/pPg9GpY+2TtK/cVJtxmEakxuTX3UuNyVGUqgPgXhBOTXsAh
 OM7poRVYOpFTEcMLKC4jr9dSdxRidPLEd245lXL4VMPD/NGx56ce2rh+35hFZ3IIlRSMpZLlyWy
 x5tVMhsnnXJCKy1tcYOryyNTbxDRgWt1TCg==
X-Received: by 2002:a17:90b:1802:b0:34c:a35d:de16 with SMTP id
 98e67ed59e1d1-35367013bb2mr3866370a91.11.1769216601398; 
 Fri, 23 Jan 2026 17:03:21 -0800 (PST)
X-Received: by 2002:a17:90b:1802:b0:34c:a35d:de16 with SMTP id
 98e67ed59e1d1-35367013bb2mr3866331a91.11.1769216600907; 
 Fri, 23 Jan 2026 17:03:20 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3536eaaca08sm1601449a91.2.2026.01.23.17.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jan 2026 17:03:20 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 24 Jan 2026 06:32:56 +0530
Subject: [PATCH] drm/msm/adreno: Add GPU to MODULE_DEVICE_TABLE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAD8adGkC/yWMQQrDIBBFryKz7oBKaTFXKVkYnbQDVdvRhEDI3
 SvN5sP78N4OlYSpwqB2EFq5cskdzEVBePn8JOTYGay2N23sFX0UygVTicubsPmpr5tjcKS1M3c
 N3fwIzbz9q4/xZKHv0uPtPGHylTCUlLgNKtWEmbYG43H8AEkp/c2RAAAA
X-Change-ID: 20260124-adreno-module-table-9fdc9e009170
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769216596; l=930;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=WWUyH14juWrJm9w89PD6dxeD5604M1hC0JoByb75cmU=;
 b=D59ESeUE7GzbXhMQw40VelZqZRH5odZu5aPQm4w5JQOGjGupVHzRKCaxqjiBnWSbKc3iXl+uL
 nWDWQqVfxwABwzw/tBYiIiPjAiqCVrFca87bZpPVZwkwMEDHAG3ZdnX
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=KJxXzVFo c=1 sm=1 tr=0 ts=69741a5a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=jyu4jWsmuh8SW6qgMwcA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: sT0mEmyDaYkagYtF7f5udP0o_8cW66LR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDAwNiBTYWx0ZWRfX3cFqUAnhnuu6
 kn/FPb0jPNIhkb6t7mW2AfWehkKpXS94IRSgnr04j67+knPA6fMLk/2CkDFTT8aZDSsjqNERXbi
 eWB23GlIcFj4VqYA4bkZblJ6TpTZ5BxQaRWw2IHAjNgKKYbajwVMkRZs6ZrtovlEBCsdIlHM/K8
 8N3M7fgF5xWqG84IJFTm1xb2gBGM0bcVHlNKZkrSNW5YaZwgRaNTb+MT1iZtX4nr2kkT6WmHIGr
 waAwGzsY9i8iRUgxZwUke2JBwflqqwsvhrOHxJrk4RKnBKZxSSCNnvHpOiYl8d0dFW3T5sE7Uo+
 1S5dYKDsRoUP/FurhpimvqcvimL0p0jCzlrv6TWHiqX0Rrry+2Cq4aesalEEs1frZrAq4NXYb4+
 ifOE7DF1AzoV6F3PDPKccHwlnMz1JgvsvxKkkpgVdvMLyPIy63nr5IghMPMLf8eHYaNmUBp0UgT
 ONhA9xd2EP+RjGkln2Q==
X-Proofpoint-GUID: sT0mEmyDaYkagYtF7f5udP0o_8cW66LR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_04,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 bulkscore=0
 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601240006
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DEB6C7BDAB
X-Rspamd-Action: no action

Since it is possible to independently probe Adreno GPU, add GPU match
table to MODULE_DEVICE_TABLE to allow auto-loading of msm module.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 554d746f115b..4edfe80c5be7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -302,6 +302,7 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "qcom,kgsl-3d0" },
 	{}
 };
+MODULE_DEVICE_TABLE(of, dt_match);
 
 static int adreno_runtime_resume(struct device *dev)
 {

---
base-commit: 50c4a49f7292b33b454ea1a16c4f77d6965405dc
change-id: 20260124-adreno-module-table-9fdc9e009170

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

