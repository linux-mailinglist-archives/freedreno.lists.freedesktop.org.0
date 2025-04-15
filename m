Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 340EDA89879
	for <lists+freedreno@lfdr.de>; Tue, 15 Apr 2025 11:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C3DE10E6B2;
	Tue, 15 Apr 2025 09:44:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="V2dK16yQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA4E10E6AE
 for <freedreno@lists.freedesktop.org>; Tue, 15 Apr 2025 09:44:45 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tHCA012579
 for <freedreno@lists.freedesktop.org>; Tue, 15 Apr 2025 09:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dh7xlUxtOWfIN7SBnmAvxpsTUhx8yFt35Gg5z7br5FU=; b=V2dK16yQl6pylqWS
 R1E95Tw4nkew+6moyHTARiLlnzpU7er5QnXJOU6ovmVvOv7CvgFE+WH6F3WS/uWH
 2037Xy7QYlyzwmIzWlRgwVJcYpGY2vKoGDzFnX/B6t3f/dekJxM3g1v0Ue8tvzdI
 4K/8BvTKNaPDcQit495aEP72xKPw0DGcQFntRIgUrXwTaOve0qWcJupVBbl+e2V3
 wjkvTYEiU8UELOL/r7isTbpTdiFRkxhqYQmwyzGgOzd0NIf7KLgmuIwZo9L/Xhdw
 TQ5MQ25y14hj0RqNACX/BCiGgErdDIPNv7/02OUrxS3t4YT8kK4g3GK9hCiJhhEs
 g5FIQQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhq7sh0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 15 Apr 2025 09:44:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4766654b0c3so12197281cf.0
 for <freedreno@lists.freedesktop.org>; Tue, 15 Apr 2025 02:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744710284; x=1745315084;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dh7xlUxtOWfIN7SBnmAvxpsTUhx8yFt35Gg5z7br5FU=;
 b=qTfvo/Qdn4gaGtX5p4/Ib+56nohJDKL8nHYMLxSuLx8fNWdc3vtyLu8MCoUcJqpcMB
 htATaJekwlmpa4nFKURApUuMT+54HVN9BSOaVHu3ef1mnwYZT1Br4zT6J4hpTrOcB4Ke
 cg8v1hPOZCOylvQFBNAVIh4DIf158W3MuCpdJdaIlytwwtCfOjYNQNvUvobXH4QzlJ+Z
 K22X4bvx0/RhytiEw+Dm+FK/Qtmu/tnSy942CdrPN/CICf7Bw69ZyTSWfIbyJukRb+6b
 t0ziYHAfXU2CU4bZlw2qImtEEMdXULYTS82rBpH0wFLv+jZs6wfuEgoDO0Br1SrrgTiJ
 JGNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKeMm7UFM7wSecfZe+G/mN96SV1ijlcPxXuFJWQRWWoHDcT0wDlrZs/015TixCBKL3HmVlxrdOfQ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvGBsyItOsrDcdTG3PoMXkn25pLWR7232k3NT4W3VnLTH2PXmh
 k4R0mBMR76H3UMfRfZhdMbojKX7HDvVhVJDIFuOUmCj/4KyoMEuR9NDxf5Mf3+zKlkXrGj7cOoA
 mnentVinYE7vdzU1C53302GLKEiINu3ShHkfkvZzunMs/WZF4VzIRlyB3j7PaqrcPo3U=
X-Gm-Gg: ASbGnctsUbeLpBY/TtcA/4bpWmMaWIEVGtUcIgUqoJ96hdi/GPVFpVM1HOzJaEa5FRh
 ZBFJ/4KPj3pKUrOut8tbffV3Q/Y2S0O+I2UEGlM8A5SMXTj7hm8PMFk3MKXStcrGwT8IJkpxJqh
 mBlqVj8VU39y7Qhutiio5muM59hrnw40M3dAK04GngP5z0LMapoGbwXlJhBAU9Hxc8V/JsQc60Q
 GFWpPmWrZWJ4sBc8euMLlaEXxYx2xCkYKH6vONBnS8dhS+UdTg7THxcMtfhqO63titvp03wkQCi
 TPrX5mbzrGhsChkLbqJQB8S91ZmYIaDZpP9oTu2W6iqqVs6YJbt1MZQEt3I1bYDk4us=
X-Received: by 2002:a05:622a:190b:b0:476:66fb:4df4 with SMTP id
 d75a77b69052e-479773fae77mr86594231cf.0.1744710283878; 
 Tue, 15 Apr 2025 02:44:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtDVLNzgvpQI0Lhz9q3H+Gl7nwNw80XyxluXGruUxEXUTIGiDUoi+aDVsGLS4X9fWsR8kNoQ==
X-Received: by 2002:a05:622a:190b:b0:476:66fb:4df4 with SMTP id
 d75a77b69052e-479773fae77mr86594041cf.0.1744710283561; 
 Tue, 15 Apr 2025 02:44:43 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f36ef61911sm6334674a12.32.2025.04.15.02.44.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 02:44:43 -0700 (PDT)
Message-ID: <aa67f077-98dd-4561-b431-9db276ea29ba@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 11:44:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] iommu/arm-smmu-qcom: Add SAR2130P MDSS compatible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com>
 <20250415-sar2130p-display-v3-9-62314b1c9023@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-sar2130p-display-v3-9-62314b1c9023@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Z2iR6Y5pwZp-bz6BU8jYBgRUA1SrUr71
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=67fe2a8c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=TMI2DeuJ6cRHfy_QMqYA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Z2iR6Y5pwZp-bz6BU8jYBgRUA1SrUr71
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=640
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150067
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

On 4/15/25 11:39 AM, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <lumag@kernel.org>
> 
> Add the SAR2130P compatible to clients compatible list, the device
> require identity domain.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
