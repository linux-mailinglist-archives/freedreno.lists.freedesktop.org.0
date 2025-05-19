Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E972ABC3B7
	for <lists+freedreno@lfdr.de>; Mon, 19 May 2025 18:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6762D10E2DC;
	Mon, 19 May 2025 16:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MlCcQVgr";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D600510E3A3
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:05:21 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JFUQx5022850
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aWCYVrEOdgn0YXXrxgnbqeolLsmmtMUaNpkzWfiOXzk=; b=MlCcQVgrCh/zQBVZ
 p1sMHcEbsFpAUzSwCWUndtM4MVuAIJ1hD6dQ2kWqaG3h3ZPbJFhM2p7g/d7dW3Fh
 67Do7yKIor3TP1c42oIO46GwA3BaNWNcy3WgISuypR2EP6Y0RdIEYfN5slf3mZHi
 YsbygYecViZEJpe7lZj5YYfW8oLwd2Gjam+r803wrpkvHMenygZMDz8lYfqF6TUK
 f/mXQi5ZGEPf6oFCPlpNcnYC7Z3ydN8+C3voLErQ5Bs5QXlE3+YKaMoyKxzTzKf/
 zm7gNTvOWWWL7PNYawgEH9S0BbjlbE1eMhPKVz3evRLvWk6fDYwRp6lqkmi9+Xix
 vFdVIQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041sg4v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:05:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-73bfc657aefso3366129b3a.1
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 09:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747670720; x=1748275520;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aWCYVrEOdgn0YXXrxgnbqeolLsmmtMUaNpkzWfiOXzk=;
 b=hmV5Kdf6mqo5560OU2ixjF3PnEHcgJ4DmT/SXq7f/7YSgoaU3sNpu4aFSOhRmB6SKA
 javf2ERwYaJ0ofRBVAtZFeQFp+/LIBekUCPXu3ZsBxWeJk+TLwXl+r047iUK6fWihe5G
 YEvHZJp7ftrX27PY7FRg4ee1TOHbeIb5xTgFCmjOT6yreBBVWl1zRHUaeHlRzV2rpAY2
 /eTHZsHWm3QoZCxFWkVy6EMEIaMJTIAsW3JFPNNKN8ULNZ4UdlK8dX/+2IpHg92fqxOX
 pwSB9dGjYfudTAygGP7uJ8pb7O67y7zJl0Yi9jB89Yi0D4Ias1NQEqwJVqWdxSD8ru3y
 G9Lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSgx56f1PARd+B+JNNTOe9ug+pEhA9etUpcQKPw7tu9B7EO82yhTI5edXLb8Dj9/gdpBZ3trM3eec=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzICkTjcRW6cSdUNoyB88djbFWkPWPB8kh973NesaZoFV/iTBq0
 We99aGEU8KcsoTD2R5m6mfSmks3ppkl3x5ctnvpwiRW+lWw2NDazHFIciqCd/7h0Se8CiVZEWAB
 QSV+PSkdviTbm6Lhy5LcXHpjPACr6t8FUsE/4E0ZaKxH/9wO3lEcvbBNEMq4w4nq9D+R3blA=
X-Gm-Gg: ASbGncu16fTkwsHLK6DlfvepVm24i+f6FvRDJ5IQyRMa0hrGKduKF6755Vqg4hj6lr8
 wj/fr+r7MvbjOXWEECCDvvuA25mJ1rnAd56w5euGapPm+S+jLGbozMY/htcRVDeDG7Z8LPUeIhy
 zsGBgOiuoTuvWpKegyvhEdcKNAXwRt6u7CFfrxXrBR+SlB3Qfh8e3tGOnrgsJgwyIms4I3oLWM/
 wjrIu1uANM2vrk9j2aAfEqZ0BMvfeNxOZ0hTRhxP66vL+vyL1W5JffrkWiRmGY4ztm1+mrocrMq
 Enwgg5gN7mJ0PPCVSTQXYUDVvGV6ScOQV2AVGGdtBa6LVgpn091jtWvHmXzv1vZQKkTefipigHd
 fCy7qS7X2dd608X0VJCavpZlo
