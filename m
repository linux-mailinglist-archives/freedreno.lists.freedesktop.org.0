Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 917779B8464
	for <lists+freedreno@lfdr.de>; Thu, 31 Oct 2024 21:31:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE6D10E114;
	Thu, 31 Oct 2024 20:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ITwb8X6P";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 370C610E114
 for <freedreno@lists.freedesktop.org>; Thu, 31 Oct 2024 20:31:00 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49VBroi2002303
 for <freedreno@lists.freedesktop.org>; Thu, 31 Oct 2024 20:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9k2M3b0n7oscrFwRKfsA6u45GGCm173u3WDMqWDo1xk=; b=ITwb8X6PDbIvjmfl
 ELr7FmINRqIoyn79Hh+7Rit+kINT5dybgp31/iqDOJ9lOWLZKSMPNnlqsL/D2vhj
 mkqDcvPqMY4TPYea773VS9TSu4IbnWZ6h2AXjvkitfFVMPViLJNVJCalQktZAb5h
 VfueIQ8W718wYtbf5Q1d9Bjr4o5w05ws3rcPlZt25L7EKLx41WnwvzkCeItalpk6
 H5omKuXR3O6pQ4oaiFv5fOxlIDEE9/EOtBbKhGTGaXCN10IaAID1hgBfUbt622pT
 j2uNWFqhJGWEgUYh5Rhe6BXp2M5mWi52WljNxFKOENUQZVAVzmtOFIjJ/0if82lz
 x4SyCA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42kmn5ctve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 31 Oct 2024 20:30:59 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-84fba3e0787so50544241.2
 for <freedreno@lists.freedesktop.org>; Thu, 31 Oct 2024 13:30:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730406658; x=1731011458;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9k2M3b0n7oscrFwRKfsA6u45GGCm173u3WDMqWDo1xk=;
 b=nTSATfn4G3HvH2lQwRytaHl6wYo6wSe+RAuZdZUL0EylRh/YClUmyseAwHP9WEAc34
 I+QRDtu2845NP1NJAqcAbYizunETkND3kyjT4LxloUUJHAU+GwefG29EQKhRc0Zfz3kl
 /XcdQQyYxLsjoToItJ1kfudGS8ZzoJjdJ0eNF+EPBSvAZkk/v7kduzGvmW1OVN03HPn2
 Y6eGZvKW6nGGtvIlEKk7inJNGfxPvI+STtBg99fSG8LY4N89Hr1WdISDQF6IauXsgvTW
 1DedWtB9nH65bF1RZojKtjqdRv1bGEWCyyWvEHjcpKCN+FRBXrgkWkPAEghsELfn5Jbd
 rSHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOkDl0VP0HqhSJ68iVP3uWdCf2ijNdCI9befLRD6qLlMgtrjwoyxqdf0dUHXEiFbAyvB5bGPaRzfo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGbC68598hnJL0b+MufMBQhZ33oMbnvPUPgoz/EaG55JeUPULD
 oBcvE6FZvaJn9H9uPph5uPBQXv5EIrQtgLIh6SuvY88TFyJLWAWP0WWDGSyq595GwVfF3i3Hu7R
 qdfZkys7L46N/ZdOjLCmRHUVDbo395ILLwAIVT/u2558y5tfRjBy46OlZaeRVnXSd47I=
X-Received: by 2002:a05:6122:84:b0:50d:4874:6c3d with SMTP id
 71dfb90a1353d-51014ff78b5mr5809017e0c.1.1730406658426; 
 Thu, 31 Oct 2024 13:30:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGq7JvNQxAihqkufmrhlP1Kc1i6aseFNdHcqNo96oE6qeQc+5u9i2EYOcAH7guDp1OzQvnpxw==
X-Received: by 2002:a05:6122:84:b0:50d:4874:6c3d with SMTP id
 71dfb90a1353d-51014ff78b5mr5809000e0c.1.1730406658112; 
 Thu, 31 Oct 2024 13:30:58 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ceac7e93c1sm862582a12.81.2024.10.31.13.30.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 13:30:56 -0700 (PDT)
Message-ID: <fb0b1d8d-e47b-4357-b35a-6acd14507653@oss.qualcomm.com>
Date: Thu, 31 Oct 2024 21:30:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sa8775p-ride: Enable Adreno 663
 GPU
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
References: <20241030-a663-gpu-support-v3-0-bdf1d9ce6021@quicinc.com>
 <20241030-a663-gpu-support-v3-2-bdf1d9ce6021@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241030-a663-gpu-support-v3-2-bdf1d9ce6021@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bNlhM9x9yLHdQjs8yMntAs6IZwJWx8nC
X-Proofpoint-GUID: bNlhM9x9yLHdQjs8yMntAs6IZwJWx8nC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 mlxlogscore=671
 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410310155
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

On 30.10.2024 8:02 AM, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> 
> Enable GPU for sa8775p-ride platform and provide path for zap
> shader.
> 
> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
