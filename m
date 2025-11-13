Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C000BC5709F
	for <lists+freedreno@lfdr.de>; Thu, 13 Nov 2025 11:59:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA6E10E6D8;
	Thu, 13 Nov 2025 10:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OX9cuSGu";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j7HRuFw3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA73410E78D
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 10:58:50 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AD6qsqq3873844
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 10:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jgBPaO5vYeetCNzgFhvdCRkSv11ZkxPO6+3HoWQmMsc=; b=OX9cuSGue2w3yOTX
 RFu0kR0LgWyxuJjvGc9Ya8ZqJu/ZqNoTzEstbau0fpspsTIz7A2U4jGS61BnCtCN
 mEYsktpis3zl9MYBs77wYRrjIyaC6W/8QJD/51E2bNPgb9Iv+K1g1izUJi8I1Lpg
 HzZQaqYNNmysuiKoJAVqbDA8E7jho/Fi4LdG4c89xIA1kf0v7crDJl6pP0iO629q
 pCVL8VYZ0TBBAGpqHTB7GkTLgRmc0Cw1zBzr09i2kVJT8wlPD8Di08D6tanVIyft
 ejsV1xCAzPbKU9jkEpynvoDWKlIQTmNxWfm7ecuemCUk1P0cYWFz2BAx8zsxDbbs
 Ce82oA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adaeurrh1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 10:58:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-88248a197c5so1552426d6.2
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 02:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763031529; x=1763636329;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jgBPaO5vYeetCNzgFhvdCRkSv11ZkxPO6+3HoWQmMsc=;
 b=j7HRuFw3GUZYqdgPg5abAjcHg3WfxunafB474XP/SY5zVHr+M8IPoDdKCMi+4tDt8g
 pN0TL8rfpAc9ukaKZDWyTa1JV3rVsAkuNBwiRZQqnwChF5KOVg54yvH3WxLZC87KFnhN
 fBhnsQk8PZeAWvn3yUYHr0mCzmIkss3bWLbhQ6LlWtYALaacABSbw/ik1yTeZO6YzW21
 sn5Be/tpNVlmwGJJEtvyPV4lF99S1vtCZmy7KDxT03iwAOY9KUO9p3gjanMNG0SRVG9L
 X89STtvpqltfDd7QR/GzKJGuem53+0/9no8SXFUe++PpAafjdOl3braxaqDGNizTodDj
 qMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763031529; x=1763636329;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jgBPaO5vYeetCNzgFhvdCRkSv11ZkxPO6+3HoWQmMsc=;
 b=WG5xvcMZTriPL8hvUNoXaWMbKTTTEJk5PjTq6WubjjC4lmLk55dVnnseLsNHQ5JXrI
 +ChdscQ7v8ZB/8X9sjfpqjglwBEEee/MgH9aTN6NZkY1+xJn3StUIU4SQUhXVryLcm5o
 mSJePSYOfPfwQGX0oVuERFjHYRBYg49+YBEpEnkcVHQbcyHn3Ur/7I/EyjtSgsuHyylH
 Oz8OJTH2PoJ/dYL1jxAxwTG/AXOdv8wrglPg60J0heGQ7cKRCcXAjrmYp0qfmGLX2KoK
 jxU65IIQeI4Xqg/JxY/X89QiAGje90gt1GOhFtfAQqixvhoIspdKcsTO/37E4pfg4QXC
 k1gA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnvcmpnO6G/w93NtpMtZMr0SrOpSS/+Sez7MJ7v7m8YGBkq5PauPo1Iuf+sV1D4geuBp2Dd1Rn/j0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMIPwZdy332PCny+VDkXliL35LaigVOIhMlrJvO90VfIfD7WL0
 PoWGNYMAQpfMpVE16nycf346Q93/xEtYzEmvwENyuM7/hXXrlZoGKY47hHrAKsmg6dgWvkjRuTe
 S9VIq5cTThzcKzIOXOLYK8DIDz8XPUWnm7GkZ+dXWo87tgCm3liOneVH9Jbzi2evGsKdd4CY=
