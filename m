Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05354BC4AC8
	for <lists+freedreno@lfdr.de>; Wed, 08 Oct 2025 14:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D7510E7D7;
	Wed,  8 Oct 2025 12:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eIMRSor3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4EF10E7D7
 for <freedreno@lists.freedesktop.org>; Wed,  8 Oct 2025 12:01:11 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890XvT014279
 for <freedreno@lists.freedesktop.org>; Wed, 8 Oct 2025 12:01:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YUe30woE5xEimZOnT9raXvhiVzii7F5/lJXV/+rQmpU=; b=eIMRSor3s8f0HqdA
 pkeP+CNNNqq715YMCOKDIEvIXhzK21rEAyE8AKxeGV11sFtZfcRSEWqiWYOV6l31
 CLFJOgcKqXCKvLzgnXLH0MLaL1IiJjrT58mDzQvQZWYfiOmU1MSSdWVsnCF/0GmF
 24SSvVe5dkZRObBoMxoeoc6XnfDZJoTq5N5OC7hOgDuV2LrGeLjqslpcpdvtsSBv
 PaXMMVUSqf8eH7v6YNIhQ2uNOdysGj8ioXnzOt1TGs6jNoNQNQnjGVfPLyCMnGdk
 V1EDZok9m9WVpHqCc8TtZuOo+U/kvJtxr0J1HRlQ2GVaXM6DoXflM1gj63gLWR/X
 j5vGwg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mgd0p1rt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 08 Oct 2025 12:01:10 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-8920ba68a79so81028241.2
 for <freedreno@lists.freedesktop.org>; Wed, 08 Oct 2025 05:01:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759924870; x=1760529670;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YUe30woE5xEimZOnT9raXvhiVzii7F5/lJXV/+rQmpU=;
 b=p6FH1F/PvS1CiCFIt+J4LPQe3MRyfWz/x4pSs0x/BcCMXHDsnOEG89B7tyRQkt9Hnm
 FJslXe9OFkgQl7O/aadI62V3+yk4tHWXNi+F+4WZSGNiLDx4LI2iTpQ4Fa0x/9Z5OQ70
 CqiDcZRUmg/QGZt+ip37SJC0tn/M5KYk5LievgIySLizcHXAPMxR76uUtb+QMEBSFtSR
 4SZ1nrAYDx1DrZO5gz8pAv0qUBmuzfdi7Na2o43eT6Tx+e57iiwPhNngOiI3wKK2fhTp
 D129IGdBD4IhbyCSEDREB/enw/8o+vjV89dN9wdysogh1qvjGpLoqzucaL1WI4OQ245g
 IT/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVM6Ok8i+VdJRgJ/Ck3BZ0ytMyNZmUH070i1CwmnT8tHl3yqcu4/mmaq3txC9NqZbdfbriVo8jRAWI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyp9XWnrxYPwQNs+xyZjyMlbGCybEki3VsZKBYgysSpzBegyIH1
 tebFbxcdsXPQplKcnLYa8qcFrqcWVzWDpNoHXWpiO1FIhVI5lJ4k8O4+jVOdkkvBKi/OuzUka73
 7tkstjTL42/WC21NCJayVZdR/H4RWwPVUKc14wzSv6DgKr8H+7VRFHx+FJ5RWDcKiXoW5ByE=
X-Gm-Gg: ASbGnctOrcBAqGSph8OVOhvdRPX3e0/D2bnYiSui3Et0oSvfQ87IgC1ZmiET9YDuw0f
 xjV/2z7r3S3eViqzGdA0kWjlJ6wZBo4xpjfratEi8AgoLUJ+UfMPivqz3iuIc6npq/3SyqteVvr
 j8w1nMuZJVx4aM9cpkCgQg2mky7D/I3iKVjn9xK08R6IAioshLhl+qNRPA5T2+pAW46ZaPHZNRW
 eD+18fHAwZFcIZH93rJrP11tBfnBE7dOACF/1bwtbfX4+eiiNFdTisCZk1es1ktFDyDEWnd7jGf
 j5rp1oGtr8hzxhGertWhw8mmziA42iv25lHhIXXNjosfijNwKwX+AkGAOO1dPAw56UtynMy9yWO
 5FvjzoTbG0jyJIhkF1e5St48QPDU=