X-Received: by 2002:a05:6a21:9183:b0:1fe:5e67:21af with SMTP id
 adf61e73a8af0-216219d18e0mr21996851637.30.1747670720439; 
 Mon, 19 May 2025 09:05:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRGw+2xgpgtgdFOPHQKkmBXnPLv9iv9BYNbokVamaYo0cwZzI9+rfZEq7etlPcP7JKFvfusg==
X-Received: by 2002:a05:6a21:9183:b0:1fe:5e67:21af with SMTP id
 adf61e73a8af0-216219d18e0mr21996802637.30.1747670720058; 
 Mon, 19 May 2025 09:05:20 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 09:05:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:31 +0300
Subject: [PATCH v4 29/30] drm/msm/dpu: drop ununused MIXER features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-29-6c5e88e31383@oss.qualcomm.com>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
In-Reply-To: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=dxmFi52JXvJ1CCkpTL5KufBplkJro3M21X2ntMDmC8s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z+0x0FUsHIrIe0Eg95z4tvJvjpvHMbEaErh
 VYR6GD3cX+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWfgAKCRCLPIo+Aiko
 1dGBCACT/MY/vz/hMHTlHhFJBlS+WzI1JAEi0dsryovjblh6D5tWPLnsfC1quu2IqIb+e0xkrKu
 cv0NJxNDDZFC8wPMMdvErAlhZ9IPICyuhAeGWpcSKRqxUiIPkhjYfVmYeZs6t2tgh4ZYvCl/Atk
 WsRltJdOxYgLGwEiq99ie+NLyqGPBQ1TS6INtkAToXrCuzWDG5Q8Rk27eobt9dT3Aq1Sozfd1QE
 3LVnBTyL28x0VRyIlIC5JpicKU7FI8v/D/kJawLOCcQie4QbyKT/+9CPWjreSdFYPlF4ti9S8PC
 OP/xhMBx7cTX1vxSfTXqXqAgqId3jZpDMMmsZ15ELCbIGYbE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX8KoOT43Vgg36
 FznTcLJ+cpGwBw6xZg85oLdvpRgaJuizoMDAtcrIwgwBv3K5gGbPjEMA3TTNcP4T1R7MwMEhbvO
 XJtySCOOmNJcqMrqMdcbyA/e54f3hCsc9ZH07bAxJ+2Kh0miCWYTk6fST9qDMob8zPF1mbdxH8C
 nBzs7T1k5F2HtqbI/9bGFQzEyT/3LPtKPGQJJLUMQwcAPGmF1tnBU1DkN87sw+Nkw7m/R08bdui
 YyH0fHnVGd0Tn+TBbKZCzQYtMRo8r1q2VLYUNNr2B01gpdw+CClS42lP7pDuyqpCEm8Z1+3ms6p
 59zZVKbFtJnfy0nYbcIxU/s392iB4fOJ1gtywlscn1WImAnWmAJr6fberYkGcFv2nA5iTr9dvtb
 SNrhvbYpwYXdzT9xZHAfxNJiX4TzpwTCxzXlElp2L4+7FzaswXwOPwuLOIaVYa3Q6MDJDOsV
X-Proofpoint-ORIG-GUID: 9NKHi8teelaACu-qP68YX2nZwfnqwdto
X-Proofpoint-GUID: 9NKHi8teelaACu-qP68YX2nZwfnqwdto
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682b56c1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=87smWpNc5u_ETeg062IA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=919 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190150
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Drop unused LM features from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index c1488a2c160b0e2ab08243a6e2bd099329ae759b..d51f6c5cdf62f3c00829167172ef6fd61f069986 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -66,16 +66,12 @@ enum {
 
 /*
  * MIXER sub-blocks/features
- * @DPU_MIXER_LAYER           Layer mixer layer blend configuration,
  * @DPU_MIXER_SOURCESPLIT     Layer mixer supports source-split configuration
- * @DPU_MIXER_GC              Gamma correction block
  * @DPU_MIXER_MAX             maximum value
  */
 enum {
-	DPU_MIXER_LAYER = 0x1,
-	DPU_MIXER_SOURCESPLIT,
-	DPU_MIXER_GC,
-	DPU_MIXER_MAX
+	DPU_MIXER_SOURCESPLIT = 0x1,
+	DPU_MIXER_MAX,
 };
 
 /**

-- 
2.39.5

