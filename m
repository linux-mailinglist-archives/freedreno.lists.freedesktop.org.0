Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLR2I6YsqGk/pQAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Wed, 04 Mar 2026 13:59:18 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFCC1FFEF5
	for <lists+freedreno@lfdr.de>; Wed, 04 Mar 2026 13:59:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0627E10E9E7;
	Wed,  4 Mar 2026 12:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WuZW4Bdk";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YYTE4s0c";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EEEB10E9B8
 for <freedreno@lists.freedesktop.org>; Wed,  4 Mar 2026 12:59:16 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6245SRWh2861146
 for <freedreno@lists.freedesktop.org>; Wed, 4 Mar 2026 12:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ixwUNY3FhPaLn0RIA0x6OgA9msiCTyxEpi5p5oX17h0=; b=WuZW4BdkRexaYpNV
 P+EENcPl7dwLMtle/8EhyG0s+YqpZeqwHv48Z1c+YYBoqOJeC1fMCxg1XiBxjlBI
 CX7Q25qs7OLIM3f/MLCp35fiPoWw+Sk7m/q7grmtuoX8OdZhKMHhiw0FQFJNx7N/
 1qCEu1p8ISCl8xhAE2gEaSiyvxlfTFVgKopitM138EeyWEdmNKKngkMlmD/qpZTh
 sonmODZj0M23AZ9L3UoLYljYlu54kbMskRQHvhGIeb3+IEypo3L6TMkuclq8Zuiu
 64aSCtslbiHUcRV4O/ZcfXsg3mkhlFjiachs4kyQzmuoxquoD2MFPoB06+raT1n/
 DolPow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp2c9kxtj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 04 Mar 2026 12:59:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb3a2eb984so4871007685a.0
 for <freedreno@lists.freedesktop.org>; Wed, 04 Mar 2026 04:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772629155; x=1773233955;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ixwUNY3FhPaLn0RIA0x6OgA9msiCTyxEpi5p5oX17h0=;
 b=YYTE4s0cQCPhP5YvO9gnsW/fNNz8+54YXcwLVdLGkv1iXFi8096YU5S+NQjUIlTUbX
 aMnTFNVD8zxLvCgqku5hp9CRNetE97npBJtrrzwQUnDsiz+XiHW4owKo41XD97IQivyy
 4ySsvdlgxHJBBGceCDFNT17s19EqFIP9pwmASLMmQ5lwJCPam1N1rF0/WMuJecN7Z7sn
 NMvtFq/iFawq99+UtsAee+8AN0QfDyks66aO2n86l8bhdB2DK+5NDKPFkQho3csseILg
 eEF8pmYlhOkuCxXvbbmNLZG59ff1iY5RL0t7t2zoJQZsJ+Ns/PmX2LcC3miK+TbM8649
 D2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772629155; x=1773233955;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ixwUNY3FhPaLn0RIA0x6OgA9msiCTyxEpi5p5oX17h0=;
 b=GNaaz/qIiE/bwjynxGwTm17bZL+nVWkbx5A/o8yufxLrMBr47GJV0zeiQLFZiz7K0Q
 A+xHmYVoGRXnZ1KRxDBeFbS8jZ3IipHUEWrr6nBUFUAcRhjlAlaOASnSlALLphVRfl8c
 Tt2cO0mml3FIAXERsz87VgvrwWDowBy8SMraI80vJyv2kGBJIVFrTWev+fZVYb71twky
 LdyrORHsUCzjmJparShdQGC0FIAx87O5RBKl/84DiQpEvHwDBZSE5rMT768qO7xXWzW1
 nTmCcFKRgK8pnvuS1XaXCBa4OkV/CqWnkIj7uE96zGcNSrL9t50cprqY9FVKeSleXgYc
 Sm2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv8fR3+jclT6Rclog+xxe9EbSyc7sWHKbUlOkdQSeFLThylpS1Ynt7q/1Edax16TRxosm/+xABRYI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrxjIWAdi1Vx2HArIycLIChGwaBXoFG580VYjAemIJfmzMv5uo
 sWfQlUuSd5OCooi/G+Sy2gyr/g0O3ncIemOZ2d/wHosV88N3gu6Mycsym9Q4cOeYbPdbF0hOWAz
 yj06cKTiYu9q7i5XMd5HLwD71ljMLyJJZXZ1tEPtCPqqHp4QrjTT4XXnCW8/TEcu935sSqag=
X-Gm-Gg: ATEYQzyf1ulEoUiNOf8mBHmZf9JOot206TwJTSq82NBVprF0JHwNCgIhhBTJNnLoZuh
 PQf6vLn8d6kFJlN+LFADuDix3w1VUv7KZjk6dT8JxDCje4I55r69ftnCpaXa3TK/T14TTkYQm5n
 GuNOSj4fsfatomrnq4BVzRU+8LifDoMVjzkNw0jm3Rq0iTkFCuZbv2Eme4wYu4aXIWyZHeEFl5Z
 BGsyMw4NZAhuKnvbF6YsuYy7x98HWdyeAQls+PJ8TrI4bPTZ0bLlRM0lGi3c0s+YqGdrmebsmJm
 A0z5s7sIylWhnQXyFasgv7N8+h842a/XRgJXwSOvjnBPnQ1suqln2t/mgFJ8WBAvZG6/22j7H3B
 IC3dFQEW1Fs7y1OrRHJpxzuD1RHJS3nNahBfoNPIfdYMy
X-Received: by 2002:a05:620a:690f:b0:8c5:2d4c:4f0e with SMTP id
 af79cd13be357-8cd5aefb869mr209347085a.25.1772629154887; 
 Wed, 04 Mar 2026 04:59:14 -0800 (PST)
