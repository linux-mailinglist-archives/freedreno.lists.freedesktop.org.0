Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 848B8B44AC0
	for <lists+freedreno@lfdr.de>; Fri,  5 Sep 2025 02:38:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16ADE10E290;
	Fri,  5 Sep 2025 00:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gJ0Gktzc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6096310E290
 for <freedreno@lists.freedesktop.org>; Fri,  5 Sep 2025 00:38:41 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584I747S012221
 for <freedreno@lists.freedesktop.org>; Fri, 5 Sep 2025 00:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=ZQ1S7RqBfWQLYYMNG1n1QH
 bTBVxy2xoCDvsUe2ZNd+8=; b=gJ0GktzcYf4HvI+MGTT4gqAMCiYFFojtqKgU9l
 y25gPSfo9ocuoB/gzNafYTZAKkl406vvvTGawoU5LNIiYrWzOnVnBFk0etWfe6z4
 sHi5jnHZsVh36WkbqroVwAuhDhqzSt+TBhLvSROD1O2lVj2uLmbnEDIl0rMUHkBm
 OO0g6IFgiSea+1ZY/uW8PRLcmP8NKCofbmFAQEL7RzMESdvhFDwXxdIlkf/5iyS4
 f87MVIqYvEYN77qW2fWmAa9PlFxGqHLrulGLoYacbuHP50DrGuVwhbFb1BuKmjBJ
 p3AkeeEr/lVdIydTae/qc5yFyCDO1Rx3pfyuX57wglqj2/ww==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj5pxp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 05 Sep 2025 00:38:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70faf8b375cso33115486d6.0
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 17:38:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757032719; x=1757637519;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZQ1S7RqBfWQLYYMNG1n1QHbTBVxy2xoCDvsUe2ZNd+8=;
 b=WM88VsU6CHqDZcsbl43/Hd71TQRVytXkCWrPuCZk7v2Bj/+DGPwK6QK1QfbdfLix6h
 sVrNv8merliqi6REzGuybFCJTe20gTDpUuoG668urGtKx+W7Cy3JMwAul//9PvNVIr5A
 3my3BzQ2fCTic7XpDvtoiksf2TENCJSvZ8S8jYkimAAHRgfpZs4dHVAJoltRJP7Wvgaz
 XrqTXsNFooVrcATkEQTAIQM9JXjZiYgTrVBMItryZG608VLuDWNUBtF1xl9exX0lUtQR
 Y5TZ27R+L0V3PeHrCAoMAuIE4ZlLCJJB0X/U3xlZRJc1aZBJ3npxdR9taN3DLHpgoE4u
 0lKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkxKrkQpV95m4DLI524YOBnP/7f2/quHiqkNkqI55niIUCxVHLsUZFfO6lsoLHfa9aQQMqlZooJ3Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAk7LJp4yOhrLjuaS8hnmR2vMHe6B5+kCYpSpOlqAmjOxyMhct
 IR9zdpABZhUYVwnm1xcBcHO/cy1YxqbsQ4Yuf9RaRkcH3HXDyBqEHbq+PHvnt69OE/sy9+CWJOr
 4bDNAEsZnQ0dqnnD6lyiVk1DMat93Z7aNcf7DQ0nLc6LQbah7sYEgRgE+r0BRii4epXDl5rA=
X-Gm-Gg: ASbGncu3K3LUedCtPBxtOdOzuhmr4cTyUm/oSa4fRt5K6avV1QfMX21pWJevKLHYePe
 QX8CbzgN/Orha8ANuPDVkdG5eG6YLZEl1nYHRYnlV7mGNFlZ6jobRkicviX12yigE44fX3dxO0l
 98gtVQ2yz5ypoVilT4FqQnIXOCaV+OeU5XVfSfaF145j8gmyI0UKoVJrygVr0UnD5qcB0DBqJRF
 W9xyX0XW9Q33ov+ARKmcJgttayL1sDwPP4wswLm6eHJc7GAzSEA/41Vl+LQpow74kDclMv6pkbZ
 z5CrP8UAv81N/OmFg46808vtihRhK6l3inlN1Iy96i2SrJ01ouKlEbTTRAhHEz5H1mXvAj7owps
 XhgIvR60Qlh4HVZk2z3jE38Qgl9xRD8x5YEnLJZf9MEGzqQd1zRAC
X-Received: by 2002:a05:6214:19cc:b0:716:ba73:8b72 with SMTP id
 6a1803df08f44-716ba738bf2mr270613926d6.19.1757032719191; 
 Thu, 04 Sep 2025 17:38:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH78jS1CC6gp64q9CeCchmxo9IKoMvJ1QZpZ/tTHVE199OLsf88wLnqSYWQo27SKv7RW7GqeQ==
X-Received: by 2002:a05:6214:19cc:b0:716:ba73:8b72 with SMTP id
 6a1803df08f44-716ba738bf2mr270613576d6.19.1757032718742; 
 Thu, 04 Sep 2025 17:38:38 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608acfd938sm1510059e87.109.2025.09.04.17.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 17:38:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 00/12] drm/msm/dpu: rework format handling code
