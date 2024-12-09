Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D12039E99E3
	for <lists+freedreno@lfdr.de>; Mon,  9 Dec 2024 16:03:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F35A10E1C0;
	Mon,  9 Dec 2024 15:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jSFrKtRI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8464010E1C0
 for <freedreno@lists.freedesktop.org>; Mon,  9 Dec 2024 15:03:34 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9AQDLv030619
 for <freedreno@lists.freedesktop.org>; Mon, 9 Dec 2024 15:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 O1NX/w+RRXRMNKqZKOVFD80ajURS0nT9KzUnQ2eXmK8=; b=jSFrKtRIpp/uh1HI
 1ZSMggM2zktXcxYeEg12mY5F5vZhV6xdyJWwngeTJFfhhvO7OjURTjDRlx5i8T7C
 QaNYPvfsEYVxy7MjWd1m+EL5J/r2ycVkakFH8xA8BHBK15Rhsm0sh03/hGNSSqS9
 6gFkhhN9OsgRXeCUejhs/vTxNlh3UVqQwsX2Vs9HPJxoBFS66+ie//XrPKbu0iIQ
 pS6bz6sfNjJMLtlkY5SlNyfLCPavVO5ALJtvbVFFxPaoscIH1WEBTSWUuFktmuc4
 oAUqopvQgikVlUkEhtOI9G079DqLTQ7It5ufNv5IKzMB9gMOFwqX03Lrtr9f0vqj
 MfSAQg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdxxd6a4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 09 Dec 2024 15:03:33 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6d8f8762a69so8895866d6.3
 for <freedreno@lists.freedesktop.org>; Mon, 09 Dec 2024 07:03:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733756612; x=1734361412;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O1NX/w+RRXRMNKqZKOVFD80ajURS0nT9KzUnQ2eXmK8=;
 b=OBDgAxSCklwGujbq0cUlFtS6exVa2StNtQSbJ9cpJzkFRmYMh4b9FFOQqH7xggDiNe
 02n0SbSmz37V40f9vAtkaYh2JwaazF37AfrtQjEMCtDuV5w8HQjN4Fdzc+/fwttHMski
 XnSKYKd+mM4Dzp9Kiq6+zhbWsEkPdKk0WKK5q4oZnr5eBFFkETN9RRW86eUOCDN2oP25
 Z8cCw4u1LJowECBf3Tekm6voJXVQvvND8u4dfrejmx/OxXZbZqm9ZFpAklbCu/50o7Zy
 pMYcosQvd7tTB4nDHG2TEYbkm3B5EcvyC37iAUxcdTXrWv852wzZVb4+zytIWRnaWMXn
 mXIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUg11ZjWI4zsYhd5s8r1DD0TO2wMqMdz8hGY0Ar0xgb4gCvZFB0g7+0BhhAagmQDn31XKKCR8iVoUs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNaZb2o8jUPd+q+KZM3gHOsCG+s0gVP7O6ufu1OvrLZyVhfvuk
 iafB/4eMXUPhvdYNa4Pw0iEf0IwkddgsygK+SchC/dS8MM6DU1ZQMZEd3LwlEe4hrT8JMbj9usC
 nmwhXJlWWZ6GX8jldpp6pckWZvchy8RZ0FqyuWgse6tVRjGpPnrP3YuXgjaQFq7o0Q0I=
X-Gm-Gg: ASbGncvJqV2EsnQAST/XrkM6z2vS5EFRPa6gV4gUP42O8u3OBx2HR03VIQCHvW1Jf1M
 VOCdYsZwifLkXi7GRBXp7jmPgbv5TfkMTG5q8tfkuId1hRTiXAg0MKFH1zlg+C9DPq22Z3cKFXp
 yFUgD1Y2TEyDL19u9SMqk7Ru68Mk7j+A98D5zrOx2emzo7Fh3uI8ChRkRIRQYK8N9UEUFigoFVt
 gzWGrvcWgmGzucNIwm4bqPa6SG2PUnh1egu8TpMdQrrTJzY4rfGCD5jfbmMoymEsiYsBWYjN7S4
 oc3GpW/Ta7L2C0kpiwjYISkD4dORB50=
X-Received: by 2002:a05:620a:2909:b0:7ac:b95b:7079 with SMTP id
 af79cd13be357-7b6bcb32067mr860495685a.10.1733756612382; 
 Mon, 09 Dec 2024 07:03:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHP91iP55Oeu6qjVs4Q6wCz7SyJ+UWO9ki0Vk/JiuqKFG8xeOAuOXTb1bf9EcxOg8/+s23jtw==
X-Received: by 2002:a05:620a:2909:b0:7ac:b95b:7079 with SMTP id
 af79cd13be357-7b6bcb32067mr860493285a.10.1733756611833; 
 Mon, 09 Dec 2024 07:03:31 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa698e922dasm64701866b.84.2024.12.09.07.03.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 07:03:31 -0800 (PST)
Message-ID: <08440076-3c04-4bb1-b339-071b82d638d2@oss.qualcomm.com>
Date: Mon, 9 Dec 2024 16:03:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Elliot Berman <quic_eberman@quicinc.com>,
 Pavan Kondeti <quic_pkondeti@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: znjzy4jsPT3NJmqrhUNFvG8eJtyIsx2N
X-Proofpoint-GUID: znjzy4jsPT3NJmqrhUNFvG8eJtyIsx2N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 phishscore=0 mlxlogscore=955 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090118
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

On 9.12.2024 9:19 AM, Akhil P Oommen wrote:
> When kernel is booted in EL2, SECVID registers are accessible to the
> KMD. So we can use that to switch GPU's secure mode to avoid dependency
> on Zap firmware. Also, we can't load a secure firmware without a
> hypervisor that supports it.
> 
> Tested following configurations on sa8775p chipset (Adreno 663 gpu):
> 
> 1. Gunyah (No KVM) - Loads zap shader based on DT
> 2. KVM in VHE - Skips zap shader load and programs SECVID register
> 3. KVM in nVHE - Loads zap shader based on DT
> 4. Kernel in EL2 with CONFIG_KVM=n - Skips zap shader load and
> 	programs SECVID register
> 
> For (1) and (3) configuration, this patch doesn't have any impact.
> Driver loads secure firmware based on other existing hints.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

[...]

> +
> +#ifdef CONFIG_ARM64
> +	/*
> +	 * We can access SECVID_TRUST_CNTL register when kernel is booted in EL2 mode. So, use it
> +	 * to switch the secure mode to avoid the dependency on zap shader.
> +	 */
> +	if (is_kernel_in_hyp_mode())
> +		goto direct_switch;

So I suppose this would ideally be like hv_is_hyperv_initialized()
but for QHEE/Gunyah, which is not going to happen, as we have
millions of devices with old unupstreamable-ABI-Gunyah running..

This looks like the next best things then, so no objections, but..

[...]

> +	ret = a6xx_switch_secure_mode(gpu);
> +	if (!ret)

this should definitely be a if (ret)

Konrad
