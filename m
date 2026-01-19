Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E27CD3A8EC
	for <lists+freedreno@lfdr.de>; Mon, 19 Jan 2026 13:34:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0246410E42E;
	Mon, 19 Jan 2026 12:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o+z2yB8Y";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R/GENOWZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7A110E42E
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 12:34:34 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60J9n8Gd2965504
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 12:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=NafDNOWh2Yw0HDpwvNJ6p5kI
 hs263x8t/XdpfBo68qE=; b=o+z2yB8Ys5JwKzfiMysVNipfjtRKrDmyGGrJYSuC
 8cHA44itrDb6H6Aa7hFgB0enljKGzTROb9F5HSH1SILQKzq1QVlP9yVyjDvbI6ri
 ADJRm3kz8jLcWTqFcMjeE2Tu8qB0v1gwqBL52s2geE1ty1F5GuCIgWvME6SNDZZi
 rduk4kPIwE0Mygid/y4A6rwnCRcrT/1I/Fr70khsRZ5GE7lbSky1CShn9wpSmFKH
 8KPCfNaBSNhjL2A+qnpUPcGYM3BQ/VEarPkUEx9e/nH5A7N4mL88B5dJYqf8xqtR
 RIf5YJ7D+uETfWNxdStl91EsXJXpj9PKpxMAiiRezWNCdw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjaa8fha-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 12:34:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c6a0ec2496so836634385a.1
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 04:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768826073; x=1769430873;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NafDNOWh2Yw0HDpwvNJ6p5kIhs263x8t/XdpfBo68qE=;
 b=R/GENOWZkIlrcvVL/86i+Qt8EsMx2SxpAdFLzbbScitgG8UWYCqz/N43ictTO8aeHI
 9JP3vymya2KHDs3u+An5fu+wfNGsHTQw0KMHQiYTDTWftYDOnNBfInOAl7LNeMIsp+S6
 mUTmH7jG8Pc9ZWl4UnvznqV+Zj7lewrCuLbnapyPWVVje+6qKo7gVyjFjXWgGUAFICA0
 y9KkrtVgUCbZRRywZ8np5TQzTseRLVYJ33goTgvnwUdke6oUf1AXmUYtmv+Oyw5buvZj
 aKLeRTz/Oc1NUkrNRMHK3TMWkZJrE+itFcxkjdo+STdr+0FOEfjvxOUrlh/w0rmZOum+
 XZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768826073; x=1769430873;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NafDNOWh2Yw0HDpwvNJ6p5kIhs263x8t/XdpfBo68qE=;
 b=WrNUzpgfb5u4Tp+PMcdPlHNa29iF5sKSlhSyk5bBb+ZSqGjyCmS2t6GcNSa7070BKO
 I7Bu24r4OMfWGP+ymbWpiaJgSLp0/649SLfTINttf1JCpkhACeLTiJOBkGf83ZbJoShn
 MvgczZeidJ2WIf6oeVfEvu4xQC+SZA2E64NcHXUr8ZupCO6P0sf2wPDIphzyjyRMqvWe
 8jyF/11ml5zjzJB3198MWLYSigeI1ZDtY/5jd9RQ1UwTK4OHAS4pVZTS60rZgOiQZDDp
 3uMJyRDWShYhN0DF37NHzwpv8GVeAZhTUvbtvaDkNQK7CV7u/TSUq5At7jXLqTYaK50h
 j0PA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDTi+TxiUgvNmWC/C8psash/iDjBele/uSrjLRN6FxPC4QhozaOUUuoCz+hAWQoXXYPTJhekVDM1s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/lIyvpVxkK8RtkmRHPdZMQgSHKjLI5zBVPxpneaDVwQ+x4gg6
 pyA/OSnTJ75q5wk9MIu+8OlvCk42DCDdOKPLZnx4QxyMC1laqJikwu3bu88AFh2HOO65kQlELgx
 Kn2dq/PI7YA6EZ03TzELDs+7Byx6+m4AkfnBFvp1Hjp0877g886JmMmXVC8j93K+o3eRYkag=
X-Gm-Gg: AY/fxX48gOqaSuB7Ffult7FZnSnhlCT2NNS3LI5V/aay5rWmVIYhJ+wr1fKBZO7r09/
 ROfgdRK5KeuwmF+y3h6GI9E4Cb57n06CN5rBhfpXyXNyNQw4RLIqsGV/X49qyE3p7DVZ88hqS3z
 x/whaz3Co1kyaeX/Aaz415yaLefEL7oRbNxMS+pN580lqghqtlK6Bq/H0Za/EPCK8BDzla+VZZv
 EHZwTZ01C99Ypq3WCDsvtRszohwnc7tDh4CwzYcflX3ON9jXGIid+mIvDPP9mMfqsxA8fWZanCj
 7GS0qyRtQDOcj0HlZ9kdXB61qs/k5OGzZUT39rpVc8Ksdx4Zq1PIUXAMw7UJv3yxrRNda++ts8a
 8KiUyt6m0f97F3JVXsgcFSn2pMTfIZKFclI7I1GHj559LpuvUviVFrFP0A8Pb48r25tDrvsjZc6
 +zS0jpFMx+5AmiuvL+/7u9Htc=
