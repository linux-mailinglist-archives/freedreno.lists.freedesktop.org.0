Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6EAB15DE8
	for <lists+freedreno@lfdr.de>; Wed, 30 Jul 2025 12:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF1B10E440;
	Wed, 30 Jul 2025 10:16:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kw5bmzUS";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD17C10E157
 for <freedreno@lists.freedesktop.org>; Wed, 30 Jul 2025 10:16:27 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U4kK7o013712
 for <freedreno@lists.freedesktop.org>; Wed, 30 Jul 2025 10:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 e74WcFwkTr6qVr34ZJAvZTfeytAh6aWlboCX6N91C3A=; b=Kw5bmzUSHx4PROsj
 WFRjmhqaxrVUj/5aGffpMHtJaySYHJKSY7gbM1742maN0xiQAkLy+hHEDb16UgwV
 UcCLWhxRDLqFv0M9FGqOkSyQ1ZKRGtjf9oMWfzonCyS3lDfQiUB1BcDvfr+pFMxo
 VwxGQnokbaF/DeCxN77CsEGOxmsgDTf3R+ESA05MvX0gz8NP5ChOjHHPc2XvTY1H
 1q5nKz4sc9Pq15owH390aNtsUt49yr1gi8mlvVk0Sel9m47bjjzBF8WzRT46vXTL
 LGAAR+XsE3RKLJLEf+5/r1K2AaSbKsskxYf/KlJNRTp9AnDg2AmK7coCk1eh2a3n
 ngFqwA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qda38hx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 30 Jul 2025 10:16:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ab716c33cdso29944601cf.0
 for <freedreno@lists.freedesktop.org>; Wed, 30 Jul 2025 03:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753870585; x=1754475385;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e74WcFwkTr6qVr34ZJAvZTfeytAh6aWlboCX6N91C3A=;
 b=nfPKh4Q7Sv4/ZVriS3YredX4yYGRfk/xV7sAhDCBw/cCvrEqjG4k1Db9iATIv3u/Hl
 +UVAG+xEHElKRvOdfoP09QOdz32YEtsNmvlvOdGEue8MM6kLb++nZuw60CDI2bvfVQLW
 uGU4F0J5wK9MRW2yiyHjfTg6KT7mR9BWK+XObB7NkNxCZdQo54Cst7T5ySW8ZVwMbz1z
 Nz5AJEpVXprw01xpVlG1M4ltgvFiw12klLysrDtYNAR9oySvLUhQqTZMcHbM0Z6+Cmng
 5R3jg/azkyGsvYpBSERjuAg57urXB5razmWFtVFnukahxTdvrb8ICxgNpd8w3qnLlkJP
 89OA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZmEaHO7VdaPfR6zTK7HPiq4E9NZWAf1KA+fb0mMaPSDby1Zu9Q98rvL31WpI7LBOVzNCNg+J2YyI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVdjeiKgtZBlHJXIvyHPK0eXijW8WkcjPqf3sSciZ9APQR7wJ2
 k4tHYkNh8YI6HkAZymIJrWcokgn05FMCdf+Ev+gw4RlRj5XYSFv9Q/lKS5x6XM7D92PAe/b2cug
 xFtL7L0NX0h7vjF+qVjXT6ACccJ1E3MrYNfloeDv7guD/KyO4qjk0iaYlemWe2lFskZ7NKSI=
X-Gm-Gg: ASbGncsRfZF1vk8MYLefetJK+3wPyfY8SJSiuPtrLLnk6vvyA6zY8tM9eQ7LEm5/8lV
 KxtW1k/xJWyawvUoXygZ8oOnWsTWnFg6GXnvK0l0N5p67n4tTwiBodYklLANfEYn5VaB7lKCvTw
 ZARpbFEYPDzdO5lf619lUncU0+4ZnXNpp4qxCbXmdumpc/Evm3IRh1p+WDN3GhVLdAR7obNtQ1u
 nWkw+ZlH3E1XSzAWc1dpTdsh/4QgXi3lrTTByFq5Lr4GJ1kCG7x8KvZU8NN4bOnqJYmN6CN4Bxk
 RqJm5FQUgFqdeqdtcPbfRca0jjBSAUReaUIojBdkNLiyTBOvVJKEQAWjiOjHCVTDDNxS2i540QF
 6RbfMtHBNE5tS78K8yw==
