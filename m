Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6011EB0EF36
	for <lists+freedreno@lfdr.de>; Wed, 23 Jul 2025 12:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C129310E78B;
	Wed, 23 Jul 2025 10:05:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XPTTaDIp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C49C910E78B
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 10:05:40 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9SGsB016061
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 10:05:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4dITZrpRLLfNiDzDsVfXaS3NGw4vNmfg16p169LKj68=; b=XPTTaDIptBlmsY4D
 J3KoAXcU0LlrUtSSv/ydQYsoYVm4ubWkmo+qnBgCXqxasXzMJhFSIAFeq/juxEby
 YNTvni79dr3cmG9NkxPWuGZ6a2QXMmy0oyjUwCxGRGK1a3aNlBuYMNJUeV5PigvW
 VVicywIpxy7cYY08ZLr9JFNSdx4cFaGSS+VNevzxOr0OC7UdT5r0sXQ9Xcwym4c4
 kWO93xX9oX7roWNLHH5XHE/diJ+LGe7p5MHp2Y5hSBVgjewjT8hS4cld5eIASRu5
 OjrKvxXHS3OzWUsOXO9okrDFbR0ZO1kcWUXz7gfR4Rc1XnIiUAehS77/ElUOwNpc
 uO4WKQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048vb2bc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 10:05:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ab5e4f4600so19362721cf.2
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 03:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753265139; x=1753869939;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4dITZrpRLLfNiDzDsVfXaS3NGw4vNmfg16p169LKj68=;
 b=waHtR7l749N7vxapHGkiRIvuSGqerkVcOghFZ6nAFfkLnIG+enhnsahsYVisWw+r8V
 1nps3rAUSFqkQZM+4wl9XqQEgxj/QuT8hOiEHoomqGzoMHByQfLUqW4y3rJ3EbNbbcYz
 4uHJB0SErzR9H63FLMIq5VMVHzWMXMYyrdB2SLzX8lskqcaqAOMnH2lW+1BOz+M2e16T
 YdUtykxZSwi3uIVERyPrpkZR3yZVNNyVv3yeEMCY0GVotjFi+C20rnqMu0Hp+ac+JqsF
 7eh9rItfMYx2LemvIJGYR81OUDmPResa6ct41zH6WlxDk1/ChLPY0PhSMity8bN0I40d
 qgDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWT+L3J7HlcEPR4s15OHeXiNCAt69oqVdcekbIkG4e5bgRGd3DXup9MeE0wx6OIj8k6UJvC+XK7JLA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxioY1n0Aq8BvSH6nD6NLFLKHHPukViRgZsvLJ/DrOZJNrYMkG
 8fdmAK/p86hbX/Y146KLjJp+B4HcsaZn2VYKHGbZr0vsR2i1uXDVDnwKLyeGZjAS4MU5UthHMJu
 1zzkMUcBU5G4p9QYa+8dGoFQqdqUR7koYqbVOWpPU0LqQUasad9mA/ApdgTEA8vIiB5jnQU0=
X-Gm-Gg: ASbGncv1Vs/TVqSUzqRAltSANUb+xs+N45IPdqm/RJ8+f4gb0L1pBaLoMJ1cehRuXW3
 7iRZM+xK9ne4bT7uSnlgPWLq7OJaYQvp498u808Mn2MHoMFVb+2fxAYYHRCxSOn8Hta6REXC2T+
 FgPqHJJF+az18derF0ffadF7G4Y96aCgWIaJB3cb3pR+WFz4YRc565jSLnPdqktO64u54U9mrX/
 nS3cX3+xGtDWeDCo5sR4l7WoJs9mADqHWjl1LzO9vp3HmEwMLiwdGv7xLGXEvXtASaWR7Jc4rt+
 gADOb+2bIf7tZztbHs63YH7k8lvM2HmgeK/LpGZy9G2njL5y0jLAdtDbndt6utjY53f9MNtV2K8
 N+BgDU43iSLwVgHLISw==
X-Received: by 2002:a05:622a:1454:b0:4ab:635b:a309 with SMTP id
 d75a77b69052e-4ae6dc94975mr13062611cf.0.1753265138779; 
 Wed, 23 Jul 2025 03:05:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7VWxyiO/uqaEAXmfUFM7818+WHuRXfXtfClF+Ol27/qeXk++n++ym4I/iG/5MBDbAN4drlg==
X-Received: by 2002:a05:622a:1454:b0:4ab:635b:a309 with SMTP id
 d75a77b69052e-4ae6dc94975mr13062291cf.0.1753265138140; 
 Wed, 23 Jul 2025 03:05:38 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-612c8f0afbdsm8405149a12.6.2025.07.23.03.05.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 03:05:37 -0700 (PDT)
Message-ID: <644a81ff-bbce-4cc7-a364-8e0c591898b3@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 12:05:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/17] drm/msm/a6xx: Set Keep-alive votes to block IFPC
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-8-9347aa5bcbd6@oss.qualcomm.com>
 <jvn44gmttkidyy4emnz6mytqqjbwltlxibywfr6bfbqjfbq35e@fuvvefesqbzw>
 <0427769f-62a1-4a20-af94-b340413296ab@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0427769f-62a1-4a20-af94-b340413296ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ova21116rjVkmSCFOti39JbGGDN3Rc_w
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=6880b3f4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=w1FpSeGnf3HiULV0hxkA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4NCBTYWx0ZWRfX6x+loXHJ+F7N
 FI5LtICpuUtyliJtYcJ/rtTGXqpgodW6JEZRlztNQThWPO8CEFWbXoROQVUGuxDXGIUFVt8syRQ
 kXAgP+9JtBUAAd+vEuk1OUoBw8pzMscosyocoFbmuXsAc7QR8m5pf6LUP5SGctjydNzUxXDeDMt
 GnPkm5qVyjqbGH9l9GzogDdOQJMuw78wZSzqJ413lpV7A2SAm4NFuprC7I3ygXRRTvrpPqWmniI
 ZAYXVQkTNGNK1InIUWh7B///W8VPb0J8GuypSqW5mZ5pYwvoFCM98NasnIwU3IpmtB3sJTO3IT1
 ZhUAZTzaDobOWJzNkgDfRFgX6Rrjxt+gx4lt9gWvUYhszFVWxFoRoASVr2vndzkIzdXui0dbkHV
 nYDI52UCQH0SB1BMUBttaKiDNx6jGxPqxLnXiBUsOAd9+xVe2wvrDeoV6YG32vJSoIFoUQ8x
X-Proofpoint-ORIG-GUID: Ova21116rjVkmSCFOti39JbGGDN3Rc_w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=960
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230084
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

On 7/22/25 11:24 PM, Akhil P Oommen wrote:
> On 7/22/2025 7:14 PM, Dmitry Baryshkov wrote:
>> On Sun, Jul 20, 2025 at 05:46:09PM +0530, Akhil P Oommen wrote:
>>> Set Keepalive votes at appropriate places to block IFPC power collapse
>>> until we access all the required registers. This is required during gpu
>>> IRQ handling and also during preemption.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---

[...]

>>> +static void set_keepalive_vote(struct msm_gpu *gpu, bool on)
>>
>> a6xx_set_keepalive_vote()
> 
> static fn! Why do we need prefix here?

It's good practice to namespace-prefix your functions, so that you
can more easily find them, e.g. in a backtrace.

For a prefix, adreno_gmu_ would be even better, as the register doesn't
seem to have changed across generations

Konrad
