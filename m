Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GqbIygFq2kMZgEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 17:47:36 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5632255C5
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 17:47:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2C510EDD3;
	Fri,  6 Mar 2026 16:47:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SHyqn30/";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="COCgv39t";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6397F10EDEB
 for <freedreno@lists.freedesktop.org>; Fri,  6 Mar 2026 16:47:33 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626FqxP12007768
 for <freedreno@lists.freedesktop.org>; Fri, 6 Mar 2026 16:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gmnFPJlHzxIIFhYmKoQungMgxWFw/K8lJH5qH0kO8lQ=; b=SHyqn30//lKMgHjk
 YbJvYJ4ll9vpAgyGxrgQNSXvNDSWaMUVX9IRRfmNNKHyNAEpA4OFXUaSfS0DiPYI
 ymFOZyRxXCQ9tkv0uIsYhQ1SFRSqEKEtqYGhuEk4pMmQCWiMUTQr8KD3NfcBGQ9X
 /DwkdMpy98DWXY4mNzNVwTOz28E3/rYRtP2BtenQOG48G4iy47sbrqM4QpvG/x4H
 qJyB68zyWfG8ja7EW1cGBAG2qTW8sSk3XbNskmFhyBHvn+Pe2P1KsLUMXdkdc5lW
 nwvMd4gQK6wJ2Zt7zBsVZgINpuENU0G9kCkRpp/+pNt+BW0YH/wa+aC2d/kQ95yX
 /+BKTg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9ahck3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 16:47:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb42f56c4aso5399471685a.3
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 08:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772815652; x=1773420452;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gmnFPJlHzxIIFhYmKoQungMgxWFw/K8lJH5qH0kO8lQ=;
 b=COCgv39tek8Tp093cPjA8PYQ0yYzA1VF8KAhhJuWWa7e8VBxmazxc75MpiX+9JLy45
 31oh+R8l17hq1vvvJeZJXGGPafHjfLVHbkhncw53SssvzK7WMGu6spN9DGAPeM2GafOU
 T7CZEBRn3bfZb+8JXjAwyGUJvCAX/yrg1d8oZFZ+79QHXjHFS3x5zvd4isEVo/aZKJdU
 z2MywdCDtELoGBFfZcuRKuHv+4Bl5uBy7wBpsW04flNhsNtoXutisjov9wpzx+3QuRPw
 IlhZQ+HpYEHlsxdo/hGsA2THUWKD1LkrQNDuR+XK2nzTsNu5+F4ifIPrheYvlwyMIo7S
 HOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772815652; x=1773420452;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gmnFPJlHzxIIFhYmKoQungMgxWFw/K8lJH5qH0kO8lQ=;
 b=J8gX2ys8lL0TY7XQIQqnZZR26BAatJJUE+I4+7qt6rFMreq9NYp5fbUokLkCjschS7
 FNRH3iA8Mjn/r43O2Gf5LEL2judmlj7EK3SgCxqoKB0VbENOssog69nLTQkhd6N4Z4P3
 xL8MvhxFpQaaVQlbgNHNpC33lYFwcseEXEZWfoI8UEoKIkjPfTHBaFD44TS15hgsE2PL
 oTvAFzsvllDamGEYkf1VITjObnPUnqgGiCSXggre/HW2uxzTwzP/FxaWJQH3PhOYcui/
 zNt6ajWJpbCkYjDUL4uobV2bkGVOKlm/1dpYQyfqCR2joToJUYuaTS51iAdJYAVsjJoC
 veBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpKnHkiUTtflAdU0WUzoaVjECm2HZFgafI/Xf9KTZRn+0yIoChebhnjRMlEXMqkqx2TSuOamJpI90=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEYKiC0qkECF3EaOpkrnQM1sTNybFcbGPYDlJ5U6F7lF0uUAv3
 0killmen03HBsHE93ltlyOvqL+WceaO1oqan/5IZEVp2lyvLipxxWnoxNtzwQ35HPznHjuD4xx9
 uj8rMXuFr6F3RfAiZgZoE8d8XogYTWKMZZNPa/VlXxaw7dXyfU3x9eBxlqn6GOf53vWyE/nthFT
 BI3BI=
X-Gm-Gg: ATEYQzwKACP9pHXI/Iy/XiAclC/lqE9CzDbbFyrdVErs22+71zLPYUHHI5Lgaf4A3qq
 4vl0eaMb9//cRSc8FkhgLOQ6SCq6fcKyBnndyslcbGVRosEgiCWdvPPnMO2cQ3xhB4vj6r0iM8y
 /Dv9LrTFmcJ19fIZfRSJt10USSkkgV55brEz7gYGoIArht2oAYhwC25KjKWdRK+nNA2hSTRxhaW
 79ONdq84mI8CshnzTft8UkuRxitPJxl+VG/MdDijHbd4sA4iuHGvcTPZ3cerFSzTwvKbPZ+4ZPC
 h0zvbH54VLZaQ6s6XX9oDc8e9v7VhbL+fTVR/GnOjQHqpMEuNQSwOXd6wlL1GmowCg/wKiqJNM9
 TduKCCBackFKjITp3BgAjuuXURa8wsE86PzEFRY3ZGH4FS21WTHGlepKApflXeSYlBHsnYD2JSo
 eJNQ3lBBKEGfe+oNmjV0bLEEdgk3PIg+SaKq8=
