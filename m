Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCdDDiAFq2nDZQEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 17:47:28 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8FB225572
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 17:47:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E23810EDD7;
	Fri,  6 Mar 2026 16:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jQHU/CJH";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BucMKcMK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 484D910EDC0
 for <freedreno@lists.freedesktop.org>; Fri,  6 Mar 2026 16:47:24 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626FrDYw082888
 for <freedreno@lists.freedesktop.org>; Fri, 6 Mar 2026 16:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ylSabl4CClj6t/w9cxf3ZToG54oIITlqCJttWo/AVWg=; b=jQHU/CJHY5MIn6ZY
 aCSa4lqOAqgPrFoHJiZLiatiMeY3RG7EoVpygYZKTT+feeX0KHXAChnzoNtelO48
 zbrLl1vLkjDaJLWiYYdI+RwCOF4DSXOTT5+IHLWeZt9vNxXGMTBu+F4Ou3Lz95rs
 Rt+7KUNev0Rtgr/aFoUFV0RdAbn83m4TfVPZ4NZ/6Y3hZnJzqW3qvZoSoXzzj51j
 geHtdb16JctMLyLShtDDoV2zpu3iQ4x+V4QKUt4uvBmIwa+PDxGtQdkD8b8C+I1I
 ZNLXNe4PS2eiEV/qGU5Iw4SYHnhspL/H+uSIVitmv0mgac5uYpEbnYmPQcsK4ZOZ
 +1IIpg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv98hbyy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 16:47:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb706313beso1228030285a.3
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 08:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772815643; x=1773420443;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ylSabl4CClj6t/w9cxf3ZToG54oIITlqCJttWo/AVWg=;
 b=BucMKcMKOi7kVGdWT47GWMSRPbAPFV3SO1k7YWqJ1WgnFRZO8isBJ/05jE5YCUs5KB
 hw9HRybhbGhny3FXkWgPUKAH/zv+JSnrZ1PVrhHCPMeJ9Hr+Hstk46EmbsayGqRqormw
 IRTONBn35bMYeEu+KwpLIWGO7WuN1+3L3h434jg8HY5x0AMyOzEjDZTGmLK7k41yn86W
 CsBFNZA8jiH/LkOO2zt5sjhSA0pOThgS74y1hP6R62s504rvbK7ZPLtMBtGm9014te1y
 TPum059aTkEAWvg9/lJ6+26ElFnKY7xgSJq/57gah2HmVKEQh+KkAxCTzmH3CU+RwXb7
 M3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772815643; x=1773420443;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ylSabl4CClj6t/w9cxf3ZToG54oIITlqCJttWo/AVWg=;
 b=pSx3s2fbTSrSoARjwUskrUfUbEOX2npFj2DSsdrW3lCsEvT1cCor2Ix+XH5O8cm/Qh
 HlqrhvaGuM7hnBXcjyaaNGNtNHl0t9NGnSf5cmck/sTglHu19mwRJB64TjUd0drJRTL2
 7+C2aTxAP6rPS/PmAHqGaA/+27DRFcTNdx+YqEJyCqsunS39cyAKZ8XL7ElwipVJVnOB
 5jpc54nwc6KIIN7pB40gMpGyliunrmCgOoBnVDLfMkLhMmzVlbafsWmV4aJxHJvdoFDj
 ZfbVytDP2AYYezwcdul7D9B3KErR0LWbhEcOtpPci5lwrwirpUha+qr+kSZCjcYRXpf7
 06HQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWx6dTGxfmL+jRsh1FUT5tD22vfH2Kg1wQJ94Eg1ey6FH4rwSKH5ys/bgLopGdexxdbW/5xrEjdR6E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSN+hrl81ifPW+yXwjEur2eUACwgyTLTZkVcf3z3QVWGLT3cz8
 9JTbufFo1TBOYwHaN3e4EO51j5sP4luAvSU0zBe7NGntGV4MfF7EeY+faplgIl6v9J+xhuW6dml
 21s12j2BTaDiR436QmdGZelg/HdvX7111IuGe/vl9d4saw5lAwtc0swLpGjmRKly4x2PuuZk=
X-Gm-Gg: ATEYQzw5xRmWZHy069RmsVW1ZTK3rNU8HhexfrQPj0mm6QLBF8PQY/HtNswU8/pomiU
 nmJSlF8AMbsCHkvDP6FPnQJwprJR5AGb8LDuCtxNGRykil87eazEBXHqQe3V3+hCj0ZkJE5tQQY
 DPtNKOAvP6hBNCwwCnm7n+Fdn+YnNKW8oUTx3409suDrlLvwBot4TAlT6mv9N3+OAv0Ps0iig6A
 ME4THoDMuaEv9OmvcTf9K3BP6jdZgBDwntXyviySTBW3HzHTaisfSO7aLUJSMTYa/5Y9kgGNeMY
 YRqZvq3lJQX0kLOrr96MuofL/dbvgxELQDOtTrjC9Vif5iqSs0BCYfnVjybSq0z6x4cbNUeBYtA
 kqB6mZUIP1LbiTy0K4ebbpN+i4kkPUFKYrzLpue7IHlW8Cuc4Io9sa56Gx67jwWQE6L83Gj9Cir
 T8gWisemA7++JZLcjfBRCFkybA9zbwCfd3YYk=
X-Received: by 2002:a05:620a:46a6:b0:8cb:4ef2:f3b4 with SMTP id
 af79cd13be357-8cd6d48d6bdmr344384685a.73.1772815642654; 
 Fri, 06 Mar 2026 08:47:22 -0800 (PST)