X-Received: by 2002:a05:6122:6c01:b0:544:6d56:eef1 with SMTP id
 71dfb90a1353d-554b8b9dafcmr382779e0c.2.1759924869678; 
 Wed, 08 Oct 2025 05:01:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFT9kYombhVn9vLwV8HVqDP5rHDdMKek8m1Ph8xI5IlH4fvXAiDJcCahZY6sxIbEptqVVlYDA==
X-Received: by 2002:a05:6122:6c01:b0:544:6d56:eef1 with SMTP id
 71dfb90a1353d-554b8b9dafcmr382725e0c.2.1759924868891; 
 Wed, 08 Oct 2025 05:01:08 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b48652aa040sm1634050866b.20.2025.10.08.05.01.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 05:01:08 -0700 (PDT)
Message-ID: <f7f2189b-b182-4616-bba3-ad1a0af3e4da@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 14:01:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/17] drm/msm/adreno: Introduce A8x GPU Support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-12-73530b0700ed@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250930-kaana-gpu-support-v1-12-73530b0700ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6IgioOol-lmtzCnju6ktAWw9hSf4gufM
X-Authority-Analysis: v=2.4 cv=T8aBjvKQ c=1 sm=1 tr=0 ts=68e65286 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=C_0j-PAzlxBuy3Ei6pAA:9
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: 6IgioOol-lmtzCnju6ktAWw9hSf4gufM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfXwlfHs86VxMZC
 gy8qO0H+9dUuYd2hfPU4MoxEYiooUsUzkyWjd3LuJK2D6nieJIlxwmo7MJiugpUK1OXobi2bJra
 /Ux6vPfVAkUZRVnMpym/Ci9MP4P/nUSxpFaildx+wJDk17jo/mBKXeFK/vSvnEGDb6E/ZbJs1WH
 orcrKFdAhUeVH5CkdgXQJjKXfANrKcQAS1PQYZ2rE2JemN/BxW+b595MpdRzTA4EIMnAMYWrE6S
 DDCTKaV9EfbXYLtcDA7HBZIxqSSIc/2iswfbYs18mb018QZI8m5WpZ5bxfPCEvUMo/xgg5rZx3Z
 +w/Cu2xmwuVBj3ZoLPQZXU024a/xN6fJz0NpgUEz8oJuu+wi6n0xBsPjJCcOxU0fNVChmfecj6a
 L7Rfcy9WreZlB5yYM6klpSuYlZ0SGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060123
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

On 9/30/25 7:48 AM, Akhil P Oommen wrote:
> A8x is the next generation of Adreno GPUs, featuring a significant
> hardware design change. A major update to the design is the introduction
> of Slice architecture. Slices are sort of mini-GPUs within the GPU which
> are more independent in processing Graphics and compute workloads. Also,
> in addition to the BV and BR pipe we saw in A7x, CP has more concurrency
> with additional pipes.
> 
> From a software interface perspective, these changes have a significant
> impact on the KMD side. First, the GPU register space has been extensively
> reorganized. Second, to avoid  a register space explosion caused by the
> new slice architecture and additional pipes, many registers are now
> virtualized, instead of duplicated as in A7x. KMD must configure an
> aperture register with the appropriate slice and pipe ID before accessing
> these virtualized registers.
> 
> This patch adds only a skeleton support for the A8x family. An A8x GPU
> support will be added in an upcoming patch.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe, u32 slice)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	u32 val;
> +
> +	val = A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe) | A8XX_CP_APERTURE_CNTL_HOST_SLICEID(slice);
> +
> +	if (a6xx_gpu->cached_aperture == val)
> +		return;
> +
> +	gpu_write(gpu, REG_A8XX_CP_APERTURE_CNTL_HOST, val);

unless the effect is instantenous, this needs a readback

[...]

> +static u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu)
> +{
> +	return ffs(a6xx_gpu->slice_mask) - 1;
> +}

#define instead?

Perhaps also move it closer to the user


> +static void a8xx_set_ubwc_config(struct msm_gpu *gpu)

You modified a6xx_calc_ubwc_config() earlier in the patch

is one of them unnecessary?

[...]

> +static int a8xx_zap_shader_init(struct msm_gpu *gpu)

You can borrow this from a6xx_gpu

Perhaps moving such common functions to a separate file would be
even better, I glanced over the change and there is probably some
potential to commonize

Konrad
