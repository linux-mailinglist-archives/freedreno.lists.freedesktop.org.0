Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EAEC178D0
	for <lists+freedreno@lfdr.de>; Wed, 29 Oct 2025 01:31:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF66510E6C7;
	Wed, 29 Oct 2025 00:31:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CEkOydok";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gY/bIeIm";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF4C10E6C7
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 00:30:51 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJlHCg2615908
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 00:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /WIa6RkBloD5ztrGJJT0zLrD3gSyVrhoMmTumwjlzqg=; b=CEkOydok2jsuebK7
 kpCmaL52MeJ5wtd83KVpZ93pw6a8ivyGoAe4/IN62UwP8/CC0AvwFH31OWtXDb3R
 HntjABQQEzPVs6jIDdUi920cdXtHZUjmZ7vpD2t13AiUCb1tYkuM8++zHyqQyGz4
 VAWTqoL0HUBHbmw8jKPBQ0FhxLILRGO5YDR4dYOTSOHFpz+ib9IeEZk89HCjfty3
 zWOn28mMtKlB9l81pecqJPZpEsvpZTmrVxMVhZ5ywNeBqm/26CEHiwhbznmlnCJk
 6MO6Yb6K3aTwRV6ALQRiPldh5+gyok1mObEd2sD00Jw/z0WUPq+/L1XDlYcMDXwa
 O8EZxg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a0gmpk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 00:30:50 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-87fe7c9134fso38657586d6.0
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 17:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761697850; x=1762302650;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/WIa6RkBloD5ztrGJJT0zLrD3gSyVrhoMmTumwjlzqg=;
 b=gY/bIeImtPaMzQwAgY1gq7yezcSUHj4HPuYeLBiNm01VlM6jQ40NKHlz885hQXBZQZ
 z9BIKQ333jY/xFptycDaluoSbUgF89AaddS1rHbWbnSZljmfPHg2T44Au/yf8MM60Gxl
 lqmuLvMCvngCefw+DimwaX2iI86sYKiYApqRWvCv7nuJTkvTg+is6MXP8YzXBI4Fng5K
 afuVoF/cU2Tu2eNyW7+Qe0OlFeT+chdbQoqmzGqhNbc8Y8D35Xsn2KXMDjD2X2ItM8lM
 MJHMcdhHx8bnYMHOtgmMXGa3pzcDEdZVVECtFX8XbA8953l6x6o6Nfe3wwkkArbwP2Tu
 vdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761697850; x=1762302650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/WIa6RkBloD5ztrGJJT0zLrD3gSyVrhoMmTumwjlzqg=;
 b=BdRAgGmaWW08OAZkRp78eBaWRBPuTsxGF++Wj5lOHKPNPLQqocu6T0/WXmtQdZNblp
 O26QNempJij4/fU7OgTlEcJckFH4JsmOLoYxYOACTrqiHTdKVCd+TCd8ZqF6Vi0zVV7w
 D4nr7S48KpA2Ey99nP9fG0TIgs0Rg9SYOf2EagEFc0+grEFFzQzh0bPkPPwXNm3YplUo
 8mLa4xNH2lQRO8PyGlKeDgqTjmHqa9ikTr3qwnAIzQMi3D7LKuw9l8aZgQTEW/ZXy3Sl
 QFo06D9mL+GaYPAYHkvhOou82FA0/sPOSuRByaYmjTZMAs2tGWWbXrb7+ladtJhHz97v
 ST9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmcXaMJM5QC8uuDIgRBTEjJwKHf87hV2sKBAdVzF90T4o+ZwiauydtRV9pFbpR8ouvU8V3hWP4iKU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjGyNSgqffoCuOhVS/4ynawJZ2/wyRSAQ75uOOZKcw8f1UMIdJ
 b8IxRXHDA48o41ugNwyZEV9FRvp2htyWz5Tq5sJXVtaBXXTT4tQbXwaMndeat/HbwgkIWy+nclc
 ZQWmzphDMCL451Suxf/zbmsFc2QE1n4pVm0b8BSSqjVe25jiF25bnpXN+x9UMYG6pOyD7a9g=
