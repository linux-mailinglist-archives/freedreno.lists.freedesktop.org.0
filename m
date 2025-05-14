Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA9AAB7503
	for <lists+freedreno@lfdr.de>; Wed, 14 May 2025 21:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE90110E647;
	Wed, 14 May 2025 19:03:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eb4GjAG5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398E210E6D0
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 19:03:38 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuecs020098
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 19:03:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=xYRDcZvrRlAs4itLVeZfoidr
 MFA19B14tFBdS3+9LaI=; b=Eb4GjAG5gViCu4d5xl8g7M0Fiwgy45K5d9VqgR5K
 amS3oPhv0p1NEzHEQEGjSgBZR+E99/PZECxF56R3Q43j4ddfzHpoS53/8do4P+E4
 VRb5cI4hETkAH6YppRjh6GsGPSRrlh3gtIzj57B8bPCjKcDotRAryznRyBVdHujK
 m7xL07QzRemA8qw3/yUxRmu8gDeOvqHdxVc+3vejZoTjkIF87JD2wTdU8gR+1vY8
 PE7nsztC4p7cFDDO3xRjOgWaW1aVV0dvkwoEhfSu9zpj5zqhsjg/fMT/X9XJTObh
 89KuTKa3m5M8PVYWfxtQUf+3jHvVVsYnDcHLLDT/RQXMRg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnkrys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 19:03:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c95556f824so9379185a.2
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 12:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747249416; x=1747854216;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xYRDcZvrRlAs4itLVeZfoidrMFA19B14tFBdS3+9LaI=;
 b=fGeqitfcH71Ihdd5Ie+Zu2dRWrAujp8qYJCI4bhovBttKwLDuu1VdTTscbIWBKGRHo
 fOvbe7OeeZT7eFMfMnZSZ08NljPfl9C2LYuMow5KYIGN1uI1KciuLkUOARno2oKqbwte
 JU8IN2sXamRlgrsZW8iPJMDqHuVp9bBH26jppxixXL2LdFuF3vPoRRTbDUGIKtq4ekzt
 uUJLYdlc3kMOoYaoNGKj/sadloRphI/jGAR1RkVPf70YnDqIM/50Mq8VOc7gxZJIkzkR
 dlS+Fid/YZXnnF8vyZkAUgcBVoMwyx4RvA3iNxzQ5r6IOe3wzGte4rSvkGjQpQGNdepR
 fSMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWipSjdZ+N3eW53Uc2OOYsWOhYk/X+UypxYCfQn+HzYrgL6SWT7rZjhdOcfMLhShc3mU0xz9G2XHSc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjTvgawwk93ZHnOk1jAT+zGWh/eVMom/Nq2zOlVSbM+lli5Aiw
 v9e62MDp5HFg/f/zqHj5V8beHfA7BkoGgyBklUVxZh2DvgOxhi2T1atuTAwmW8TDMuiDeVXYEYN
 FMZfLgK1hOwb7me+l0ID7zRXBZs6D1y+RxwywzJGlkanEqx6sH6isJIz0B3c0HSHp3tw=
X-Gm-Gg: ASbGncspEaT+fnrNArvAjJiw7OREiRSYZq6yQ+co5pF1CFej9gIuLcC+MOhU1B5mvWy
 AGFLwpLMrTsfKOr43O4ZmhcLIYsx9YKlq9jiqZXYFucpVcDvg3wkSZTSvyvJuh1KwPJnl0pEOAJ
 xbjFqnhHfHKYBRZ4pSVGgvY9VuqKD7veWP4+xyNVnSkmv11hewR7PvVPDI7aGjvDRXTPCUpgtjM
 0oVOc6Rx6ONR2JGHLkihzOhQGzPeh/hmbx+DIe63Qz3MzSVSysMzNtCleS8LHGEg4TECuIGbbIQ
 OPIopCturxQ7+2m/Q3lCsvptM2mWM1BJi61oZpqy/6wnAB0HZj8tE4CCW3nhE12L0B1LTUyr4ng
 =
X-Received: by 2002:a05:620a:1a0e:b0:7c7:a5c9:d109 with SMTP id
 af79cd13be357-7cd2888f7d3mr704287885a.50.1747249416343; 
 Wed, 14 May 2025 12:03:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnbU/N6XFKdVURfBzODUtwnKgfcbS0R68TW1dNTpTgKpwi4qIQ1yAtQ1dg+wqpVirb5QQAHg==
X-Received: by 2002:a05:620a:1a0e:b0:7c7:a5c9:d109 with SMTP id
 af79cd13be357-7cd2888f7d3mr704280185a.50.1747249415726; 
 Wed, 14 May 2025 12:03:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc64bf86fsm2347052e87.178.2025.05.14.12.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 12:03:34 -0700 (PDT)
Date: Wed, 14 May 2025 22:03:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v2 01/15] soc: qcom: Add UBWC config provider
Message-ID: <cd4zuhalspnepn3xebwkwt4is66o27db7e3s3n7h7x4r26sg3b@ai2psdpjdv56>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-1-09ecbc0a05ce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-1-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: HXhA1Dp_0HzOZ_XSdse2AuxiPyqZeGbX
X-Authority-Analysis: v=2.4 cv=aIbwqa9m c=1 sm=1 tr=0 ts=6824e909 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=CA9_ZTp6D95CLmzeQEgA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: HXhA1Dp_0HzOZ_XSdse2AuxiPyqZeGbX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3MyBTYWx0ZWRfXzEI0stSNpvhX
 Lj11TZazor9NTZruA7ytmHJpwx4rqsbZicsEvtJHxJrad8mBfPg63+dqcE+xUPKRJkoPQ6ffmk7
 lU4ftIrCs5Sv/TVGDyl/c/REywVUP6oirg3vXrAQD2dRJ48+hTMsOvM/L0CqGa6XaZ+jbR38rTn
 6PGLQOVsJDn0e8vLhAUIxS/Yqhy06j5CpN9joyAQHUpJA57eR4lJKt8USm2Zy8n0Foo2wWK9ONS
 avB9adtYU5VhoEW2UJSPDNoM0gYFPI6cu4DCqn3vGnqfLljIq0YzRmyR/Pkl6hSArVFt4PHNjSY
 RzqgqYqwgYlGhjQaHzocoXQFrctNxYNl5oGTKISSrbL1ouvmGMCxMKR4fT0vpY6vEminGmlu22W
 06LghL4iD8+eHtV6cZy7xHeCd2xNhJQPurDxA9PtWIv6PASxIk7sd4hBe43eRkEhCk39O7UC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140173
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

On Wed, May 14, 2025 at 05:10:21PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Add a file that will serve as a single source of truth for UBWC
> configuration data for various multimedia blocks.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/Kconfig       |   8 ++
>  drivers/soc/qcom/Makefile      |   1 +
>  drivers/soc/qcom/ubwc_config.c | 235 +++++++++++++++++++++++++++++++++++++++++
>  include/linux/soc/qcom/ubwc.h  |  67 ++++++++++++
>  4 files changed, 311 insertions(+)
> 

With the SAR2130P fixed

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> +
> +	/**
> +	 * @highest_bank_bit: Highest Bank Bit
> +	 *
> +	 * The Highest Bank Bit value represents the bit of the highest
> +	 * DDR bank.  This should ideally use DRAM type detection.
> +	 */
> +	int highest_bank_bit;
> +	bool ubwc_bank_spread;

Nit: any documentation for this one?

> +
> +	/**
> +	 * @macrotile_mode: Macrotile Mode
> +	 *
> +	 * Whether to use 4-channel macrotiling mode or the newer
> +	 * 8-channel macrotiling mode introduced in UBWC 3.1. 0 is
> +	 * 4-channel and 1 is 8-channel.
> +	 */
> +	bool macrotile_mode;
> +};
> +

-- 
With best wishes
Dmitry
