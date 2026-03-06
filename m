Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AFLBjEFq2kMZgEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 17:47:45 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA70E225627
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 17:47:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E48D10EDF5;
	Fri,  6 Mar 2026 16:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VUFNn2O0";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y0M8+eBf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC7B10EDF4
 for <freedreno@lists.freedesktop.org>; Fri,  6 Mar 2026 16:47:41 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626Fqum81424174
 for <freedreno@lists.freedesktop.org>; Fri, 6 Mar 2026 16:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ywz55t77MzTGeWA2SI0gC7OmSPpeiWuIVuyHjN4dOpk=; b=VUFNn2O04bSHDmBy
 sUJKq5bTCIXbmEqZV60HspAfaAUBL3M6CHYt6j9f3o6ivfVfdztqMUTsy++FxZdf
 QzSfasNBMTvOmAPkbEPgllvhJ/jcK7Yu5AplEse0GA5S3abang4uZub42jcBHx9D
 74Xr/JIfUsonMbe2R74qhiK00DQBBXmllIo1X0OvPVqLVgm0Xk731ALI5m7cEKKm
 6cG5Xt2BreFFMnumKNPaUvWmaXj4Wk4Q42LUFU7llAttQfJxZpcPZ4/oLtOyVdxq
 3+PFpuUKssO7zOFiVoYEfv3XOXf2TPpia/thGfBmlJhRMWFrlklE96i2P/AqzNiN
 ccQXlA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqrf5t7xv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 16:47:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb3a129cd2so5931989485a.0
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 08:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772815661; x=1773420461;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ywz55t77MzTGeWA2SI0gC7OmSPpeiWuIVuyHjN4dOpk=;
 b=Y0M8+eBfNH4nAzOL2u5djc1+Ci8MN1jV6K8DH+YpsdyvbMhSzOO3wXmS6cZBjgxnWr
 YhTxjWOyhnDIuj0Sl/r4KuvGlqooj2x+h6tn9/VgfkGD7GXFIEkoVV7BXPoxAIVDuUbe
 0Z8rnlvNdeXJr1VLzDKWupExONOy5bdcQCinBG6wcF1dwNfkmw+AcABUMOzNt+TtR7dy
 9xafyAj4CQPxOVbSYHTDML6JSDjZsONwH4wAp5wvQVvGF0vrWknLTUIpbBRAE9Dl9qyv
 H+26dl/3UzQmICq653Tw4K5XMl9D7XX/Kh5HkUTN2F3GMm/BW2s4P8Sq0ULfeyWEZQjM
 WQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772815661; x=1773420461;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Ywz55t77MzTGeWA2SI0gC7OmSPpeiWuIVuyHjN4dOpk=;
 b=JBcPXsS9cSjSkjJwZfROpeMXxpmk68+5Ga6RK0l9zCnmTLJmOvQIjqaa0FQQf2hoIS
 tvVcRLZEmOLbkAdl46oYXqnzRINLvYoy9GniVU11GXJ0oPvvTPscfNlBfq0KH364M8aU
 y2tzdUAp/zFW9IqKG4ttsSIzRagjlR1LD4/gUhwYx3BKnvxtKYLt7iP29LTjt1tu6m4K
 4OzvmNAxN71gGrKu8rV8IQpqkxn6HNKPJBjs38FlYdXtMIeFNZYqRnDOLfPiu3HxispC
 IDmr2oVh7eXGT4qpq0qd4f4uJOdOZdSt90Dn66aDKIqC4B8bftYZ/XN1CDDtGNFgHkiV
 d5uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlWthMyURR61GaVPNAzia12Dm9nqOfcZ5Bjtksxt7I2IYMfiQIA3OrWQHrJqIEczL6P3MxxoSOIWY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVEbt+ySNFVmO/FjKO0JYhBmbCf59aggPa5ZxTPhPdis6ujZQU
 5ucZTCVA1pebKKL8MngPRDMYDzsF5Ym0oa3tm3ttBUstU00jMAdkrFjZceBrHRtcb48BDnvhTwL
 MLNWs73SwzZnRRvU5ACdfTiijtNwnu7p9qG4pVC8PpA195PXzn+wi+i598cSblICZVeygzqA=
