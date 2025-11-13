Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E988BC56A82
	for <lists+freedreno@lfdr.de>; Thu, 13 Nov 2025 10:43:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E0610E34C;
	Thu, 13 Nov 2025 09:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UA1XHHHd";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G2k+bp7i";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9621510E34C
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 09:43:00 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AD4wpXI3336970
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 09:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 omyFsDM0eGj29Q1WT1EzsONp+JQNaIFi05rWWj2fj0k=; b=UA1XHHHd06fGc5oj
 UDE+8yWJZUDMpUakkDIBVnZ0jGSLIw1/LrjbR4g9fysnT0ovoqWOW3Ndpc7EpCbb
 HGdAgKMXxXnmD+Cc2QrNEqE+ucptu0uYQ0uHQ1xWmVTsw2TL6sAFykqfnhw2w9T+
 KjDzxSIR32k7vnh1wz1Rlhi5UvNBFaYzkMed/JBioNpx3Tf3bq6XtX3O925XHiML
 7Lm4wL6pT6JfytKQ5RepsV03igwJVXDuZGar3glhxLxtkhNoBYuSFs8VMSF3BTxJ
 yadKRTeBB63jFiY3i/ojJyr1bMOmIm6W8Kvmkf7oRVSYdY8akmubSoVY/UdiKZYN
 L06QZw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad8sa0vnr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 09:42:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ed9122dce9so808621cf.2
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 01:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763026979; x=1763631779;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=omyFsDM0eGj29Q1WT1EzsONp+JQNaIFi05rWWj2fj0k=;
 b=G2k+bp7i75sVf+rG2nr72rvPtY2jwCJmO9CFy0rAXxsQPRqW90ynYK/Iw3v2A/m8pk
 JouAbvx7yXC3coueprQP1TDoo8eZkbCxGrZy4jyFGnDlA/CMcf0OmJk14ctLHondJULh
 zs6kUO+dXmqOLgeJTO/MSlzp1mMVFLneyq9JDpcv83MyjT9QC2H2Flz8YgjxClRUVHWm
 VfaDVSYammpOWDDj6hpzf42F5r8Ikp24uZK5E+Eou1847zRnIaQ7/Gxfuj9wZz82ICw/
 gpO9eOv26jeMEcO58vRh7wkpGLESi8yYZsRVZ0CF47vuTk/ovrFcXBjXSXabsLizg0N8
 1jxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763026979; x=1763631779;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=omyFsDM0eGj29Q1WT1EzsONp+JQNaIFi05rWWj2fj0k=;
 b=NM5J4l0sIRCLKqa5Opc6Anh08mPNuNHNPBxbFOFTu7QYZ32UkUqlhwg731mPlU/WUy
 79mU4C2KCdWVZb2ATHXuybzecwax/MER5BSzEw/bnlf9glMhoO9ln0nXLSH/aB9Hp8VT
 75i0/DK7GfzaWi7qKXYgBLCNaPqnC+SiLmyxbEYfpvKN1CUGb0I77FwrZsW/zZMoNX5c
 HYhu0lV1kiKtGXKA/r8De9oIPZH0CNsJcPf92TcLo1zItuAQ2KEJt9/abf1N9qNx3fLg
 S0LYGa2vCYhErI5WE3TGX+xfT6d6Q/UWnSyCk7mn/Vbo75Em2RmH7M+EUz8jnuqkMJp4
 0Vrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgq4DsagNllUPhi4IaUePMuvQ4NQ/hqtG8ebpY+jn8mBpUG2OoCwvpu61/iNUEf/otvqgApEw2IEw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEWS8QJW7Uddy7GWDMxaX/moIGdx6wAE7Bv89iAiqc7FTwm9Ru
 HgpBfa+su/Z2xudZfGbgsBr3BVrgRbKf8k1xXbRwZZWb6WkToZ/D+c0qiWgycWhO47+AqB6vwS1
 aPOXTxTUIPlYPDUlJd0LnS+brq7i7XtFoMXlE9zzsWW2wK0NKV7o5jnDw/IHRZ+6Ua+URt1U=
