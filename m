Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B788B82DC7
	for <lists+freedreno@lfdr.de>; Thu, 18 Sep 2025 06:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7D010E65D;
	Thu, 18 Sep 2025 04:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SblFZEZ4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE8D610E65D
 for <freedreno@lists.freedesktop.org>; Thu, 18 Sep 2025 04:14:22 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I3trNs029779
 for <freedreno@lists.freedesktop.org>; Thu, 18 Sep 2025 04:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aCNDmHkvNY9CrJM/mPFO6zJGKSeooOfxAkQ8HJXEz3s=; b=SblFZEZ498279MOz
 Hkw+Et0q6V/VIfMyuduzYbMcR53L3BpndHtO9HOuhb2f4Hw1fLg7919GpnCSZ5fi
 1lkPrHrO9HP3YOujDwG6g27veIL5hvZhaAQdhwGlwI2+qLld0ibftLFTVH8klWGs
 JGRqyDKY/3pbUdGBQGaN7MMCNYv4muGhK+bjdS6Sal9+5+g+iX0ydurZ/n632Hfe
 ChA3MEjRWwPNL9mzdQqP1dHosU8iSu7uVuXKBgj9BrG8LNeUdMjzoRRPuCcRPSwX
 7WDHvKZcSu4bq4XyH+ShQNtsXNeDbvmcPB8/WfYwu6sjb8d/VYOPF19fpvZtoIWt
 B+43Qg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy0vtpe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 18 Sep 2025 04:14:22 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b522037281bso349803a12.3
 for <freedreno@lists.freedesktop.org>; Wed, 17 Sep 2025 21:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758168861; x=1758773661;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aCNDmHkvNY9CrJM/mPFO6zJGKSeooOfxAkQ8HJXEz3s=;
 b=fHYtlqnxq3BVkte8zrwkXHVNyO98lO1EOBBecw3EX5WEw5jljm/7zSO3FhvG5bLmEH
 aNybGYPapyAVguef/ykYkkcG4zq+PwSOKBUxCX8TaKZ/3S0YqNb782++RZiaFHutRfGh
 gYLq2RtAzo9Uum2S3LZ2490RMZZBcxq3IhnrKnWHb5xVFpMvdaG2F/PORWr0r9jfSsly
 2Hrqe05NGZA6iMMjw/ZzR4Qdi62rRX359y7D9qVT/AxJ7chsxyLIinlvrM84Ot96MwGQ
 BuJz1RsIq0qnYvVOKWr1qRvOVqltBOUCsdun3fngbkLKKT2SnpnWbyoSVQ3ry09JERcz
 Xp1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNrOSNNfUOXY79s9vS+AHcRnGN3meEeyZNBsp5/qkLdMg7G0zPBJprLjhXoEUZpgvWvnCrD2b9E20=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsK2yBvx9Fbw03uRHETUit3A500cRBjcTcWBdpV7nYp+dA21ti
 WckoePFq2yNShXDgQf4E88MI+jVBFZhEH7UQilymoBbUNj2tMAplSmqz4Z1WlMVO7EZ0qtVkN5E
 8mKIh6QC4dLzm43z3tPrtkz+XvGlaEB8M821lsHCE2+7EEkqbjqhuIm1IqLegMZOhiqgq6k4=
X-Gm-Gg: ASbGncuTX/YKhSEypxtSqHuGj0BquqgPNI9iogamAASFZRVKmbAk5xDFOfeZMTD7S0M
 PMwN7uns1Lehq7jiMXDb8UIRD1WdVhOgR6BgzbWhb5sjhLs2Sf4xr9L0dcCRR8KdHxIGCI8t53U
 ZYW0CcYjpNdPIBPf3KVoN0fszonl5ospfixwsHSgrWl7T3hPU/7A16HjIPN2MItfizAyA3zk9OR
 RAwhw/D26PjXNH8uc+4T9wCeODveS+qet42dcQS6JIASPgn0NofOc4R9sHagykt5vEKQrI9t5FX
 0s2jSTM9jqXLKgJZbImaCtTvLa0e3iUqKrniXR9cSqmvEwIkgHX46Sbx0Bqg2AX5HpZDBeRq8oT
 nkaSvI6HWza9X3m0EfAaxw+tosDdYe0fNAmM=