X-Gm-Gg: ATEYQzzmYFZSCnHKZJccCLEOshlZpCVP21YS+OpLYgAeXG7B4AUX6ULJroLMElDtslM
 1SGNSgAHSzQPAT7kgQMP0hj6fv7HN+WPc5TrwHz1hbN827/ejH6mud81dTOM0QZ1RM4d3253xos
 sg6wRVN0r37OW+A13dSvqby/A2uUXB8VIgPRD5L3gfdFKQ+pbpjoeddnoXDeRaWpRLCZfbCyHFe
 WRNbYsSxyAf1KyXXskO5Nof6sVuo2Dz8/Dxxg3zILzNkQFZEf0ixfG49iTC42jWinIgdFDpg7GH
 J+KVRbOgYgwEzcSOMPdF+YYlg+1B4pyW9l3nBLrWTli1DsCsHYiGQWqAdM+vN1+fUWNEYZgWSHD
 PxkoTAukv6VoM4/ncBeLtlrRzN621XjK0H7PVbQBdLzU0TktsOFBvEk50tWXnIrZxk6b13OKbXZ
 yff4tD0UWZM+o6K7UZDY++3k+kHUA4EHjR8O0=
X-Received: by 2002:a05:620a:4014:b0:8c7:1181:779f with SMTP id
 af79cd13be357-8cd63505988mr773192885a.35.1772815660652; 
 Fri, 06 Mar 2026 08:47:40 -0800 (PST)
X-Received: by 2002:a05:620a:4014:b0:8c7:1181:779f with SMTP id
 af79cd13be357-8cd63505988mr773189285a.35.1772815660151; 
 Fri, 06 Mar 2026 08:47:40 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:47:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:22 +0200
Subject: [PATCH 16/24] drm/msm/mdss: adapt for UBWC 3.1 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-16-9cfdff12f2bb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=949;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vwRo08OJVutBorS+YUDrF98Dwqb7dE59/dcjOq0vApo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUPwUEnRX71NuA9Gi5WebRwDt6TiTaRrUNAv
 nUWm6hl8LmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDwAKCRCLPIo+Aiko
 1bStB/9BcXAxIUP2RtzC7dV//W9EtFmgN7NbJA5eNFvekMnqAPi6UQnD4/9sXCZrEq9f2vgbELS
 3fxYn5T9j/rTXhtfElX4KaIkOioOpy0IUwGHDgUOraMjrQUOOiyEW447wUgkdnI5y6jY+pc4WlP
 EHUbIIcHHtDTKStyGC+dGOam5DV8tU6iSS6AYtRVSsqAzry5xtrjAZUJMz+jpHeuJSRh8VUvE5S
 hapj1m0OL/RUg96fiRTvhrTcCiOB3LWWK7JQv4DstQw63Q4tbTGpEA59/x7Z029T/tBwObOIs83
 VojDx08SvHL8z82LStmPD6OjDDMCdmCO3W03OE4JUgEJvJSp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: qAD1bhaEHZNu3heqmUjOXQpWy0xhx1xZ
X-Proofpoint-GUID: qAD1bhaEHZNu3heqmUjOXQpWy0xhx1xZ
X-Authority-Analysis: v=2.4 cv=L+oQguT8 c=1 sm=1 tr=0 ts=69ab052d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=ou6ODICaiX18ouMgCewA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX03NSRov6+D67
 eyvvVTy0uoK28/4qrnCgCaj8FjEuidzKq6UnqvwVrbRerRyDGKqDM62jXVqWXA93uDHnW1OdGyX
 Uerp31G+TxDBf9XSnW5Y4oUBKGio4enbvv12T3obbrGNZXt6I8XVIUjq+O67Tj0b1tIAgevFb6U
 NVhON+IRxMR52rw+J6L3PPt79AAYsYrAVg93X9dzC6kNgqkDXFTUR7nOXRwcnPqBfuFldi0EtPY
 WbFG1liwzvcqKPgg8p1nIRTojn4w5jQiNPD+tMUDiS+pKHC8cbcOrcX4ghxfUdWaeRDDB9AmwcR
 nmv88o9/HDQYIvUvrZr0LrK33R07NMrxcdUlQIoUM6Fqxoi2nLj/rLcTPyz0IISU7aH2lNqto0s
 Ag8sNEI3EVFfCQiwsYoPfji6RvFp50F9+8wV5Q8M8HLcebEJwLUC8hkfYPeedZHZzMOSm8cJWDx
 9Wu/WJ8arC5DUbMwZ/g==
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
X-Rspamd-Queue-Id: BA70E225627
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

Extend the driver to handle UBWC 3.1 (in the same way as we handle UBWC
3.0).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2c2cfefe9b9a..a63a3545929d 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -190,7 +190,8 @@ static void msm_mdss_setup_ubwc_v5(struct msm_mdss *msm_mdss)
 	if (qcom_ubwc_macrotile_mode(data))
 		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
-	if (data->ubwc_enc_version == UBWC_3_0)
+	if (data->ubwc_enc_version == UBWC_3_0 ||
+	    data->ubwc_enc_version == UBWC_3_1)
 		value |= MDSS_UBWC_STATIC_UBWC_AMSBC;
 
 	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));

-- 
2.47.3

