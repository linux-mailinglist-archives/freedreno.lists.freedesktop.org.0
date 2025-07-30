Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA071B16088
	for <lists+freedreno@lfdr.de>; Wed, 30 Jul 2025 14:45:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E08B10E209;
	Wed, 30 Jul 2025 12:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PGoJrr4z";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D005F10E209
 for <freedreno@lists.freedesktop.org>; Wed, 30 Jul 2025 12:45:23 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCbAVx005861
 for <freedreno@lists.freedesktop.org>; Wed, 30 Jul 2025 12:45:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tGD7An+ORZOjh//giVMxSzmnuZTa775G5JSoHE0guvU=; b=PGoJrr4zHtCSTMPk
 m4+MGP3v7i8nvYY6l/IeF+O/VzXc/JOJkvDKxkB/WnwfCUMbbY+mQ/vtfeylc9+q
 GvDQMiv4Sl2WCjxQZSuOvTQQGE5nVD5AwxOTPBhakMxacyKtC+rGtNIqsEV8bLD4
 /6NEs+qZEnPJ9NbcgY6C5HtPpq1RzWlGRp/jCRVxDez8RGDUWKvmqHtiB03I2kQq
 Ac9owKDs8M8roGeVDkoI4YndtHPlFrFkLLqb14inLTFeN9RjNueWdOukdmpLof6V
 rc13k8IJO+/z4KUVlA+HGHma5Sus/CxAA/QH4HKno8Xkpj6zA5LTHNg+ASv7VzkV
 moBH/g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 487jwg845e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 30 Jul 2025 12:45:23 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-707641946ecso1934646d6.1
 for <freedreno@lists.freedesktop.org>; Wed, 30 Jul 2025 05:45:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753879521; x=1754484321;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tGD7An+ORZOjh//giVMxSzmnuZTa775G5JSoHE0guvU=;
 b=MArFgh3q0rAVM31Ipfl1thtbTziqWSWuvk7l+33pvt50jFmHQpWl10EihNWlBFKr3I
 I25UFIAOLfKLR1oG6vrlRLeO+QgB/sLIeVMpSVo6AU293yMjurfz8SkX7PimOMkp9liH
 /eyMZhetCFnjQ6fZ6ooSjK1YcLC0v4IdfwS9dZLSdlU+Dx6f7jsolP6buur4gt1+5c22
 b9+yI/YuhVMZoXnBfxODBg2H+897dr5UfSW1rKT5iqUuN5Fd7kHIOwgT9GVfGFSc+Tyk
 jgLfH485eKREJh8xM49qOtGDLy3qHnWd9XFtCfKa3WmUNNAJzAe7tZ71zat4k13T7Kmf
 o+aQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUb2TBMVZrCrSsqmBlO/vwZPqdVBrb/au3EJfr2tkKEaWvzyS5cngqAMHUf6UmUaIh5patisX6HCDU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIY2gsmKava2RitKPpApCFOm0QfSc9I5Tl/koT3ZoeJXCYw0fO
 WcTXp34THyegbwZchIeC/Mdw1Y7KAIwtdCgH+ziSp8+rJIyyign6Lru11CdP6x6Lu/qKvbdaHyX
 XbgKXl06QjeTW6FTqH55GhI6D9+b4LMdNR2hnymJFFfR1xRgUorjZ6U/3Uxi1+XvnsL3XK2A=
X-Gm-Gg: ASbGnct4WsLDAEhP28JMZXbIfjHsoNWuv2M//JEKFnDl4/3z3JDzG7fPwLFeWwt8W78
 QExnbPDnsVvf/e58dfZtHDFo2RI1ldytxqi7nmYW5A27ZXcTf44Ij24jphRk74gB9cW8YLx0N2k
 FBlmWCmVPJgB57JEplE1KgOAP+3O9OxiIMwAKZFKHje24t/dg3Enooyui4A+T1WnFe3I39jzrze
 SUo2kPOKPIqBCMAmJ2mQ1CFrJlhRK5my0Q0aR+wUKWrmgCHF/Qgk/pNyfNG4SMUoQsenMDaE+uG
 uj5d9WHMssGY9rUscZGgS6r/KzGtDkyVT83+QZl394gOtSV74UNCdYVNGCoIAGVvhXl6PpeAVF1
 /vz7R7bidli9VZKqfMw==
X-Received: by 2002:a05:620a:c55:b0:7e3:3c02:4c10 with SMTP id
 af79cd13be357-7e66f340dbemr204407785a.10.1753879521340; 
 Wed, 30 Jul 2025 05:45:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdISRDnj4LdKwJnA5RwUTBCM101PtZrNYA6In3rDGQz1QjGYTyHcrpf0LJ3CYc1iz1Xdis+g==
X-Received: by 2002:a05:620a:c55:b0:7e3:3c02:4c10 with SMTP id
 af79cd13be357-7e66f340dbemr204403685a.10.1753879520804; 
 Wed, 30 Jul 2025 05:45:20 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af635a669c8sm733134866b.72.2025.07.30.05.45.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 05:45:20 -0700 (PDT)