X-Received: by 2002:a05:6a20:914d:b0:243:f5ba:aa82 with SMTP id
 adf61e73a8af0-27aa1e62dd7mr6641636637.30.1758168861318; 
 Wed, 17 Sep 2025 21:14:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEESmYhA9ZUlRBuUTUXtxNrHCYKFq5Co1XH0AnMN4ttsNfHWhbopdOhRVpdLtRhJpb6K+upXw==
X-Received: by 2002:a05:6a20:914d:b0:243:f5ba:aa82 with SMTP id
 adf61e73a8af0-27aa1e62dd7mr6641593637.30.1758168860852; 
 Wed, 17 Sep 2025 21:14:20 -0700 (PDT)
Received: from [10.133.33.39] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3306061aa5fsm996954a91.6.2025.09.17.21.14.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Sep 2025 21:14:20 -0700 (PDT)
Message-ID: <b745c515-2264-42aa-8d92-663efc7f6276@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 12:14:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/5] dt-bindings: display/msm: Document MDSS on QCS8300
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
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
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com>
 <20250911-qcs8300_mdss-v12-3-5f7d076e2b81@oss.qualcomm.com>
 <20250918-spectral-seahorse-of-witchcraft-69553c@kuoka>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20250918-spectral-seahorse-of-witchcraft-69553c@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HyDzdQ2l_frgNVLAOAvHCssswWe9P9ht
X-Authority-Analysis: v=2.4 cv=btZMBFai c=1 sm=1 tr=0 ts=68cb871e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=zVao1zPCBEz49K_-8u8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: HyDzdQ2l_frgNVLAOAvHCssswWe9P9ht
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXyZQK8nhQ4hdm
 GSvOh4Lplfr5rqyz4fP1bv/qIwLAAv2Xo+hiX2ZYpqfcliCYzmzfZ5d6C9o20G/1Kz2zTo6FDWo
 Jt2+X7k2qPB0MYRTYHnAsrvkRDbTpcRc8KXuCOIu9+yZOTXUxCCs75Z6juz1aPzJjDAGAiCFpx5
 Nl4xTBY9NmLCtj+Y8jZbHQJW1XkY8DO9eUSPVqSsBjRtXMWk+Xy9vSGdVhdrZV1QkA9AzBUcYCB
 TUNYZBX6FLNfy46z+PpwEvvwsC6ffsxu4jZm5tnTMNdE2AZEzhZeoGjYlJewZqbOBg0tB+i2Hnd
 KTZRFI4+4dPq4bJS2yNryywKCE4oxW4S7AjDXXSREi9VyVp/5vckAFP5wY6GpXf4fpy3JL1suz2
 nCLx3Tls
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
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



On 9/18/2025 9:01 AM, Krzysztof Kozlowski wrote:
> On Thu, Sep 11, 2025 at 07:24:03PM +0800, Yongxing Mou wrote:
>> Document the MDSS hardware found on the Qualcomm QCS8300 platform.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> 
> Patch v11 and still basic issues. I am very dissapointed.
> 
> <form letter>
> This is a friendly reminder during the review process.
> 
> It looks like you received a tag and forgot to add it.
> 
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions of patchset, under or above your Signed-off-by tag, unless
> patch changed significantly (e.g. new properties added to the DT
> bindings). Tag is "received", when provided in a message replied to you
> on the mailing list. Tools like b4 can help here. However, there's no
> need to repost patches *only* to add the tags. The upstream maintainer
> will do that for tags received on the version they apply.
> 
> Please read:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
> 
> If a tag was not added on purpose, please state why and what changed.
> </form letter>
> 
> Best regards,
> Krzysztof
> 
Hi,
Sorry for the confusion. I did intend to remove the Reviewed-by tag, and 
I mentioned this in the cover letter, but maybe explanation in 
cover-letter was probe not clear at all.

This patch includes three changes:

1.In the displayport-controller compatible property, "items" was changed 
to "contains".
2.Use "qcom,sa8775p-dp" as fallback.

These changes might not be considered significant. So I’ll be more 
careful next time. Thanks~
