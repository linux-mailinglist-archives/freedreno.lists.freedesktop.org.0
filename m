Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 127F4A88D30
	for <lists+freedreno@lfdr.de>; Mon, 14 Apr 2025 22:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 142EA10E28B;
	Mon, 14 Apr 2025 20:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ikVxrvTU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1FF110E28B
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 20:35:51 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EJ7kBL016520
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 20:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TcfeZVOyedKWdzur922HOzg3A7r2ZIv8dN0aYlvohuY=; b=ikVxrvTU13ys9n6N
 jaLLgH1FaPL+nIYUpFJPW7Q409nPG1nghVHIT6Cx2I1bRUnGTqQYaYpcknUVlAZW
 Qd515P9l5wS0CXUIXBha6uLcHrCyNbrn1gg+cn8BqUsMIPb2arDJOAuU/ED9u1Co
 ornb1tJSAxhEU4uRJZ3pHG2Ct4p/LS22YDGHOu1dsBCUam9Znu1hp3Fg6EJ+T4JT
 S4P5Ph/luMP/LjxzNt27frSZMeHtEOMRCC61liIXC+rmIW3wYIjF3n4+/6s5nYHz
 KE2ouncoT/DaqRlTIPQJu3RNpP9ykc51eXyvXr72x9Fr/aFf4Qf/bwrLUgihG2Wq
 jRfY0A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf69ntdb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 20:35:50 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6ece59c3108so10507316d6.2
 for <freedreno@lists.freedesktop.org>; Mon, 14 Apr 2025 13:35:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744662940; x=1745267740;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TcfeZVOyedKWdzur922HOzg3A7r2ZIv8dN0aYlvohuY=;
 b=gTUGWtS4OjOx1y+Nx4RQI797Ry0V1LR9RWxY/pw3RU5fKbckGXnK40St1xkELBR5Ip
 xSVn05my8MkxuMzGRMEdB5UNDJUMa9/we/6V20dlQJr5DFUjgmx794hQ0uGsxwkqWwhu
 6tr7mUQGoO14o6YHsxMMiRYN5UbRzs4dKMFavaIyDc80uBDICdwKMALzPFUBVHf5VPbY
 XbwbN9cxLkgxBTMdrrpxgtsPcFg9+j6PDT1R+livrSSbZ/b/Ar4h4Cn3+tMRKlkx1n1B
 hv0nLcTHHJn1O2ap+zeSbtdICBFGePJcXwMJApYJjKNdC/wC3KFQyfVQQ5zUguPvz7FT
 CzDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpChJ4ulhNZdgklLjSPkhVu57EJiSsD6XRa2sT2LFZqlME0nXgNyifvgWcVEGUIVjbHrWELsA2Y10=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIhDpTnnemLlhJPGbYf163ubyKwVOwLu/Gnz963t4MLPpvE5hR
 jmGLPpH5kucfk/cSnEdcGFN7S6tfCvVKN0FJeH2ddXnB5kEK7rTyx5fNIBi/LQgmdlKhrEJorF/
 /h77Nq1/iDAq91it73Fobth4uuhv0gMG3pOhGiNJsDGp8/5noFDf2BgpXuB4msiZzcFg=
X-Gm-Gg: ASbGncuSGbp52KOZqstsyBj46NOGginYyzdmsJvQ64yBQmVRNPSvP2M11Tcdp6V6d0Q
 nI+d8CsVnQgFhKFrGiT9I4pV8n7jrfCKxP73YCQpl0vzXFIJI8gvKtcS59UIiypDNJHmPVC8rSz
 38pyoB4mbkfzFC8FVO46O8dp+uTJwYORejG5xsBN5G35oeWypAcnJI9w8fhFdatJOFKXnWE4xOs
 reexactKE23OAHd4wAzcv3dK3zKOZRKkMbHLgcyli7AYxChO0CUOuTYEznhs3vzn97TiOCaMYvU
 pNuj/SGfnr/9MYS53SjUSRDMMBQdx9l8N+Q4igICHtQ3b8ij4flqnIluQONDpEgOEA==
X-Received: by 2002:a05:620a:4405:b0:7c3:c406:ec10 with SMTP id
 af79cd13be357-7c7af1d0611mr694927485a.14.1744662940224; 
 Mon, 14 Apr 2025 13:35:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IES94yre95taymhy/asOVTUHtSDJQP8JMi6CuPlrYL55wGW9j9JqYzSQvw7vL4wpMWwbjEpGw==
X-Received: by 2002:a05:620a:4405:b0:7c3:c406:ec10 with SMTP id
 af79cd13be357-7c7af1d0611mr694923685a.14.1744662939794; 
 Mon, 14 Apr 2025 13:35:39 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1ccc195sm993479766b.143.2025.04.14.13.35.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 13:35:39 -0700 (PDT)
Message-ID: <9c21f321-1aec-4b36-9e3b-026ea9a810fd@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 22:35:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] clk: qcom: gcc: Add support for Global Clock
 controller found on MSM8937
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux@mainlining.org, Daniil Titov <daniilt971@gmail.com>
References: <20250315-msm8937-v4-0-1f132e870a49@mainlining.org>
 <20250315-msm8937-v4-2-1f132e870a49@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250315-msm8937-v4-2-1f132e870a49@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0Bn45Qy-bukKs0ESFFlpNs3O2DDs7up5
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=67fd71a6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=OuZLqq7tAAAA:8
 a=XF3jJdBvCvMoejL92xsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: 0Bn45Qy-bukKs0ESFFlpNs3O2DDs7up5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140150
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

On 3/15/25 3:57 PM, Barnabás Czémán wrote:
> From: Daniil Titov <daniilt971@gmail.com>
> 
> Modify existing MSM8917 driver to support MSM8937 SoC. Override frequencies
> which are different in this chip. Register all the clocks to the framework
> for the clients to be able to request for them. Add new variant of GDSC for
> new chip.
> 
> Signed-off-by: Daniil Titov <daniilt971@gmail.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

[...]

> +static void msm8937_clock_override(void)
> +{
> +	/* GPLL3 750MHz configuration */

So this is a variable rate PLL, I'm not sure how it plays out
with your frequency table - it looks a little different to the
3.18 version

The patch looks good otherwise

Konrad
