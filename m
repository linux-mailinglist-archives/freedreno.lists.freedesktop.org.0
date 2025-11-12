Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6238BC51A09
	for <lists+freedreno@lfdr.de>; Wed, 12 Nov 2025 11:22:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315B810E08E;
	Wed, 12 Nov 2025 10:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="A3D2P2Im";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bFiqpcuc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4FBA10E08E
 for <freedreno@lists.freedesktop.org>; Wed, 12 Nov 2025 10:22:50 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AC6Skp5350167
 for <freedreno@lists.freedesktop.org>; Wed, 12 Nov 2025 10:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5rwAyU0aPBERjod7wgKA1iXuGw5l4SeREMu619RQNrI=; b=A3D2P2ImD5qeuGzo
 jpBbHoHhTWoTnBAVC6dE7Q74dffCYK3d80Avh5EWOL9OPMibphll25jw/a+c2fLK
 C5Xv6OpsbOgjUViRvORZ+CEajalz9Rufz8i3y5mJ2xlMsqWP4CYR0jS6FfxV65Z5
 d867ln9H65q5ZU2XS8q/+NvwyDNLhI9aTeuQXWh7xnlDZOaHMasR3hzUsIAjzWVE
 evSA5abf0Rm28Ey5jE+QIs1WuH5Y0eqCeH35kW5hDrm/kkpjf/WzOU/kUnT+0InI
 kNXy1SsstRtaRY8vrTCrNCkHCRaxLqzO05nSOfn6qD8vBhrVoyDKg2u63Tt/Z4Th
 9sFYBQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acn0nrues-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 12 Nov 2025 10:22:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ed6317be8cso2156341cf.0
 for <freedreno@lists.freedesktop.org>; Wed, 12 Nov 2025 02:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762942969; x=1763547769;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5rwAyU0aPBERjod7wgKA1iXuGw5l4SeREMu619RQNrI=;
 b=bFiqpcucgJvg966OX3kReoItRKRqt24Rw9DuQl8pZ8qyhqMYv8TH2dMSy2by9klJPJ
 WUamCX+moBZnoXoO3YKaO6S22XkFYgU9fhjcC+/A++TtLRYV+DAArzV2GxZHNsKJ2CA5
 tg9dVxm8+duxN4mU1uqrdvcpVz3mXQe6EjgyhSobeZ20YD2pAfUmhtg+VW+lQNMz3ANe
 h+DZyN++A9kTRmzOqPzBl3Md7lp47+IsS1bdxGT3GFkj22CgjnYMYW+faCBVFLq12lLR
 666SMDUFpQyIXwQN8Bun19qBqsNT7+Ht+ITFFSoT53IccxnqWQJO1XbwGxnK5On5koa3
 KjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762942969; x=1763547769;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5rwAyU0aPBERjod7wgKA1iXuGw5l4SeREMu619RQNrI=;
 b=IAocifQ1w7RiONYEinegDrD5HsrIPLEbYSHAJkNhoenx53gT3smk2+8Fd0iFM7icQq
 DABjnDwu/MISeoIhcByJMGUoCiubfkwk3x2bynJ46zvxJrFvrzSjN6f2W3RAx2eWvU9y
 7W6Pt0adSz5gsnTMPUoocqKyJ54jmvOiKx0cN9BwkWBHA+9FAFgSIGsMDyNy1GX0LR6I
 UPMsznRgva95zKmztz4R/emDu6zo6TqqguTyz2l0bpiISDS7baUAylmLXLkNl6QK/CnK
 E7vIKaURsVW0+xDX6DOCVugSChfR6TNXslIWcY26si7zqf0iG4gvbLKretKg0zgQAGDT
 iypQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXa7+xkpIRYFK0733NxtH2eee9uoLAokyhqMfSlaEP7YgbeqiI4tY66ziFuCLznAdDKyfo7OZucLZE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzkyszox5K8S7bj4vFwKVScZOtGs16ztAzLi4kLnAXqTmprku3L
 TQPcbRQfemXPG8X89hGU5rXwI3K5xXe1xP36k24G5RX/VGFLkIYAxJ0qrza8J5Qxx5h09+8SnlH
 /Hfg9x7akrXL2ui3YZPYSAWe+oOLbPs3DC1VxIkg2alfmQK4SFtu+prkftPFFc8UlJ3ewKX4=