X-Received: by 2002:a05:620a:a907:b0:7e6:6f9d:4b06 with SMTP id
 af79cd13be357-7e66f9d4b93mr156064985a.0.1753870585407; 
 Wed, 30 Jul 2025 03:16:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMVovcbr9AHNlT90gl+k15THWxhh7Sd7H8hPKD8T+t66JapkQsUuAU5RAVLiYqLUQ/JNBoxw==
X-Received: by 2002:a05:620a:a907:b0:7e6:6f9d:4b06 with SMTP id
 af79cd13be357-7e66f9d4b93mr156060585a.0.1753870584897; 
 Wed, 30 Jul 2025 03:16:24 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af635accc38sm715115266b.114.2025.07.30.03.16.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 03:16:24 -0700 (PDT)
Message-ID: <070915c8-4d7f-40d2-ba38-e20a801c9089@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 12:16:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] soc: qcom: ubwc: Add QCS8300 UBWC cfg
To: Yongxing Mou <quic_yongmou@quicinc.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com>
 <20250730-mdssdt_qcs8300-v5-5-bc8ea35bbed6@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250730-mdssdt_qcs8300-v5-5-bc8ea35bbed6@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MvrpEfhaVSIhZrzJAoeqc9lPtxrLLzji
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=6889f0fa cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=TI01094hTbTrXjSAet8A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: MvrpEfhaVSIhZrzJAoeqc9lPtxrLLzji
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA3MSBTYWx0ZWRfX/0zbGWIuh5+2
 9h3vDF5rBPcYclhyeSMARO31iK6Gb80gouiydfVdzFoIw9d8ah0FHTIR/v+IyRxBJI206+5YaF8
 hwiucHk4jJcOsZlgqotjukHBGh18lsf3gZ99GUB8jbtA/TzkHeJ8CH9lEjjIkAuq0XAPT8FORrQ
 4X6kAhJErKeUCH+/4NYZyVHb2umkVGYxIZhYeQyOpaLoymBAuM4MvBsGTKsampywJay5MLy5xN0
 IPK0qxixP+lGonYsZgIlJnCnXDTy8JCEAo0xuSwQ8/5hA0PrajLuumWh/Z8ByAEIKB+SpC8Sd++
 RRv6yxQCgox8ASAhcFO5fKjjMDRPEghuFUYVpVoyZPEYCUpHiTlGIrlmxWc66usioSQvCJn3E/z
 GB6nr1KLDKd6GMCSKqJPKsz43XyOLdi/j6/NLwLknVlBAce+XpBvZhO3b6GqQAB06Ax7YPZE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300071
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

On 7/30/25 11:42 AM, Yongxing Mou wrote:
> The QCS8300 adopts UBWC 4.0, consistent with SA8775P, add 4 channels LP5
> configuration data according to the specification.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> index bd0a98aad9f3b222abcf0a7af85a318caffa9841..389fb871018b65987295db60571c063b4d984d70 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -35,6 +35,16 @@ static const struct qcom_ubwc_cfg_data qcm2290_data = {
>  	.highest_bank_bit = 15,
>  };
>  
> +static const struct qcom_ubwc_cfg_data qcs8300_data = {
> +	.ubwc_enc_version = UBWC_4_0,
> +	.ubwc_dec_version = UBWC_4_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
> +	.ubwc_bank_spread = true,
> +	.highest_bank_bit = 16,
> +	.macrotile_mode = true,
> +};
> +
>  static const struct qcom_ubwc_cfg_data sa8775p_data = {
>  	.ubwc_enc_version = UBWC_4_0,
>  	.ubwc_dec_version = UBWC_4_0,
> @@ -225,6 +235,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
>  	{ .compatible = "qcom,msm8998", .data = &msm8998_data },
>  	{ .compatible = "qcom,qcm2290", .data = &qcm2290_data, },
>  	{ .compatible = "qcom,qcm6490", .data = &sc7280_data, },
> +	{ .compatible = "qcom,qcs8300", .data = &qcs8300_data, },

You can just pass &sc8280xp_data instead, they're equivalent

Konrad
