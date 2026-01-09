Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5362D0AF58
	for <lists+freedreno@lfdr.de>; Fri, 09 Jan 2026 16:37:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37ACC10E8E3;
	Fri,  9 Jan 2026 15:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MVFIK6Rx";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VL6vLS4m";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0563210E26D
 for <freedreno@lists.freedesktop.org>; Fri,  9 Jan 2026 15:37:37 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60982Xwm2184005
 for <freedreno@lists.freedesktop.org>; Fri, 9 Jan 2026 15:37:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=SAEpD8XcNSH
 gJQ50kIyVGYLQv6H2L3ra4OIlJaXAEGU=; b=MVFIK6RxLT81AVxh41DRBELaJ1t
 kh/I8CxUKF+aR5RQ80dLfWAY+g03aGidxxGBFAawYODmuEvICM9/mFMGdQlGKfvx
 j1p45cAakoZi6oCaf7NOj2KerqN837FXa72oe3Cb0IXLYs9XNsDrTXP+ClLTeFJb
 LPykG4gBADOOGuFUwh6VE4AyYuygt5LtK68JXFANBj+BR6EN51Bz0XaUuJWcy/Dw
 NsaejlzNIQsgiOr+N/UWpx70onn6uNwn+Usyl7qwJ3Ix1fvpY8N12/j2JPm7abcV
 wBuPMfuqoDpLLUoJ8HNv8RkIROMc0LLEdLLMrag1jgUYroj3ONEI81TBZ5Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjwtn9bb5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jan 2026 15:37:36 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-c503d6be76fso4287262a12.0
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jan 2026 07:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767973056; x=1768577856;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SAEpD8XcNSHgJQ50kIyVGYLQv6H2L3ra4OIlJaXAEGU=;
 b=VL6vLS4mH375en0uHmGV0744cbJm5+2S+SXpalEBzTxw1ppcpDqjAU63zirhmcIKKj
 G8Cla/ExB7ofeOIx4O0F8uae2gKJVl9gomNAR/Br9+017dbqnNAPRtFgwlY3MA97RZW/
 dh9shT1K7Uurjj75dyYuKlx8KV0a3qTUJlZcWqldWialSyopyJCt8G9pm1hYO6NVGUdw
 p6DcSbYWfLrn/4Hm7xJ2vP1Uas8G0T2FSh+GQ/ZzA2Zc1HKyy9nuI1iEySzUphUQObsH
 tmiP80C8EEaFbFGmwW1s3RqLEcqr0UioKs+QgwO4+Ig6iO6QzxZygujIIsYYtxlTrlzM
 eIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767973056; x=1768577856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SAEpD8XcNSHgJQ50kIyVGYLQv6H2L3ra4OIlJaXAEGU=;
 b=Ogcu3tysngZqZegEFGwBcEE7LOP0fGe36A5t76ud7btZN+1cjIuU1DK0rVyqVcmocP
 37odwFaFwVvZFi+ZBej8qflkewmNu7Vu2vFD93NuDvhcM+1+p/jR2jAzagIQ6YIUNpxU
 f1M0PNU114dGhYoo0+3TKuQOix38wKbnKrVXe2totHrgHTxk2R/CJC6rgkBFT8RgPcKu
 7/gFmlisgVtvxBXh31XMf9mmo+KBOPNs/rElV5XTRcOB0dwocmAx9cflOd7z1znsOxyz
 nPTl10Ti62uTGvKgMDgvDNg7/585PvpGsj/lHwvMpGJ7Ji/461HDayNUGRRozt4iIi8W
 GkJg==
X-Gm-Message-State: AOJu0Yw9dm9LWWwj00M2+t7k6LooPwBYPelsOI+M/EO00agOd/agckfd
 +b0ZogirFjX5vxxCiqM4kG6G6U6GliySS9qmxAxPleUZpQ+/b4EryvnZgGxZiPoUKV1dqVyXW4H
 obW9yOAQRZFGbLpBiU5SWsGxvRfhxY8QF+TE/Vq8xFSETzhSfSxhDyKkYKvM/XmpcZcTtGnw=