X-Received: by 2002:a05:620a:46a6:b0:8cb:4ef2:f3b4 with SMTP id
 af79cd13be357-8cd6d48d6bdmr344378085a.73.1772815642060; 
 Fri, 06 Mar 2026 08:47:22 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:47:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:11 +0200
Subject: [PATCH 05/24] drm/msm/adreno: use qcom_ubwc_version_tag() helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-5-9cfdff12f2bb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2867;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=dSBWM2x+kwZjmcQFVewwgxBgzRu48ixGoJYbIjzhJjM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUNAqeJoTbTsD3xfc25tA2JTYbYyry1SyyAB
 JBOvxzy/+KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDQAKCRCLPIo+Aiko
 1Up4CACjWn/4ferCxCSGdGqQBb4i8bAXXaYWwL4r+o7o1tnvLZy9TM5DgjZtTw6j9wSifHZVjJQ
 KpB0lVk3zwj1ON9SsrFJ6HvaP5dKhfhCBShpUBLB//PBv/ho+l3htScn1PPfLY1jjb2nCEjAzE9
 gwhanlPxIrIzvd2h0MxJhZ5dsQK7w0mGxrAY0TrvsiNzOVM76gd2ILAGl2rK2ZwnuYfVKiv4W8g
 BDhBVO5jiqVAkW8UI7PkdFFQUbCSKIo/NQ7HksoTxx1y61/Gba7feWW/PRgFNJqOSxT5ZqnTMwx
 VDurHEwjSuCaWkIwV1eur+Cdc/iv1KbnCIk9j1Y6gAT3JbmA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: HqLaSVimkAzSX17IUi-ogIubSjr4u8JR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX2omdepnS1cHI
 EL5aHSC7Czl/WtwzL+A7k4sK6n2jbzDaVOxQuTfwksRLb8MWuDca4uZ7oGv8jGQCHhaPyspKFlx
 d+DbiTtW5zAoLYY5sVsUrL1mI2cQn+oXpOES/KvzsRvrhK+g7Q765ty7UEaKjv8WEY3GaWOVCke
 tHq5Rq/fKB5/Ks0owcugsBAPGbrm3nR5r241dXi+FfX0fE+cdfrq8pAFCMR2Z1XuoImUOFh93b1
 5H5YMZN4228KxA6qgH8MH04fFySkgjtvESHDAscdAmclADWLgWHfg6vMonfbzJHzLgmTf91RtBl
 l1VQD7zM6s0e5/+Y8+Ib0Qs1DJMBmRKV9w4Oa/9XPlaZKbeN3yAUBupfTYwFJnAuVBUjVgSgoCJ
 yLB4dC6okS2VIEM9rEASpoPNvWAXBdQ3/JxZSE9WJDhef7kNxYIVB+AUI7Q8nvc6X0Y2a1wbZN2
 QCUzeDECRTgqtE7EjOg==
X-Authority-Analysis: v=2.4 cv=LbcxKzfi c=1 sm=1 tr=0 ts=69ab051b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=QjZuzksZpR1x1fsoQ4cA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: HqLaSVimkAzSX17IUi-ogIubSjr4u8JR
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
X-Rspamd-Queue-Id: DB8FB225572
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

Use new helper defined to program UBWC version to the hardware.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c |  8 +++-----
 drivers/gpu/drm/msm/msm_mdss.c        | 16 +---------------
 2 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index b1887e0cf698..6dc1d81fcaeb 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -272,35 +272,33 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 	bool rgb565_predicator = false, amsbc = false;
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	u32 ubwc_version = cfg->ubwc_enc_version;
-	u32 hbb, hbb_hi, hbb_lo, mode = 1;
+	u32 hbb, hbb_hi, hbb_lo, mode;
 	u8 uavflagprd_inv = 2;
 
 	switch (ubwc_version) {
 	case UBWC_6_0:
 		yuvnotcomptofc = true;
-		mode = 5;
 		break;
 	case UBWC_5_0:
 		amsbc = true;
 		rgb565_predicator = true;
-		mode = 4;
 		break;
 	case UBWC_4_0:
 		amsbc = true;
 		rgb565_predicator = true;
 		fp16compoptdis = true;
 		rgba8888_lossless = true;
-		mode = 2;
 		break;
 	case UBWC_3_0:
 		amsbc = true;
-		mode = 1;
 		break;
 	default:
 		dev_err(&gpu->pdev->dev, "Unknown UBWC version: 0x%x\n", ubwc_version);
 		break;
 	}
 
+	mode = qcom_ubwc_version_tag(cfg);
+
 	/*
 	 * We subtract 13 from the highest bank bit (13 is the minimum value
 	 * allowed by hw) and write the lowest two bits of the remaining value
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9f81f43283b9..798a23fbc906 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -204,7 +204,7 @@ static void msm_mdss_setup_ubwc_v6(struct msm_mdss *msm_mdss)
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
-	u32 ver, prediction_mode;
+	u32 prediction_mode;
 
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
@@ -222,20 +222,6 @@ static void msm_mdss_setup_ubwc_v6(struct msm_mdss *msm_mdss)
 	else
 		prediction_mode = 1;
 
-	if (data->ubwc_enc_version >= UBWC_6_0)
-		ver = 5;
-	else if (data->ubwc_enc_version >= UBWC_5_0)
-		ver = 4;
-	else if (data->ubwc_enc_version >= UBWC_4_3)
-		ver = 3;
-	else if (data->ubwc_enc_version >= UBWC_4_0)
-		ver = 2;
-	else if (data->ubwc_enc_version >= UBWC_3_0)
-		ver = 1;
-	else /* UBWC 1.0 and 2.0 */
-		ver = 0;
-
-	writel_relaxed(ver, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
 	writel_relaxed(prediction_mode, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
 }
 

-- 
2.47.3

