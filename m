Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53764B1362F
	for <lists+freedreno@lfdr.de>; Mon, 28 Jul 2025 10:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB1E10E49A;
	Mon, 28 Jul 2025 08:19:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZqJ3vKw/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4A010E49E
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 08:19:56 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56S4rZ7a023360
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 08:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 c3/V22c4H9/4N87ToxYjpj2YTnx67TDaYm5Xeu+qWco=; b=ZqJ3vKw/3GvY4XkR
 u3CP1JJjp9JwcIxipYoHGHzZEbT+MvMBKeBaTicf7yJuUihKYUhTyE2SeRM0bA4i
 hht87B7LURdJ1xM0YJ+76Xn1V7YNMBA8ZTDupifYtDmK4sTM6vw+pZAVjHfwLRuJ
 sJQzQXG79WLFWma44upEaDxFSrKYEIhduEUkGSbeAftU1HlXVq+Bk30iF+YV7wQx
 XmN3ssE54IOxsp45/O1nmgVeLCoXXVMuF/t0lkWiDan60me4LLzjz7+wVxGsRyPU
 2ycHzt++gelNTdIQUJe3wRptMKuSZ0kwRV2IBn38EQg3yrmTG3+uR3+++n3PAVZG
 K/RKfg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 485v1x95wt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 08:19:55 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-749294392e4so585854b3a.2
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 01:19:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753690794; x=1754295594;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=c3/V22c4H9/4N87ToxYjpj2YTnx67TDaYm5Xeu+qWco=;
 b=Kf4itGxVS6O/Op+9Pz/gYswygWycaOF7Fo8z4wGdo9eQgIX/y613FepcYOVTNHtjps
 ZOKINqkyfSG7UR4pTm2ZJsoldeIJfjIYumw7LaMyGoNDL5UMtVhWeTsnR3P7UsKp8M6Q
 6H4axbh8xP4c5Ml4dEdvh6faBsVespnjqAhcDCzbUL+HWuR6Nl9y2B7dxYbSm9s2GI5o
 RrQZf9xMxAnEW6JXw3qUWSZpWxTdU5r9tgnC2LU5PY9CNotAgeENicoXBXlgUsgjZ6Wo
 GO+xdsv+pBAxOGUchFddCMlY6lvDzfxUftFifTxFh48fuB1ylvfxPwhFcyUOIJ49DAhy
 Qlng==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGHjhv07Vp0X7MlOH62KWjw8k9z3UFhIIAH/VYiQZTlSkHSrpzjTpBdmLrZoH5aTC0A3DrPSjzaNM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyfqx2rJnJPT/Fxz+fHq1/LOz7oqcr0TPYqmJLmKoYCAAKR+SpH
 vCBOAXJvSZf2qJ1aR98SnMD6Ox85Qg0tLPNmcO3nAZ3Ui+696YxLgTqZuJSkmG7dXfZ+DgWqEhL
 O3V4tGg39dbmDpUrzFPtlh7l+rf+9cD3+Y6XEsaLrGAGy+M5h3rBJZ4kkP+hkssqMlL5KQYUmsT
 urnwE=
X-Gm-Gg: ASbGncsGAvHNywesdbvzOfE86eQQUkcXeB7asjG4JDA9KWzxWH7lmxzVHPAJLqXzgLj
 CPQZq1JC39P1ZNcn0jkA/dKnq49mcS9wQFQ3o7wi13zAkPq5gFqAMic8+JI3VRgNu41NLskvQca
 2MVoPkZeLl/noeTXzJqd4Mn4UKwpjcLnJM9EIzafIhek/IoZUI72lDN0bVltBu0t3G84l+26B/4
 FgWN6oDQyFOSAAcA9kiiGt1heu/Z3cILnr4EpLyidULdtP50jz4c+zx04dMP+S6XJShEnOk8q3r
 DDpn4MODuPBB3ZrnFyh3Musr51OdWSdBodkm/l8nYtiN5GskOzHUrQ4uwH2rG4sPkwgoX1vUdPl
 +QaSuk59eBMxSrsahu2nau9s=
X-Received: by 2002:a17:902:ea0d:b0:240:11be:4dbe with SMTP id
 d9443c01a7336-24011be58b5mr24214695ad.8.1753690794469; 
 Mon, 28 Jul 2025 01:19:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBHlvf/+jz4Co0OGrxgZgJllWx8x018fZVsC0zcR7Ey8G6AtlwbI1UqIOOzans4FRj4G1N0A==