X-Gm-Gg: AY/fxX6R2q9Kn1187PuDNpvYy9QiN2OLH1EeKph+twziRJzLXZclVFXOkSzzXAqccU6
 3an7DkMYWHliTa9LsXe1Ys+u+rarX2A7Di81TGAX81ELp58pIqiULtPZiI9b5qgrqc/de8yyQ8n
 graFUACGBFLxcYCBu604RvkVD2Cx+mIkF1sqSrv4U4co8ytqcrW81VrGD/lzQlWv5spT4B+l1co
 8hKJ7Da5ZoVca0B3cGdVEcPmIcj+uYsat56sWnGKQIlqXHET/i3+Z1hATOQQH4PFp8j8TsO7+NA
 mTlBPN6w15PzeG13JEgzJ8+PpeQk1jl7x9UPcMbisTe7Pwd5TYFGRRGzszssGndKIxAnDq59b+H
 zzIRhiAo9V7jWqm+IRKDTr+KibegcKZ2y1wdlwSGNlfC30KrmSs5k8Aku
X-Received: by 2002:a05:6a20:7348:b0:366:14ac:e1e7 with SMTP id
 adf61e73a8af0-3898fa060b3mr9686719637.77.1767973055864; 
 Fri, 09 Jan 2026 07:37:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGyhFtNygsyffFcGSojAzXokOetFNGmXvND3h8FNk0KTgssj8XkMam1JS4ObRAuNfNTetg07w==
X-Received: by 2002:a05:6a20:7348:b0:366:14ac:e1e7 with SMTP id
 adf61e73a8af0-3898fa060b3mr9686697637.77.1767973055418; 
 Fri, 09 Jan 2026 07:37:35 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c4cc8d2932bsm11379570a12.21.2026.01.09.07.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 07:37:35 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm: Fix x2-85 TPL1_DBG_ECO_CNTL1
Date: Fri,  9 Jan 2026 07:37:28 -0800
Message-ID: <20260109153730.130462-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109153730.130462-1-robin.clark@oss.qualcomm.com>
References: <20260109153730.130462-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KHqMqOQwhR8Lh1UH8V1FbFfvpQP9_bDC
X-Proofpoint-ORIG-GUID: KHqMqOQwhR8Lh1UH8V1FbFfvpQP9_bDC
X-Authority-Analysis: v=2.4 cv=Uohu9uwB c=1 sm=1 tr=0 ts=696120c0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=WPuUNEN9mCnJaCDdw2kA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDExNyBTYWx0ZWRfX4Vwoa+AlZNop
 XyV0wFDgd5lk6AjuQ6NOehboS+lflSHnOHhdC/2KnkilpMULn5ztreTmkIe0nfhwdYnJ94EgUGi
 59KgUiwiXplu74r8j8KhtHZs+MYj2oZIRKHrfxUMo+GRFt6k3yGhp8e8NXreVy2nFKt4Ku5sAP/
 qA7VE3nEHFiH+Cap8xgMGjMIwBtY6DDII2zGJrWKJS+ibY5Odd+inOnEwZhSRkGUS/YdqgvFvVL
 HLca/XQfkLXzWsTIZzxGS/a8SYdwMy9qe4NSm1aXhndObwtDeBJJbBnnapQlHrlcfYahgmdawFg
 IevJtz0HIFdVlJOtW8lEgSPHuoyhbo5W0bQ4wLd4qRX9IOG2RXkA9xHGIhRQO4OkNkfwSD6W8Gr
 lBMTvwu48NYyDzhfqUsMIN65dhNWgL2WzcGRkf7lhRPEeYPExrmhFMHEWPx3QJ+KTwKLzSFH7jX
 pm9lwGm2+vJi9Iq90XQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090117
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

We actually need to set b26, just claiming to do so is not enough :-)

Fixes: 01ff3bf27215 ("drm/msm/a8xx: Add support for Adreno X2-85 GPU")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index ac9a95aab2fb..e15d654733ea 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1691,7 +1691,7 @@ static const struct adreno_reglist_pipe x285_nonctxt_regs[] = {
 	{ REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
 	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10000000, BIT(PIPE_NONE) },
 	/* BIT(26): Disable final clamp for bicubic filtering */
-	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x00000720, BIT(PIPE_NONE) },
+	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x04000720, BIT(PIPE_NONE) },
 	{ REG_A6XX_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
 	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
 	{ REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
-- 
2.52.0