X-Gm-Gg: ASbGncvXFYMEEKsWPtNLfdQjODe6yKEwG+oH5fCvaBY5Cb3P1iNvPkZwIlAqydzNyYB
 S75XCPGcX92EfE4RZ4Pg97tfz3mfj7lG+wtzhMAHTo+r7cSFr3QI0Gg2KBRMe9e3Q8ROgOvCMkO
 7HGhhx/8MVQOEoqBbCY201kP2ueGaQWsbktTgbuEOnOm/mNklefwHIh6dwcImDaYadFTyPRZLZv
 p5rF3M3CluvxklSBAqgN2DNCqz7IsgKWhZnN6iUNWAFKlXcKkfj13wWZVahRWBHoLzBFivMllbB
 tpIcDV7oYYLre1gMk7bBSxMOGRRCfGeLMd1btscFAPLzFTxYep9OOYzvFuuVTqjKiwIFMwXXgin
 Sk6n27xJNKiq8Fifj3sULZF+kArU+xgIRAmTEPlVwj2nSuD+1z9bcxuktgvnSTeDKgL/VFxaUX1
 em9Hd7iOXrvTWl
X-Received: by 2002:a05:6214:d62:b0:87c:2805:9fa0 with SMTP id
 6a1803df08f44-88009c38648mr13964906d6.65.1761697849637; 
 Tue, 28 Oct 2025 17:30:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSnLbnquq7Efq2KCwiEYWEnFhYg3Vhkyj2eKpcDAg1Bjm2R9tCzuRidVUDhLFOw6pKZFqx3w==
X-Received: by 2002:a05:6214:d62:b0:87c:2805:9fa0 with SMTP id
 6a1803df08f44-88009c38648mr13964546d6.65.1761697849177; 
 Tue, 28 Oct 2025 17:30:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378ee092042sm32141621fa.6.2025.10.28.17.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 17:30:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: dsi: fix PLL init in bonded mode
Date: Wed, 29 Oct 2025 02:30:42 +0200
Message-ID: <176169780826.3761968.3488141100025074954.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027-topic-sm8x50-fix-dsi-bonded-v1-1-a477cd3f907d@linaro.org>
References: <20251027-topic-sm8x50-fix-dsi-bonded-v1-1-a477cd3f907d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HvZ72kTS c=1 sm=1 tr=0 ts=6901603a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=8BgOjkq8Mluc09TWGxQA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: ni9OHDPi5ccuyndipmPfOoXX1NV360nV
X-Proofpoint-ORIG-GUID: ni9OHDPi5ccuyndipmPfOoXX1NV360nV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAwMSBTYWx0ZWRfXzOV+TPkaRsWd
 ZL7fEOGpkYHX6bzpoGM0cfkpJHCRDLKkvSif4W0tGNLxLaUwGctdvJ6TvbdJoq5IZhzeAXfiO+4
 dbHs9Y1VFtYTuOKJ3SZD9M1meiVpeY+8jiOb+7vfWw+b5FpUVmtijwVKmh4cTxXQzOcNwmNcr8W
 tj5IlSzZ1jsvlnf0u/iaMILxjLHLhQSYp+6jJLb2C7CoWq+qWeLeVtbhhA1wn1KpRLYr+l8h23i
 T6vSatG3qvRAdarFlsAHOQUShSOW9mDL7wD6M0n4Dc07JlRNWngkN5IOkLruH2muQMD7/XJTU4T
 1ybDTLSF3cxr6GKJppJMBS3PQL/12mJgT1yYu1gp/G+1vdEQV9mhStWECbvlPBlYluySZWBU15P
 jRHXaIP7Wk7gOENVCfT84/U7Lzsqpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_09,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290001
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


On Mon, 27 Oct 2025 14:09:48 +0100, Neil Armstrong wrote:
> When in bonded DSI mode, only one PLL in one DSI PHY is used for both
> DSI PHYs, meaning that parents of the secondary DSI PHY will use the
> primary DSI PHY PLL as parent.
> 
> In this case the primary DSI PHY PLL will be set even if the primary
> DSI PHY is not yet enabled. The DSI PHY code has support for this
> particular use-case and will handle the fact the PLL was already
> set when initializing the primary DSI PHY.
> 
> [...]

Applied, thanks!

[1/1] drm/msm: dsi: fix PLL init in bonded mode
      https://gitlab.freedesktop.org/lumag/msm/-/commit/93c97bc8d85d

Best regards,
-- 
With best wishes
Dmitry

