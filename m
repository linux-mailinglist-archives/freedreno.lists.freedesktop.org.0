Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46739B0287D
	for <lists+freedreno@lfdr.de>; Sat, 12 Jul 2025 02:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D691710E3DC;
	Sat, 12 Jul 2025 00:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D1etFXxm";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09A510E3DC
 for <freedreno@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:34 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BLkdW5021781
 for <freedreno@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6E9jQkxkkxYeO4ddlwUOckDDTm7H+p9IlxlOX6Jevp8=; b=D1etFXxmHyKRaxoM
 bJ6v71QP1LS9plKKCo8Q5z1fdSomHSjeU5sXvAH31+/zLKrSb+3BZSlnXkEepOkO
 M0IFP7jSc6e8s47GIf5EU6+ZQvcYOxQkr2qawl9M+dtwNO3zclCcyUXlyM+fh3o5
 2NgpIv/Bc0UHfM7JiV8oaEsv9mLv7Kx+EjwFCYlN3N92D55XTekQp/D/c5+8mOr4
 FIGu1wOaLs5AS65CYX7KWndd4b2F4VUdVuDb3fnAC22CuipCTxsBkqrbarty0ikX
 EYu1q/8dZ6hbw5j7UqtYdE7IPriBYAlbXkktzDh6I/36h7BSbQfDtnImwQXKCWEn
 AdLOWw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b1b8r7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-313c3915345so3819197a91.3
 for <freedreno@lists.freedesktop.org>; Fri, 11 Jul 2025 17:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752281913; x=1752886713;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6E9jQkxkkxYeO4ddlwUOckDDTm7H+p9IlxlOX6Jevp8=;
 b=WvlxhgDxIfRIf29eT9RFdMdAY2Fs2MPnKyS2cDZ4ViIddMjpNAH7WCN+C6IvREqJrg
 C9xTrhyrlrgRdZQuQytqMzquBsJ0A0xMihJj3tjjZTv8pITvNMzjqgaR225D8Aa5PhkN
 1Hyben48aE6oXK0s4cY6hD9dOE+B1VrWKQsWoo4m0++hYa6uLI79/OlH67XEJrMgkVbY
 FFVHORGudb3bWMaZFBYjIzdlqbg1WtdgD9aVGPM3Fywfe7ZUq/xEmsvVkzgytMhlHCSR
 an10LXOWnkY6wJOsrIeMuGf2gLS2vYakN8fN5Yz+c9wxxvh50kGDf2G8ccfdzsD/pGFW
 wmaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9oZafO2znXjpR0btyTwV/cNuNfKQ1tJU0jdOLzfYPGuddRzre0Q/uqTozlCGYA6oR5xcogPlbheo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlwHJ+9vsI6ruxmbai45mp1GbYtBvyU69Si+c/V9bbLNZgJHzS
 WdXKhCFQ7Uu0uFP/glbkbGMxd6qoKdBLEAXxgPn9AqlufvUA0pswqMp83UJjCQ1U43MDPjRBs/4
 kj6+FaWEpDfj2+At4uGGvQ3nF4xsVggHjtprtx1PJ/Tri9Dpgc/YGjuGSmT+41WfQZ3hdzM8=
X-Gm-Gg: ASbGncsUjvJrFPMBLBXMaN2B6icq2H96/d/HKOx1i3PFiW9kLlayxh277XZwWjmz18K
 l09y47RHhhedjpX6aXdgm//z4zq0U/afodqrfs3vumq5iSNdnNKa1lquMNLXJ44nMA89ntHS7+9
 Z3TADdI2Byh366vTJWS8TJDgQ3bJq6sgxX/YznF4WUBC4f6S+AXAScXbLQ9yhmJ1fhexCpTIGck
 Vq1MYnCRil1WIswSy8fAKb1kUeJWCgzaBkpOpBxbk35Im+sBm6Eq4ohIwGDU9sA5DG+W4JO1Vpb
 aHE/kC27EtfwOgHxo5hEmcQF4LX89SuQrsmX6uQ1HviziSnZw/ODlnVTkA3YvORUpcnKjfzwpir
 0+LgORcY2duNHij6e777YqUMz
