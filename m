Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EqDGkzkoWmUwwQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Fri, 27 Feb 2026 19:37:00 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 044A01BC0E9
	for <lists+freedreno@lfdr.de>; Fri, 27 Feb 2026 19:36:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6044310EBE6;
	Fri, 27 Feb 2026 18:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OsV/3gYr";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X03GJg2C";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B07110EBE9
 for <freedreno@lists.freedesktop.org>; Fri, 27 Feb 2026 18:36:57 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61RH0Jl41912525
 for <freedreno@lists.freedesktop.org>; Fri, 27 Feb 2026 18:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4IE3O8RcZ2cyQt1CqaPozoDzewVBG1KDsBmyvR+tfIo=; b=OsV/3gYrV1l14RTJ
 PMq1/L11GC9Cs4GYEIHiIDY2FT0nZth8fvgSwhx9jOnVnCymrK49842cRzjWBns8
 Ml2pATas6s0cbD1+fmMZEEOIa0+bU9ksqv/MPCQFawM5/1RynjJ6R6IWNZgeurNU
 Y9HZdvgwaT4Q62oNdpKOj0DQpFJ5cu3yrTFLmjlHgj9Ry8UYBZUIyT67WBY2127R
 do9Kf8IKSqHyMVPakMEDtRd6g51jmEwU7tgUzGKqtyeJq9mgvAy233MNli60xjqX
 5tZRITz0CS0ajXjI7dsbryBJ474VxVQE/reExep1jhnI6itQP2TW8z6uGkFw4v7H
 6fzmWw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjuur45s6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 27 Feb 2026 18:36:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c70ab7f67fso2682625385a.3
 for <freedreno@lists.freedesktop.org>; Fri, 27 Feb 2026 10:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772217416; x=1772822216;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4IE3O8RcZ2cyQt1CqaPozoDzewVBG1KDsBmyvR+tfIo=;
 b=X03GJg2CsWn6AIxN/SgLljoshFVMuXY3pPIVdtzr+myvvusjh47kHC7rcnMaKTvvEk
 cpVXxIYVFbwG+2Tqn2ceBgK1WxYndvhRonDy44mUgyKDn6O42iZMvoQq/L59Ur3e2hNI
 6xmYJI/GLBze6lBSKP6vA+HM9gIaNszo0kCzJ2vwjQiASus+bfqk784m1NZ2OQ5wjcAt
 RYILSDKtSkn9AXaN3gZafbDIspUcD1a9uDeJspBXNSOEjo8HWX22VW2Rkvf+rvPhXQPr
 GyutEkS9qE+9Y/Wu8TwbS2BkXhy5YUqYNtMKaqJirNw1dAbzLTgLGGVBN7n4a7H/dfS0
 uiBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772217416; x=1772822216;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4IE3O8RcZ2cyQt1CqaPozoDzewVBG1KDsBmyvR+tfIo=;
 b=dY4p0blzoPSI1PSCsr3mh9TriT8hIB5EO7gyTgoq8GbM5159qc+kBNWLCZ4QeAW9wg
 cNR4LXDFuMKzjEttV1GeJKOSg0iklpFlZ4zWKsClAqAtA1Yj1Fwpg68dTG0Kn42zwe83
 BWF0F/6luJh1BhCszuYDGq77nfhWBPF6VF4/CEudbZUVfLIZlKdvSf4n9QymCKA5g9si
 pNqkxg1ylOOZMXvxfQ9nLnSiMOEGB7LdV6XKHrX0OllgLOgXRrBNG7AvifgiQpohhW7d
 xYqusUjrQz6wfiCJXt8EoIOVQJykfOq4XW7xt4PNvK1cRf2mHO+0MQcP3ckU33lX6Yzd
 bBvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWK0ffhEGM1xAJcUBm29n/qTRNP2AaTteNvdxidKqOww/zE5sdMz4CXxxh1N0dBd6tN7zVGAqhKoJE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFLPsAUS6E00o1cAEoTvA7SvHxv9oxfnclAgBDZfXfP1YvY7Is
 HzB0MCh+85vzTlWWyEJZRd18ECb4SgSlB8bQ7HClHMx6IBgKfetnHUyTQ6M5gjjU1miO21AQxYi
 Uikb+ZlhKw7F0AbfeYIgMXrV19QSQAFqoJ8iL6Xj/3hl/nYahBpAd9LIJN/9LBbGYaXUWNgI=