Date: Fri, 05 Sep 2025 03:38:29 +0300
Message-Id: <20250905-dpu-formats-v2-0-7a674028c048@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAUxumgC/22MQQ6CMBBFr0JmbckUIaIr72FYtHQqTSyFDhAN6
 d2trN385P3kvR2YoiOGW7FDpM2xC2OG6lRAP6jxScKZzFBh1eAFG2GmVdgQvVpYoGkU1UYqqa+
 QjSmSde+j9ugyD46XED9HfJO/939nkwJFjRa1Pkvd9u09MJfzql598L7MA11K6Qv9ISfSrQAAA
 A==
X-Change-ID: 20250705-dpu-formats-0d5ae4d1a1b9
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1940;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=qW6/eOo9LKWtLOPcjncf4diY+DYlgQ8HDpWPicvkcCc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoujEI34ZWt8/uxOCCrSdZPDQoLW0OQwNEl574P
 Bda+7JrzIuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLoxCAAKCRCLPIo+Aiko
 1e3fB/sGKF68MD3l94OTzkHkplbqwsQrimwI8MrePyZDA0gRkuJ0n9rx+IjpmfrO6IfDDzUqKJa
 FAuZpjx9SdSP2qmXlwDXCwww4iSqrnFngy/BEiaY0RvhqeAFN7fY7pgmwBE8Jds1qzVyFexPbzn
 9CoNJ1J8JxNRWaeJ1t7HdF6oqTCH2yqYFkR9U2a4h5LhnNRIHXUtdHFX4wI1EMrb9NOjGphlTxO
 nS+YWShKQ+31Eqw1NDyUxyia5j/P2ewl4dS8WuqM8b0jcIPEmBRjXQb5QIZ53IYHBwxh8Z2/TlK
 U5CP94rpkwYGshLBdhDtsPIZ3EyA4siwQFts1f2UyO5toXTw
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfX3/uO8GN8x5UJ
 Z0ZXHJXIYfydMdDGSD0k7IjGH+8jH6paWrl+NlyHn6txd6FhBn/0bwsZmthCsGo1ADRqtNwE2+y
 KgIfAEdEDO1fnqSDeHEEj4cjra7ftDEhq8Ox6YyDPKzksCjYDXlUTG3JhiAfsxltTZPFo1VvkOW
 S2qgcz4z5fE6Y+vSyYai2m2NkQZblHH87w1+dLyCafVfj2QcuLRjT7r1KFTHc9WiMTVYNIFnf3w
 wZUoXOk6rDSt7RviiR6RAjEH04Jq+8bbC8Kszq3igRiz5ElN+iPs/+2tbmyARITmPfYWI6jSkjy
 wGzoIG6i2nORu98NPvWq1GuXo07MeU0JHjoheTSC4ngqv96MhDK1wallgD7iprv5t5eIuKGRled
 TH6di7yJ
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68ba3110 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ilABv6Z8GYNuw7svrMYA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: DSaQ66EAl5YZtiCHg9231fWsipYGVhEN
X-Proofpoint-ORIG-GUID: DSaQ66EAl5YZtiCHg9231fWsipYGVhEN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117
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

- Rework mdp_format.c in order to make format table manageable
- Rework layout population for UBWC formats in DPU driver

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Dropped DX flag from the tiled NV12 format structure (Jessica)
- Changed round_up(foo, 192) to the roundup() as the former one is
  supposed to be used with power of 2 argument (Jessica)
- Fixed undefined varuables warning in
  _dpu_format_populate_plane_sizes_ubwc() by dropping the always-true
  condition (LKP)
- Link to v1: https://lore.kernel.org/r/20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com

---
Dmitry Baryshkov (12):
      drm/msm/disp: set num_planes to 1 for interleaved YUV formats
      drm/msm/disp: set num_planes and fetch_mode in INTERLEAVED_RGB_FMT
      drm/msm/disp: set num_planes, fetch_mode and tile_height in INTERLEAVED_RGB_FMT_TILED
      drm/msm/disp: simplify RGB{,A,X} formats definitions
      drm/msm/disp: simplify tiled RGB{,A,X} formats definitions
      drm/msm/disp: pull in common YUV format parameters
      drm/msm/disp: pull in common tiled YUV format parameters
      drm/msm/disp: drop PSEUDO_YUV_FMT_LOOSE_TILED
      drm/msm/dpu: simplify _dpu_format_populate_plane_sizes_*
      drm/msm/dpu: drop redundant num_planes assignment in _dpu_format_populate_plane_sizes*()
      drm/msm/dpu: rewrite _dpu_format_populate_plane_sizes_ubwc()
      drm/msm/dpu: use standard functions in _dpu_format_populate_plane_sizes_ubwc()

 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    |  174 ++--
 drivers/gpu/drm/msm/disp/dpu1/msm_media_info.h | 1155 ------------------------
 drivers/gpu/drm/msm/disp/mdp_format.c          |  613 +++++++------
 3 files changed, 390 insertions(+), 1552 deletions(-)
---
base-commit: 9be5c47908e669db4934ef9c129b28bbc879a8be
change-id: 20250705-dpu-formats-0d5ae4d1a1b9

Best regards,
-- 
With best wishes
Dmitry

