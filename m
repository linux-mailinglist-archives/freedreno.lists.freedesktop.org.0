Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA5AB486F1
	for <lists+freedreno@lfdr.de>; Mon,  8 Sep 2025 10:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C41210E41E;
	Mon,  8 Sep 2025 08:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O2xuWFxh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E6610E44F
 for <freedreno@lists.freedesktop.org>; Mon,  8 Sep 2025 08:27:36 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587LrbqA017315
 for <freedreno@lists.freedesktop.org>; Mon, 8 Sep 2025 08:27:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MdRCXOUq+VTaRYE/Oa3hlCeqy/ZqfVMBxdnUcOZZReY=; b=O2xuWFxhv/JR6w69
 PZmQtW1nP4pMRYuaVV5+Xvp5xipHHGW7Rn24NcppvNrFjdK9xLbez3DH5eQmLQ4M
 g8pVXpvuqLOnwlOBY10A8XxswqfNMy0D/cpNuR+mmaGrZHCYydwquC71H9nYjT8x
 3GbN8eJRxkcUcWFIpEmkRcfv5lCSJGIIzaDaisvJFiiwRpVIl9LBH6osof8f1fM7
 Qq/zpXXKamka1KE01hcXzrH1DewQ1/vkNaS7hOUUE/JjwQrhIjEbKVcXalMXvvUG
 m+vVm6yzGo39//ObPqdyt/3hE2ZoIE9P+5qulFP8R00gdhFyseauUmb3lM43qBik
 p5o6rA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4kuqha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 08:27:35 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-76e6e71f7c6so4168770b3a.0
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 01:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757320055; x=1757924855;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MdRCXOUq+VTaRYE/Oa3hlCeqy/ZqfVMBxdnUcOZZReY=;
 b=D0FG9xSOUqiYkFc+2c7gLWfnJZmrKsT4beqJXwVmbJ44GPUGZuhu7Daq/DyYZqGMJJ
 bR8sUAx1VSrEH2egmq15ezMWhEMdevQZhi+PdjKaX1n/tYWMpF2AbLJbShsn3PQpB5vg
 DJhY5yifcjKVnA9itHUyrpfdz++/TWaqJCI3rPSV4pohRh54pX1vsIvIRce6pNY5fK1j
 shmYLYxi4TRlqrcNt66yWDJ9fJeD2byFEEiLIku37nSworxeFY6UGNkUYi/JamFB27p9
 +LULzJhzTwgIudxkVCPGSGK5nDN25CI93nBN+lojesntZ3SRv/DI1pg7Heuhfm7JVqNz
 jMSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4JtzdE41iTIgJ4h7z+l8EUj9vj9z0HYhdgbDJLzDazWWXyeNObKLLyqDZda638aXu6n1tVwmnakQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBPq1fIlwwi5GrQ8XaaAaYp3B5msxmhfsTRhOUK9jwy+iiqS15
 xVGXH5DgH0dnp0XkAyYikBWiy88ymI+TS245OgWYhi6d7WgRFQ9WdY6RKf7VTB4TsQY90/q1zBc
 W6190xWr2a3AAWjm+/4gtsnfORiXDjXUQqfvYI6B4Y8QNJkNkq5HcN/p5O00KZsEAXK/Ux7s=
X-Gm-Gg: ASbGncuQZ7qaVtKv3ly9kowELzmG98zs0FctPaIjC3FErfBAhQ5/8MTxgOqnBbREWbr
 rU7tNExbvA9/QjtvpjxLHaisPPPsUl5EmWm7p7y+kva1cCznMh+yDgv1BkKukerYgHJiuhTQjnz
 OxTLdNoN5AtmrN5QGOprhVG6fGfdpPDlOTTdjqIfPEB9yQtqmL7saf9Ht5/qgSB1rZO9oTmrq3H
 kWiTblXx8YNSBPFs+eIO/fBWvcFQoE17qg3dRWaPSV84xf+QwVNAyqjrvBJd/wCm1p2+Uruu9X/
 IVNFSWP+U8nOyDq7IRh1Zb7bzJHyadv+/03TFvVsohfjl6U/XHPvazWyBm8jGgwK
