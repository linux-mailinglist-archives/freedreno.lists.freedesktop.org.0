Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0657BAD7D4D
	for <lists+freedreno@lfdr.de>; Thu, 12 Jun 2025 23:20:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD7010E194;
	Thu, 12 Jun 2025 21:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EaxjjFpJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F0E10E194
 for <freedreno@lists.freedesktop.org>; Thu, 12 Jun 2025 21:20:00 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CGobjq013456
 for <freedreno@lists.freedesktop.org>; Thu, 12 Jun 2025 21:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3Zmr5+JECjNDrTnuNUMITpmDMpNItBuB/kFf5nbp53s=; b=EaxjjFpJ7wS6WdqT
 Al1W1Dj40l1WVibjXSMhFBkQf7/kUWFEy7BYQ5Xh1aoIZxivt/1erMUK4pXf9IzK
 D6GvU6tPk97CzCjDbyjp4RBj9ZR2Q1Hvg6pEjCSoSHTOS3GpK1i0MNQqh6ss9Eg2
 SsavzA5JlzCtAdLE/i56RtkKXQdF9mkMe7qiHQCpIWSERGU97gZWoXfBPDeAs+Jw
 GtAZTZSGbvNuZJ46oglDZhV60SoySDp0yIswVG/qv1FuDvK6FXSbAiIjtNYMBxKL
 RYCYlTJN6LekxjS9R3Ha9R4GwWOjrVcR9JwvsLgw9wJq8Ykq2S9uhRG9dXyOKWIo
 0C2X8Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476fmnhgmw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 12 Jun 2025 21:19:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-31315427249so1469362a91.1
 for <freedreno@lists.freedesktop.org>; Thu, 12 Jun 2025 14:19:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749763199; x=1750367999;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3Zmr5+JECjNDrTnuNUMITpmDMpNItBuB/kFf5nbp53s=;
 b=lI61V9MSAbiwSMpJ48aq2dUp2WUEdrtp4uPaQwEdlt//jw9JQiJnhQdH5YTx912l5q
 fWY0b0FuxbmPhE/Y6HycPPreoch2pLABuqhZlFiw52ATpKH2WY0sHPfFCUgSBEDXH4Pj
 vVGpsOLhwbbug/6HFZmvM8JnLWBq1yte30173pY9X3G48phWwvJwdnvLi4e68fLWaH2G
 Yz/D3SBrFjrvuGM7LP//i/5SzizEMIfcwcLAqdO0gOq4kfq3jsF3sUgZYwv75EUeNofv
 YaHxdCTrfvBtoBvt2GNwz8Lf6+by9t98nfLDub0XUY3gJ+1v/5mFV9ImYcxUSoZ0xQIz
 Y5Dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVe8mkqvBi3uIW90zgvhauvomCfv4l8DMWpYttTvxO/kRRMJmJmRIM8PljS2RdW+DnemSb3Gcq+cTA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0URUB1Vrl+7q6bIV2BUCtuVRK6JauGYmf/Izt3FGALVlo2HIu
 /wjTtgJfe/xRnc2RY9elPOr6ardMcgO6ApyySOTmx15qqlEb7MPNYTi3awWU5RFP0k37bzudry2
 8A1Q1jHE9gDTDidzEnXD7zr1Sx2L/EiodCJuPx63WAiNI8mLd6QnTnFHyEALMRLdNfdlQ+Qs=
X-Gm-Gg: ASbGncsZHy3YD3ZLAMLrBu7H/vn1+TWFZagOe9nrnTap4qZbBknE8b40w1xHm7WlJY8
 ZK3pdTusgL3Oss49g2rwMPR+wcJ29fv3qrtNHZwgf3kIYbQvVAriLspmYNgQ+BQqVAoio1CpukG
 VkNN6ZVoU7A27DXvNoCcGyGSaCapJHJunK6+Iyu4p4fwDlbzcsFL0UrKW71/lbWsuv+g2wS1D1n
 USRVbMRKhONQL9BuF2VshNiwrjsixd+idMKrYYrbBwmcvXchLYJQxh98McsSwND4Go/UE9Esfli
 8nBTPUw6XI8tVKH0nmsyfjjV5sftxStZdF0jHEl7CQ==