X-Gm-Gg: ATEYQzx634e5h0BvXSp+QVs2tuFBaIYwb09GSl49gAZYnHQUZv0KP9k9D8ydS3hhXIn
 LbIm9oXyeIwUayZEbFHfhv6YIC90Vb7uWpdwLmirLryH8t7DRpJ1Y427YqOnWA7uIFqP3Ug/n7Q
 J4f8VWAqZQ7S3JYhacCD1Zfu+xRFtw0ivCb8feTgpPxtlFZNqj2jacmvq2S+1kOQCcbyYxYzNOp
 XySjStfxkFwxL+IiTGvEtsUqtN9P6Puttkog+sxVlEqUD16KWpjAXye4cUJ1wdyaqE4dCJ3QdAy
 4c8yNbfF/4+xFzXlf7WYhI35lyoLkLo+DiMO6NguL4CZZ/zo07CKuVpYys1njr6PlrPc3sOBkuX
 vB08c3hL2+D5AqkPnqQIaHvpat2XmlqL9Q4iWz7Eh02kn41SGJ/dboqRy5BgTWJxLRwXjqop8Js
 kjN/eaYmOlhWAQgV1jTjw0DxFUTZxg59tlucc=
X-Received: by 2002:a05:620a:171e:b0:8cb:72b2:2a03 with SMTP id
 af79cd13be357-8cbc8dc4137mr459911085a.4.1772217416313; 
 Fri, 27 Feb 2026 10:36:56 -0800 (PST)
X-Received: by 2002:a05:620a:171e:b0:8cb:72b2:2a03 with SMTP id
 af79cd13be357-8cbc8dc4137mr459907685a.4.1772217415832; 
 Fri, 27 Feb 2026 10:36:55 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a115bca0e6sm117082e87.29.2026.02.27.10.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 10:36:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 20:36:42 +0200
Subject: [PATCH 3/7] drm/msm/dpu: replace VBIF-related array with bare pointers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-drop-vbif-nrt-v1-3-2b97d0438182@oss.qualcomm.com>
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
In-Reply-To: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6597;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jtx4caMdNiI5fTAT/34EoDSgo/ae6naKuxWgagrfJEU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpoeQ9jPaVwM4aQnIOKc+/if5zv2gfEuub3Q6A9
 SHtG2AtIlSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaHkPQAKCRCLPIo+Aiko
 1TmdB/4iQUwctUc7kIs57oUEj9FLfoOw4gu6LX8KYAZASl7LqPJGQ2f17dtLJalrY5/20jiXtlS
 oK3svF5J9MJdskMbCk6IblkycJC3gPt4CF3nJS62u2uXBkDUNvS/MG9NtDL5PInb/barPt0D8iL
 /8kLInLsInhKJA93/+m/6CT21NHrpG2HL1ReswAGkwtLgnecuPaEUgrys7ZCaZuA/DCQ37rqVgv
 Vt7VVdapdxVFF/iRPsB0W8gKk2rOCeEIX66pmq57fZGRIDSRdIhtlSYhbs/bZ8oONUQz7u66O96
 iWNDUbx1yNHOS07FJdSAG/8V74/pFZzrgHVQDfdHARw9SwJr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: AW_gM3rlahAmp6WOSku6Jnfk3Hsuvo97
X-Authority-Analysis: v=2.4 cv=PN8COPqC c=1 sm=1 tr=0 ts=69a1e449 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ZDNR4LwpRtkDERcRuL4A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE2NCBTYWx0ZWRfX2A0PQb3Vp6qX
 qsQD08O9J3U+1XlmrEHITB3/9kMXMeVoTkOo6rUabah64Zd4FV8BdYeS0gVbnzSkUjZBBnyeFZx
 aYjfPj5BX4aAY05V3LYOBFGw0o2/g2dYc61x3RRF31ubDWuV30Wr96RzY3QMvgWbiMBC/McScG2
 Ui+4eVVP3MGEl5sJCMQ8K/KS+I5bcM9jtsR5bClyVlnZeZ693R9gk6hkJ34cDnzzTScExLNoni/
 mjcXmYPbNQX1jk8Rt6ZMzJ950HFB3cAoWoJ4VdGCsZ5pULRS12/ruk5cKehI/9tOHEO+JNmNh/I
 w7E92CN7M9AnW6xqZGksJVpJtPKqbvk2M1ylsEn39IvCRw6cQQUrskIY2bf6HBfhIlMXzhjywaN
 Zl/df1DzyK3DUggXOTZyX/rkRJ+NjGToR3qdDNYQ3RMarR+T/z1bzOGCf/nPVw55BQi483LukwG
 WLucsY0iwGAJtnpQkjQ==
