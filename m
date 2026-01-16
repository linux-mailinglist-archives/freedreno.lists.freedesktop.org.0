Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D3BD2DC8C
	for <lists+freedreno@lfdr.de>; Fri, 16 Jan 2026 09:13:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C56B510E823;
	Fri, 16 Jan 2026 08:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z7V3VKNK";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q3u+0v8p";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E40D710E823
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 08:13:33 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FMbliH1241227
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 08:13:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ynv1j8bv353Wqu7/JmPfEjOt++cda3rF60jsZo4KcPI=; b=Z7V3VKNKHJhUAO17
 zYFlMHFCLBDCTS+GA434B3Py7yo154XZGAc8biYfQCqc89bYvzEHopXnx/S0S2/n
 GM7TCmUIwtECS16q6NWlBVSg09COKQHFkIXIdjAG3E1LIWhdPzOjKueIwJxaK3ez
 jh0U2Wm/oBQMKrWzVhMlxS6+Ks8FWmCroQnK4KOJ6oOa1rsJwZQ8V7RC/o036dcH
 yDle2aU3Ob6oWP56jD3PZ6k7Hm+h51DyQpjOtJ/+KDHSAj56ln+wH7xD3fbaP8N+
 6OK8gCq+6ViUADkGBbVjpYul3UJGS5oRHYUSwok9gviBf+mi7hzZ5Z9HqvUHVbWa
 fJ81QA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96ssbpw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 08:13:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-c5454bf50e0so3291370a12.2
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 00:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768551212; x=1769156012;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ynv1j8bv353Wqu7/JmPfEjOt++cda3rF60jsZo4KcPI=;
 b=Q3u+0v8p86Scqv2FK6LuDC9jUwt9oOERKlge30myltw2vntWdqvK0gqJIOTUJ+ICN+
 dTXOaqg+da7zrKZdRbekVgInU2RsPHnxstk+hzTRfl0BpSqATBLTCXwmVVJc0NbJZn34
 kl0Ou3g6dLnQCT3llimUH52toXAJXTsZm1Qm7yxhJQGsl76YTz7WG1uOscp7Y+bqyLpp
 IekeK0PfvdYaVvqAXzOFvD0RA/Iq4skKYkXNNK4TUZYzU9LhAbWrYCcob/bMj5ZpwAZg
 fkaZLnXuJd+hnRnz37WWES2iSAyior//zgHYfS9+bxc5n3GVal2ps/5KMxT4A9OptVTe
 dW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768551212; x=1769156012;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ynv1j8bv353Wqu7/JmPfEjOt++cda3rF60jsZo4KcPI=;
 b=MdxCTATQmsNtC2A701CTq9aYNslvXNrYw7g0WYIb1fqBFPjRcGF2Pv2bC9FNFkUGkd
 hZKEjQHuB/L6E7z4JdALHTHt0tsis6KLJqOXQv307rtfmni25ZJQch35qmQiMOupBoXN
 zMuYaKcU4b7QgEWiz4bu7zwOJtiwBcK1afE3KWyAFKKf+5EpyUefDLnExtl8LATtoffV
 falg3nT3SiZv5NQoq0oV9yVPubg01sL+8IsgkExwI1lj9tMW8DrbzGTkFgdshjOaoGOu
 X7rlDHL4RM/5M4JvX8ZQ9Jne7AIH7uRdik2LPO/7w6Jaguq8EmntCDciLwboU9KgQBAj
 //iQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX87c3Se0cPX7ZNAt1atVowKm3fpVI5moaW5wjf+ESBdK2PuOBkOPfwbaAKgYUyC4B/CgJlDVAkQO4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzt+3e1nmRg8No/BLmGAiEU6PadaweLRCNAv6kFRYLrvnxFEH30
 w9Pa1SCzoXl6KabM31zKC1a/P3TxmVkqwwgDpxV1Clud4kVc0g7t9gpPk44lXoBcB3ysNYNlbOS
 KlyIYagImmo21Jaxfu64OnO4weQr3pj9q8+tDWb+64WQj/Lt5/1853xmfpznnBXRFS7xyluQ=
