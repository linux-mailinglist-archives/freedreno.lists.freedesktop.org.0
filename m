Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E53EA9D0DC
	for <lists+freedreno@lfdr.de>; Fri, 25 Apr 2025 20:53:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C962310E979;
	Fri, 25 Apr 2025 18:53:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ccly0v2N";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64ED10E482
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 18:53:22 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGKMt5001950
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 18:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=EyI1RYrs4XXWK6Jk0wNG+VY0
 wHQ7kc01RAG4sha1MzY=; b=ccly0v2NJWjBD/RWATeomyvHcfgv2NaRvB99ZMGJ
 Oo24ULU1DzVtNt0YzDnlZN2U7vD2b6/y4zJ7QPS4qHl2Hv3mbL4AtGebIEuBmTWT
 mzxz61C0CPyx0SgzVNPjXDSzL8+cJytICNAA97YlShxCGt5QWkeugqJFf+GDaz9F
 bqXCfPMw9uaktthG38TBXppReKEX/lxueCaWhIayEvIVPesUdzPLCcUAhQeopy6H
 66O2NhkauzuI8TI8ko7HiP22/KUW468Klp+z3nGXHoHAhIVkuFcdayLhVzsbJLou
 n7/8+rGttxuO6pCewEgBhJM1ipURX2WNVLS1jNjZPNNgzg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3j045-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 18:53:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c579d37eeeso383671385a.0
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 11:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745607201; x=1746212001;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EyI1RYrs4XXWK6Jk0wNG+VY0wHQ7kc01RAG4sha1MzY=;
 b=eR2+8CJMxoF2MKdkkQeP5rqyS0x8f5om3I5Af/DA9CCtpxI1HKDsIo2kKPCDGwB4Je
 1iDWLgl40dbzwSGXkjfpVX/GpdnUgBbL6D+gJTPvcDUfDdaG5qInmVlGpS2XZp3ysnAF
 zWOlTZIyH2tbRFAJMbF2+aY3kFWR7jmQcv+XnmgxYnwdmK9K5eic+QiNrK8UxHFEynZF
 7BoIx4/E68caBUUFZZkFy0L12gbYhy3qbHKJ6sH5l23sXsu7Cmx9hoq3QPMv3wWni8CA
 pbE3df897gDt8bULqGYbmWVukcBNh8BvknE5TFpmzgO7ateIKrXFwD9mOC2X1POLl0Kw
 ktww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXfgBDPbSfpFY5ziNxYvq6Rgck6OxiD+/uesmCtYO/gg8xMOdfL9CWiNpAnn/kpJ9LUpCuj32V3Ts=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7rO0Af/29lTCN2WqnuPSWyIlAv2Lzv61qd4BDGEhcSMPzPiJ/
 RVdb6tJCJKPlaz05ZRCge5QMrw/QueAmpjhgNI3zXw8+hDiGEv6mSz72S3HlOSTGC5fhDKPVnhA
 nhhN78PbxKo/9evTRvsYTNMPYSPI02Ce+YgaE0A7xbMyhtfWHLTqjLRevL2yvWlWKjZk=
X-Gm-Gg: ASbGnctdUaqx9besY3OJm/t6bitTzueun5PdzPMU7pnJjJq+m72xd5oE6SP1yB8Y33P
 149dl9dWltWf88JUg0UO2VoutYBRn8NDVsUeIAoPeyqDkRazqhABghnevK6Kb/fvaGny7DUpH0p
 zKDqFlIC5nqtXcql7jv9o8DiUOdekvq+TxYWoqrjX+D5jZxXYTPX71rPaixPXJfSb9r5gLSqbYq
 iJHOzQ5C/RCYWlkn/kbOEnT5pZBG+Esgg3r/XaD9UKXgU002xwlyenpAU1m48oEzYb7OnVF0WBD
 LaeGywP5rNWpgdWX+4m/yuMRQUHk7kZV/TtUXhbwlZvEOjHjyRzCT+qPxMjMM2UCvKQ2SDHrlwo
 =
X-Received: by 2002:a05:620a:414e:b0:7c5:5e9f:eb30 with SMTP id
 af79cd13be357-7c96687307fmr83995385a.15.1745607201020; 
 Fri, 25 Apr 2025 11:53:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzpHwv43BxegR84WM3cKeKkomXnTuNqjngSJPB2sfsV1ntCPBMFR2CHLVVFpG3qFUcYD6E9g==
X-Received: by 2002:a05:620a:414e:b0:7c5:5e9f:eb30 with SMTP id
 af79cd13be357-7c96687307fmr83991685a.15.1745607200558; 
 Fri, 25 Apr 2025 11:53:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7ccb8cabsm690134e87.258.2025.04.25.11.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 11:53:19 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:53:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] drm/msm/dpu: enable SmartDMA on SM8150
Message-ID: <c62wafi73jwdf7qz5a7gp3xqhqg27aifn5ollr7dmufeaeyldr@rbzbtpbfenkc>
References: <20250308-dpu-rework-vig-masks-v1-0-f1b5d101ae0b@linaro.org>
 <20250308-dpu-rework-vig-masks-v1-1-f1b5d101ae0b@linaro.org>
 <bf242898-bf47-4235-9086-745bd4f05acf@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf242898-bf47-4235-9086-745bd4f05acf@quicinc.com>
