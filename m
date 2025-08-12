Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 935EEB2248D
	for <lists+freedreno@lfdr.de>; Tue, 12 Aug 2025 12:27:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 894AE10E0FB;
	Tue, 12 Aug 2025 10:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C+p1DqYm";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDEF10E039
 for <freedreno@lists.freedesktop.org>; Tue, 12 Aug 2025 10:27:19 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C4sLkm029604
 for <freedreno@lists.freedesktop.org>; Tue, 12 Aug 2025 10:27:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 C9vCp9m+qHfHd3sxSOOc74EeHEbwHcJ/Vc8rKeqTxWw=; b=C+p1DqYmbrJU/Coh
 bokhX1Hwqe+djWwDbWYX16FTHV52bz+TPAG1ISJJx9RagMCEfE6NwyQ4whxAvhbM
 p1wwopY6ag5xi8uvABmqHSLWe/eRltRVQnOKvrrjwyt8uaExrI4PPLzCLckYv2M0
 WU3fAZ38r9xeDgp6WhiCTML9ypUd7a5oXxDRy3C+cMGM30kyrgR2fl3PKtEojDrq
 kqdFOYrt/cKIex/DgTFQMGnUMCGTlIlQmt6NGAeC/fhmYwRicYRQJD5H03IOHW0b
 ubCflHD5qMRRSG2HVgJjBvlhy7TAH29DKKZ72BVkQwHBkRpzYMuLVUtlAFPp06E3
 wNQnog==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sqx5x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 12 Aug 2025 10:27:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4af1219f29bso4841121cf.3
 for <freedreno@lists.freedesktop.org>; Tue, 12 Aug 2025 03:27:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754994438; x=1755599238;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C9vCp9m+qHfHd3sxSOOc74EeHEbwHcJ/Vc8rKeqTxWw=;
 b=Hr81SsbYEtK+JBZnNZxCQac7ewrVMHoFGkyaH9d5kNBH6DL6J/D8xgU4Hwjw2eIlgw
 5x72HLgK6bOFDPqwfTllWtjdgtLHcVSUff5wWkyJq9x7To3h9Gbm5sUxfRc7QPWtfpxU
 zi8bbnvrvEKAfJvSX8wUrt7NQWaZstg0nA5F0xsM94MeINbJADWWotbFBreVcAHnaOqQ
 zQyRDE+ETnoZD5zjkH+pN+GXJOyQ8EiM6jNp0YoZtbdFd+ccS2eOUjKaDEHHbdI/Z8yf
 Lw9YWualA28tUDLGZitwhjXORz1/nW17o+CwHXz8vJHi+R9VOSxAw76lE+jz3oGYh0re
 wC5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq9KWZrW2cZ+GtZnC3flVOFfKdYR43HQk+B/CNiZHwhOvQEaWCZPoeFFdq3rL8Nbe4PRYMLrmVJ+k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGFfjfZl7Wwt1NK2zHMv/5fB6WWf6AgKn/OKnJ7SaIiINyXTDK
 lT0x9HWL0zdvc4xcoH7HLmvm0BUhHgNpfyZd07GutdlwRmaRHGy/rHV9zx3lABLdrTOc4SfJOfi
 op03IOO491LMKKVfGvUnWM44DCNP6KCH8PijwBzpeYdoTRjDuyyf4jD6hNdi3ANkEKNj7xnQ=
X-Gm-Gg: ASbGnctt/DHBpUNS1+hDqX9vPhHpJxlyRdxhPv4zdhcPNOs6np373fkS+4+qzhCrYsF
 UhhIkGVNLXC7PrdDOpCF2FjVz4AAN6HBVzRApw9CXeHlHu7lPvuDPqt8Q3OEGr6ioWsFWGktkSs
 Dba3c5UAiJ5XOnao+M9VOmuLMX1I4lmYhJTm34XMRcvs4ckKI8UpxtSZJrciodri8BwXHgO+5LX
 AP2RX+lWIZtmQfJK2tw+Wcp7CcDbRwoIMR7Y+4eEtJ8LSCSUG6yMi7cLtsRulEgFx3e0x1JPX9k
 0gCu3pN42gQ3+K2S2Yo04qGNMnBlvSuRgZsjZiPJ8nTV/tx+S9PAM2u5dhplmKV4LfQv/+kxYG6
 fQyuYT8Rd0C3xqe+42A==