X-Received: by 2002:a05:620a:f03:b0:8b2:d72d:e41c with SMTP id
 af79cd13be357-8cd6d3d9183mr369892685a.5.1772815651561; 
 Fri, 06 Mar 2026 08:47:31 -0800 (PST)
X-Received: by 2002:a05:620a:f03:b0:8b2:d72d:e41c with SMTP id
 af79cd13be357-8cd6d3d9183mr369888485a.5.1772815651062; 
 Fri, 06 Mar 2026 08:47:31 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:47:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:16 +0200
Subject: [PATCH 10/24] drm/msm/mdss: use new helper to set UBWC bank spreading
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-10-9cfdff12f2bb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1239;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=T4XlIf9sWC6G5eodtz3g7Nl/H7ebAymEe1iQ8N83kkg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUOCroA14RUSjBXpDlMJpG4G9tbOzhXJ7jnX
 AHTxgYfdp+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDgAKCRCLPIo+Aiko
 1cCLB/sH5fdyjgJAnBqdlTRluLWUCiX+r9ZILouuB0tLMDmHwLENSLGdiFpafUBOnwRtvXV4sS/
 72MZ27DxVesz+OFeul+RrNQCrj6YomzTsVqIeWRrhmUulx/MlLuCrgyCTCSTBJYDVMRWPBJYaKb
 YILzDE9wkXQJf2puwhieUS7rZ9MfRAy2ZcwCwJczI0qRjyk4VJmEq/V9fQN9hTfeH0mfiwpaYcx
 uSwIQOU27/dhRM0QJgEcaqZQE5debAvAgCA9X/BdgFGByPzRxtdhJ9wA55scqELFuD0FHnpr7+Q
 zJ5/2s6mTr//sVQ9Um2aCrUz8D4Pq/f3DCPW0xHH4TQkz2aq
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: aUYyQgOGDM2SMb8wc3GhVPOvow_Qhayz
X-Proofpoint-ORIG-GUID: aUYyQgOGDM2SMb8wc3GhVPOvow_Qhayz
X-Authority-Analysis: v=2.4 cv=G4wR0tk5 c=1 sm=1 tr=0 ts=69ab0524 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ujCctoy6CNRHcyqwK_8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX8UPUsxmT7YTk
 21Z3vEMMfOUwTAN64OGX32OAwigznkbyP+0RwjMOnBY5JCIqXbfv/agbH/7kijwZ7uZw5VLo0FO
 7peAEJCyMiFkz8cqlfMGJDGNw0UFwienboLXIQLlBEeOYfe8OMRzRttgwKYw9/boW+UbUotR1H3
 UwE6XxgCC1OMPH/2Xf7l1NTegdu4nqvW+zh66sHxX8lQumz9HDE31GlR39OQIc1DPmqR7M/X70a
 V6iBdzX1habBCDucddu0LrMn3tc3a/R4rkkWhSac5dqGW6ci25kTH48Cp94/2cfr6jCgp1eYCSV
 HmWEBIz57kwzZhFlF8NA0SZhJ5PHcQ5is7XKFFI6aNPb4ud8FlE60I+wIbSN6N7nnlUrk4N4e9G
 LxF4IZD1B9G8xyMdA0PxOpJWJJ8yilEyjq3cTpH8dEEmSzcDCEhp7bRbPv3rxhiwip7O/8qrZxC
 5OX1bKFU/AKeipivzTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
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
X-Rspamd-Queue-Id: 3F5632255C5
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
	NEURAL_HAM(-0.00)[-0.985];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

Use freshly defined helper instead of hardcoding the checks in the
driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 41289606407a..90a4b579776a 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -183,7 +183,7 @@ static void msm_mdss_setup_ubwc_v5(struct msm_mdss *msm_mdss)
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
-	if (data->ubwc_bank_spread)
+	if (qcom_ubwc_bank_spread(data))
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
 
 	if (qcom_ubwc_macrotile_mode(data))
@@ -204,7 +204,7 @@ static void msm_mdss_setup_ubwc_v6(struct msm_mdss *msm_mdss)
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 	u32 prediction_mode;
 
-	if (data->ubwc_bank_spread)
+	if (qcom_ubwc_bank_spread(data))
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
 
 	if (qcom_ubwc_macrotile_mode(data))

-- 
2.47.3

