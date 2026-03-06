Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKOnNiIFq2nDZQEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 17:47:30 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81435225596
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 17:47:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4125110EDE7;
	Fri,  6 Mar 2026 16:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UgXDXmIx";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cDHeIM6p";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F97910EDE1
 for <freedreno@lists.freedesktop.org>; Fri,  6 Mar 2026 16:47:28 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626FrYcG080470
 for <freedreno@lists.freedesktop.org>; Fri, 6 Mar 2026 16:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tJzrziKqS66K8BTFV7yRFO0U3JoxSa5Zc+pCmKaMPzQ=; b=UgXDXmIxS0HdjyD7
 y+NlaWZQ1s3gc+g591ESMTwKb598rpvC2HRitDqRmzUydFY2/29N8BXtxITMPGep
 2I+CclEvBA8c9SNd9Si4LiN/VlKFoEbqwx6tesc+pZOsWxszr/VSaHKDtzcF9z4J
 RtCLM8LK2HjQJGFJbHFIJOtgAWYtKUjkZMjyhuHzksEqApBdifKSJwqY+nj5KcXj
 osSoRTlShdlZzAbhUpl7crxZk0XWDpRD+dLYFtpC0awcCuVsajZ8kntv8YPIg/3c
 WGtew1duxsckLmJq1xw55Hw0CkW6OYmwLCIWo1GdQqfhFytEYotfQqOkwTAzpM8S
 LhGIOA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqgp43k6r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 16:47:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb4b8e9112so848590985a.2
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 08:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772815647; x=1773420447;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tJzrziKqS66K8BTFV7yRFO0U3JoxSa5Zc+pCmKaMPzQ=;
 b=cDHeIM6pUwSmTrZsiRObneZ+P+stZ3V23EhjvJa8yvkgZB4J2OPzhcoIPipWbxi/Hu
 nLlvUCCdGAOzDCEiWa0Vm1KLHpUkwZD1r26Iv9fTEaBg3CFYKDYLCU7bw5UklMA0eISL
 BZbxmVjT5OBgS8CQt23mBjVs7wU+8yJfXjF01NFW9v9+5ZSXJ50FagFdGQHxlKdabfX7
 bhGNGkfreRyLBa93X31KCx+cIo9bDfThj699/D9+02rtGOK5OA1ERaBZ5IUIbckd/Dkg
 xPX4np0ez+6PMvsn0Wr6ngiDwAZYm6VW8h4uPrIP8YLKOm0lKwlHwKIOSaHAWGBHSgZz
 s+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772815647; x=1773420447;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tJzrziKqS66K8BTFV7yRFO0U3JoxSa5Zc+pCmKaMPzQ=;
 b=muGBA9TO48q+D0lwGzMXty9WyDF3Umni60xvVCVpCnnJTIwWUiCHFwSOJHg/gMMIyj
 XBN9y+qGnOIl0DtDUP+B85deLIgWMIOkgzvWlc5rmwECQFogkZNw7+X8rPlkRrB/zIV6
 3lkhueS+TpyB1zFqXr2X4t3mQ6cAi8XSA6o+9aiyqiTTpVBJcl1LcN5G0QfK4gd7yyW8
 kFkMv/LSPbXg8wufBD34txzlSetVpiaJldZu3O7ms957oEPygjobLfGPIgl/hiCK4qBP
 pAQvDU+UQKi4upaH+4n8BXIn7ra/QB/vzGttCezyAnVPtZZS0R/HT/gIyp+6R7lDcQQC
 us4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAFu7gM7p4URd+t2DTnyVZjULO7bW7We0eLyyuAujBBZOoIHS9hXg2haz4UxEST2+Jm4PVb99aCkE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyW7QX2t/Z2i0IQmPAZBoEVJK9eOZPyP9/sk0am0+ot2MuChjlg
 Fsi2HLjk7SfaG5qJSMBpm9tum6NAUSxW8ECtgZMuYgEZPePs4Pu1ySEb3+t+BmG0IqXJUlEXxnT
 KXJcqfhlg/ErpOZLdoKgeN/FcXGmmVWk2rgorhjW6jK43NQyLY0L0IJunxx9jM9/Ri26IQdg=