X-Gm-Gg: AY/fxX5w/UFbnJkMoVIFpUYdng6nOFcTV0NT1R1XN3gXJU0aFirzdLLmxMC9YJ5weha
 xLRDf3nRsx5usuVGFj8SJFPYUZLjWegsQS3gWlH9APXqM8hHF84ul+idcbvDvBgChUxLoeM9F/c
 iOrP3ij1SzYdzcDu+Sl8t4dMj1loCwkMt2ex09UIpRTjDDpviZRAuFrY70PqhAQNsb7Veu4vXSY
 A2j8SDB/HGGZ4RfRoGmfZ2g+vSO/IgWwJIXyFXLM9zTj/ML4Qm3AysYug2LSloy8B8dJuhifIQW
 6ax5ptAeOlpbAP687lWPsCKkYrjQqtEbOiUKJ1zwxsvoeHGuzzvGo0xUXHSEpFpWbt9SMNNVEOK
 lxdNIMxCs9GEJSn4ljjkzxZX3knqAYVwfQpXJ3Q2oFWzil6rYZjXrSPw63DikjVJ4CD2l
X-Received: by 2002:a05:6a21:600e:b0:38d:f745:4d4a with SMTP id
 adf61e73a8af0-38e00dd9766mr1992661637.78.1768551212589; 
 Fri, 16 Jan 2026 00:13:32 -0800 (PST)
X-Received: by 2002:a05:6a21:600e:b0:38d:f745:4d4a with SMTP id
 adf61e73a8af0-38e00dd9766mr1992637637.78.1768551212076; 
 Fri, 16 Jan 2026 00:13:32 -0800 (PST)
Received: from ?IPV6:2401:4900:889d:214b:d73:b128:21b8:6188?
 ([2401:4900:889d:214b:d73:b128:21b8:6188])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c5edf354b24sm1338540a12.28.2026.01.16.00.13.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jan 2026 00:13:31 -0800 (PST)
Message-ID: <d3274681-c437-4ec1-918e-10e49cbcc676@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 13:43:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/8] Support for Adreno 612 GPU - Respin
To: rob.clark@oss.qualcomm.com
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Qingqing Zhou <quic_qqzhou@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jie Zhang <quic_jiezh@quicinc.com>
References: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
 <CACSVV0006wVK-JWweuNYAfu-a9rtn=zp93sey1srPieGEaJWRg@mail.gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <CACSVV0006wVK-JWweuNYAfu-a9rtn=zp93sey1srPieGEaJWRg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 01ffURb1g75fNQlZXkcs-mc185N8RKaA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA2MCBTYWx0ZWRfX2mjj1BZniCpQ
 TkRcgKI3Wq3R+OFvK5qdI89WKl/TdBf0TwIpk8NMUJkkealJTzTHJ9/OJLpY+Uk1PsSYZZiCJx/
 OOn+XLJmjcvJ6XfGQh/LKrmwC+5ctq/LicgY2iFeCnk0ygkAlB/6kN4cdUrGN7jEp2rSBxF8ooP
 gnZm4jyR2E0EKcFZaZxymwmFlEcQEdmGbub7piW0+TJMdLUFJ7mETWtx7bICURvI7RnhgKpumz6
 h/ANw1L4gIOeV6KoLMSdmrWyaZBd0iSS1nBMkar4+Cnbl1RujZq+jbjEJiVBh2vh3J3YwWRb+yV
 LYbdw/kU5rglfIJt47pXycfVQSAImA2w+Dxeo11fO3z4sJMiAhNlElmytq6/PgoF2l+YGRap/0v
 XrseO4f0XCmSUuCbDuBupBAMheB2xmo915UVlKbMO7SyprG9pjx5RrBO1CeFHIb4rgrxc5xyF3t
 L9GlamOH2srtm/c2/3g==
X-Proofpoint-GUID: 01ffURb1g75fNQlZXkcs-mc185N8RKaA
X-Authority-Analysis: v=2.4 cv=M9tA6iws c=1 sm=1 tr=0 ts=6969f32d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ruhtLSfl90xYY3NouLkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160060
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

On 1/16/2026 3:52 AM, Rob Clark wrote:
> On Wed, Dec 31, 2025 at 12:45 AM Akhil P Oommen
> <akhilpo@oss.qualcomm.com> wrote:
>>
>> This is a respin of an old series [1] that aimed to add support for
>> Adreno 612 GPU found in SM6150/QCS615 chipsets. In this version, we
>> have consolidated the previously separate series for DT and driver
>> support, along with some significant rework.
>>
>> Regarding A612 GPU, it falls under ADRENO_6XX_GEN1 family and is a cut
>> down version of A615 GPU. A612 has a new IP called Reduced Graphics
>> Management Unit or RGMU, a small state machine which helps to toggle
>> GX GDSC (connected to CX rail) to implement the IFPC feature. Unlike a
>> full-fledged GMU, the RGMU does not support features such as clock
>> control, resource voting via RPMh, HFI etc. Therefore, we require linux
>> clock driver support similar to gmu-wrapper implementations to control
>> gpu core clock and GX GDSC.
>>
>> In this series, the description of RGMU hardware in devicetree is more
>> complete than in previous version. However, the RGMU core is not
>> initialized from the driver as there is currently no need for it. We do
>> perform a dummy load of RGMU firmware (now available in linux-firmware)
>> to ensure that enabling RGMU core in the future won't break backward
>> compatibility for users.
>>
>> Due to significant changes compared to the old series, all R-b tags have
>> been dropped. Please review with fresh eyes.
>>
>> Last 3 patches are for Bjorn and the rest are for Rob Clark for pick up.
> 
> I guess you meant the last 4 patches are for Bjorn?

