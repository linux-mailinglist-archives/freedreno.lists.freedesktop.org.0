Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 394B7D07DC6
	for <lists+freedreno@lfdr.de>; Fri, 09 Jan 2026 09:38:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FCFD10E819;
	Fri,  9 Jan 2026 08:38:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MlEfH4X0";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jCszcgV0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8383010E819
 for <freedreno@lists.freedesktop.org>; Fri,  9 Jan 2026 08:38:46 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6094vaov2765703
 for <freedreno@lists.freedesktop.org>; Fri, 9 Jan 2026 08:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=p2iydELEX89
 MeFSjotNCh5W/60kH6MpBL7MbZgsYBPg=; b=MlEfH4X0Oqkd9+WWa/b+2PkZb56
 xVTfEE2K1gl4jQoaJSkkbU1rOf/NPr2jdznoWZz+2mDPvojqO7gAhqoivcii+8QI
 xQ024+XRFXOqrE6eYDBJcy4PQWUvqJWe2rN7icrtRCl+yj+f5emvo9RBYeDiXnwL
 JsoFGCz7VDRtw6AaIK2rFQIeYla2MyeIxg6Hzs4AYaEgT0JehoRBteB8W9slV575
 f8iRbqEC5SiYxenrcaZTkz4DkRlaDC0zFMMreysBknW9Vp8h7vqv67+c/BkcJq6p
 VXGuubYHaSDeDHquy1qznb+7QtpI8j64wWIgFkTNja92l3bXWbz9y3Q3pGA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjfejtmvw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jan 2026 08:38:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b2ea3d12fcso949684185a.0
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jan 2026 00:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767947924; x=1768552724;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p2iydELEX89MeFSjotNCh5W/60kH6MpBL7MbZgsYBPg=;
 b=jCszcgV0agqRVkjfH7Nh244fkMiIHS5Mu154AjJ6aALQIR3pRv4uoz68I5oyALMgoi
 TCpli2sHREEJTX8GCxYeLxEt4bR6m1TIDXANfomyxFkzmT8KCniAdK43OaHUkJoBWRRW
 FDYoQ4TywCvGzOnecoSqFjtwvAQKDayUTAuOGNA3VMnv78duKegA/G93k6VXeOENy0OC
 BTM6WdSyUmGP/HOSL+4vmvS+6LikE4lTpj1AJW1pfPmDYWKfp8+t/mb3Bl4FCqztTWuZ
 whI/BBRbruxEZPBxHhDusmyJw9cL8Yz30jLcKkRPZFCWLIvwbtNV1+c9EwTc1UeMwve/
 6f4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767947924; x=1768552724;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=p2iydELEX89MeFSjotNCh5W/60kH6MpBL7MbZgsYBPg=;
 b=KrN3XCE4/VYX6VR6SSF3LSJTo4/CyKYXtgkDL2EHb0tXlULwoysOoq/9NoGniGPDuE
 PnxSm2n8uiq1C7XwveXsc4SjCppOjwIqlZKc+Jr61mNWMIrkyMWrzHRUiElSKzKvn7Qy
 cF66cWa9KVBn/wrHWNKWaYo1RRKyiwOFvs96ILaJCnzcsjo0DbyjhR/39FCv/mq/ZSI9
 e6Eb47AgZCT5rGzn6vDWrYkuRGkO4LpMMnxdmQmNjnGD2FTmUTlDNTvrPSzXZg7+Trb+
 uYr1bqK6F4o/q7kjp7Rv6eraHmR90qOl4ojwDPSjIUDxhEJCgHBINymysaiMKyIdF8JX
 QH2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEquCd5ph37BXSmDjloRWv/K47jWyEZVL+R0fKabteOIo7MabWtCysJHJGyAUkcJzuhvEHGIBUJA0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdYO45ZFnLhRGnhZ7D3RYb3QGYfJrtSxZHc2kU8IU5Xmpi/dT6
 MQAAkVrGCRVhoa9X4/Nx29cXNcFtzIHgO29vMVuWha/Ew9n/WasrsE+ESmOqZapCr1+w1EBx7Wg
 iobRn1Q88+blAhi0mcZnnhxA2LY3kijh9A2wl2lVzLjSapsRpTFtAIObPRu4IhpU8iw8QzUk=
