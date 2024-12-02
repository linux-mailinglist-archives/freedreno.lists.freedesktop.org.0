Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C54F99E053D
	for <lists+freedreno@lfdr.de>; Mon,  2 Dec 2024 15:39:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC7A10E771;
	Mon,  2 Dec 2024 14:39:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="K1MTDluf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B04C10E784
 for <freedreno@lists.freedesktop.org>; Mon,  2 Dec 2024 14:39:09 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B293grF002804
 for <freedreno@lists.freedesktop.org>; Mon, 2 Dec 2024 14:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 g6AHa+2hrNPXyHkYqMwv/F89CPs7fpLf/SFfF1BRFFI=; b=K1MTDlufvtvpJQmr
 OimYmvMcwTVI4zv5B+SND0p/IMTank1OPXf498JGJbQBrQ7Gne8DOSz0P4u39mCy
 Pv9tWOjALOS1a76F6HrM/7AJvOGrcOTcy7Jthl5qYlcVUshUyYcTzK2ZddmKnKt3
 Sbk5zWfCRDAS4RdDLXYPfNkIq7v1CwjObQluZIPrbo1JhjjNB2vNdxC8Gdur5n2J
 i7jts3cbkgEo9f2WmjP7+v9Pm9KYFgZZFRAur8dQ6yZrURcjhIP4ZB7MQmXFjUyM
 MlJS+1xS0U+x3U/5nwiNDpWTvfgIv6v584s1TeZ54vHAl4dDLxmfKeJpHw8u+mQx
 ZL7JlQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437uvjvxab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 02 Dec 2024 14:39:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-46692fb862bso5063381cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 02 Dec 2024 06:39:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733150347; x=1733755147;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g6AHa+2hrNPXyHkYqMwv/F89CPs7fpLf/SFfF1BRFFI=;
 b=VCckRRH0+e5fUV9idVVGsiT/S0lm6p4r77MnZc1tVlWNkhukvzLjVfvcwGA+E6Ep0U
 IV12tEEeCtHlm04NnYBKxJf4kY2qEm99hfAnSsF13kN1a13bTO2Ih9eY1w5PSTqU/waJ
 yCFJnWK/5YhHygASnoLaNgoe46iNscMPxhdrc/QD4NomacZgy51WuGnT8SA+OpyqUn80
 vYlwTfB1jtdoSZA55CWr8LQ4gK+lH965BfZssY6JvOv5IiLkc+scQp6OaaaNOW1cKaKe
 hACfTbyAuoZ7lErC5sF2oC4FC/WeBizbf8So3yZs1w+dqbdDhcb8jnUwX9AVvY1M7TR1
 EFSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaUpCxXIjwwZBMf9LnpbQQPFFfLQILXitz4dm4YF31H20fYBMYBkyEZDJPdr2f9jzy9vtabPJy+TU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7cIhz1Y5WRGmG/8LjGp3KE/sLQkCkFd/d+damUrM8oXRgFmfE
 XdbtzlYYOB4ILNb8up13GPRokDhXzuSO5HWhFxWEBkGW9Xw1cHzPwZaHjCn+Spur1bx0bSZMJdb
 +0uTeK5wilL6JzWFJvdM72ygxL7+4VyMcd6fIMJAmnhdZrcp390mu4TUlH34f0dLFtj0=
X-Gm-Gg: ASbGncvCpgWICwVjd9ec+O6pWaxwAtB9UbGcndUUj2NqMoKvN7lrnkHSSVjkPlQrD+B
 dWx8DShIUR43hxJYFf2Cn6wvAtlqvA7PKZ4GZ24Eu0vLGRfg7gJMwIYLyYAVm82RNfTGIJAP4tm
 10Oxw+EWgPhdhTDfFcUBJU522vtsEE/tK9v97tGEDtQx8iplYnIZBZV9QtcYyW2DUDdAXluLNzM
 AcdFq5ZKKFuSIghkQdoVtGAeF2bt54z5Xs4NE1K3QHHUtej9PtnkkjYuDLdIIe7WIU2iD3HdnOv
 onWhrg5QqmdyZp4o4J6e8rHKVbYA5EY=
X-Received: by 2002:a05:622a:cf:b0:466:8033:7dd2 with SMTP id
 d75a77b69052e-466b365e8d0mr166007371cf.15.1733150347063; 
 Mon, 02 Dec 2024 06:39:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRWwFbKz7t/fucB4yBe2bX2YgC+0oLMQnDi8dNTq6P8UMCq+YzXzq+ExBumA4HfzOz/BTPFQ==
X-Received: by 2002:a05:622a:cf:b0:466:8033:7dd2 with SMTP id
 d75a77b69052e-466b365e8d0mr166007091cf.15.1733150346436; 
 Mon, 02 Dec 2024 06:39:06 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5996de7fdsm514344466b.54.2024.12.02.06.39.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 06:39:06 -0800 (PST)
Message-ID: <d8e1c1d0-a375-4944-aada-2bbd6a4739ff@oss.qualcomm.com>
Date: Mon, 2 Dec 2024 15:39:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sm8550: correct MDSS
 interconnects
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 stable@kernel.org
References: <20241026-fix-sm8x50-mdp-icc-v2-0-fd8ddf755acc@linaro.org>
 <20241026-fix-sm8x50-mdp-icc-v2-1-fd8ddf755acc@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241026-fix-sm8x50-mdp-icc-v2-1-fd8ddf755acc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: J_MYrQA5-gdJdkOZiaOGyNqG0c-9umo-
X-Proofpoint-ORIG-GUID: J_MYrQA5-gdJdkOZiaOGyNqG0c-9umo-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=773 impostorscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020126
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

On 26.10.2024 7:59 PM, Dmitry Baryshkov wrote:
> SM8550 lists two interconnects for the display subsystem, mdp0-mem
> (between MDP and LLCC) and mdp1-mem (between LLCC and EBI, memory).
> The second interconnect is a misuse. mdpN-mem paths should be used for
> several outboud MDP interconnects rather than the path between LLCC and
> memory. This kind of misuse can result in bandwidth underflows, possibly
> degrading picture quality as the required memory bandwidth is divided
> between all mdpN-mem paths (and LLCC-EBI should not be a part of such
> division).
> 
> Drop the second path and use direct MDP-EBI path for mdp0-mem until we
> support separate MDP-LLCC and LLCC-EBI paths.
> 
> Fixes: d7da51db5b81 ("arm64: dts: qcom: sm8550: add display hardware devices")
> Cc: stable@kernel.org
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Feel free to use QCOM_ICC_TAG_ALWAYS, for both patches:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