X-Gm-Gg: ASbGncuT3tl9wOkdBhQy2N62zP6XfUfHZG68QpQ+ujaH2kU4RWFMA1UcBUzUL0Ebf97
 MaDdLf5Ise5FSK67gGHsl4CdW/G2f65iIe3quxSEu7Zkbc5s09QPxbOuLjWHbbP2S4Z11z0SAUz
 pEkj06YYg0l7I/ttG8iDrkFVcpZVpw2vxyK5u1xruKUC7ftIOu7vUsh9i1kG8aRCK+hyOEWbuHa
 NNpkcbIBfCBGar3o3OtPXZ7gGLg5CoUt0E1WJ6bW7idG2fA/2H2lJN4GgGFfwJ44DXz6kySdU67
 TNtRK4tv6uwO6qBEOUPZDB4zETVHs3nip6zg31LP6MnRnr4DR5M7zY2II6LYInoCoJ8MbXJ2vhp
 4CW7jfu9Y7g9mdTrIhmO5iLP2xB/P9KEvzgbvgEJ2WAucvVfWbSmkD+er
X-Received: by 2002:ac8:7f4f:0:b0:4ed:2f2b:aadb with SMTP id
 d75a77b69052e-4ede794dd10mr20846441cf.12.1763031529013; 
 Thu, 13 Nov 2025 02:58:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdQDsxtlP4V4oPmd1PqozO62xfFzJpWU31Y99QHzv5aGDzw9SGa8isg87xEOWg69/ZZScEyA==
X-Received: by 2002:ac8:7f4f:0:b0:4ed:2f2b:aadb with SMTP id
 d75a77b69052e-4ede794dd10mr20846131cf.12.1763031528471; 
 Thu, 13 Nov 2025 02:58:48 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fad3edasm140259166b.17.2025.11.13.02.58.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 02:58:47 -0800 (PST)
Message-ID: <8ebd7250-fa3e-4705-a5e6-f01878389df5@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 11:58:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/21] drm/msm/a8xx: Add support for Adreno 840 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-15-bef18acd5e94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-15-bef18acd5e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -1BsvSERF7sFhTdkNcZEoEQw8RWn7OhQ
X-Proofpoint-GUID: -1BsvSERF7sFhTdkNcZEoEQw8RWn7OhQ
X-Authority-Analysis: v=2.4 cv=JPI2csKb c=1 sm=1 tr=0 ts=6915b9ea cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1fD9zpMYXuRVFxAoecEA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA4MSBTYWx0ZWRfX2ElgyqbYT7wm
 5zn3m15SrovxmLZo5blrKmlyBwLqZ+y4W2erefK4UWWIkWv3jrefFNdyJe02VM7L5TVrobtG7Go
 oB79R3fc+iFFJgwZcoewbSYL1Z3kmOOGkIcNLI6u3yENogyuqdMOeahKr/As9jXDdKkvoAmbM5O
 RN52PSKnZkKDkAhsJqo/sPyxbl+VUFx99pcoO63V1mvyVQ2FwBfUhbJkz+GV52A2hgtfLoIXg91
 BvP42j05WoAI7umsuB8Mfk7b0HA6cu1T6xV/RTxK8nU2F1pYeTaYJNie4tFWjJb8udUlHhpy1a0
 EcgFZs/7Vqhp3AMyO87+8g31SGu73v2t2Nmrf3/bgoZwsU7ZNDWo/Ql79Hw2sNPCdAW9dXxgKDK
 zK8YSoN+mGjdjhuMe3ru4uOic5vMKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130081
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

On 11/10/25 5:37 PM, Akhil P Oommen wrote:
> Adreno 840 present in Kaanapali SoC is the second generation GPU in
> A8x family. It comes in 2 variants with either 2 or 3 Slices. This is
> in addition to the SKUs supported based on the GPU FMAX.
> 
> Add the necessary register configurations to the catalog and enable
> support for it.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