X-Proofpoint-ORIG-GUID: 1h51t7EMKV2iPTvPuanst-BsU08E22g7
X-Proofpoint-GUID: 1h51t7EMKV2iPTvPuanst-BsU08E22g7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNCBTYWx0ZWRfX1XNTzG//okgN
 bYvoXtxT+dOGcmI3PfmXHCV0BTkRicpoh1IAbfjtIShb2/ERz/Z0JU+0C7fkQ2MRKUzZBxg38eq
 fiJf/VYSo6SL98fZ6TCJ+nfwi6048qV56KtPWPVsZyIEwq7z+1mfLrhxfWJNXgmxkm5xSyOkn96
 gZojNZdFVk/qacssMub74icXDrJlnJBO92rnMKk5xRIlDQFqLJjSzJ9/93OpZ+MbQecbGOALyjL
 pGDWnt7FOuXfDo1QBfUvOMRl0uWCA+T/He9DYv2OTJwdxpHz6pSNWcRbG+dGaBRdvx8RAiBbENj
 8XNp3wXVnHtU/4yVLs2I6ocDn4mMXbprj7W2YINaIz3zrPrf65WK0ap4CjTlBKxBbsO4ryCAWQg
 1fSdqHeqr9YoZb2GgNBzagk97uowNJn3pori2aoqbcB5QkDhpz4jyeiJNFKhZNkUHwBdDwhZ
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680bda22 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=jGqEa9bayqSivQyTaeQA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250134
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

On Fri, Apr 25, 2025 at 11:26:20AM -0700, Jessica Zhang wrote:
> 
> 
> On 3/7/2025 9:38 PM, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Reworking of the catalog dropped the SmartDMA feature bit on the SM8150
> > platform. Renable SmartDMA support on this SoC.
> > 
> > Fixes: 460c410f02e4 ("drm/msm/dpu: duplicate sdm845 catalog entries")
> 
> Hi Dmitry,
> 
> The code LGTM, but was just wondering why there's a fixes tag for the first
> two patches but not for the other catalog changes.
> 
> Is there some context I'm missing with regards to this?

As I wrote in the commit message, SmartDMA for these two platforms was
enabled previously, but then it got disabled by the mistake in the
commit 460c410f02e4 ("drm/msm/dpu: duplicate sdm845 catalog entries").
For the rest of the platforms SmartDMA supoprt was never enabled, so
no need for Fixes tags.

> 
> Thanks,
> 
> Jessica Zhang
> 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 16 ++++++++--------
> >   1 file changed, 8 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> > index 23188290001ffb45563a9953a9f710bacb4dac89..fe4de5b31644de33b77a882fa21a18f48ecd1790 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> > @@ -76,7 +76,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
> >   	{
> >   		.name = "sspp_0", .id = SSPP_VIG0,
> >   		.base = 0x4000, .len = 0x1f0,
> > -		.features = VIG_SDM845_MASK,
> > +		.features = VIG_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_vig_sblk_qseed3_1_4,
> >   		.xin_id = 0,
> >   		.type = SSPP_TYPE_VIG,
> > @@ -84,7 +84,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
> >   	}, {
> >   		.name = "sspp_1", .id = SSPP_VIG1,
> >   		.base = 0x6000, .len = 0x1f0,
> > -		.features = VIG_SDM845_MASK,
> > +		.features = VIG_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_vig_sblk_qseed3_1_4,
> >   		.xin_id = 4,
> >   		.type = SSPP_TYPE_VIG,
> > @@ -92,7 +92,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
> >   	}, {
> >   		.name = "sspp_2", .id = SSPP_VIG2,
> >   		.base = 0x8000, .len = 0x1f0,
> > -		.features = VIG_SDM845_MASK,
> > +		.features = VIG_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_vig_sblk_qseed3_1_4,
> >   		.xin_id = 8,
> >   		.type = SSPP_TYPE_VIG,
> > @@ -100,7 +100,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
> >   	}, {
> >   		.name = "sspp_3", .id = SSPP_VIG3,
> >   		.base = 0xa000, .len = 0x1f0,
> > -		.features = VIG_SDM845_MASK,
> > +		.features = VIG_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_vig_sblk_qseed3_1_4,
> >   		.xin_id = 12,
> >   		.type = SSPP_TYPE_VIG,
> > @@ -108,7 +108,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
> >   	}, {
> >   		.name = "sspp_8", .id = SSPP_DMA0,
> >   		.base = 0x24000, .len = 0x1f0,
> > -		.features = DMA_SDM845_MASK,
> > +		.features = DMA_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_dma_sblk,
> >   		.xin_id = 1,
> >   		.type = SSPP_TYPE_DMA,
> > @@ -116,7 +116,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
> >   	}, {
> >   		.name = "sspp_9", .id = SSPP_DMA1,
> >   		.base = 0x26000, .len = 0x1f0,
> > -		.features = DMA_SDM845_MASK,
> > +		.features = DMA_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_dma_sblk,
> >   		.xin_id = 5,
> >   		.type = SSPP_TYPE_DMA,
> > @@ -124,7 +124,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
> >   	}, {
> >   		.name = "sspp_10", .id = SSPP_DMA2,
> >   		.base = 0x28000, .len = 0x1f0,
> > -		.features = DMA_CURSOR_SDM845_MASK,
> > +		.features = DMA_CURSOR_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_dma_sblk,
> >   		.xin_id = 9,
> >   		.type = SSPP_TYPE_DMA,
> > @@ -132,7 +132,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
> >   	}, {
> >   		.name = "sspp_11", .id = SSPP_DMA3,
> >   		.base = 0x2a000, .len = 0x1f0,
> > -		.features = DMA_CURSOR_SDM845_MASK,
> > +		.features = DMA_CURSOR_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_dma_sblk,
> >   		.xin_id = 13,
> >   		.type = SSPP_TYPE_DMA,
> > 
> 

-- 
With best wishes
Dmitry