Yes, that is correct. I missed updating this sentence after including
the GPU cooling related dt patch.

-Akhil

> 
> BR,
> -R
> 
>>
>> [1] Driver: https://lore.kernel.org/lkml/20241213-a612-gpu-support-v3-1-0e9b25570a69@quicinc.com/
>>     Devicetree: https://lore.kernel.org/lkml/fu4rayftf3i4arf6l6bzqyzsctomglhpiniljkeuj74ftvzlpo@vklca2giwjlw/
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>> Changes in v6:
>> - Move the rgmu register range update from patch#8 to patch#6.
>> - Capture trailers
>> - Link to v5: https://lore.kernel.org/r/20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com
>>
>> Changes in v5:
>> - Rebase on v6.19-rc2
>> - Make the reg list in A612 GPU's binding doc stricter (Krzysztof)
>> - Link to v4: https://lore.kernel.org/r/20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com
>>
>> Changes in v4:
>> - Rebased on top of next-20251204 tag
>> - Added a new patch to simplify gpu dt schema (Krzysztof)
>> - Added a new patch for GPU cooling support (Gaurav)
>> - Updated the gpu/gmu register range in DT to be more accurate
>> - Remove 290Mhz corner for GPU as that is not present in downstream
>> - Link to v3: https://lore.kernel.org/r/20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com
>>
>> Changes in v3:
>> - Rebased on top of next-20251121 tag
>> - Drop a612 driver support patch as it got picked up
>> - Rename rgmu.yaml -> qcom,adreno-rgmu.yaml (Krzysztof)
>> - Remove reg-names property for rgmu node (Krzysztof)
>> - Use 'gmu' instead of 'rgmu' as node name (Krzysztof)
>> - Describe cx_mem and cx_dgc register ranges (Krzysztof)
>> - A new patch to retrieve gmu core reg resource by id
>> - Link to v2: https://lore.kernel.org/r/20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com
>>
>> Changes in v2:
>> - Rebased on next-20251105
>> - Fix hwcg configuration (Dan)
>> - Reuse a few gmu-wrapper routines (Konrad)
>> - Split out rgmu dt schema (Krzysztof/Dmitry)
>> - Fixes for GPU dt binding doc (Krzysztof)
>> - Removed VDD_CX from rgmu dt node. Will post a separate series to
>> address the gpucc changes (Konrad)
>> - Fix the reg range size for adreno smmu node and reorder the properties (Konrad)
>> - Link to v1: https://lore.kernel.org/r/20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com
>>
>> ---
>> Akhil P Oommen (3):
>>       drm/msm/a6xx: Retrieve gmu core range by index
>>       dt-bindings: display/msm: gpu: Simplify conditional schema logic
>>       dt-bindings: display/msm: gpu: Document A612 GPU
>>
>> Gaurav Kohli (1):
>>       arm64: dts: qcom: talos: Add GPU cooling
>>
>> Jie Zhang (3):
>>       dt-bindings: display/msm/rgmu: Document A612 RGMU
>>       arm64: dts: qcom: talos: Add gpu and rgmu nodes
>>       arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU
>>
>> Qingqing Zhou (1):
>>       arm64: dts: qcom: talos: add the GPU SMMU node
>>
>>  .../devicetree/bindings/display/msm/gpu.yaml       |  89 +++++++++---
>>  .../bindings/display/msm/qcom,adreno-rgmu.yaml     | 126 +++++++++++++++++
>>  MAINTAINERS                                        |   1 +
>>  arch/arm64/boot/dts/qcom/qcs615-ride.dts           |   8 ++
>>  arch/arm64/boot/dts/qcom/talos.dtsi                | 149 +++++++++++++++++++++
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  14 +-
>>  6 files changed, 357 insertions(+), 30 deletions(-)
>> ---
>> base-commit: 2408853dde584f01950a0f976b743739cce30eca
>> change-id: 20251015-qcs615-spin-2-ed45b0deb998
>>
>> Best regards,
>> --
>> Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>