X-Received: by 2002:a05:620a:4047:b0:8b2:7726:c7cd with SMTP id
 af79cd13be357-8c6a676da9fmr1441157285a.49.1768826072681; 
 Mon, 19 Jan 2026 04:34:32 -0800 (PST)
X-Received: by 2002:a05:620a:4047:b0:8b2:7726:c7cd with SMTP id
 af79cd13be357-8c6a676da9fmr1441153285a.49.1768826072151; 
 Mon, 19 Jan 2026 04:34:32 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3976dbsm3340662e87.66.2026.01.19.04.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 04:34:31 -0800 (PST)
Date: Mon, 19 Jan 2026 14:34:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Val Packett <val@packett.cool>
Subject: Re: [PATCH v4 4/4] drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL
 programming on UBWC 5.x+
Message-ID: <3cvigxba6lkhbolzf4hsdn4a4psvkvqeaztgjkd66ctkuaykyk@jtocgpnugygy>
References: <20260119-msm-ubwc-fixes-v4-0-0987acc0427f@oss.qualcomm.com>
 <20260119-msm-ubwc-fixes-v4-4-0987acc0427f@oss.qualcomm.com>
 <35fababe-11ec-48a8-a6a1-d1aa1ab95dca@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35fababe-11ec-48a8-a6a1-d1aa1ab95dca@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwNCBTYWx0ZWRfX79OavTyyWVB6
 BwwzbfNi6RJP+y2HZRCwHaLa8tXs6KivT1EvYiftHYwC37VRMerxNFvRD3RyBvU5PZUEUrvmxY8
 NKxLLarw1Ijbf9T3kxDO9wW8fkBTjRsoElVIgj/eCh+sCFqERffEx+EsK1BQBeezGMW/dXVCTdv
 cxkuk0aSQTnKOED3Q0a9q7b5boJuFaD/Zinq0++ORZicJ+GUkkFYKljmPJvUUzKVF2v7X+Ur8bg
 d2Fa5Dmp+g3uDgg3TEl4F3u9LTXR8HugAtah6w7j+9H7EAhE1aDngpL3w7DwNuk/ud4esn2oSTs
 cUk/kAkF7SVnbdwWlYQhJusLfBUzFa/8Dj26pqa1cbTXDAJpK+PdxL1esnlwCLQxgxgeSSxY6e8
 0fGOVT93ofW5kC5SEBJCShvFWMCykwrGbIio0SAybtSC+T9S8UXcPaExsS0m2nmtD9G51Fxx0hu
 g0JoW3mS4uLPc5Z+Pvg==
X-Proofpoint-ORIG-GUID: jyQNSc7WnsuwLE-mR1Gx1ibPjDuod--u
X-Proofpoint-GUID: jyQNSc7WnsuwLE-mR1Gx1ibPjDuod--u
X-Authority-Analysis: v=2.4 cv=L8gQguT8 c=1 sm=1 tr=0 ts=696e24d9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=nqBBLIHtStSxbiTUqcoA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190104
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

On Mon, Jan 19, 2026 at 01:24:58PM +0100, Konrad Dybcio wrote:
> On 1/19/26 1:16 PM, Dmitry Baryshkov wrote:
> > Code in dpu_hw_sspp_setup_format() doesn't handle UBWC versions bigger
> > than 4.0. Replace switch-case with if-else checks, making sure that the
> > register is initialized on UBWC 5.x (and later) hosts.
> > 
> > Fixes: c2577fc1740d ("drm/msm/dpu: Add support for SM8750")
> > Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +		if (ctx->ubwc->ubwc_enc_version == UBWC_1_0) {
> >  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> > -			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > -					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> > -					BIT(8) |
> > -					(hbb << 4));
> > -			break;
> > -		case UBWC_2_0:
> > +			ctrl_val = fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> > +				BIT(8) | (hbb << 4);
> > +		} else if (ctx->ubwc->ubwc_enc_version == UBWC_2_0) {
> >  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> > -			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > -					fast_clear | (ctx->ubwc->ubwc_swizzle) |
> > -					(hbb << 4));
> > -			break;
> > -		case UBWC_3_0:
> > -			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > -					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
> > -					(hbb << 4));
> > -			break;
> > -		case UBWC_4_0:
> > -			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > -					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
> > -			break;
> > +			ctrl_val = fast_clear | ctx->ubwc->ubwc_swizzle | (hbb << 4);
> > +		} else if (ctx->ubwc->ubwc_enc_version == UBWC_3_0) {
> > +			ctrl_val = BIT(30) | (ctx->ubwc->ubwc_swizzle) | (hbb << 4);
> 
> This is pre-existing, but BIT(30) is not unconditional in SDE for v3

When somebody adds inline rotator support for DPU 6.x (SM8250, SM6350,
SM7250 or SM7350), this bit will become conditional.

> 
> For this patch
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
> 

-- 
With best wishes
Dmitry
