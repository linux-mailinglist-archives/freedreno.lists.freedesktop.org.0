Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D54CEBF5E
	for <lists+freedreno@lfdr.de>; Wed, 31 Dec 2025 13:29:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979E510E153;
	Wed, 31 Dec 2025 12:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="e85aK0XT";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eH+keLmv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C17A10E153
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 12:29:33 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BVCF72s2916852
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 12:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KFud8qCRw7D7DQF64mtGmDdTqmMXZ97Xc4c1B/Av8pM=; b=e85aK0XT7X6B556g
 rSxyb4cR/aBwAXUbyRNOcVz2c+e9H99AQXq5xS9XRXEfpes7PKwtVHRQRte8T/12
 ymrAgYI30cJoBKrp+D0r9b8EtAP4mzPTd7YuyxkHnT8khKUy68xOuR0/CcOuka46
 D8pOTkH1rx0J70wek8q7vjW6l0hD6S0uiF6lCS75DebTMSVwBLNBGKSOP30zqvCL
 L5i9IbPWnOVEZSAEoMjRtC3BLq23yT+j8XnfTzkndecFzf97ygjQePjL7+07txuY
 TXTXWBTZ4g/t4qdKEr/lexZrQKrGG3F3YRtEbQwCC81lbnJXm4s1seEKW8xOMvzb
 rVj3zA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc8ky3eh1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 12:29:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4f357ab5757so48491041cf.0
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 04:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767184171; x=1767788971;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KFud8qCRw7D7DQF64mtGmDdTqmMXZ97Xc4c1B/Av8pM=;
 b=eH+keLmv3K5GhHPPDIjjL5YYaZL69nnslEKi/eWU6nFL1eKt4i8eXGdJI/u2alaVWS
 QjzhE2H44Ghd7RMSBeeD+Ai7l3w//W46xFraSzIhzXmpo2ejYPkqVQ3+3AV3t0ikvNvA
 0frFTurQeJ9Bcu6FRnpdh3G1YlC8T9zdE0uTeGXajP+eOALddBYSd9VXHqvOCx2KMh+x
 pMA6iP1E8riT3iF7wBMvRK/9vxiWFF6S9gss8OZTaIjbqRGG324w/khjcPEVa28fkfZu
 CNK4ZkdXuX0BXIIViIjk9hK/XaQIobtNiqrcZTftK8DMyYJ07ZOirPRhaGs+h5nVUrcM
 UbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767184171; x=1767788971;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KFud8qCRw7D7DQF64mtGmDdTqmMXZ97Xc4c1B/Av8pM=;
 b=eZ4GoCImzPp6zzoxk8EiMhL2otkQM3x/fGc14g4WjayWJKyjCvLETAtziIvU27LUjS
 ueucfGJiwI3fNo6davjK0sDC8z2PqkKPxf1rjeIyAitH8hnkBAOvEAHc20xrRIbZItdD
 XPQRANlCjlncNQyGQM0wqxppnnVYiRYfDqMvWjoVOqNjz+EAMYqsS9gaWWraPEIlA2TF
 P5BaqwVPl8XZ/rBrnw8Daky0zfZOqXnlie5av3oufwtPqi1wFZqFrsn1XVHX+QizETK5
 fBHJh1aKK0m+32ceDmlhFe1OYiboaS7kGs/Oo5tOXvcojDw9fL/WjSUKFdtbUy2Nn3Bj
 63Fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfiDmBgWHjW9t7PigyFaMk2W4nML/JzVCp47KrFP0O8cmpt9o5cOaMjtjV7xxb5/TTss7lzeNKKdw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywh33iU0x6aGFJg0hV/DOfoQjJDCVntARD1VNHBmAIN09gFK39U
 3pANmgtDUKoeLUQYQmU5J6e+X5NY8F/fkRRqbEhHNVaYsVnfu8FGlg3X31Sff6ZSYrltPejJDQ1
 WRPEk46SHIlWEzxEdT7yF3gpOzCIJKqTKJVpdX5T6FoWZXFAdSLKeboK4+gRxklNI3b/BDGE=
