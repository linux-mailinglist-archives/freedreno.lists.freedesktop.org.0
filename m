Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D40BBD554
	for <lists+freedreno@lfdr.de>; Mon, 06 Oct 2025 10:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A42C10E29F;
	Mon,  6 Oct 2025 08:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JSSvtF+E";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF5E10E342
 for <freedreno@lists.freedesktop.org>; Mon,  6 Oct 2025 08:28:54 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595NJbH6018627
 for <freedreno@lists.freedesktop.org>; Mon, 6 Oct 2025 08:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fySFI0+vB4C2jZwTubej+JIBaPURTzcto53v2iuju/0=; b=JSSvtF+EV+lEe3aW
 HdCNglBweJ7uJXfNoYT/GyNTNvVOLaG6JqNdCqvQUqx6Bg1onQwFvG0S5V7hN6qy
 GWU9oH5N+kPsFyQJiGypl4mFosNXvRl8peDSkz1GAVJnm67uQ5y2g7ZOMzTnCg7v
 6L6OZssRWfcWLOFZS9EOsajv5bHTQbTCKWPn6DEJgUzSCNMYPxurMTWd/E1CsKlm
 SFnr2dXyIeb8dEar1Agjt33dL3+DABK9vL0Ogl/A/OH2gw8gf7boUqOH091S+a9r
 MY7GinrPiCmEgvNkRYtSygH49dtSf/0q65Xr0Ifqw4OGNNsIcWRjDwQIaxRdbEaq
 gmdhlw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49ju5xbb6k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 06 Oct 2025 08:28:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-865c7dee192so100632685a.2
 for <freedreno@lists.freedesktop.org>; Mon, 06 Oct 2025 01:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759739332; x=1760344132;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fySFI0+vB4C2jZwTubej+JIBaPURTzcto53v2iuju/0=;
 b=KlKrp+3SF9ouZL3gW397LE306cnLbRUFMGPnnpComOy5nZzUtEK+jRPE+fxVZG5HqG
 1giOSf6XXxE1StktrVq+xLIk3OLehjZr7DFPZ71/Y7e3PTibkzFS3Fg4KxB/NB+ROump
 YXxBbY4j5cz3xZoe2n9vvUq5yVyHsdQZ4RDAfhK1DzOIaZ1K6w5Ycd8anX6nZZI0YnL2
 +sAqfEG5fOm59ewSDlRGgDz7/q2ZiAbGnsm07hXNd/q2kWkxBIcjFnkNMNEQJtLzXmbd
 g9UqauJ8ZyuxDxHKQdzIKIHUOiFtThkQ3JqHfMJNw5I4eNpaa3WD9Ai/jWrJ74YXAyhP
 o03Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLSHK4DDvMnyKyUAzIBXulCA/U5vXvGIeA6EHz3D1KeS3Hk0/ulNzl3jy8GMgzRYEkIJ9LBGzhnb4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzunzm8IGKLPoVcKT2LGbHgqE2jSEB3+B2NzS7w3y1Txsuyokg7
 i3jtntNudoi2qj7Q/6G1rmpGpJseTlEIM0VVwCGWaGGkk/HndqA65KdhqNej4KJCuAAyFwrAviT
 /suwIoKnj1KnQUDaWwwZCI+W34Ug2TTcTu0AJRWHTKoWsavp1+FdUXzchUS5iwheeEIBOQoM=
X-Gm-Gg: ASbGncsQFxNjst4CVxj6IqZV4b+mTLvsrWhWx+U31oBx76dSU92M+vwzkkYHjqLVUul
 b5ivpWDb3BGbu3SJbexEmoT/JIOxNENdDz9YWZV765Bx401Bo2SlMGHwywJ9jCnKbTZWCfsu7u6
 mLy+/eu1h+Xf7iV8zhMJZf6vKFap0O8qDImiotJysutt37qB9EXpWDI29cezp+bk5PxEgdS8Xxi
 /hcYAvhT2JJFbEXUIRiiLUBq6RVBCPMtjXxlcAbkhdxs7/SrArB6U2JwW2SblvHVjjV/pLznjim
 h3BVtWpsGL4SgKXsYttl18Z/nAhhYqDeuQeO7eVH3SKuqSmLsZmnGCsdC8VeoNGESC2Qa3WkB6L
 lOhG9vEh+L5fcpVnmI8D1PO0dMBM=
X-Received: by 2002:a05:620a:28cc:b0:855:b82a:eba5 with SMTP id
 af79cd13be357-87a342f8541mr1018834485a.2.1759739332431; 
 Mon, 06 Oct 2025 01:28:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExpG1GPi83h7oEKjeN5OxS64YtQ149fVac/bi4Nb1qP6pl8aEItSm3iduplFbNPRMuPJyo9Q==
X-Received: by 2002:a05:620a:28cc:b0:855:b82a:eba5 with SMTP id
 af79cd13be357-87a342f8541mr1018831185a.2.1759739331800; 
 Mon, 06 Oct 2025 01:28:51 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4865a83f6csm1105339366b.31.2025.10.06.01.28.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Oct 2025 01:28:51 -0700 (PDT)
Message-ID: <565924dc-84d4-40cc-8826-5143338cca21@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 10:28:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] drm/msm/dsi: add DSI support for QCS8300
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com
References: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
 <20251006013924.1114833-6-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251006013924.1114833-6-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FooIPmrq c=1 sm=1 tr=0 ts=68e37dc5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=rHxuBsFVyQJAZ78EHecA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ivnjc6FTnphuBWIXLDHp3Huh_QZN7YZP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMiBTYWx0ZWRfXz+72z2AZogTL
 9+hKtmAw1CQ0L1GKROhTN/e75Vws4dlRHhiRlNTsx/c3/yzvxBbGbzkLeBlfQQief1ioaSi/Cpd
 CGJGEmLCR5M1EQb/o4L94RBYmjdncdEQeZeFOjiwLnTAWTtNsp53E6qv3y0JsejSrgXYHvulMk4
 nwlr42ESYeZgu9V0BviFdAl+naR92ziHET2rDneS9ufvx+eILZDgGnQUTtiLHx++SNuLOpCTeAk
 OWwWZ0bbVz9LxK1hZDfwS8EMzA/DB6zyaMv4ba0Db40Ev9BX5ClBpKsS+wdkdaChzgIZ5Zhg6Ly
 ELui96HZu5P694DQ3QQCpLB3lYrcU+cua5LkTm8+242EqdBW0fiVpvVaQxyGblQnA6r52oCmxAl
 IQ+4/e4eHlGksVc3IulTVD7KaPXEzA==
X-Proofpoint-GUID: ivnjc6FTnphuBWIXLDHp3Huh_QZN7YZP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040022
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

On 10/6/25 3:39 AM, Ayushi Makhija wrote:
> Add DSI Controller v2.5.1 support for QCS8300 SoC.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index fed8e9b67011..b60384ea0b32 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -226,6 +226,17 @@ static const struct regulator_bulk_data sa8775p_dsi_regulators[] = {
>  	{ .supply = "refgen" },
>  };
>  
> +static const struct msm_dsi_config qcs8300_dsi_cfg = {
> +	.io_offset = DSI_6G_REG_SHIFT,
> +	.regulator_data = sa8775p_dsi_regulators,
> +	.num_regulators = ARRAY_SIZE(sa8775p_dsi_regulators),
> +	.bus_clk_names = dsi_v2_4_clk_names,
> +	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
> +	.io_start = {
> +		{ 0xae94000},

"{ 0xae94000 },"

But there is no need to introduce this ops (vs 8775), if the secondary
IO base is never requested, it will simply be left unused

Konrad