X-Received: by 2002:a05:620a:690f:b0:8c5:2d4c:4f0e with SMTP id
 af79cd13be357-8cd5aefb869mr209343885a.25.1772629154510; 
 Wed, 04 Mar 2026 04:59:14 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439c1fc577bsm11318491f8f.19.2026.03.04.04.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 04:59:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 13:58:48 +0100
Subject: [PATCH v2 6/8] soc: qcom: ubwc: Add configuration Eliza SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-drm-display-eliza-v2-6-ea0579f62358@oss.qualcomm.com>
References: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
In-Reply-To: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1611;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=A0isBPfvtv19/rZF96jjkXvuTjw3cs72aAEpUz1TX/g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqCyPA7rdAeJeKkp3B2oG0OtmhA3bWB1CytGVM
 MPyrhLeajqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaagsjwAKCRDBN2bmhouD
 1zXED/sH4ElI088Uuw9/j1e01n/LV0h8NX6F4MbebFIP11rTOcoqlpwyBQ+jui/P6Kp74V3q420
 lyBv7olmR5rX0vqOv2oe3Bb5ecafcbdTU+n6WWKNqrKxpPfz629IikyO0nmK4Uweqgn21ZTpMm5
 5d1BsIexofV70PghYwAgK1o7H8h2FpQqLfGnfH0R++MPczNV6nRjYhq7p8tzGE806DBNlv9gs1N
 RPyRS+Ou4WqrclwhfXxyRFPtGobqGW19V+QYUay6d6zff34icNfFW6XTc+7DrpvbLD5amClDSch
 UcigbuPTVAAkxQcniS7oPWUVSdfrCqqomtMMheoSTUr0waL6yypLRr5mxJRgww39xm8kYW0Irig
 pe625vKqz7RTzDvv40d1vygKar5Cb9K5DK2LybipbO0fUAMHGc7WCmTc/HkrKOBhIMLuYxc79bP
 nDNjPurNiM8mbclG13jGhqAn57xznsg5YhItI9MCvJjCQmPILrP6ihllk0AR8m/DchkALlo8W4m
 5+9J0KvU0Y18ymxnkD0qbdl5Zex09dw1/4oZV5tWJ7kilCsK3oJZaaaAgq1K50VglqqVS+NYO+0
 eBu7IObwEekKMclLEaxM7cecu6Se+IL7Z0LfgO0ddXsWFlGrIdBuJJa3C18UOEKhqyjXoN4u4yQ
 QUz34oqo13KAA2g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwMyBTYWx0ZWRfX5NnChXaAk9KG
 wpwSVBzQiik2YjCdrepP09OMqG1LyG5jJ5yQnbx8uZZ1qeUYj4vaOTvZlx4wfKdtd/cMxmHKaVz
 tfHH9gCbCbpU1NM1aKPpKud5jGf6I3ZQYg3iNkpTWjgRlswDXxXX+OMuWHGuYKHKo6m8AzJ4Zo+
 rNifzk9GUPgI8OADrAMtN3hdhvCUqVAUm2eq5xkCKJPE60kR94T2KNLfJH37CQ/1yUXIe9px9Ng
 X9Dt+aJELKFZHY5wtS4xP8CTzDOhMgnhIM+136uG4jJyvUP+ryroE4EVvZLvXxwzSspafLOsJIK
 PeXt2UNz7sqAlYmpiRf2Bobacq/aTFPcGDwny4FB27334FZ57MJVupvyTNAXaYHLyNZb1nHRK6G
 E/rfTBbGDZsceOy+lPO0YhdClsdwy12OjqMUXuaXhqPFhiyz22dDCarlPVxEXI6IklbIE4tOqF9
 L3hYQf07f6SFMpQG1ZQ==
X-Proofpoint-ORIG-GUID: XmiRiIFIRinqNJswC8lP-ECsvypVoRLI
X-Proofpoint-GUID: XmiRiIFIRinqNJswC8lP-ECsvypVoRLI
X-Authority-Analysis: v=2.4 cv=EefFgfmC c=1 sm=1 tr=0 ts=69a82ca3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=-43RnHntoZIaUBb-iF4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040103
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
X-Rspamd-Queue-Id: 3EFCC1FFEF5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_khsieh@quicinc.com,m:jonathan@marek.ca,m:quic_mkrishn@quicinc.com,m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[freedreno,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

Add configuration data and an entry to OF table for matching the Eliza
SoC.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Use data from manual (UBWC v5 as pointed out by Dmitry, but different
   highest bank bits).
---
 drivers/soc/qcom/ubwc_config.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 1c25aaf55e52..633d1efa0883 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -16,6 +16,16 @@ static const struct qcom_ubwc_cfg_data no_ubwc_data = {
 	/* no UBWC, no HBB */
 };
 
+static const struct qcom_ubwc_cfg_data eliza_data = {
+	.ubwc_enc_version = UBWC_5_0,
+	.ubwc_dec_version = UBWC_5_0,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	/* TODO: highest_bank_bit = 14 for LP_DDR4 */
+	.highest_bank_bit = 15,
+	.macrotile_mode = true,
+};
+
 static const struct qcom_ubwc_cfg_data kaanapali_data = {
 	.ubwc_enc_version = UBWC_6_0,
 	.ubwc_dec_version = UBWC_6_0,
@@ -245,6 +255,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
 	{ .compatible = "qcom,kaanapali", .data = &kaanapali_data, },
+	{ .compatible = "qcom,eliza", .data = &eliza_data, },
 	{ .compatible = "qcom,glymur", .data = &glymur_data},
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },

-- 
2.51.0

