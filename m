Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8485EBABB9D
	for <lists+freedreno@lfdr.de>; Tue, 30 Sep 2025 09:04:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4734A10E501;
	Tue, 30 Sep 2025 07:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pazFXeSC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F2D10E4F7
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 07:04:02 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4IVOa028237
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 07:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=tnz5TqBen53zV+5c0hfw9xo0
 Ki5Ws5bufZFZJ5eyQqk=; b=pazFXeSCg6o5laK+b1VdfeBi/n+XWo/NDACcUXTe
 UThRpLJb+Di/Os6lyIJ2n2gB5DCHAf9Y9P4MKFydgDKh6p9L1lChuHqP7i6IKcZy
 ffNiiibIpJwhES1cDQkWs27bxgAwDm64aK/C87iSuqxqkx1hrN1glNoHKpIx+1pT
 12MUrxNMPV7xJf3dntnWub2mC1b65RUpB7Che2v89b96bVzQ0wTJd4L3yI0NkPbz
 1rt+1z5xtboyQ05MHbJ7hDBUds1Tfe5NjHwoS2//qqZ3+C9CySiLf3PNw7+9e5Yp
 jgJqQCm+uRBwMET1BkMmb7wAzbWV92jcVZotc1l0Gif/jA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fyrf1jhj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 07:04:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4d6fc3d74a2so162271541cf.2
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 00:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759215841; x=1759820641;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tnz5TqBen53zV+5c0hfw9xo0Ki5Ws5bufZFZJ5eyQqk=;
 b=GREVFcGpFIZZwal3qjtPw940t4AUtQaZPI4OPayIA1Z+S0snUc9Nh9PPY9FZFg+z+3
 9/zmxBGLo3S6/nD3a3/VsVp2cOiTz1bLdxJ/SL0oKJhR3tsVJHlihFq+awg/GLB0HrFd
 0V96OqEp1/n65xlWPdiqc/e6GZ6k0MfSlC7gENxj6d1dhYd2i60emp8f4OPnbrq9l/Id
 jWVy6Gh7WjbvnXXA/7fIlHMzyPr37R4km6+sM/7KYvzD5o7b5j/RpaMu4T3AHbCWlpNp
 EYGdC7R+TsYgclET8EyYEQXGoVL+Mth2pgnJnTqmcUwr0sXe5jCYgn6Coy6TzVaZKHug
 NY4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRWbDM5056aIz/X+E8fZvPhy2eeJqu5jVKZ3svhd3yGHhoHJT0utkQnoX/0UZ+/K87TTAEOGTbUK4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzshKnwomUzYikFPJT0FpUWLdKbkz9ma9CgZ/z49Pho7rcqUrp
 +DCfZiEcM3UPXzjpu4GW8WTvsWr+MFWxRnjHSYGjo2SnwG+Bh5ojACUzEgGV2DGWFrTIkp8VXGK
 o0/cehHcwfziVuHOjfb8jw/WXHZWdrMGvZ6CsQOREadDbOKAVVT/BV7B6f6CujaQUSS4hXaY=
X-Gm-Gg: ASbGncsibKYXkZ0nQLnxlguW7ZLiu9Xf1ngWcRNianb8uuJEJENjfVQC7bpJiXXK5HE
 iEeDPSUTQKlYsKfxknkTQtRFuwN3D7/01wdkYuHg30ffEUX61v/8UiSiwuL6HaV28FCfwdWvu6J
 zOecBtWqFqdJs1nkSn0KqF9X1L7s+FhOHgR9lObLLDuQHPSz/LSVy5sX38HCzQd6npLFRw/reKb
 Tyb8YSt4cJlFhCZht4p2LXiB3/i7LofwMWeOqyG37hhzOEmQOuYXLYsmqgW58u+1erXIxyItaHn
 5SIwWPbCFfS2JkVPB5KSQ1w8snqp72jYSKfZqt4jPJHPno1VIODlAqGarme059XUZS7JE0MS13A
 5VneCK+sr173Ij07XDcSYjUDXIwaGUcxOJ2wQfczbZImotFSoZhw6TexyMQ==