X-Gm-Gg: ASbGncvN606ZyqJXiJ4DfMHQ/U/gdWSX1msLGCa8v3CBRfGuPdJZ3ZmGdL3jUKfO8T2
 bUZy1YDRF+KGOxk3ylrvH3Rra0HFuq8rfzV9jl2HZNSAYkSypcaTR2cIuaiGRN/ILTQzwei+znm
 vKsRS/Y0l9GifVh3geiBmlYBbpOLbfkDAZwkNAm9EuqBhjUzzez6o9ZkIE+lIbUplU/wN50LcDc
 sa5QzPiqyhN2n2S15voMKYBDRm6/XYCbuAnqLlZHIyvbj3lBVOfSjikER/9jpiB+FGgmOMwLx/E
 STLr9Y9WS2z+EjYu8MdWvc1AVXCIKd45wIbqHYqoIQ1jlVybO6epOzDrvX6oXE64ZAfkDuF8cNf
 DgTlAadxKbxaE9/tUs7Kjii5ECvPPDZ63GiE+a9ZnTKOqW1pexdJFzCPB
X-Received: by 2002:a05:622a:d0:b0:4ec:f53b:418e with SMTP id
 d75a77b69052e-4eddbc6bc3dmr20362921cf.2.1762942969343; 
 Wed, 12 Nov 2025 02:22:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGebY4K7Namd6glwHLtMAZE0lf4hL9guGKfOfliFjM5eEuz55Nipc9SN3o1JFfip8JTUrox/Q==
X-Received: by 2002:a05:622a:d0:b0:4ec:f53b:418e with SMTP id
 d75a77b69052e-4eddbc6bc3dmr20362721cf.2.1762942968808; 
 Wed, 12 Nov 2025 02:22:48 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6411f862bd0sm15744925a12.26.2025.11.12.02.22.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 02:22:48 -0800 (PST)
Message-ID: <28d62905-c191-4c3a-995e-a4146ffce619@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 11:22:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/21] drm/msm/adreno: Move adreno_gpu_func to catalogue
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
 <20251110-kaana-gpu-support-v2-5-bef18acd5e94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-5-bef18acd5e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gay-qFUMX3fFJsAn0WC3wxvm7bn4ENid
X-Proofpoint-ORIG-GUID: gay-qFUMX3fFJsAn0WC3wxvm7bn4ENid
X-Authority-Analysis: v=2.4 cv=acRsXBot c=1 sm=1 tr=0 ts=69145ffa cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=p7PcLuspDTVbkQel-sEA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA4MyBTYWx0ZWRfX9TilK3QEjixT
 MHYfNaJsBpyG/76QOZh8e7bVF5kaIkCp33V/tsGzHguxzsbucUSZ1RFZB6Sl2cW+/s5Pdw2owNm
 38PPD9JxHaBKP9CvIQZ1oEN9fF2XvQvlMYYVOyn67UN8Jv9C634RMbwntjrIltK7gf2y621typI
 zdMEBWmvBlhrgK2vP8pbh3Ezulm9Xlew1zUhs1HBQ8n7TJSn3W8S023sR2CfuP8lcqoN7OubhyN
 7ZAB/K22W0JxCFICEh/nUu7eSqhsrD/jkLPsMY6LeYYPAJc/vQLiY9qTwWCewfs8sy4KQ7R5zcL
 nChdcy2hYbbcmeyhmRmdYbtYyly3pOWsIBSTrnN3hxTpzX0WHLG8uCw1NQ2YTszKIoUwUdqOdeR
 jxFx/4yVmALCzCSFxegHMWmXAxr+pQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120083
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
> In A6x family (which is a pretty big one), there are separate
> adreno_func definitions for each sub-generations. To streamline the
> identification of the correct struct for a gpu, move it to the
> catalogue and move the gpu_init routine to struct adreno_gpu_funcs.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]


> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 44df6410bce1..9007a0e82a59 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -683,7 +683,7 @@ static const struct adreno_info a6xx_gpus[] = {

Somewhere among this diff, a619_holi needs to have gmu_wrapper funcs
instead

Konrad