X-Received: by 2002:a17:90b:1843:b0:30e:712e:5739 with SMTP id
 98e67ed59e1d1-313d9d71383mr1065537a91.14.1749763198848; 
 Thu, 12 Jun 2025 14:19:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcEB2oQFFgVMym1bB2VUhhziP7lQFCJfNjFpbKCnIdWSG44vwJc/VtPEHqnpJDg2SoasT6AQ==
X-Received: by 2002:a17:90b:1843:b0:30e:712e:5739 with SMTP id
 98e67ed59e1d1-313d9d71383mr1065512a91.14.1749763198422; 
 Thu, 12 Jun 2025 14:19:58 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.228.17])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-313c1b5a882sm1990932a91.40.2025.06.12.14.19.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 14:19:57 -0700 (PDT)
Message-ID: <036e739c-54e4-4252-b6f0-c8eed5557d15@oss.qualcomm.com>
Date: Fri, 13 Jun 2025 02:49:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Support for Adreno X1-45 GPU
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
 <0e6fd97d-9a56-426b-8b98-dc8aa50d02d2@oldschoolsolutions.biz>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0e6fd97d-9a56-426b-8b98-dc8aa50d02d2@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lo42GEjNBCAfwHLYHKD5PDLQ9MxqUX68
X-Proofpoint-GUID: lo42GEjNBCAfwHLYHKD5PDLQ9MxqUX68
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDE2NCBTYWx0ZWRfX+kZNEX9iIYjT
 cRZXQFrjZpXoiuKyp22iNXDoPBlM6ThYdOjUV0KJeBLozMS8W/w+yb6ApZG8q7YrOarAPojkXO5
 DXq4eDGmxa7vYsS+rD+JqnB1Nr5bisuRAXMxmDgV3RA5VECsDZcnYATp5m/0za0W2OGBOCw+OSz
 7iq9b3GylpRdfzCrFDGPwTiRccMWTlUnWmpmvD6KPtcUDV889a58VeJfuEVudPkQUe5ybcnCF8i
 bhnilO5p32Hg5i9Qh8rNEjKaxguzgjIT+Ct3zISA4nHBXGGjOzlaZOPv7Icfi36AWe3OSIhaAbM
 nHUBArCLs2wECcvK8U+EToz99J1jD9beRrUjR4lZ/xNTePyr25iHbhTfbtLo9MOByrr7TSkVsyC
 d8eZxkLm4cd8o/qmrqp7Fvvwmj2JQblOY01w9kiveXKEGOpvdjhbnoDUyFCbFpar4BgdCXnr
X-Authority-Analysis: v=2.4 cv=K8wiHzWI c=1 sm=1 tr=0 ts=684b447f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=8TKXt+tWyFtBY9WE4KDEmA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=uKUkM4gl_lyc4tR08vMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120164
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

On 6/12/2025 5:32 PM, Jens Glathe wrote:
> On 6/11/25 13:15, Akhil P Oommen wrote:
> 
>> Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
>> version). X1-45 is a smaller version of X1-85 with lower core count and
>> smaller memories. From UMD perspective, this is similar to "FD735"
>> present in Mesa.
>>
> Hi Akhil,
> 
> when loading the driver (still without firmware files) I'm getting a
> speedbin warning:
> 
> [    3.318341] adreno 3d00000.gpu: [drm:a6xx_gpu_init [msm]] *ERROR*
> missing support for speed-bin: 233. Some OPPs may not be supported by
> hardware
> 
> I've seen that there is a table for speed bins, this one is not there.
> Tested on a Lenovo ThinkBook 16 G7 QOY.

Hi Jens,

Could you please try the below patch?

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 2db748ce7df5..7748f92919b8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1510,7 +1510,8 @@ static const struct adreno_info a7xx_gpus[] = {
                        { 0,   0 },
                        { 294, 1 },
                        { 263, 2 },
-                       { 141, 3 },
+                       { 233, 3 },
+                       { 141, 4 },
                ),
        }
 };

With this, you should see 1107Mhz as the GPU Fmax.

-Akhil.

> 
> with best regards
> 
> Jens
> 