X-Received: by 2002:a05:622a:560c:b0:4db:b5f1:84a5 with SMTP id
 d75a77b69052e-4dbb5f18dbfmr197540101cf.57.1759215840537; 
 Tue, 30 Sep 2025 00:04:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEB+47pVViAKJXbEvOe8O+nb1gHysifWQJ8Ow1s0HmR2oz9c6rHltLPTDn+bK5bbHz5yEbEhg==
X-Received: by 2002:a05:622a:560c:b0:4db:b5f1:84a5 with SMTP id
 d75a77b69052e-4dbb5f18dbfmr197539681cf.57.1759215840076; 
 Tue, 30 Sep 2025 00:04:00 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-583139f990asm4623729e87.38.2025.09.30.00.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 00:03:59 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:03:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 02/17] drm/msm/a6xx: Fix the gemnoc workaround
Message-ID: <7gjolux5eowgpbptxdnuys2fgzkz3we6hznldrmfwrkpym2gwl@e4e2tpiinyb4>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-2-73530b0700ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-2-73530b0700ed@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: OdxM9xZKAGVB0xpQnzduqAnW5NY63BPT
X-Proofpoint-GUID: OdxM9xZKAGVB0xpQnzduqAnW5NY63BPT
X-Authority-Analysis: v=2.4 cv=etzSD4pX c=1 sm=1 tr=0 ts=68db80e1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=EdiAtJSrrEaB_zXPBFQA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE3NSBTYWx0ZWRfX8UK8bb5nw0Kn
 P/pxAnoa5i8Zdk50ULJDZz9v2UhuH68g8XWQgObVZ80YxDwxZNPM0tQREIyXF55yRorLI7ywRDT
 dK6JLUWo6nLyD8Hj7ElzaAfXc+0aYtuWEfWaR2V6652KvQHODM7ficyuIGrkwZLgRAQZswqm2lp
 9fhFrUwzPlYEhBCrSb4myZIp/ntFmVb7E49YOrV/uFFg31ZOSRkzoCA9MMnKaPWfK4IwL9tC2hk
 BjHL9/Ow/LKzOge1bPCixzhWpxUpi1+UVapDunWdGVXm+T2CNA+3PgZ3/CttaunGBkFEW9/AnQt
 zd8AsDmxTl4xJ3TeBbftrQqnsnQxjRF7BsIt+MPI/BsoUNR1zcHM5WTaPYtK2kEl/zDFN7/QO5g
 y8WuZaVptAKwm9xGP9LYeCHMZnJ2dQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509290175
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

On Tue, Sep 30, 2025 at 11:18:07AM +0530, Akhil P Oommen wrote:
> Correct the register offset and enable this workaround for all A7x
> and newer GPUs to match downstream. Also, downstream does this w/a after
> moving the fence to allow mode. So do the same.

Please adopt the 'why' style of commit messages. Describe the issue,
then describe what needs to be done.

> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index fc62fef2fed87f065cb8fa4e997abefe4ff11cd5..e22106cafc394ef85f060e4f70596e55c3ec39a4 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -485,8 +485,9 @@ static void a6xx_gemnoc_workaround(struct a6xx_gmu *gmu)
>  	 * in the power down sequence not being fully executed. That in turn can
>  	 * prevent CX_GDSC from collapsing. Assert Qactive to avoid this.
>  	 */
> -	if (adreno_is_a621(adreno_gpu) || adreno_is_7c3(adreno_gpu))
> -		gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, BIT(0));
> +	if (adreno_is_a7xx(adreno_gpu) || (adreno_is_a621(adreno_gpu) ||
> +				adreno_is_7c3(adreno_gpu)))
> +		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF, BIT(0));
>  }
>  
>  /* Let the GMU know that we are about to go into slumber */
> @@ -522,10 +523,9 @@ static int a6xx_gmu_notify_slumber(struct a6xx_gmu *gmu)
>  	}
>  
>  out:
> -	a6xx_gemnoc_workaround(gmu);
> -
>  	/* Put fence into allow mode */
>  	gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
> +	a6xx_gemnoc_workaround(gmu);
>  	return ret;
>  }
>  
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry
