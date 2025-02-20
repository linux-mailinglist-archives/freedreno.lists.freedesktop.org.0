Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BF0A3DC5B
	for <lists+freedreno@lfdr.de>; Thu, 20 Feb 2025 15:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB5BF10E96E;
	Thu, 20 Feb 2025 14:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="n5EZLtut";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9FC310E96E
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 14:17:29 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K6i0fc001826
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 14:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3EGm9P8kyzCVbkWoFmdV27iox2OfLl7TljwpZhahyf0=; b=n5EZLtutRjhz9TVk
 nVNfdBj3vHd3mh5sb1yu0+ZR14FvY1Jv+vmEM2yBqNV72xw6mcKjdiHh/Zs7OTSu
 O9qBsrxm2xWhyHHBIqnY9aasOAmuaYpPG9lSCB+kxf7kRTOkGL9ECqf6E+RkdFhY
 PxKpKckghEH5j1fPRTeuQJx1Ye0XwV+NJSZix/1+eLaEZiQzzb/NuzNS8xvH+BrZ
 Gt6fpuUE9NEfPkgKO899F7iiDm1oao4i0k+B/K5ZPf6D1U9yAOYdF0Nvv1oRtr2K
 a/Ql4oEFJVfLk66afoAQPNCqR5ojNX6CVH6286K5Zq7La0zSFgOyMiehtHtfyZBw
 kGP4oA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy2ecpp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 14:17:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e66ba99599so2113176d6.3
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 06:17:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740061048; x=1740665848;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3EGm9P8kyzCVbkWoFmdV27iox2OfLl7TljwpZhahyf0=;
 b=pNW1SnVU7vx48aVPqOjaggIcooitgeVQ6/G1f4SIzQ2dKG+/j9ICR7qSLWEtoclVnV
 SUE7Cq3nKinFiYDHkgRQF5iS/UMcc8/WRA8GmbljlcJKZ5NS49eYxQKc8Wn71W88Io2z
 3f+T50HAhh7IggamEQVcfVp3qTYc0ZbLtpyDSwH5aUv57o9TjeMVqni9r41igmT0+G15
 6HxKtqIoVo6uq5uRNvJ//CP971Fj4TXEWOconMf9/rfGMqdLDmlaTsGyFQpVp8s4GlLk
 HVBruolPMGTnnYXbDY3HjFWCIHZSZbxo/0VXypzVvbxelGbZO6AXsHYis3JQNx03ve+w
 O+gA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGomYPY+IEmEW/xQHf4Ra9Wo3rv0JaYhTyDQqgomKghdq178OHjmCoYvvPdKvBc2w7d7l+KcLJAvc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHglHgy9JkMfKq3BZ9RFbm9epMdxA0UKR1IqmbUdJjvs54qQZi
 v3LKGfpUXCbAhrsput8t3x+ag0/+eLKD836Th//3qg0aE4BA7/Ki3py3cvzLZE43aFxtbq5RNH4
 c4srgn5lA2P1IAa53OiTSbKb4VNR4Jz92ZjIUetaBt1hmgE7HzLbfRA8JcRsGAz/eWMQ=
X-Gm-Gg: ASbGncvXQxFpMu+o6WpktHq08XDbck3rsd0htB4fVqL6hozfYNiwaPyc+VkB9Im07qq
 CtxEPJbzvyMB5cLLLSsrEPmLMDU0BUirpAcKZWFb7UYsZqMsYdVH0P/sQYBKcEnmarH3jCzUHA6
 mOYX5j2CKABC0JXBC2D8KMMsaeZ7L9enbHFqDStrPsgTE2AMXCWlCLAtcbXt/o9qnK9iOuMjwjf
 R+3nv34PpXjcqglvqWHNwDL2KdGbFIa4P5dkt6UUQ5ztCQT+h3lR4MY5IjI74z2uyC1Yqzdmqo9
 bAH5z9rUMNprWEW+W7sqSB8ZOfmx/+Mrt8mRR/WPxiRuCEZM6G8Src34Gjc=
X-Received: by 2002:ad4:5f0a:0:b0:6d8:a723:6990 with SMTP id
 6a1803df08f44-6e66cd087c8mr103321226d6.7.1740061047775; 
 Thu, 20 Feb 2025 06:17:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDkW2kyG3s5oW0jAOFMLLRJCpIAozDV8aRQ9BA7y2aWTC7YO6KQmRn9uS9vaOsEf7hft1g6g==
X-Received: by 2002:ad4:5f0a:0:b0:6d8:a723:6990 with SMTP id
 6a1803df08f44-6e66cd087c8mr103321046d6.7.1740061047341; 
 Thu, 20 Feb 2025 06:17:27 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53231fd5sm1461709866b.26.2025.02.20.06.17.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2025 06:17:26 -0800 (PST)
Message-ID: <517f2021-d863-4976-9df3-ae5f64102b8e@oss.qualcomm.com>
Date: Thu, 20 Feb 2025 15:17:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] drm/msm/mdp4: use parent_data for LVDS PLL
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
 <20250220-fd-mdp4-lvds-v2-4-15afe5578a31@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250220-fd-mdp4-lvds-v2-4-15afe5578a31@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7CG9letVxdURb4avlLrQsJbfBMKNw3Qg
X-Proofpoint-GUID: 7CG9letVxdURb4avlLrQsJbfBMKNw3Qg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_06,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 mlxlogscore=643
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200103
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

On 20.02.2025 12:14 PM, Dmitry Baryshkov wrote:
> Instead of using .parent_names, use .parent_data, which binds parent
> clocks by using relative names specified in DT rather than using global
> system clock names.

You're not actually dropping that behavior, since you still populate
.name of clock_data.

Konrad