X-Gm-Gg: ASbGncsSdgvBALuE+7dx2Yw/lU0Gb16dS4pZiRif6gDnBHUukwvIq6+f0h1NBTqk1Jl
 2/nvVMuQO0quKWh6JW/zlrknRkYJbHG0sI+7+WxpX4TeoE15wXOJZ8ra/BfYHwyZG22b6lT9N1Q
 Ck8Kr/ooH0ZU3lv3/2RMBqibkDpNru1qnpsQg8TrTVTHCnu5DaGullgTMtjlurKz9tcMNxGfkTU
 J4TNSpcAIzRkQBu5xOyr1PSwG0OuNFiW5UWSEQIJUmcOPC9/9L+Jr34NV5YYDpUe7WwdLigWeLQ
 dU4ddutHTqx/wmYLOEcMwE0abC9LzvATAsVKz9OyY9cmA7r9XNLPuyBuDs9qgUt+TXNV0l/dq5A
 9SNlIUzcVuKbsU4MTpVOAnk0It7xINGWj+5rGiRosAByheHfcBDR/ifMD
X-Received: by 2002:a05:622a:7908:b0:4ed:e284:4a18 with SMTP id
 d75a77b69052e-4ede2845978mr28815981cf.9.1763026978841; 
 Thu, 13 Nov 2025 01:42:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvKWw3IiL7wkrQy/+jmFVdR2o6TRc+eiHUU5enpTNDh4j+/qHBb66cMr9ZJ4pw+AV310uIfA==
X-Received: by 2002:a05:622a:7908:b0:4ed:e284:4a18 with SMTP id
 d75a77b69052e-4ede2845978mr28815661cf.9.1763026978200; 
 Thu, 13 Nov 2025 01:42:58 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fdac667sm124168766b.58.2025.11.13.01.42.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 01:42:57 -0800 (PST)
Message-ID: <fee56a54-5da0-47a4-b8e3-7ec01e2a1559@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 10:42:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/21] drm/msm/a6xx: Share dependency vote table with
 GMU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-12-bef18acd5e94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-12-bef18acd5e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fOAHQ-Uj45RL_r5uhoEzAcN-ZP4Ompvg
X-Proofpoint-ORIG-GUID: fOAHQ-Uj45RL_r5uhoEzAcN-ZP4Ompvg
X-Authority-Analysis: v=2.4 cv=dcGNHHXe c=1 sm=1 tr=0 ts=6915a823 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=DqcpYa4PS6cT72Y9dlEA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA3MCBTYWx0ZWRfX2XoZ23ncA3V0
 +moEx27Plb8eTdqJYhaN4+8Kvn60HSy4oBf++NoCoB5zhsiQqMJdYQ7k0yRWvCb8JJtvu9OoFpr
 z7OrVg1hvqux9NN3LoWaFIQmadTtCyjuPdQYlQSIEcCJRhaklwJsCk0jyDWbtmtybHiJf6W0F/h
 MfQpV965BldH27CMRfjtFj4oFxElTZPDsZVcozOEDtYSnxnTYQCfXLr5cOjwZOBipoZ+YNpUuFl
 /C4rKZ7M9gY3EUOWpwPEGZ8vn02KQLJsolPC8u5anVeSq+wOjqq008fHcop0+vOVeoWl+afAS+w
 yxicPH1WJapN1H6K4clQ/y+66q3JTXQg0OgLB/JKmpt/IlIwrsdNWXnlZXiSigMVqrqjK0uurI8
 QvtjgB5IFx/YFvclq814R6Bo0Ue4Qw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130070
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

On 11/10/25 5:37 PM, Akhil P Oommen wrote:
> A8x GMU firmwares expect a separate vote table which describes the
> relationship between the Gx rail and MxA rail (and possibly Cx rail).
> Create this new vote table and implement the new HFI message which
> allows passing vote tables to send this data to GMU.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 54 +++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 53 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.h | 17 +++++++++++
>  4 files changed, 125 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 8597d7adf2f7..396da035cbe8 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1591,6 +1591,57 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
>  	return 0;
>  }
>  
> +static int a6xx_gmu_rpmh_dep_votes_init(struct device *dev, u32 *votes,
> +		unsigned long *freqs, int freqs_count)