X-Received: by 2002:a05:622a:1a26:b0:4ab:6de9:46ae with SMTP id
 d75a77b69052e-4b0f6267d03mr2669071cf.13.1754994437730; 
 Tue, 12 Aug 2025 03:27:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcHGbLJllfiL6T0pXR0Qe7084myDh4JmZG4tqCEOLzDDsKtMH0MRvtexCeFrKzOU71x8TNjA==
X-Received: by 2002:a05:622a:1a26:b0:4ab:6de9:46ae with SMTP id
 d75a77b69052e-4b0f6267d03mr2668781cf.13.1754994437236; 
 Tue, 12 Aug 2025 03:27:17 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af9f4796e23sm444380766b.26.2025.08.12.03.27.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 03:27:16 -0700 (PDT)
Message-ID: <0bda8e0e-4f86-458f-b55e-c5b0d6cd5c30@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 12:27:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: display/msm: qcom,mdp5: drop lut clock
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250809-msm8976-no-lut-v1-1-f5479d110297@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250809-msm8976-no-lut-v1-1-f5479d110297@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689b1707 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=vZF-wXTcH1iwIe0ERPwA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: m5qZ_AMVl_-1hSPtz-LLXmMGZQO_HG-t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX0vglcozfnCqW
 Sy/xCkN4e0dU/GYaDNrY4OBb9lHqYE/+Sr9PQ02IHDdDQHz3C0uR2J+BhU/o7W49z5mU2gfvYrU
 e9MUSGqhdOb5XVP26faZUIjEZLeP07yV2V8jZf99JuJk6pClF7MJeeEBTxK9oZIePXFPSMkjxtJ
 hGIbxdUhzPr1A6JZwaQk0GCt8fiByDL4PpuPxi+eq5stDQ2i77+0ADO4wNQ8yl/EXVuPSlV6kEH
 /ZHNM3nJ7m6KA+a9wWupGeevkOnU+hRZRaRrG9O/Wo27X+4wVVU8Y8YOjl0c7Ve+SZwXCGaXU1s
 hgF5st+mfnHyaxpXx3O54seCZ+npcOA9rhdY8dhk9p+29mAmccvEL9r4XCr24zhzwWz1Ct9tr9p
 i8zdglNM
X-Proofpoint-GUID: m5qZ_AMVl_-1hSPtz-LLXmMGZQO_HG-t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_05,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015
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

On 8/9/25 10:36 AM, Dmitry Baryshkov wrote:
> None of MDP5 platforms have a LUT clock on the display-controller, it

8974 and friends seem to bind it to the GDSC

although on msm-3.4:

arch/arm/mach-msm/clock-8974.c
4197:static struct branch_clk mdss_mdp_lut_clk = {
4203:           .dbg_name = "mdss_mdp_lut_clk",
4205:           CLK_INIT(mdss_mdp_lut_clk.c),
4609:   {&mdss_mdp_lut_clk.c,                   MMSS_BASE, 0x0015},
5118:   CLK_LOOKUP("lut_clk", mdss_mdp_lut_clk.c, "mdp.0"),
5387:   CLK_LOOKUP("lut_clk", mdss_mdp_lut_clk.c, "fd8c2304.qcom,gdsc"

Konrad

> was added by the mistake. Drop it, fixing DT warnings on MSM8976 /
> MSM8956 platforms. Technically it's an ABI break, but no other platforms
> are affected.
> 
> Fixes: 385c8ac763b3 ("dt-bindings: display/msm: convert MDP5 schema to YAML format")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> index e153f8d26e7aaec64656570bbec700794651c10f..2735c78b0b67af8c004350f40ca9700c563b75f8 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> @@ -60,7 +60,6 @@ properties:
>            - const: bus
>            - const: core
>            - const: vsync
> -          - const: lut
>            - const: tbu
>            - const: tbu_rt
>          # MSM8996 has additional iommu clock
> 
> ---
> base-commit: a933d3dc1968fcfb0ab72879ec304b1971ed1b9a
> change-id: 20250809-msm8976-no-lut-4b5100bcfb35
> 
> Best regards,
