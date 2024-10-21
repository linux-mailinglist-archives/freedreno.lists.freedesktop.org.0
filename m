Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A2B9A6046
	for <lists+freedreno@lfdr.de>; Mon, 21 Oct 2024 11:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3025110E461;
	Mon, 21 Oct 2024 09:38:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qshzu1NG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED7010E2F3
 for <freedreno@lists.freedesktop.org>; Mon, 21 Oct 2024 09:38:47 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49KNOsJk020573
 for <freedreno@lists.freedesktop.org>; Mon, 21 Oct 2024 09:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gn+gkmOeUyjRBUooDRR+2My5sXvmwkHI88BMxZAlKmE=; b=Qshzu1NGPFV8rsTh
 txIOPB3GFuckqrBScsLkjnrIuuT7jhuJiOz6yvjMOpWyZRN5rKHEvIet1nKtgOxZ
 xRjTgCApXxaGFy5Uspt38X1yhYRPKGdbw5DykooS4TvsXhfT5crN/yTF1rG8WthK
 o/PWB8BUzZUpcpjGci3nE1zaFet6EfRwlt64/kco889eZ/zeYDjKA6vcoaKwJHih
 PbX/R/39BknU39Mxqa1Wu09I1z48fwrNB7LCoTlsfEQ2ambgf+1dyAepy5wDpAgm
 vBTMHBogS3iqAZuJ35s4zfihjB5vgQMoXKc4cOqb9wNNTfkfpVBpyZIP2p2mRejF
 4cI7Dw==
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6vc44bx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 21 Oct 2024 09:38:47 +0000 (GMT)
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-837875efdbeso57550739f.2
 for <freedreno@lists.freedesktop.org>; Mon, 21 Oct 2024 02:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729503526; x=1730108326;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gn+gkmOeUyjRBUooDRR+2My5sXvmwkHI88BMxZAlKmE=;
 b=HMTTpy65SnS4mg+jlrsQrvXZ/WwHwHegjz6j/d0RSM5Yc2gy4poxKH3/ZMKfehsC9c
 Jvc22KCOSLwS4O24ImzhqJmyU2E7ES/XfJNxbfOlD/5e4nl4/fSXTC6Hf7/aPvLFevDK
 L3NbcIw9tJ0Rhbi7Pn+yIwxbzrfjvYruQ5yzP8xUgReNW4qYn4ZeT/clzlddCKbDMnBg
 syW3k9xEyzfvRMT69pZGbBcgv/wVBGrZj2CqnxahOcLAGx1kXQwZWZA2DdqofjBa1tJT
 3ZTNXZnVJVNLIyWqObuDtLNW+mBXD6ZwxBWdjO8xggoq5wLq8UdK7lg1fYLsz5mVD/HD
 jtbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmKQmcOMjqrz+hmS3Ar6EKtDD4bEyKOgIpzbq/mx9kb/ufDdbRKAh5tnMVwnhw+JYedhVUCjuk5Co=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZztnhyfYtpvnppEH7Yi8Fc/FxoMFI36JQq8CjUO+B6XzQo3FT
 RjVy8ciaYagr/aEazf3MeECb+znjplR//FTy63BjuqTgHAI99xshjST0KfuBCByBibUkJ4qSxL1
 iWMMVQeXXfbHnfGeXLFNfb5Vw4tfRt+ZWcY+GQ/VVUiq61DksI1pelEvo7c8mCMQKt2g=
X-Received: by 2002:a05:6e02:b2f:b0:3a2:6cd7:3255 with SMTP id
 e9e14a558f8ab-3a3f40b41afmr29449085ab.6.1729503526147; 
 Mon, 21 Oct 2024 02:38:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/wHHBGM3zQyx0/OSXW35rXmYHrOpG+GrEQovUlYPyc88a/4376jQdZSvI4nY76nZm9i7w0w==
X-Received: by 2002:a05:6e02:b2f:b0:3a2:6cd7:3255 with SMTP id
 e9e14a558f8ab-3a3f40b41afmr29448885ab.6.1729503525721; 
 Mon, 21 Oct 2024 02:38:45 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a912d6225sm185228266b.11.2024.10.21.02.38.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 02:38:44 -0700 (PDT)
Message-ID: <1543ae2a-76ff-4b36-adae-37076e48b7f8@oss.qualcomm.com>
Date: Mon, 21 Oct 2024 11:38:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] drm/msm/adreno: Add support for ACD
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20241012-gpu-acd-v1-0-1e5e91aa95b6@quicinc.com>
 <20241012-gpu-acd-v1-1-1e5e91aa95b6@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241012-gpu-acd-v1-1-1e5e91aa95b6@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: o5tCmzo0R6EeulvTiUWuZG6wO4YfaduD
X-Proofpoint-ORIG-GUID: o5tCmzo0R6EeulvTiUWuZG6wO4YfaduD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0
 mlxlogscore=936 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210069
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

On 11.10.2024 10:29 PM, Akhil P Oommen wrote:
> ACD a.k.a Adaptive Clock Distribution is a feature which helps to reduce
> the power consumption. In some chipsets, it is also a requirement to
> support higher GPU frequencies. This patch adds support for GPU ACD by
> sending necessary data to GMU and AOSS. The feature support for the
> chipset is detected based on devicetree data.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

[...]

> +
> +	/* Initialize qmp node to talk to AOSS */
> +	gmu->qmp = qmp_get(gmu->dev);
> +	if (IS_ERR(gmu->qmp)) {
> +		cmd->enable_by_level = 0;
> +		return dev_err_probe(gmu->dev, PTR_ERR(gmu->qmp), "Failed to initialize qmp\n");
> +	}

I'm still in favor of keeping qmp_get where it currently is, so that
probe can fail/defer faster

Konrad