X-Proofpoint-ORIG-GUID: AW_gM3rlahAmp6WOSku6Jnfk3Hsuvo97
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270164
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 044A01BC0E9
X-Rspamd-Action: no action

As we no longer have multiple VBIF instances, it doesn't make sense to
keep VBIF data as arrays. Drop the extra wrapping and keep only a single
instance of each of the structures.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 28 +++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c    | 45 ++++++++++-------------------
 4 files changed, 29 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index f3cb827034cc..a169628eb512 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -286,7 +286,6 @@ enum dpu_wd_timer {
 
 enum dpu_vbif {
 	VBIF_RT,
-	VBIF_MAX,
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 5f0960368db3..416dd4c2464d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -886,16 +886,12 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 
 static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 {
-	int i;
-
 	dpu_kms->hw_intr = NULL;
 
 	/* safe to call these more than once during shutdown */
 	_dpu_kms_mmu_destroy(dpu_kms);
 
-	for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
-		dpu_kms->hw_vbif[i] = NULL;
-	}
+	dpu_kms->hw_vbif = NULL;
 
 	dpu_kms_global_obj_fini(dpu_kms);
 
@@ -1220,14 +1216,14 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	struct dpu_hw_vbif *hw;
 	const struct dpu_vbif_cfg *vbif = dpu_kms->catalog->vbif;
 
-	hw = dpu_hw_vbif_init(dev, vbif, dpu_kms->vbif[vbif->id]);
+	hw = dpu_hw_vbif_init(dev, vbif, dpu_kms->vbif);
 	if (IS_ERR(hw)) {
 		rc = PTR_ERR(hw);
 		DPU_ERROR("failed to init vbif: %d\n", rc);
 		goto err_pm_put;
 	}
 
-	dpu_kms->hw_vbif[vbif->id] = hw;
+	dpu_kms->hw_vbif = hw;
 
 	/* TODO: use the same max_freq as in dpu_kms_hw_init */
 	max_core_clk_rate = dpu_kms_get_clk_rate(dpu_kms, "core");
@@ -1343,13 +1339,11 @@ static int dpu_kms_mmap_mdp5(struct dpu_kms *dpu_kms)
 	}
 	DRM_DEBUG("mapped dpu address space @%p\n", dpu_kms->mmio);
 
-	dpu_kms->vbif[VBIF_RT] = msm_ioremap_mdss(mdss_dev,
-						  dpu_kms->pdev,
-						  "vbif_phys");
-	if (IS_ERR(dpu_kms->vbif[VBIF_RT])) {
-		ret = PTR_ERR(dpu_kms->vbif[VBIF_RT]);
+	dpu_kms->vbif = msm_ioremap_mdss(mdss_dev, dpu_kms->pdev, "vbif_phys");
+	if (IS_ERR(dpu_kms->vbif)) {
+		ret = PTR_ERR(dpu_kms->vbif);
 		DPU_ERROR("vbif register memory map failed: %d\n", ret);
-		dpu_kms->vbif[VBIF_RT] = NULL;
+		dpu_kms->vbif = NULL;
 		return ret;
 	}
 
@@ -1370,11 +1364,11 @@ static int dpu_kms_mmap_dpu(struct dpu_kms *dpu_kms)
 	}
 	DRM_DEBUG("mapped dpu address space @%p\n", dpu_kms->mmio);
 
-	dpu_kms->vbif[VBIF_RT] = msm_ioremap(pdev, "vbif");
-	if (IS_ERR(dpu_kms->vbif[VBIF_RT])) {
-		ret = PTR_ERR(dpu_kms->vbif[VBIF_RT]);
+	dpu_kms->vbif = msm_ioremap(pdev, "vbif");
+	if (IS_ERR(dpu_kms->vbif)) {
+		ret = PTR_ERR(dpu_kms->vbif);
 		DPU_ERROR("vbif register memory map failed: %d\n", ret);
-		dpu_kms->vbif[VBIF_RT] = NULL;
+		dpu_kms->vbif = NULL;
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 993cf512f8c5..bb3393bd102e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -63,7 +63,7 @@ struct dpu_kms {
 	const struct qcom_ubwc_cfg_data *mdss;
 
 	/* io/register spaces: */
-	void __iomem *mmio, *vbif[VBIF_MAX];
+	void __iomem *mmio, *vbif;
 
 	struct regulator *vdd;
 	struct regulator *mmagic;
@@ -81,7 +81,7 @@ struct dpu_kms {
 
 	struct dpu_rm rm;
 
-	struct dpu_hw_vbif *hw_vbif[VBIF_MAX];
+	struct dpu_hw_vbif *hw_vbif;
 	struct dpu_hw_mdp *hw_mdp;
 
 	bool has_danger_ctrl;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index 6ebd9627514b..a4c5ca13179b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -11,14 +11,6 @@
 #include "dpu_hw_vbif.h"
 #include "dpu_trace.h"
 
-static struct dpu_hw_vbif *dpu_get_vbif(struct dpu_kms *dpu_kms, enum dpu_vbif vbif_idx)
-{
-	if (vbif_idx < ARRAY_SIZE(dpu_kms->hw_vbif))
-		return dpu_kms->hw_vbif[vbif_idx];
-
-	return NULL;
-}
-
 static const char *dpu_vbif_name(enum dpu_vbif idx)
 {
 	switch (idx) {
@@ -170,7 +162,7 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
 	u32 ot_lim;
 	int ret;
 
-	vbif = dpu_get_vbif(dpu_kms, params->vbif_idx);
+	vbif = dpu_kms->hw_vbif;
 	if (!vbif) {
 		DRM_DEBUG_ATOMIC("invalid arguments vbif %d\n", vbif != NULL);
 		return;
@@ -219,7 +211,7 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 		return;
 	}
 
-	vbif = dpu_get_vbif(dpu_kms, params->vbif_idx);
+	vbif = dpu_kms->hw_vbif;
 
 	if (!vbif || !vbif->cap) {
 		DPU_ERROR("invalid vbif %d\n", params->vbif_idx);
@@ -255,16 +247,14 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 void dpu_vbif_clear_errors(struct dpu_kms *dpu_kms)
 {
 	struct dpu_hw_vbif *vbif;
-	u32 i, pnd, src;
-
-	for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
-		vbif = dpu_kms->hw_vbif[i];
-		if (vbif && vbif->ops.clear_errors) {
-			vbif->ops.clear_errors(vbif, &pnd, &src);
-			if (pnd || src) {
-				DRM_DEBUG_KMS("%s: pnd 0x%X, src 0x%X\n",
-					      dpu_vbif_name(vbif->idx), pnd, src);
-			}
+	u32 pnd, src;
+
+	vbif = dpu_kms->hw_vbif;
+	if (vbif && vbif->ops.clear_errors) {
+		vbif->ops.clear_errors(vbif, &pnd, &src);
+		if (pnd || src) {
+			DRM_DEBUG_KMS("%s: pnd 0x%X, src 0x%X\n",
+				      dpu_vbif_name(vbif->idx), pnd, src);
 		}
 	}
 }
@@ -276,15 +266,12 @@ void dpu_vbif_clear_errors(struct dpu_kms *dpu_kms)
 void dpu_vbif_init_memtypes(struct dpu_kms *dpu_kms)
 {
 	struct dpu_hw_vbif *vbif;
-	int i, j;
-
-	for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
-		vbif = dpu_kms->hw_vbif[i];
-		if (vbif && vbif->cap && vbif->ops.set_mem_type) {
-			for (j = 0; j < vbif->cap->memtype_count; j++)
-				vbif->ops.set_mem_type(
-						vbif, j, vbif->cap->memtype[j]);
-		}
+	int j;
+
+	vbif = dpu_kms->hw_vbif;
+	if (vbif && vbif->cap && vbif->ops.set_mem_type) {
+		for (j = 0; j < vbif->cap->memtype_count; j++)
+			vbif->ops.set_mem_type(vbif, j, vbif->cap->memtype[j]);
 	}
 }
 

-- 
2.47.3

