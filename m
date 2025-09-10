Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 424B6B5229A
	for <lists+freedreno@lfdr.de>; Wed, 10 Sep 2025 22:44:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2285F10E9DE;
	Wed, 10 Sep 2025 20:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pBP3A2xh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF0710E9DE
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 20:44:49 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACghXP004095
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 20:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4zEFniw19gi8VanifAvhqImkhPqqb16gAdVe5GvYgBk=; b=pBP3A2xhm/9Vc7b7
 5XvUZa38nD1PWzIpkMiggd2k3I4H5/dUjVXSHb/Csi+n5GghLhFxRIf9yJFj2Pgm
 dDVzvSmugP6DC6MjPHamzvuHwEqKXVROzU0rgxULgwGVgdOCxa8yAGaQHDgtfI4w
 /IPzr41fwgT/BK02tW5cMZKoJ45x+szN1rVh/Itb6VZMWGRSyWW3sXDRBppKwMW3
 5QjdelzzVWzWzAqUM6tKBxq7qVWCqQ4QJ8A1yJer/L6z1Zi9eEKtOGcCkGzi9QNR
 4qZVdoOZxB+46vtJPPodVPeeMYy8tn8reprRI6w9TQeJjXWQzbkD7z4+hP5Zezkl
 4twIoA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bwsdctv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 20:44:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3234811cab3so8373253a91.3
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 13:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757537088; x=1758141888;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4zEFniw19gi8VanifAvhqImkhPqqb16gAdVe5GvYgBk=;
 b=lt2MnVwUDf6t5sQ15Hzbs/JqutpSXcNiZl/5Tc7I+XLiIlhLUnpgqxhrNVnuieQg8k
 +5N3ER2oJ3VJdR/xHV6XRvQCeDUI7GH6vWHwMIaouaFEds14fKEKwDxCg5z1n28kRCaS
 4BpXhfHju4HvpoGQR/AVINOp5nBToUXZxLEMmRnm36pCniVeTjpPjx7zmONWR4NcIXs9
 XOkFhO4Fsi2jPzS6lmzWopTKZyZviNk6GUsRKikiCTkfV9gqyOqL/ndm2gnVk25LV/jg
 7qHz4JARzTGWnmWdS0KM60PFYTKtiWk6xd48Xhj2B2Sz/a0YwcoDg24xyl1YjU24pLVg
 3bVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5HWJ97L551LYDteKPXurs/SVi5ZC/BaONGLZWcrspv07adsGViktxsJP7RUM3alRd5+x52YlEOSY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylGIxlAzASEUBltIthIP+QKNf6O6s8Gj1d8NlIuMhW9nBYwqhg
 mi6dQiK4oiZf/viJBbbjUPSbTkCdMxhlNhRgPLMG1SZnM2tFx//m6n9C6eO86QC8EZt14d6K0DC
 3PiwHgBOBcaafOFgOVm0LhLoJ3O+5wtFDW754QFpYrxT5/NoimCz2DylCnr7RQiPWLkzFAzs=
X-Gm-Gg: ASbGncv/62z1nCqk77e/EVBJVX9RkDa0TL30Yswvzh20qBPk1jvZCP7dDqFwDxE0Ucc
 5bS8CUiqqoG5w0E6AKigYfPhfO3SJz+8TTbTqymhZfdWnPJMcNGmY0HwK0VUh+iyLhqoGZ8c3G8
 /u79C//0qG2sm1YnV+vZLefqNb/r+GIgoAsXhfUj3b9zaaCr4a0QnovOo+mB+4S9jVvnTJJwsX+
 AQy311klUQcVB8OPlQF2DzMjCJldANsvlHBIC7onYA0SjClhbi65WglSlbXUuJLmWYxvMIvBGcN
 q6mlzebW2OCZncBnZFKY/UoWZuR9fKtmzn6fUROZGrUGRvaHrTc2bbwDCh8Vj/oI
X-Received: by 2002:a17:90a:da88:b0:32b:97ff:c941 with SMTP id
 98e67ed59e1d1-32d43eff6b4mr23734447a91.12.1757537087777; 
 Wed, 10 Sep 2025 13:44:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5JeaHP78+QQF8BxRzGsrY0698vqlF2QsnYTCp+u1b2tpPw9ban79zLcuyfYHCSYie5Erv5Q==
X-Received: by 2002:a17:90a:da88:b0:32b:97ff:c941 with SMTP id
 98e67ed59e1d1-32d43eff6b4mr23734421a91.12.1757537087342; 
 Wed, 10 Sep 2025 13:44:47 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32dd61eaa42sm46771a91.5.2025.09.10.13.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 13:44:47 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 02:14:07 +0530
Subject: [PATCH v2 4/4] drm/msm/a6xx: Add a comment to acd_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-assorted-sept-1-v2-4-a8bf1ee20792@oss.qualcomm.com>
References: <20250911-assorted-sept-1-v2-0-a8bf1ee20792@oss.qualcomm.com>
In-Reply-To: <20250911-assorted-sept-1-v2-0-a8bf1ee20792@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757537061; l=989;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Cc+w7MVJQJo0DUQb98BGTv/aakQ6gRVawbdf+TbmC+Y=;
 b=xWRPiIINeFvdpTfSw32jFQ/B9ZRSd9C0TetdrhgEBC7bIXtv5wFHq55xcGfI/ke/rZBcT3KGu
 bc7geSlPkQwCgsmEfhFN1DFSV8/fZ/hsq4a7zWaKlTfbN2ZoQJ+3FtQ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: 3TrnF12Uz9LXRmdfHoswES2ieeqtEaEV
X-Proofpoint-GUID: 3TrnF12Uz9LXRmdfHoswES2ieeqtEaEV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX8rNvFf4vwPE8
 g07qB/nojp25J3KsVgIc4fYbFFZT43lT9G/9Ap1pak5oC63atdUZsLitRLbPRg867qNlJ2LTaum
 VvIYQofgxHoJizMbaO2VqSL7aoGk5OpSH4RBnWM2CbdE/rJ79CbLKzVYmMwILdJ/g9NUk1u3/IC
 9qbznsA37vWalhyLLOCP9E56oE0Bp2TJo6YoCPccrDB9JkiEKABHJrqL7qI12m6gTTyfAcLbYxI
 m0njrbcQk/lm5uAafJ2K1bJUaBB20yWd+ViBOLub5u9OFQDV6U6m2vvIfwGd2drBJPKOUjqdA6I
 4oGHXH2nJ/xFBTpff2etpKqmFyTp/FePoZn47UhR49HL0ClTR52Pl7f6kKHpXbmL7neii1UCRfc
 jmvDq+Er
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c1e340 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=p01HAiXOVyKYB5BxCaMA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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

It is not obvious why we can skip error checking of
dev_pm_opp_find_freq_exact() API. Add a comment explaining it.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 4c0510cc784864da990af8cad086176a5d92ae8a..f81e28fb6f2ac4b1ac15fe50cfb488572009003d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1695,6 +1695,10 @@ static int a6xx_gmu_acd_probe(struct a6xx_gmu *gmu)
 		u32 val;
 
 		freq = gmu->gpu_freqs[i];
+		/*
+		 * This is not expected to fail because we are passing back a
+		 * frequency which was retrieved just a bit earlier
+		 */
 		opp = dev_pm_opp_find_freq_exact(&gpu->pdev->dev, freq, true);
 		np = dev_pm_opp_get_of_node(opp);
 

-- 
2.50.1

