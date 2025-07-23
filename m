Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FB6B0EFA9
	for <lists+freedreno@lfdr.de>; Wed, 23 Jul 2025 12:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACCE10E138;
	Wed, 23 Jul 2025 10:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dSbZ/oLy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B3010E138
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 10:23:02 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9aC3k019723
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 10:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 A8pYxrLggsp/Pc9lqDpa3++CGRfIO5nj4AvygT3vYys=; b=dSbZ/oLyUawVCApG
 U9s1cCPf1xaU5ffr1QouCSCReiTXpsSdXT7yImzX80Ko4E33y+KWyJl5y7B9zmS5
 D2U2UwBB8crRwf3p/3/G//AUWbfC/MJa/EU5dDSNahH0XM6MGursDaTOnoT41VX3
 ocl/Y16OYNQ4+WFYSx/gSyzZIKXHpeXcQs5uQB271ERjdxN9/O1rNtjPHXFw6z0n
 4UzOtDr4+5w7tSTHVyINko/jOvcoEB2IihBvFnWmlWvjwYT5s/B3LblCndbDvFLh
 LXymxsVGKKRdd6tKAMLHV5BmUU5Xv3YP7Vx+u6BWr5Y4jeKNNlzNPAclWLc0rl+L
 ivewTw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3htt62-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 10:23:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6fb030f541bso15667336d6.1
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 03:23:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753266181; x=1753870981;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A8pYxrLggsp/Pc9lqDpa3++CGRfIO5nj4AvygT3vYys=;
 b=KyCLHIBnM5EPKestiFpCISncRIQlgnBf/hLq4+t9vLI03h4Nk7AoY9drNki73Rc4YT
 sU690src4ecDVA5i+ItUhKt16//HuDEBHVifPBcN3oMxizUlrJkwJAHT1f329WFKQFWj
 aRM0SRi6t7ddPg3spHKuUzQ6DsI/EuHD0XINdXHe52qb76EQwBphgCjqcQijxQWIAgyk
 XHyc+IrAU3aj9r4WF1g5rkaOna5/DrXfSM1IVNwbQP23tPWEQVTYARJnsI0aXH43O/pG
 5LkTkqH5T4PpWJnTlYeKSaShGoozFtmvnbuJURhmSbfL3RNCUTP78WVh4YKsxiXpTO3J
 9sIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWa/EgriSkY36OBgSmuW9/sYKXRz6fibKRZb1PchAC3ZoRClwTqlih9Jsjn3WTBMxdU3/91yqL+ldk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoaESYQdaqY0cWzSmj/HdXIuuuNQtJT62KRO1VhpuIY93yIhK3
 qMS4jB5zYr9wLAmb5O+316ltRyJMzNW1nChKr9Z+eKN7DD6rtNzedf47Mdjbr9MUXFc0ZVl+er6
 5bzkfgVKDjIlrRAh6oPsIzLD6ekK8VPJ7T2GacR9x8+ggRxuDwNkh4537t0YKOoZTXrxUBr8=
X-Gm-Gg: ASbGncv9yGT8gd8VXwahOUyGZ6FRGh8svhNBjoJj2KTzYqJp40TqMbJQq7rVq6qOqy6
 l3meRuaYnnOXYJc7qvRwoCFdMpBfl4ck2EQGjeaI98j7iyKuXTmRBrliy4scNmvkqsWn7K55bYy
 UK8bYTSiQrWUv3QJ2NbiiTX9piY9853XfTw/geUBD0e5keXqSic+LTTfnd4rAlgszMfZmlOtbWY
 yBIAfz/fojpaYkQvXU9wg8e71pafk8H2QZFaxi3eRgl/fm6NXL9Tl7tNKiK8Vykk50b2uQvUSk2
 KNq8j8Jt8JnioHlStx6MW5HhpAldWZ5T+EDQY5bP/Ggts6WEoXgLxtwhx0NQX8uQfVgj8NEizUy
 qiGYlpbjeVKJW8cAzog==
X-Received: by 2002:a05:620a:28d3:b0:7e1:6d46:9bde with SMTP id
 af79cd13be357-7e62a1af38emr109301485a.11.1753266180886; 
 Wed, 23 Jul 2025 03:23:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbdAr1cLYfzXD8fo0X4Lr4Ip40OFyltSfV9KEUBwzI9EI09L7HNQRYzee7xRd+UpVLCkm7uQ==
X-Received: by 2002:a05:620a:28d3:b0:7e1:6d46:9bde with SMTP id
 af79cd13be357-7e62a1af38emr109300185a.11.1753266180496; 
 Wed, 23 Jul 2025 03:23:00 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6caf9ad7sm1021436966b.164.2025.07.23.03.22.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 03:23:00 -0700 (PDT)
Message-ID: <ffc28d89-ba45-480a-b664-9e4ffc50a3bc@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 12:22:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/17] drm/msm: Add support for IFPC
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-11-9347aa5bcbd6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-11-9347aa5bcbd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=6880b805 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=mXZsdZnO6U5RsJfdWwEA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4NyBTYWx0ZWRfX5/zQkXJwahHA
 T+aylyJv48sJyCOjcYo568SijE6LrAQXteQalm8LYOXMz5Hi70p4mQ2PyDfs2PAuiCXvJMe6bIW
 SFMpFK2UcvUF/wevk0+fhUlv1GEgMIDU25aQYJWQemv/lbJ/XRtCPOO/7AiSiWWlcjqPFzzG7Xn
 LNLw5qqqURt8qWWj6WccA2B/RAbH5t1gqyCs4zwMYy3zALoDD54JYeO7lrcgJbTBE32aCylBDBW
 uLgESIIjkwZI6PklArVp9W6tzTvl13rG2MNgs4/xy6W9oYLdAcE+JiCFybmVR3PkSXnndLcPynR
 eYG1Fe5VV+BOjmkSqi89tOUUB7M0W/k0FuE9OiT7n7QnmVdr0LuAk/oMAGT0Z6dJZnOHJM0EKGj
 54rTYVNQL7+9zrv/GjTMdzSPx+RWIdF9yrFnQpZgYkyv1Zdrwp0a+3hiFzG+lZhlF/Keee9Z
X-Proofpoint-GUID: gIRm-WuBmDSku8Q6iBvfnbcMFSE-uZj9
X-Proofpoint-ORIG-GUID: gIRm-WuBmDSku8Q6iBvfnbcMFSE-uZj9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230087
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

On 7/20/25 2:16 PM, Akhil P Oommen wrote:
> Add a new quirk to denote IFPC (Inter-Frame Power Collapse) support
> for a gpu. Based on this flag send the feature ctrl hfi message to
> GMU to enable IFPC support.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +static int a6xx_hfi_enable_ifpc(struct a6xx_gmu *gmu)
> +{
> +	if (gmu->idle_level != GMU_IDLE_STATE_IFPC)
> +		return 0;
> +
> +	return a6xx_hfi_feature_ctrl_msg(gmu, HFI_FEATURE_IFPC, 1, 0x1680);
> +}

If this function is not used anywhere else, you may want to inline it,
checking for the opposite condition

Konrad