X-Gm-Gg: AY/fxX44dKpiRRp2Io7Ek0uMoKFci0T1GKaiUFuI9nGHAKTLATJpO8Ylfo2EIg25taf
 ObcgB9syRIJ7SaPzfS6fYPotZNvhFCFRdqgYJaLyqiuut/8m1JSqsT/LMyUh3Lz5PpkERJp0EDH
 kQgCcLwfkOU87fVWw0kFQovg+hIMQZmIN+PCFEFtvQ07wz9ywlF8Gab4WjqIbcbhkA70dsyChnY
 deqRnJTwqG3CJ1sgvUvp1Lud54MHwo8l5kBKCNEA3B9tFZWqtRRRPDfVLgRrp1+843vlgcQPP0e
 Ovwj1nLX7tNz9BWkysI7T336l0OKEg0uvOm72iHcQypKl3E+ISTmAIf4JVk4AXqA2h+xoql/+pT
 4orrUVgsLNBcX9KtnHoBC2AkTm/iFcLlSqVRC+qTHGsOlNfCxrAHGmft8JplArsP7Wg==
X-Received: by 2002:ac8:5891:0:b0:4f1:840a:c90f with SMTP id
 d75a77b69052e-4f4abccd72amr410542511cf.2.1767184171272; 
 Wed, 31 Dec 2025 04:29:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhDVqUtx8723JBX42anoDu6k15qa+jqxNz2Sh0hjnvTQAr+BDlp8CHnTosrIcyTDnpDaKPvQ==
X-Received: by 2002:ac8:5891:0:b0:4f1:840a:c90f with SMTP id
 d75a77b69052e-4f4abccd72amr410542181cf.2.1767184170897; 
 Wed, 31 Dec 2025 04:29:30 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f0ecb9sm3877057366b.56.2025.12.31.04.29.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Dec 2025 04:29:30 -0800 (PST)
Message-ID: <f30d26e1-068d-4af7-adc3-9cd03617ecd1@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 13:29:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/8] drm/msm/a6xx: Retrieve gmu core range by index
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <jie.zhang@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
 <20251231-qcs615-spin-2-v6-1-da87debf6883@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251231-qcs615-spin-2-v6-1-da87debf6883@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEwOSBTYWx0ZWRfX0jZGt+luzYOo
 XfhItQ3gb/B/t2/Ie5CvZN2gteb9A0xuhQPqj52uHdud3xXT448BzChXncy6Lw4654GD8eSKPpi
 cQVxdw4rS2VsFVbNxCbrDSUB7y14YRrslWYLioGKPX/99EV4lGbkQYzAocPlEDM4UetfJiawg+v
 dpwDiKz8ToY6NvC0Xf9nAf1zDz46ue3arlnmt5Y9ToHY9qB6pWfzEo9DaM3zKWz7rl7QIkCKxoM
 Mt0Ab583rQc45RPFFfjEAVagydaLVhPexseeFTKQclzmAhFTruSvxHfiI6ftHP0Gj+OBdxWkFrO
 FinqkYUxJ2yydaa/oYQ9baG0P60NiKUROILFxYbf9MxoGiUbUnorg482BWsa3DPblbNLniQgvmk
 odPcs2xYBeHGvFaiWGoWGYg3Lj0J57M6clPTnAQhNpDvmsSpkwHSDbS3WnRTiz6Prob21LDrPqd
 LMWEacevmBlViYTIcxA==
X-Proofpoint-ORIG-GUID: UM0Idjj2whorIL1SCvOlrmkCzjG6P2Je
X-Authority-Analysis: v=2.4 cv=BuuQAIX5 c=1 sm=1 tr=0 ts=6955172c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bmOu7kEL96IPmD5EUUcA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: UM0Idjj2whorIL1SCvOlrmkCzjG6P2Je
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512310109
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

On 12/31/25 9:45 AM, Akhil P Oommen wrote:
> Some GPUs like A612 doesn't use a named register range resource. This
> is because the reg-name property is discouraged when there is just a
> single resource.
> 
> To address this, retrieve the 'gmu' register range by its index. It is
> always guaranteed to be at index 0.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
