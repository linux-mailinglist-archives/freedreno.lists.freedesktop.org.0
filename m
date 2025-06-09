Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFDFAD249F
	for <lists+freedreno@lfdr.de>; Mon,  9 Jun 2025 19:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D6810E41D;
	Mon,  9 Jun 2025 17:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OQZZDwDw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3848610E14C
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jun 2025 17:04:50 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599KOWE011931
 for <freedreno@lists.freedesktop.org>; Mon, 9 Jun 2025 17:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=WuIIsoKWX5Iho8vmFa7pFGwc+MhhmWxMnCk
 yh8rjoSs=; b=OQZZDwDwH2F2uj8Ad6YMymHUDmheYoaaXO/AFlTxYlg/B4Z/kgM
 5FO7BgxoDHXIif3LYm8TfDLoPCYj0N7ZadCh5oVK9vIUFqyQbDriNWaiPlqa5NjW
 IzjMdYxVRxWmz4qfz9qBRWzGHpDhyX+OgCTtYF2vEwG3vt5UiWvGt3Woc9EXG9Hl
 8E2FcXOur6O2kma3J9eckjkv9/vfVJxmhKTMt+4qHXfi0GNEoPz12Xzs227szkfp
 iJeK3dg7u/WAqNcW3ttNryi5RTtLogzlGvYSNu5HEfZfgGdL5zQOrDO+uujZ2FtQ
 1sZ1mK+TVgv+wYBQYZhzq6+sReCnlPe3U9w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekppf3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 17:04:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-23536f7c2d7so70626005ad.2
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 10:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749488689; x=1750093489;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WuIIsoKWX5Iho8vmFa7pFGwc+MhhmWxMnCkyh8rjoSs=;
 b=HLRZtlIwtxvb+gB+tuV3WQKsdtmABVyDhQ8+JoTvQybxFwmUjNlZuLRVTsVv9CmzK1
 Baa93O4dTf5EjUAFmCoet/5OvwVkznDkJcTHIRCh6l/0sT1hpoJOA4hpsQQcWODhjZlI
 pltEXJ4z+AB099HuV+euKc9ij6bZaYjlovmY7AemOyTD2J2AMiHO2P1GD5gkkl8tnJRc
 Rd+zx/zgTJRMn6IsVb+36pXkvzCazD2o2GtbATql6t8mdVbRfs3H3S0y3kLEEhnqltlX
 rxCwKkELK+ikoFhFXn/8VBsJ8ozCyt2eUWj0YKrrVU+nEf0CcerfLrg6iVz1gA8GQalE
 QdFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIpYjqQWXDppyXwHDJeajfXIUontCyiPI1z+vMZ/wIU461Sk0MMHScu5tnJFlYzI1sL7p+b7K9T2w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtvweKoRZ2YpRtUKjXLVH2a+KKdrBeZsJknnmoIm/NuklyN1VI
 z33dbtNLJDTnVLROXFIZIxUVqQBqeBHS3uJSf/Ap1hdom0crWA3+5PS4iQZnycGwfaCB02n5RRx
 ToUsXMah2dIp7RlG8OZZ2NBeEMKKloz1GSoGn2Z6YRCi1rCMHIX/dvEmVUgJjnwOL8nPo3YI=
X-Gm-Gg: ASbGncteln3pV63otAEUmoZR4//tv7/XxwHu5hUsfh1SpssDwHwI5PNLoFeAYeH1egg
 9/1eWjyMy9Cfue3PNJOb7s2jKQtr4L0ySx/w9Tx4d82VOLobGCxN47TBmI/fKMADvIQ077/Qw/j
 rRqFzWobV1su53SK++5rXDC0nYwZiwumZJwAdAskXyuVnlWS1WLZml8JQkFuvrliASEo9WYPwSQ
 4No25vKc+LB14tB9CxEOGWnhDkVhW1henWF7WPVrjmv/8pgyUcCLXxm0FjTPKSV11oTX21ST++s
 4xn2K5JeSEEeJIBtFO7aGEVun/6TwT9g
X-Received: by 2002:a17:902:ec85:b0:234:a44c:ff8c with SMTP id
 d9443c01a7336-23601d080damr167971635ad.18.1749488687109; 
 Mon, 09 Jun 2025 10:04:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFci88ZKpZFhTl9ad+qroQOgRxzN42L0DO94tMutIphra2Ct5pxyLzpOzusnoBC5stEEgN6GA==
X-Received: by 2002:a17:902:ec85:b0:234:a44c:ff8c with SMTP id
 d9443c01a7336-23601d080damr167971285ad.18.1749488686715; 
 Mon, 09 Jun 2025 10:04:46 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-236032fccc4sm57380505ad.127.2025.06.09.10.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 10:04:46 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-kernel@vger.kernel.org (open list),
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/3] drm/msm: Better unknown GPU handling
Date: Mon,  9 Jun 2025 10:04:33 -0700
Message-ID: <20250609170438.20793-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=68471431 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=JEju956KdHHbcqjs2oUA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEyOCBTYWx0ZWRfX3U5z65ppFR3d
 xcYVtYwF7Ol+lIM66aD9xob38R0KRfar5m/+4M0HUfiBENfz6TJtKfs+KLmygMds1OIvmS3c+fY
 ttG4MY8tEl/qxZOFS6zEK6Zj61ARQ4kHO09hLyz66B8sE6AbxhAlqmH6f/S5ackFjENpnB5WosE
 DoANmybjEJaE+f/ppY+oBINHgDcxs8q/kzm2p8VIhDOlbPWFa0GTNos6Pi+hOMeQpnGV+Y1XrzX
 TLqZT24muZ884GaiKgMCGfvuXdfTuvovJ4SzPTC7k50JtJl1Ex6Do+538aujmwsJUp6NZHRveIq
 XqK6szr9qoSbJCDM28rDi1zotw/EPVQo5CuC1AyAUoC0hOzZmjeXOvZwKopvO2GMHm40tni7C8y
 shcpqXQyQnuvBqoIbU9xQ933NmtYYlVMiHmyeWVP4iCxGqU8cREO83VcuTnp74Lvkos5dnrc
X-Proofpoint-GUID: ayN-I6FKiPjKW0MCu0z5yK2eKamumh6m
X-Proofpoint-ORIG-GUID: ayN-I6FKiPjKW0MCu0z5yK2eKamumh6m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_06,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=711 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090128
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

Detect earlier if the GPU is supported, and skip binding the GPU
sub-component if not.  This way the rest of the driver can still
probe and get working display if the only thing unsupported is
the GPU.

Rob Clark (3):
  drm/msm: Rename add_components_mdp()
  drm/msm/adreno: Pass device_node to find_chipid()
  drm/msm/adreno: Check for recognized GPU before bind

 drivers/gpu/drm/msm/adreno/adreno_device.c | 39 ++++++++++++++++------
 drivers/gpu/drm/msm/msm_drv.c              |  6 ++--
 drivers/gpu/drm/msm/msm_gpu.h              |  1 +
 3 files changed, 33 insertions(+), 13 deletions(-)

-- 
2.49.0

