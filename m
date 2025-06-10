Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2584AD45E8
	for <lists+freedreno@lfdr.de>; Wed, 11 Jun 2025 00:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA7D10E5DA;
	Tue, 10 Jun 2025 22:25:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RrEE2rKO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE7210E332
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 22:25:36 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIQ1bM022380
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 22:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=NIZerdv5856btQLeZiz5wtEr
 Wi3yo26TMxxYpxr5HC4=; b=RrEE2rKOCsDtipjqNu3tng1rbnolbgehv7+H0EAY
 FEZ3H6HJXAhgS62zP8ebfAMARG5HvgV9pM3dCS4KYpPB+BbADg18KKaiF23MAviK
 aWKYFISZQw1nOkOu4S98mILVhI3YL8NvaIbMq+tSvVxm6RH7+mPzzhFd8kcdEiEx
 CbWXr38/2kLY4ZqvMTtkyibG1i6PTw5lI3XtrE4ZMWb9yKLIWvaiLhoFiQIHGo/w
 E+U3k3aU54O3uGviqpsf8HqDgVh5HwDx9qqUoI8DI1zZ2HEvyU02MNC4Z6GZ2G6f
 vwbOSUWzItq5h2m9uqp/dgqun15+RhvbHDPEduLyoYWF4w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekptnks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 22:25:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c760637fe5so1081040885a.0
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 15:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749594335; x=1750199135;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NIZerdv5856btQLeZiz5wtErWi3yo26TMxxYpxr5HC4=;
 b=JHPRRRVO8Qe9ygxlQJow3CoeCUWQsUqLE5Om503G39onQZDTQaHr5vQTr/UrS3EfuE
 kCMuJLKVkEUiEMxkW4pKBFbMIk7fN730wnZtr5cdaGPr4Eund3rFrFi3xjPI1QkgOw6R
 eACkt3ymByjmkPVL2hmotsLF1Grzk1//97trs4QAu50tjmMJSKRB8FzHgl1q9Om8JGGw
 5Td8CR1lyaRbkgvIXlU3FqI6JTtc5OiXTZCPID61W3Nc0vW8vWVmFYNYbAVTTJTEGRx4
 mMfrvQZxpgm+gy2H65R7rMufl+MmJh57aKOHJciM1xa6a5vDxgzBNoJzIRnUG7XNyYbM
 OUMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpaaYx47V+yShT/bG2IaLtZVqT7fvK8IXO0cIi7dLWQp/O9gfpPXBOUIKVMnitLkHyqWv3WZs83pk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQJBa4CALShVMyCD3bKIF5y+keta2u/9mNXGImeK0pTyBGkF1/
 P/kwzkzIbsveXXBmMW1PU4DJY8GEVWlaIaSH5hX0Howk4lWgVv780AEAD7Bf1JW1Y6T62I66bKH
 bMcJGpxphqVBs8tBtFXLZnmDrDd7y1gMADEwVuiMYFhffN5XtYkkkU95dCZlR0WLts9XRdQE=
X-Gm-Gg: ASbGncvUh/Eb76b/yewAvIGDW6H5c/Fut+Y4ZYRT3IB+lwgQnV0+egPdLz7VgmENcOK
 Ol+cL/EygepyofqfINO3pvFGm7JoAceJTpcgx5WWNrpzY1vpEQXwLRlJjPtfHjYD5Ptkzk3oVtz
 mBru7FzBRl24CXTMx+MpPjyPb2qaU65YpVpFPY8LocceCWAj197gx+ya/YSXSBgp3944CX085BE
 UveIr+AS2kmPtNWNguAboQ+KDRU3qMqeszl1DxpbCKg6aPm6SvVVd5uQNF+96raSd6jn0bztlvu
 kcRtd0EzKUc4Z3g4gbpHjP5rEUmAmXIyTlJCzNAxEDEJ269LoS5PDeVFpoiRrOeYIgRd9OOcRDt
 gF4keszNB7bqTYZyW7v99/DQdYcEXlsiQEoU=
X-Received: by 2002:a05:620a:1a85:b0:7d0:97b1:bfa with SMTP id
 af79cd13be357-7d3a8806306mr191675185a.8.1749594334719; 
 Tue, 10 Jun 2025 15:25:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvqgKPApzu3rPogEhB0z1OsbrjkQcClCu9eRwx2CiVtQGPtd7+Q1xiMRbqpX3rcwtgL9CA7w==
X-Received: by 2002:a05:620a:1a85:b0:7d0:97b1:bfa with SMTP id
 af79cd13be357-7d3a8806306mr191671485a.8.1749594334288; 
 Tue, 10 Jun 2025 15:25:34 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5536772a80csm1706310e87.162.2025.06.10.15.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 15:25:33 -0700 (PDT)
Date: Wed, 11 Jun 2025 01:25:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>, Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v6 13/17] drm/msm/dpu: Consistently use u32 instead of
 uint32_t
Message-ID: <gvxglu5n6esoortifeyeapjlkwks4adxktshj4mcc2iyigq5fj@ztsuritnshkf>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
 <20250610-b4-sm8750-display-v6-13-ee633e3ddbff@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-b4-sm8750-display-v6-13-ee633e3ddbff@linaro.org>
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=6848b0e0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Sbni8NmfYZyP3K5nzVUA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE4NSBTYWx0ZWRfX1ypI/xY7zwBn
 WegSbvAbHrgsWuIh0fLdDjmxGTHPY/Iz4BlFjDmwrEFgpXYGDsDU+EY8GpBmPp4xaj+bl/KqdJW
 6+bRurVgO8NtfkO3SqxrSQEBdkSCc5nm0rWu9gmcnoogVj3aNsde/xfuYP/+P+n+mWIdBoQyhPV
 X0Po+j4xLzuPz/1cyeTxP+PyoWRnXEOjkDHgYiUCC7/rg31Y/BcOyLvUgqAFu5PBgsjLUWB4Vh2
 nV/UyRozMgstt02Gld9078qotX0c3iHrq9zrN53JIqaJxLHx4bAyroARpywJDEMxJAwLONJFiIO
 a7PaQ9CkMu3oT7EjZuG18vFvKKUcVea7G+gmUSCedP8RDSNJyvaHSwXhzmld671M6DeUz9g+G2r
 MfkTPlOyrfdt7d+CRy7MSu4xK/Y+o6GomjL17AE/H0n56/pMbmomgT7eFymyvhrqYbIg5CrA
X-Proofpoint-GUID: ed2xB5ziOvUik1MHtSW1CN62sb4joUso
X-Proofpoint-ORIG-GUID: ed2xB5ziOvUik1MHtSW1CN62sb4joUso
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_10,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=827 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100185
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

On Tue, Jun 10, 2025 at 04:05:51PM +0200, Krzysztof Kozlowski wrote:
> Linux coding style asks to use kernel types like u32 instead of uint32_t
> and code already has it in other places, so unify the remaining pieces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Changes in v6:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