X-Gm-Gg: AY/fxX5xkzxAMZCzBvL4jlEgfIw/6k+7I+jOxyqKkgYrpweKYbhZ10fSt5aIIaBtXH+
 piMnEwaZuVyNQofbq5sPX0QxLCwBO8zNCdJoiZtcoH6KphiU+EQ9Y8k/Z6LcjA8C2yoCai+hzS8
 HLP8dj5NFMDZZzXcn1K4H0uCsHoSErAZPB5UBFs0j4iNBux4+r3fYkclHY/GiCCmcoTrD6LWfKe
 CvyZRwLteWHpvyGz8dhGvZzcjFmdKT4QUWVvszElRXPh/lbhzIkqar2PmHCwAxWtlLRt71DLhGr
 /SF4W+AUwgTMXc/Z42ZCLmg/z+j6GFiFwcDt4ldqb1KGzhrxyUUNZgm6on53ehQMWcr/Vai9Nq6
 LeOpgkzgb4ZFF9W9+M8CLmBVqY8t0xjrm7t6srR4nq1obNgld4lJauejz2j7aN2Iq1xw=
X-Received: by 2002:a05:620a:2a15:b0:8b3:36d5:7544 with SMTP id
 af79cd13be357-8c3894203f9mr1062566885a.82.1767947924428; 
 Fri, 09 Jan 2026 00:38:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9rYzZuiEjS050fTw4qdxmLAcU8rZYTKxOswGCOeUlxovtPH3VDw92USgjLqt0puAdgHj05A==
X-Received: by 2002:a05:620a:2a15:b0:8b3:36d5:7544 with SMTP id
 af79cd13be357-8c3894203f9mr1062564185a.82.1767947923974; 
 Fri, 09 Jan 2026 00:38:43 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c37f530c35sm771262185a.40.2026.01.09.00.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 00:38:43 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
 konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com
Subject: [PATCH 2/2] drm/msm/dpu: use max_freq replace max_core_clk_rate
Date: Fri,  9 Jan 2026 16:38:08 +0800
Message-Id: <20260109083808.1047-3-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
References: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Bu8sxq3dSvRjs-5TGR2v_7GYUkqKPGNW
X-Proofpoint-GUID: Bu8sxq3dSvRjs-5TGR2v_7GYUkqKPGNW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2MCBTYWx0ZWRfX2qizCmL4eNKI
 nlcPv+m8h2s5CFp2ID1rPMk4P6yloR13oedbvxEYJwPwY8ln+pgc8Ow+p/MpTnr+jF2yy3S8WJZ
 FhPZveIbOcFucG0q77CJvy+oTRjhxHbhi/2qY6MK1AVvDV+jsCDZtsK0D7xhHUaaQuM2dsdgobH
 DKb7pNHmRGwIdUfb8ELwpWfK1VWfkRoIgKrPott8nKray3WIMCxuvR+vCfBU7CjyImyLM6fMHX8
 B3w6tst23u3hPNNKvVlMoTrM9LrfNofjVw0F6IxTDRyraGcLos4CdAYCj6WKZqtHZTuwZ9FGSNk
 uKm0m9nOBBV1kQUQU1UKlDpnwwBefd52xNjZzllV/4YAORQmJq+QrBDN5F2ikRDX1g1dDy3xsYW
 X+XutT6FKhRyqox3rNSPPYeX+/1kgoRpWlKEiORXyxQDK75PYBmBwCw+sYuncxDY98iZlo1QSmi
 eht8yXtJuPnD0wmowBg==
X-Authority-Analysis: v=2.4 cv=ZfAQ98VA c=1 sm=1 tr=0 ts=6960be95 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=qtVmDkmmVSxoQgGSxMgA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090060
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

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Enable power will use max_freq to set opp, so remove redundant
opp setting, and use max_freq to replace max_core_clk_rate.

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index c31488335f2b..973fec1c328c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1233,9 +1233,9 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		dpu_kms->hw_vbif[vbif->id] = hw;
 	}
 
-	/* TODO: use the same max_freq as in dpu_kms_hw_init */
-	max_core_clk_rate = dpu_kms_get_clk_rate(dpu_kms, "core");
-	if (!max_core_clk_rate) {
+	if (dpu_kms->max_freq != ULONG_MAX) {
+		max_core_clk_rate = dpu_kms->max_freq;
+	} else {
 		DPU_DEBUG("max core clk rate not determined, using default\n");
 		max_core_clk_rate = DPU_PERF_DEFAULT_MAX_CORE_CLK_RATE;
 	}
@@ -1317,8 +1317,6 @@ static int dpu_kms_init(struct drm_device *ddev)
 	if (!IS_ERR(opp))
 		dev_pm_opp_put(opp);
 
-	dev_pm_opp_set_rate(dev, max_freq);
-
 	ret = msm_kms_init(&dpu_kms->base, &kms_funcs);
 	if (ret) {
 		DPU_ERROR("failed to init kms, ret=%d\n", ret);
-- 
2.34.1