X-Gm-Gg: ATEYQzy7KP4cEZI//8oB9HVf46G104EXkaITU7I5Ko5iDIfB4sGY+M22gF8PYLjh/ob
 tLoA2e8Zt561c3sD9+2W0W9zOfaLxAA52EszpFDn2lI+K1cwWI+L89YcM8LwEE9Pu7rtocVCwhX
 4V9Yfp24UVb7T589XUAOmsh65NG5Hms4fT3BjsjduXVCD0gWCU2/vETOxwscAxdBt9mvszbgVnn
 MK9e09dpx+tLEo94aG3VCGnGsfgpHhUenaeCNDpksEtmmU6xqzcwAEM/P5Fvs9/J3cpnZSi0Ohe
 sG2+9LhYJ8xdPrN/JvV0Nlmr2rJ6uzzHFipkKXn/ZiYEREF6uP+4xIk5zZzWXhSpzleQqKyEC3u
 1O628s98WkWARzQnNoGkc6KUjBY/g49fxPHO07gY4v6ARgJMP6lHMwty7xItu2Zqc6km2ObdqRG
 DnozmTOUeabltOuybZLhrzFJ+bS2fbnPowFs0=
X-Received: by 2002:a05:620a:2806:b0:8c7:9e6:3a72 with SMTP id
 af79cd13be357-8cd6d31f36emr346105485a.6.1772815646774; 
 Fri, 06 Mar 2026 08:47:26 -0800 (PST)
X-Received: by 2002:a05:620a:2806:b0:8c7:9e6:3a72 with SMTP id
 af79cd13be357-8cd6d31f36emr346101485a.6.1772815646235; 
 Fri, 06 Mar 2026 08:47:26 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:47:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:13 +0200
Subject: [PATCH 07/24] drm/msm/mdss: use new helper to set min_acc length
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-7-9cfdff12f2bb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1420;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jfhtlunzk9GwTp//Me1L6mf+GhU7QSZw7jcsDFdN4VI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUNlQJZkBObTPhQ9Zlm0bWm4Fh06JPeRJhSf
 /dUM7IqdyOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDQAKCRCLPIo+Aiko
 1dqPB/43amVQBWWwwVe5xbDNn6w9ZozH9OsgFmzp4BgoeO0swcs8jgDuNpU2qDRl++Iw17k7dB3
 PwRY0MLxk0C1p9uCnJgLUUHvOkVR5r04JLSOa8wVEhdtJ2TaX1ildgcrGv+gPHajDVq9pV4sgOK
 WlV1TjETXKWGnM1usLnGCVQey/xVtSn84DcYEaGi2sTnuBIuEzfu9p0/+7F0gZT+d1x9wKwy1QY
 DA7NNKqdL+Xglw+F0ZMuHcmhsHSJXnz+nVckTbbDpSNLwTdP1F7Aa/tIeiPdogDGArGGqAkvNhI
 nvXBFUiFTevcuEKfPkRDVLPU68kuiGJQgrEN621haTpd3THw
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: HPC37wDxdLYyb9IMy9GFjfT01LRemqde
X-Authority-Analysis: v=2.4 cv=LegxKzfi c=1 sm=1 tr=0 ts=69ab051f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=X-e67srwgh_QgMMAbO4A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX8ojbP7EaSukf
 hIWVe4fjkUFAYit2K0T8B9D/3ukS8dSSO22+r4XezHD62ngisZ4I9/U+HU+KEsZvqGDl8jFR7MD
 TpmOW4TX+PjO4mSuiiAw2Z5ikFe7B3r17b7frstRz6CxytBaPplP/puUUBS9vEY39hwouBzRiX4
 16+9bqRYDUpv9AEl6W1+gm9BApyleENcZRRRkDmfIjg6QIjI3BeJVL99KjQTH+ZtwFn+3g3Wdpj
 5uYXpzQUUbGbaF0kURP4kZ/tOdK9PLHD/j6V+Lm4R/FIVy8DS1y/dFgEQ+c2+HFPmYhQO7UpNbW
 cvXjx8GNJfxXa0uO6wnDK3hiSa2FojPMuLOFDok+c5FlVG1fjMp9I90Vwf/uhOB6NwuT6vNu+g2
 6CdAcDZbronWZls4C1Xc7VwxpROeu/s1etnH0ALnIIoD9sNEXdxGb5QSoXY1l6I+KFpl2L0o2GF
 Ew2kB2Yh7Q+4pZ9z9ZA==
X-Proofpoint-GUID: HPC37wDxdLYyb9IMy9GFjfT01LRemqde
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
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
X-Rspamd-Queue-Id: 81435225596
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

Use freshly defined helper instead of hardcoding the checks in the
driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 798a23fbc906..16bc9589f696 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -172,8 +172,7 @@ static void msm_mdss_setup_ubwc_v4(struct msm_mdss *msm_mdss)
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
-	if (data->ubwc_enc_version == UBWC_1_0)
-		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
+	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
@@ -193,8 +192,7 @@ static void msm_mdss_setup_ubwc_v5(struct msm_mdss *msm_mdss)
 	if (data->ubwc_enc_version == UBWC_3_0)
 		value |= MDSS_UBWC_STATIC_UBWC_AMSBC;
 
-	if (data->ubwc_enc_version == UBWC_1_0)
-		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
+	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }

-- 
2.47.3

