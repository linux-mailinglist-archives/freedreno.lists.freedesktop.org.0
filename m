Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 523C5A9752C
	for <lists+freedreno@lfdr.de>; Tue, 22 Apr 2025 21:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0516410E2CB;
	Tue, 22 Apr 2025 19:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AOk5D0rZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684ED10E2CB
 for <freedreno@lists.freedesktop.org>; Tue, 22 Apr 2025 19:14:12 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MI6q1f012906
 for <freedreno@lists.freedesktop.org>; Tue, 22 Apr 2025 19:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vDfBUzxdqcOodqK0x53+9B7Qwb91WQYtR62iZ46QXiI=; b=AOk5D0rZ8GXmkTGS
 OTj0/lfCOFxNMK6SvsP0kJMxehSGUc0NnT0KYybKGvV4ScuIejqCb4j8mPlBS2rI
 Aox8SXAC9p90WKSmW2geLKOFac/HW5/ox5X6ckOHiVskWuIqgcI1AZ/4GQF1fEWd
 PpoSYprpXpZPeNMzlS99PlhMZsi57RvZXde9En5AZ2JhkMe/XJ0bRgtf2l1vZ+iA
 S0nKczjlkspJohAj8QiANmAmkwPAWvSQD0ZV3+EivpDpvtv4BbftgRIT/K7Ke8Ns
 B0Hi9LNG2zx3RgFSTgV+jm5sjWZGKS787lg//pP8C1MvrYY8qfMK/i6YcLMpO1SB
 yx7UXw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4642svgt9k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 22 Apr 2025 19:14:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5560e0893so34103185a.1
 for <freedreno@lists.freedesktop.org>; Tue, 22 Apr 2025 12:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745349250; x=1745954050;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vDfBUzxdqcOodqK0x53+9B7Qwb91WQYtR62iZ46QXiI=;
 b=JI+wGNa9mhB75oX6lACWOnZkkCKUf6IJLvRRYc3W+y3SmjYd1H7ubQ8C1R37/I+uUP
 e/ljbxfTE93zuejYM8HwUFxhenqkow3icZ1GYkE0vRyddYelkbBRij8JsPF3so171xTO
 9r2VNpWyXCyEN0NZC19fTUKv1acYziMjNsFZQDwry67ZVN0qHf0wR/Lha/VmII69PaUr
 I9rfk4R7F89m34fn8ctt7noMrHNuV1F3UKcxDuo9uLJXHHc7GZ7Igjv6kwaXJnNALbZ7
 oJjbr/Rva3qBufMG0wSQEa0Q57SWYEzathWowtNWBxElXCf5UFn/hPrb476uIkHosiOS
 yaMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAW+zMlmCzrClEGBh6hYWZiHOAoqGeSiwlydP/3hrfi7BFo06GJHpbaU7x7GzP4KO0sdfzwu10ogQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyFoDTFhJ6nX8YddotX8PIONHLmV6JkNKPkKL16VDNPF5FXSC4
 WH+uQzMGK52hRJpYCuS/yieKExUXIha7uJH6AS3ZkaMvGWQfCtoXXIYOie/uf0ro9dXtqg8Z4nB
 qaoYuLaLEQuLaRvKxvza6yAZjAZyAHlLWk9i71x9lt1uz0i3v0FiosqfZxkAme24kRZg=
X-Gm-Gg: ASbGnct3dlUOQThZGaI6/7X3yd4bFaJIwBphLVr9P5EsxY+qRlS7tFVqfxGUJpzRCrt
 KaGpNUq75VP4ENa8FK7XBae2WEu/3oxd6NzjdLEbhkX76eOJkJwN4gMGXnbgD0WPMA5w9IONGIU
 Ve9I5i7hJpgIqU9vAEa5Vwz1UgwAy9DuZd0MCMhkT9O2slEUcDd4/RPLhahGcNB9QBF03qrPTII
 crDqI2NKawY/8+aP184c670WHNQ/yNtQSOIfHRsRUBgiWuvWNPaYgthn2+GfjqdjpByXkv8Sutk
 U3W1djl7BIe/kooAPZxLdwM+I4fmNLov/w1JUzlZ8HiF6r6KTQvVu93v2ZvUI06CySk=
X-Received: by 2002:a05:620a:4095:b0:7c5:687f:d79d with SMTP id
 af79cd13be357-7c94d29ade9mr27753385a.8.1745349250480; 
 Tue, 22 Apr 2025 12:14:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7HiqvOyIsraSAjIugd3xjXilpVZSiFuqvb5lB5h6IcYI3MvuV9H6EVgiP8btR3FsQ1k8Z9g==
X-Received: by 2002:a05:620a:4095:b0:7c5:687f:d79d with SMTP id
 af79cd13be357-7c94d29ade9mr27749785a.8.1745349250048; 
 Tue, 22 Apr 2025 12:14:10 -0700 (PDT)
Received: from [192.168.65.141] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f625596138sm6572178a12.45.2025.04.22.12.14.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 12:14:09 -0700 (PDT)
Message-ID: <1f36d303-fcfc-4aed-8d8d-01a3c4dae57e@oss.qualcomm.com>
Date: Tue, 22 Apr 2025 21:14:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: msm8953: Add interconnects
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250420-msm8953-interconnect-v2-0-828715dcb674@lucaweiss.eu>
 <20250420-msm8953-interconnect-v2-2-828715dcb674@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250420-msm8953-interconnect-v2-2-828715dcb674@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kZC4VNKaNAzLFgB9B6njxek4mRQiUdPJ
X-Proofpoint-ORIG-GUID: kZC4VNKaNAzLFgB9B6njxek4mRQiUdPJ
X-Authority-Analysis: v=2.4 cv=QLJoRhLL c=1 sm=1 tr=0 ts=6807ea83 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=dlmhaOwlAAAA:8
 a=EUspDBNiAAAA:8 a=Dw-YgVe96UOjDrfUO-cA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_09,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504220144
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

On 4/20/25 5:12 PM, Luca Weiss wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Add the nodes for the bimc, pcnoc, snoc and snoc_mm. And wire up the
> interconnects where applicable.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> [luca: Prepare patch for upstream submission]
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
