Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9D2C858E3
	for <lists+freedreno@lfdr.de>; Tue, 25 Nov 2025 15:50:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D5210E280;
	Tue, 25 Nov 2025 14:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FII+UDTF";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JGxvpCLi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F7B10E280
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 14:50:17 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5APA69Hw1847635
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 14:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=NBjlQMU//RTWAkorh4/ODMcv
 htK3cHYCP7D184dJl64=; b=FII+UDTFnOL+XzmBc2WkRkBqT4Ckn0ahpJef2xGO
 RTXZXUZ3Bbxji8PSpJHya4wLhdryyJq1TPxxm+i0kgpRf9GKkMW94sbFH/UGYwaq
 5TGChqDK4RSAS1k04F0wgqBGnrN0pIAObpNaQtFMXW23kexu0v6rzurXbIJocMxY
 lH76GuL6SBbLvSW1be+3eNu+2GM7s11u8hXRlxNLuj3lEvMwhQjRq5RtvDfXjwDE
 +Y3gu8vD7rLP7cdVuwduscn18GlmtK/z4Zr9mWvT5vacerwvk6i1ojCOIkidKvV/
 UZs/rGCz6JqO0w31oN1MwHL17gBYCwyQYM7og/Ir42ggbQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amu6qbexq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 14:50:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b29b4864b7so415676785a.0
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 06:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764082216; x=1764687016;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NBjlQMU//RTWAkorh4/ODMcvhtK3cHYCP7D184dJl64=;
 b=JGxvpCLibC88D3pq8TB0Oq51xVYcUDZrHHs0KCzsH4vOia2ddvt5l18DRYoRjmNhQd
 Ze0ojSZB2G3htNGm0tfqcdyi5HKqM/4fMh+xBGcrZ6elw1rGYzMIpai2YYfzZ1FyEziW
 DP0M96l7rx6uSSfeB4qquS8udmyHYz02f4+FBojob/PkPxv8cAH/XwOcsSFzBJ/XUZFK
 0p5BjyrwmRjg8mX+is3lP5VG8EouZBLP8TghrhzKervHRPCZhufGCSUNLXoIKVI6xI+C
 9tlOu4O4izrjglo7+YfX2RC2e5BIaNNMUodOk6/Wax9fEbBmm5dVl3RGJHFaXIWxPYfa
 1XOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764082216; x=1764687016;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NBjlQMU//RTWAkorh4/ODMcvhtK3cHYCP7D184dJl64=;
 b=O7UB6ZRfAqt86OCifttihMs6gP3u+W9umMAZFZgEMk7wUe42A8M+RFOJ1uFZlBaekY
 V1Tg+H36RR9/vTAkCBEpd6MEVMr4/QzDGEIx2gsgWfFFGeQ2QJdrpOixMeNoVBDfUq4N
 5+QAn17M4/rF/kdeOVxQvnWUMJsyPhVvFTzWoZCaBIIxjVIHc67nOHoRmzYzpDISpU8N
 3PEU/Ilt/LLhoiEEI6mkevD8MnywDmcBw4gn2BU4dFNf4X530lr6x5/pPL1d3/LLzNLu
 2h1hCa5k08RRj4tFjlRnWjk4GePAT177aK6O1WT4ndT+SAW/TAFambnwEt0EyvNRmeg6
 V3+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVZNuhpcGSwqktDFRYVUZ/kb4muC+uSfTQv6GdSvHxtjcMCPpEDJluga3WO7CURAjdHayIlepSdHE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2e9F37TVfh5lrKqKUmHrEqs34FaTxa/IRqouSXQ12JMa8M6Dg
 j1CnIP8HdXMfzrM96V9Fr6XBP+7WpxM9VrewsiZqo34zG8eKHlwicJ4IyXND0GJIvqvRHM/L5uD
 KXkUXvyYNDrZS+i5RqtNi7mSfF7F/vnQDKl+isSlcrazmC3immpmDa7vfnmN7UsQzGYdVAaU=