Message-ID: <74e3836e-af29-4b5f-b644-23bdff084c78@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 14:45:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: update the high bitfield of certain DSI registers
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, lumag@kernel.org, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
References: <20250730123938.1038640-1-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250730123938.1038640-1-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WvgrMcfv c=1 sm=1 tr=0 ts=688a13e3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=COk6AnOGAAAA:8
 a=GqOxEGSAyoRmTf9NYtcA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: uhhUsInsVzXAWO5Cr9dwc24a5x6YXKQG
X-Proofpoint-GUID: uhhUsInsVzXAWO5Cr9dwc24a5x6YXKQG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA5MSBTYWx0ZWRfXxA191G+bWPFo
 KIBZywOgf8w1elTLoJm4X65DF7HTv7ZTDKWrOr1xI1a/5FG1gA7NDyql+9v2zhD038uw76/LguX
 AV/PagVm4uIe2C/xGC6VM4zVr8skjLPAKCe9AkI6qsZzSurnw7h4RYomUkzsKCy9WkqjamsvH8E
 Lko837JUOoJ6sReGAsZ7L0t5BP14zTeGxaMC1Oq/Prrf+azdaWSbufMULbej6K0MlDGQpYX4mSh
 4aiEXIwFD3exISQtAkfUy+xw2ZB1L/j/EKltSIU0JYHJDSLHsvH+l88r7mZ3KzkRmDL56Hes90Q
 78Fmi6ZBNOW5jwkaeKRTxl/XcAxVEKm7urkotN8T96vU6CP+/OlSxS8HWl7bmwjTd7KOwfZqp0t
 DBlmvLxOc1DmTIAs5wC/4IxKebnJnqlyCcYlmxhxmFMHIy+zTm4QQE5h8q/XCcALMtQ99Y8p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=938 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300091
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

On 7/30/25 2:39 PM, Ayushi Makhija wrote:
> Currently, the high bitfield of certain DSI registers
> do not align with the configuration of the SWI registers
> description. This can lead to wrong programming these DSI
> registers, for example for 4k resloution where H_TOTAL is
> taking 13 bits but software is programming only 12 bits
> because of the incorrect bitmask for H_TOTAL bitfeild,
> this is causing DSI FIFO errors. To resolve this issue,
> increase the high bitfield of the DSI registers from 12 bits
> to 16 bits in dsi.xml to match the SWI register configuration.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  drivers/gpu/drm/msm/registers/display/dsi.xml | 28 +++++++++----------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/registers/display/dsi.xml b/drivers/gpu/drm/msm/registers/display/dsi.xml
> index 501ffc585a9f..c7a7b633d747 100644
> --- a/drivers/gpu/drm/msm/registers/display/dsi.xml
> +++ b/drivers/gpu/drm/msm/registers/display/dsi.xml
> @@ -159,28 +159,28 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
>  		<bitfield name="RGB_SWAP" low="12" high="14" type="dsi_rgb_swap"/>
>  	</reg32>
>  	<reg32 offset="0x00020" name="ACTIVE_H">
> -		<bitfield name="START" low="0" high="11" type="uint"/>
> -		<bitfield name="END" low="16" high="27" type="uint"/>
> +		<bitfield name="START" low="0" high="15" type="uint"/>
> +		<bitfield name="END" low="16" high="31" type="uint"/>
>  	</reg32>
>  	<reg32 offset="0x00024" name="ACTIVE_V">
> -		<bitfield name="START" low="0" high="11" type="uint"/>
> -		<bitfield name="END" low="16" high="27" type="uint"/>
> +		<bitfield name="START" low="0" high="15" type="uint"/>
> +		<bitfield name="END" low="16" high="31" type="uint"/>
>  	</reg32>
>  	<reg32 offset="0x00028" name="TOTAL">
> -		<bitfield name="H_TOTAL" low="0" high="11" type="uint"/>
> -		<bitfield name="V_TOTAL" low="16" high="27" type="uint"/>
> +		<bitfield name="H_TOTAL" low="0" high="15" type="uint"/>
> +		<bitfield name="V_TOTAL" low="16" high="31" type="uint"/>
>  	</reg32>
>  	<reg32 offset="0x0002c" name="ACTIVE_HSYNC">
> -		<bitfield name="START" low="0" high="11" type="uint"/>
> -		<bitfield name="END" low="16" high="27" type="uint"/>
> +		<bitfield name="START" low="0" high="15" type="uint"/>
> +		<bitfield name="END" low="16" high="31" type="uint"/>
>  	</reg32>
>  	<reg32 offset="0x00030" name="ACTIVE_VSYNC_HPOS">
> -		<bitfield name="START" low="0" high="11" type="uint"/>
> -		<bitfield name="END" low="16" high="27" type="uint"/>
> +		<bitfield name="START" low="0" high="15" type="uint"/>
> +		<bitfield name="END" low="16" high="31" type="uint"/>
>  	</reg32>
>  	<reg32 offset="0x00034" name="ACTIVE_VSYNC_VPOS">

FWIW looks like at least on 8280, ACTIVE_VSYNC_HPOS offset = 0x38
and HPOS doesn't exist

Konrad