Checkpatch should be grumpy about indentation here

[...]

> +	/* Construct a vote for rest of the corners */
> +	for (int i = 1; i < freqs_count; i++) {
> +		u8 j, index = 0;
> +		unsigned int level = a6xx_gmu_get_arc_level(dev, freqs[i]);

nit: reverse-Christmas-tree would be nice here

> +
> +		/* Get the primary index that matches the arc level */
> +		for (j = 0; j < count; j++) {
> +			if (mx[j] >= level) {
> +				index = j;
> +				break;
> +			}
> +		}
> +
> +		if (j == count) {
> +			DRM_DEV_ERROR(dev,
> +				      "Mx Level %u not found in the RPMh list\n",
> +				      level);
> +			DRM_DEV_ERROR(dev, "Available levels:\n");
> +			for (j = 0; j < count; j++)
> +				DRM_DEV_ERROR(dev, "  %u\n", mx[j]);
> +
> +			return -EINVAL;
> +		}
> +
> +		/* Construct the vote */
> +		votes[i] = (0x3fff << 14) | (index << 8) | (0xff);

FIELD_PREP() + GENMASK, please

[...]

> +static int a8xx_hfi_send_perf_table(struct a6xx_gmu *gmu)
> +{
> +	unsigned int num_gx_votes = 3, num_cx_votes = 2;
> +	struct a6xx_hfi_table_entry *entry;
> +	struct a6xx_hfi_table *tbl;
> +	int ret, i;
> +	u32 size;
> +
> +	size = sizeof(*tbl) +  (2 * sizeof(tbl->entry[0])) +
> +		(gmu->nr_gpu_freqs * num_gx_votes * sizeof(gmu->gx_arc_votes[0])) +
> +		(gmu->nr_gmu_freqs * num_cx_votes * sizeof(gmu->cx_arc_votes[0]));
> +	tbl = devm_kzalloc(gmu->dev, size, GFP_KERNEL);

devm_ only adds overhead here, there's not even an error-return path,
go with regular kzalloc/kfree

> +	tbl->type = HFI_TABLE_GPU_PERF;
> +
> +	/* First fill GX votes */
> +	entry = &tbl->entry[0];
> +	entry->count = gmu->nr_gpu_freqs;
> +	entry->stride = num_gx_votes;
> +
> +	for (i = 0; i < gmu->nr_gpu_freqs; i++) {
> +		unsigned int base = i * entry->stride;
> +
> +		entry->data[base+0] = gmu->gx_arc_votes[i];
> +		entry->data[base+1] = gmu->dep_arc_votes[i];
> +		entry->data[base+2] = gmu->gpu_freqs[i] / 1000;

This is essentially struct perf_gx_level with the ACD field recycled

> +	}
> +
> +	/* Then fill CX votes */
> +	entry = (struct a6xx_hfi_table_entry *)
> +		&tbl->entry[0].data[gmu->nr_gpu_freqs * num_gx_votes];
> +
> +	entry->count = gmu->nr_gmu_freqs;
> +	entry->stride = num_cx_votes;
> +
> +	for (i = 0; i < gmu->nr_gmu_freqs; i++) {
> +		unsigned int base = i * entry->stride;
> +
> +		entry->data[base] = gmu->cx_arc_votes[i];
> +		entry->data[base+1] = gmu->gmu_freqs[i] / 1000;

And this is struct perf_level

[...]

> +#define HFI_H2F_MSG_TABLE 15
> +
> +struct a6xx_hfi_table_entry {
> +	u32 count;
> +	u32 stride;
> +	u32 data[];
> +};
> +
> +struct a6xx_hfi_table {
> +	u32 header;
> +	u32 version;
> +#define HFI_TABLE_BW_VOTE 0
> +#define HFI_TABLE_GPU_PERF 1

Such defines usually go below the field definition, not above

Konrad
> +	u32 type;
> +	struct a6xx_hfi_table_entry entry[];
> +};
> +
>  #define HFI_H2F_MSG_GX_BW_PERF_VOTE 30
>  
>  struct a6xx_hfi_gx_bw_perf_vote_cmd {
> 