X-Gm-Gg: ASbGncvUkuaFX4l7BjgJKhUVC80bzRdn8ZFdxewydj1coPtpevEVl5Pv8seMgYYD5bF
 50TkgVELAbCr9OPPQUe2pYIYBw8UUP6r93af3x2ptcyLtGfoSwqXhNuxsa/v16z5fZDzLIA6SrT
 sRn2u3AXh/Qn7XA/7WDwMb+mYpSvT+Na4daYXtSatzkMr+4qk1y1GRxf83kV4vGAg/g6/wGkPIZ
 XD1Tp4nqtb870ZAAYr/24x4YIIeghBN18G3+68Y9QowTgI83QxAps4LeDS+YpAGaCC14MVB7hJe
 lTf7YerSmrSJsSn0n8mcc0aVJypqOD0suKxONoa1WHKgvGhcu4D7e41UBJ+hlylH+ZxCSaz/9lx
 98tzLqLXLD111iHCeP05ld66dJs6UybUx7ktQus0WZWAmsL5CyyT5G4/PR3XFiI+/jKZ1ffyFjp
 F+Wyx2tQ1345UZnUddDTsBPAk=
X-Received: by 2002:a05:620a:179e:b0:8b2:db27:4270 with SMTP id
 af79cd13be357-8b4ebdaebedmr371471285a.48.1764082216343; 
 Tue, 25 Nov 2025 06:50:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF29JMf6iwu0/+APrErjc9cNvPpPDSPcFhWuKVWwCI7iWvjXvB2+ZefZmNClkzhF3y4wOuO+A==
X-Received: by 2002:a05:620a:179e:b0:8b2:db27:4270 with SMTP id
 af79cd13be357-8b4ebdaebedmr371466185a.48.1764082215881; 
 Tue, 25 Nov 2025 06:50:15 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969db81b1dsm5069126e87.23.2025.11.25.06.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 06:50:15 -0800 (PST)
Date: Tue, 25 Nov 2025 16:50:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: Re: [PATCH v2 08/10] Add interrupt registers for DPU 13.0.0
Message-ID: <5ncorvgosgt3w7flwtwpnsw7hg2js6inlyfmidds3ozt5uk3gd@7t47ilh2jtwq>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
 <20251125064758.7207-9-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125064758.7207-9-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 9IBKg6mfU-D1uSw2psFDCZx-7nsRyCu1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDEyMyBTYWx0ZWRfX8PipAiZfYh6O
 vHzC0b0iJuHpQ80A4lyhmai0L8VX4BToQu+fiBckLLoCdRMnqg75pLcSC4zCCnt5jwX9BYXSqWL
 Vs4l58vBXMbiJ/1zOcPaTDSvLou7XZjLKlwZgzHu6KlArsteKrbkufoPnmicnEUooZC3vW7FTWm
 zN0qClfYqUGdmW8++sOsV+Q1/JvG2b/8P5qeiE5X18hIxBNViW0QdvhYQobtOb9eoAkDW45LKUc
 DDTcHQXmRPR8MJpb6NphGBy+xmkMt46AsQvuCL4pskL5KYt76h2ea4q05iw4KUQcM8bkXBq1O8X
 ZhWa+8t3q+04h1ySbcWbYc3Xbjie2cvWAE26SKn0yEU+wm68eiKMcJYk9pnnyWN/sbmHsit9s8A
 Yk5/LgpARyBUhtfE3Wv9a/PGac5ixA==
X-Proofpoint-GUID: 9IBKg6mfU-D1uSw2psFDCZx-7nsRyCu1
X-Authority-Analysis: v=2.4 cv=S6PUAYsP c=1 sm=1 tr=0 ts=6925c228 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sllrQoStS4Dg3uhmqGIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250123
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

On Tue, Nov 25, 2025 at 02:47:56PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Please prefix the subject according to the driver customs.

> 
> DPU version 13.0.0 introduces changes to the interrupt register
> layout. Update the driver to support these modifications for
> proper interrupt handling.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 89 ++++++++++++++++++-
>  1 file changed, 88 insertions(+), 1 deletion(-)

The patch LGTM.

-- 
With best wishes
Dmitry