X-Received: by 2002:a17:90b:5708:b0:313:db0b:75db with SMTP id
 98e67ed59e1d1-31c4cd552d5mr9130348a91.33.1752281913148; 
 Fri, 11 Jul 2025 17:58:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGH+CvOT5H9SfPGFHjjQmB9x97tDpBw/QCMTGSPmn9BMA6KNf6NniFL89xp7m2bTro77IABpA==
X-Received: by 2002:a17:90b:5708:b0:313:db0b:75db with SMTP id
 98e67ed59e1d1-31c4cd552d5mr9130308a91.33.1752281912727; 
 Fri, 11 Jul 2025 17:58:32 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 17:58:32 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:09 -0700
Subject: [PATCH 04/19] drm/msm/dp: replace ST_DISPLAY_OFF with power_on in
 msm_dp_hpd_unplug_handle()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-4-33cbac823f34@oss.qualcomm.com>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
In-Reply-To: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=1171;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=mxuxQD5kCjtX7ioz+ogKfK2PsWX6uqWHqGDi2GAvSJ4=;
 b=i3MbKDvWRQHZ10SLpwW1ak3aD4D143rFZvveeCBQjFISiena0vgzQcKaOGa0JMSty5fsxcubD
 8vWZq4Aby2IBX1FRdivd9xC+VpVmwUM6m7ZVVPPv6VwZhleCEyjAFVB
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=6871b33a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=8oAJioj0-2SxPtK92HsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfXylaGOYuJXghH
 /Qof7eb0QVmJtYscMvGR+94WwdoCFhmRBxdUa+bT2mR3Z9MzHfKx7ykIforjg6veHp/8qU3u7WK
 TaggsBMS+Eu54pzuUft62BnFb0D0d3ykCUyzcFsNSB4tGGJXb+s3xHhZVumUtQ3KpChM+T4d4rL
 4hLKM4fqxYDojql6XZYeionL+Io5pdtyh5krq1gdFmYNabAQmcUfgfdsK4S9Kuegq416q6o+r5m
 3Hr4AlfYP5VWtbO3ypzg2VI4BAIosmoLHBZoKqSZRj7zE838nxY2qhEYdsDMsnTCkr5ejIidNZ8
 lN/whmd8EN6J/ZgN4iECW33lzDXzK6j7LdfOEx3hFTRQEbXBsZbzh36PP+dvLzr0D+fg7a1CIvL
 wGWlPYMWQWc9W3oLSvbuBKHwkPrnAWX+fv+uMRihEVmTPYHcOWtJSEs6bdH537L0nsjA6lTB
X-Proofpoint-GUID: oucxF6joVI1mR2n9_sF9skQhj2mersXG
X-Proofpoint-ORIG-GUID: oucxF6joVI1mR2n9_sF9skQhj2mersXG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=844 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507120005
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

msm_dp_hpd_unplug_handle() checks if the display was already disabled and
if so does not transition to ST_DISCONNECT_PENDING state and goes directly
to ST_DISCONNECTED. The same result can be achieved with the !power_on
check.

Replace ST_DISPLAY_OFF with !power_on to achieve the same outcome.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
Note: Taken from https://patchwork.freedesktop.org/series/142010/
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index fe38ea868eda..f93fbcff2cda 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -694,7 +694,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
 	 */
 	msm_dp_display_notify_disconnect(&dp->msm_dp_display.pdev->dev);
 
-	if (state == ST_DISPLAY_OFF) {
+	if (!dp->msm_dp_display.power_on) {
 		dp->hpd_state = ST_DISCONNECTED;
 	} else {
 		dp->hpd_state = ST_DISCONNECT_PENDING;

-- 
2.50.1

