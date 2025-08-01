Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C17B18704
	for <lists+freedreno@lfdr.de>; Fri,  1 Aug 2025 20:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60CE010E8E8;
	Fri,  1 Aug 2025 18:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GmOizVTF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7376410E8E9
 for <freedreno@lists.freedesktop.org>; Fri,  1 Aug 2025 18:00:26 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571HfrHE002804
 for <freedreno@lists.freedesktop.org>; Fri, 1 Aug 2025 18:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=3TY7JajUGvg
 SQAFX3ZoHDjZ0l2tg+rnsIJNFhfiXB5I=; b=GmOizVTFpFkXh8LhaF8YLtKApVo
 4TfIABwqGfxA73oKsdDx699Dvb1VgoTq9XgleS0+7GOMI88g7klEjKW8R6oBwWDT
 55jd3WJDZZusaPyam3JgmK3W31YzkcVQgUwk/SIF2moOs3CGyMlLWioiMpWK23EU
 7WveXX9E6ihf+CijRH9+Lm6F4c6ox9piNFH+QY37X5XcVLNjpfRaNGmel4+JLlaO
 pD66DNl5cMAFZCqmWGexPnyG8v4MFfYKuyclH1U1lazq002YjO7neXWwmrCufRN0
 kuAkunvG9fZjnRVa8SR/dxub3UFl9blVg97QGG/eDd4RPFgjKakAesguVVw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 488wgrs280-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 01 Aug 2025 18:00:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-315af0857f2so1338409a91.0
 for <freedreno@lists.freedesktop.org>; Fri, 01 Aug 2025 11:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754071225; x=1754676025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3TY7JajUGvgSQAFX3ZoHDjZ0l2tg+rnsIJNFhfiXB5I=;
 b=VNM9yxTyjkUtkrNjJ566TNJl2D2ktMrH5ZUQ9Ave4xLo1Ig80AoAGHouDTkzvRi3Qu
 +GdZGlH+d7PYIZxzY1AOdXjABFgU1yvdtmEF5DzIpdi7dzQCkkX6tCQAw9xXQJNGsNQ4
 xBk+gS0PrxHOHzQh34noiLwjoIwOL8VuTBuQBhgjqGshwuUrkIXnEik6kLqRhx/swDww
 dOrLEd2W9utfV/UnGrdDQ5WujpmD753MPInpzvXNb6mrVjwbnrlX10FZY5CoBGtkCmMf
 tfhoR4+JoEHzfEwlusy9ATnV3CjPJaB8748WF4FAsnr0MziJVpX0JMDAYEUJIWp6MB8U
 hBzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgZCX05ViJRWnKy+uNQOFYQL6q4U8RlLAQ0pnWb5ComYAS+8nv67CSUvWfEvMpsumrQ86GtXNd+qo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtWmbIviTKtogj828/HaU0Xwqz4Wk4v2qoiKgBVICKFiMtkW9S
 Y/jvXj2LGzUambq6LBVljd4E/Jk1wEkHZyA0A1bADln4I45AEdKoGPQqgTVniFCpj1jaqj2aR6U
 dg+9nEJzKb5fHCDjKMbu8GKdJxc7EZfDm9J0AXHt+Sn/MvvZr0oyUD1G5HUxTQbbXLOxA3qc=
X-Gm-Gg: ASbGncs32IS6Il3WfGwWwrHYx5psKyS5JCvDjADbdamp2az3vUlIIZTcPUnRMXkkEgf
 LUbtGyl0cu/ADAmAOvfMXpVBl1YKf17onBQ9aooopYfsscUvu7tcVHtiksBxrw3UrC9bIoyDdd1
 rMRt3xRoekz+EY20mXgkfkbVpyTUy4vnevbOvtOoEUBW+5UHMXA/WxouyP89C6/1geKNyKf5vE8
 HepylZiDdU29jJkn65d199OMCrfe3i4nNY7bPhnmBpqbQy84qc8Tn/aV8H/l9PYtsMIHCKgl4vi
 AQ+aufAR6zi0W8RSlP7s5P1QqxjXPnsV+UEovmRXHzFvf/7zCiU=
X-Received: by 2002:a17:90b:2246:b0:320:fe6d:860a with SMTP id
 98e67ed59e1d1-3211629d087mr935847a91.18.1754071224707; 
 Fri, 01 Aug 2025 11:00:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEX5MtZHVrDtRtNwnDqwNS5CiFJn1C83bZxhXU0qOaY2Ye0o4TdoGfd9YmU32DzzAJKMfk9aQ==
X-Received: by 2002:a17:90b:2246:b0:320:fe6d:860a with SMTP id
 98e67ed59e1d1-3211629d087mr935769a91.18.1754071224045; 
 Fri, 01 Aug 2025 11:00:24 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f63c25f0dsm8105815a91.0.2025.08.01.11.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 11:00:23 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 6/7] drm/msm: Fix debugbus snapshot
Date: Fri,  1 Aug 2025 11:00:03 -0700
Message-ID: <20250801180009.345662-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801180009.345662-1-robin.clark@oss.qualcomm.com>
References: <20250801180009.345662-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fs7cZE4f c=1 sm=1 tr=0 ts=688d00b9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Q8ed3UK4sgpFGPsrdooA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: ewfDrFwt4Ii_g5q9O15MVvPvTZ-0E-dD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEzOCBTYWx0ZWRfXy6L6Z5pSLy22
 AMBcXkZb8b2hVz2DxGANQPn95k8eRdioDwa3YShorTH08SEcbtycqkZCjQ6nL4zEIhD0WfByyj8
 pqHuHQM13PMKRL4hr1soaHZ9RqOKmuPGamt8e1qrKb3srtJKoBpXVCFddPGV+EC1DMw4SunBdUz
 vwsgqX+iAVbye+7B9iAnP48MC8pyP3BfCclo0FVgwYWAJ7AIhZcYBt0UEDjoIvkdacia7zwZgtA
 Kodq5mX64DsKQ7XZ+x+Mdc8TDfuZANZULFUDcATsc1Ybm1U49KksiZqlAfMtxOMyg2KQWgaNDpP
 sx24Yd6oEPJI+YwfAFzbbhubGKn+yTTf+RMpKlab5N5U9GOGcpxqfKrbOkQmShpPDoTIPPqrAd/
 +6wsrgZad1x40MofVXM4nAPYmOQj+0IFid23KWy+ghAKcrO0QyfthaP9FJaj8/RbrGctAwpP
X-Proofpoint-ORIG-GUID: ewfDrFwt4Ii_g5q9O15MVvPvTZ-0E-dD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_06,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999 impostorscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010138
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

We weren't setting the # of captured debugbus blocks.

Reported-by: Connor Abbott <cwabbott0@gmail.com>
Suggested-by: Connor Abbott <cwabbott0@gmail.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 2c7a52fb0b9b..4c7f3c642f6a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -438,8 +438,9 @@ static void a7xx_get_debugbus_blocks(struct msm_gpu *gpu,
 				a6xx_state, &a7xx_debugbus_blocks[gbif_debugbus_blocks[i]],
 				&a6xx_state->debugbus[i + debugbus_blocks_count]);
 		}
-	}
 
+		a6xx_state->nr_debugbus = total_debugbus_blocks;
+	}
 }
 
 static void a6xx_get_debugbus(struct msm_gpu *gpu,
-- 
2.50.1