X-Received: by 2002:a17:902:ea0d:b0:240:11be:4dbe with SMTP id
 d9443c01a7336-24011be58b5mr24214525ad.8.1753690793917; 
 Mon, 28 Jul 2025 01:19:53 -0700 (PDT)
Received: from [10.133.33.112] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23ffdd687aesm28379815ad.67.2025.07.28.01.19.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 01:19:53 -0700 (PDT)
Message-ID: <c3f191f1-1b83-4284-b164-64c5b3e3fd43@oss.qualcomm.com>
Date: Mon, 28 Jul 2025 16:19:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/13] drm/msm/dp: Add DisplayPort support for QCS615
To: Krzysztof Kozlowski <krzk@kernel.org>,
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 fange.zhang@oss.qualcomm.com, quic_lliu6@quicinc.com,
 quic_yongmou@quicinc.com
References: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
 <20250722-add-displayport-support-for-qcs615-platform-v2-12-42b4037171f8@oss.qualcomm.com>
 <bca68e7a-cb36-4903-bde9-15cb1945c71e@kernel.org>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <bca68e7a-cb36-4903-bde9-15cb1945c71e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDA2MSBTYWx0ZWRfXz+HTxF7Vq+HF
 KfiA0mSPJqqFRdHXApi689HhkcZP1QqjLKTvp5i2KU/THCnbo5PlEbTUiMdnYKCaNNDBmiE1AOu
 no63MFfT87NxfcisJDfCUK62ehJ7IZoiTrNXaTJ80Tg6ur3VoVq7xrFH/uWl9D50WsjjkrM5aMe
 LnoNyeMjtU+sogJtOw1rj5vXFgJX1NvJHxlFZxFiVpDMSBECJMMy+uacaPMbWxrxvIX1YX+qo+S
 O4KsXXvrbf/giE3O5CgAWrr4umaamWXpB7yqOq9ym5zB0/xWEy+vIAJotYpzq34TlF5rbIeYCqk
 sAkvnpH5xrmsC94fW085suZ1kSPua685+c7NTVqvHYq/iSJGgEnGYuDIKpwNQjK88Y0hgT2ZzOG
 f9tX12aWr16ZU9h2Zvko6zHtf+0pwSUvwheqBiVycsycW3Ej95mMMui3gvP+8BnluL3PHNgt
X-Authority-Analysis: v=2.4 cv=JKw7s9Kb c=1 sm=1 tr=0 ts=688732ab cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=E4FQgNMW2-BcOtG67-8A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: t8eDTHZb9OJ_I_IeqHhakXKpVhQ0kM7d
X-Proofpoint-GUID: t8eDTHZb9OJ_I_IeqHhakXKpVhQ0kM7d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280061
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


On 7/22/2025 5:21 PM, Krzysztof Kozlowski wrote:
> On 22/07/2025 09:22, Xiangxu Yin wrote:
>> The Qualcomm QCS615 platform comes with a DisplayPort controller use the
>> same base offset as sc7180. add support for this in DP driver.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index d87d47cc7ec3eb757ac192c411000bc50b824c59..ddb22b50490035779904d4cab20e2fee7e0f9657 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -196,6 +196,7 @@ static const struct of_device_id msm_dp_dt_match[] = {
>>  	{ .compatible = "qcom,sc8280xp-dp", .data = &msm_dp_desc_sc8280xp },
>>  	{ .compatible = "qcom,sc8280xp-edp", .data = &msm_dp_desc_sc8280xp },
>>  	{ .compatible = "qcom,sdm845-dp", .data = &msm_dp_desc_sdm845 },
>> +	{ .compatible = "qcom,sm6150-dp", .data = &msm_dp_desc_sc7180 },
>
> So devices are compatible? Why are you adding this entry instead of
> expressing compatibility?
SM6150 uses the same DP driver configuration as SC7180 via msm_dp_desc_sc7180, but its hardware lacks features like HBR3.
Implicitly relying on msm_dp_desc_sc7180 may cause compatibility issues for SM6150 if the msm_dp_desc is extended in the future.
This is consistent with how other SoCs like SM8350 are handled.
> Best regards,
> Krzysztof