X-Received: by 2002:a05:6a00:4fc1:b0:736:5e28:cfba with SMTP id
 d2e1a72fcca58-7742dde571dmr9634399b3a.18.1757320055061; 
 Mon, 08 Sep 2025 01:27:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoa7rPmKEoXy5bkSRtHuEIinaQc06jt7tvsoCi9S+fbJrxZSLSkUe3lj6xgSq9+7CmJWvh0g==
X-Received: by 2002:a05:6a00:4fc1:b0:736:5e28:cfba with SMTP id
 d2e1a72fcca58-7742dde571dmr9634345b3a.18.1757320054591; 
 Mon, 08 Sep 2025 01:27:34 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 01:27:34 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:56:56 +0530
Subject: [PATCH v2 03/16] drm/msm/a6xx: Poll additional DRV status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-3-631b1080bf91@oss.qualcomm.com>
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=1605;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=35cpBSeGBdUH66FC4H+UsUPYwwGJgjYHwRMkfK+RjKQ=;
 b=OZU+SZ4r0JqnOoFtL4cOXGhnhsKN5lr0wigU0s5og9yKoEQ8G/GdA8oV20D3i86tpktTOK4RU
 6ZfUfUEkIU4BOwAhLWMVNE8XB/6fzyhgC1jU6Rn3QsW8rvaqWHNa7VW
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX0J7QWgjgg6zn
 KfoolJRS8L8KHCJNq3cTPMKwV4QwN/tDNqp/4Lgor8kTtgW0/7zP5PvsAVsQA76xCe1EFB8WwJZ
 t4M5g04IoYxt9NvKLBheblm9KKe1GeKXx2+fIpQ29hvvpnNclnVhUc65NGUN3bmqQvNgUBE5KXD
 KNVz9bEuMVhdx3kfe/MU7dl+rrtkQJUF6bkGAIHxsngQAJ8CabDVIYuvR0MElql+Gq8tm8aVIyP
 kC2uZevGmPHecvzpk/PiBPNurFMsTKq+8J793vyKcT002SHlRQ1GtBiT6uNt1xxlVHuLoJ4K9nY
 7zQIWnfW6uPApgTjsn0vPGc8JVJ+Gv4m7xBHauVAMgqM9Bep/NJwVjasDNsu8OVDXKYnTCiLk2Y
 Y7/ZI/V3
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68be9377 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=jdX7vir1BwPwhWCwAicA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: rddTHcKWm29p-faTxVcIo3Pg1CVFsNkp
X-Proofpoint-ORIG-GUID: rddTHcKWm29p-faTxVcIo3Pg1CVFsNkp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
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

A7XX_GEN2 generation has additional TCS slots. Poll the respective
DRV status registers before pm suspend.

Fixes: 1f8c29e80066 ("drm/msm/a6xx: Add A740 support")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index bb30b11175737e04d4bfd6bfa5470d6365c520fa..06870f6596a7cb045deecaff3c95fba32ee84d52 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -987,6 +987,22 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
 		val, (val & 1), 100, 10000);
 	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
 		val, (val & 1), 100, 1000);
+
+	if (!adreno_is_a740_family(adreno_gpu))
+		return;
+
+	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS4_DRV0_STATUS + seqmem_off,
+		val, (val & 1), 100, 10000);
+	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS5_DRV0_STATUS + seqmem_off,
+		val, (val & 1), 100, 10000);
+	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS6_DRV0_STATUS + seqmem_off,
+		val, (val & 1), 100, 10000);
+	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS7_DRV0_STATUS + seqmem_off,
+		val, (val & 1), 100, 1000);
+	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS8_DRV0_STATUS + seqmem_off,
+		val, (val & 1), 100, 10000);
+	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS9_DRV0_STATUS + seqmem_off,
+		val, (val & 1), 100, 1000);
 }
 
 /* Force the GMU off in case it isn't responsive */

-- 
2.50.1

