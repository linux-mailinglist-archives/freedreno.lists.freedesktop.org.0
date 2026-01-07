Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BACCCFDBB7
	for <lists+freedreno@lfdr.de>; Wed, 07 Jan 2026 13:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBFB810E5B7;
	Wed,  7 Jan 2026 12:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RN6iTrU3";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bF1xjGoq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C2710E5B6
 for <freedreno@lists.freedesktop.org>; Wed,  7 Jan 2026 12:46:19 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6076tXc72379374
 for <freedreno@lists.freedesktop.org>; Wed, 7 Jan 2026 12:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3yqvCDKqiNpbPEHOy8tGkkpTnMSnoWF3DxtL8kCAuPg=; b=RN6iTrU3VB2qgl9d
 QtU1sc0cDRuwMNnKNfHdpyHoTDp7jYFdVQ5EXB2KINELruGUuP25wuyURuUaDmQx
 pBGyGwlLTk0h0ivGy+me8zBwbnLnp+IoaO5r0W/X0sCJ0tkgNKFFIE2UKWztTg5w
 B+p16NwgDTzfKrsxNGcLnrzp1sqmImb3mcT/Cszi+TFwdWtdp590wvyeymKzlF2Y
 gO8lDdecE69ep/OOKZHYwfrlnbo/UxBZjaJDj5fIkMqNbQrH/dnoShqaF/7pcNj7
 IGI1NvU/G8Fc/P1dliMpaTk79MTrFVlE1Z+oK1saG9unX17kjHTTpsDGaL5jdrdr
 kMCvYw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhjn4s29v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 07 Jan 2026 12:46:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ee409f1880so5206481cf.1
 for <freedreno@lists.freedesktop.org>; Wed, 07 Jan 2026 04:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767789978; x=1768394778;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3yqvCDKqiNpbPEHOy8tGkkpTnMSnoWF3DxtL8kCAuPg=;
 b=bF1xjGoq9Ml3lcKq22hkSIBZ70nZ1ylWBE1SZrLXtnlUecA+H1e1In6TbwWM96P+Pp
 NMBcPHJ+evPtJtoE7ooEU7xxoVhS2FFLL1+YAJ/28Vn6fheLYs96buMqAULCu9FcHH/6
 +YPqGVG7xqaKPoeDq79YSiM20SLW4AvSrmuQtF8fWgQNBXRfRLLNgkW6UDnSQErwMl1f
 vq6jtpLNlwpIM34uTPIE3zOajC2mvCsk7fTuWaWBhB4/cgrrIYpBXEexv2ITqixpXEGS
 wOVjz5vCGzBv8ZGs4PhcY4OqD+1coNqH5xvbvq7l47siL+wsb6noykrXWFdEJoaovD2O
 ZLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767789978; x=1768394778;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3yqvCDKqiNpbPEHOy8tGkkpTnMSnoWF3DxtL8kCAuPg=;
 b=WhOeQybEWHiCtbTYNELJ46U0Wp4mb6XNX06l/elDZPvBS/3lNa4vgplLjtaJ9+k+nk
 ohraA/z3t/ktvULuyQ9lC+IMRytqwMnoySnNA20js3QV+Smbvb/xZzObFiyj/ZL6RvcJ
 hnRttmRTzOij19lQi0p0nzbVwmwey8YZZ/gYQQWgERUkM9g86Vps/2AXRFYmL0UtGIHq
 4nV0/RlCZ9ao94B97pMF/mvr2z0OZnzgUsSDymUh3OvvdCghuQKSRDARraU5ZkMfbY47
 RWRQ6wiRgzEdoj5S9uiNi3iF90NHuva7HlhVmAEciICFIRaeH6zOCVQFP7xzDTgj5A6+
 Pi4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQP468wfGHnjAU7qluZ0Fk9KUmnAG1ryrrczGYZ9NKngESB02s9Am0ImMgvnU7kEGxdGOs+i1n5nc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfvtIsOFtdnbHsidtcMSpPdlnUP7tFiAr86sVha0QmO9t7rJ1q
 zbI0bblljpxB+Usrz40XDXH0DiQs38NgkCfmpl88Odz0kRerK16+8LS2dGSF/GORp0xBkSK52jZ
 OIdlu4/DxZ9xSBrciMaZ7kny+SxYfrLujIwaoS5ReouhJB5pZcaKwlt4XZZp3L/LznYc2Yzo=
X-Gm-Gg: AY/fxX73tkjXRtNWu/2LfK2MXqGEf5fWnR9dUG3vZkrvkfskCEe+JjqpxsFYhEy2ESh
 Eyifg00CB8kb20iXZkwQEhuw1PlxHB3N7lKB55gA9ay1/cEcj5S8pNWd0AWm18xRkagK0LFdfu6
 Xcpod5UNpKNVdIz2uM80nktwWT+wA3obbpYoaeoNBqSc8Tu1M/+ITE+AWIi9rHSw1yINXSGipNk
 R7pVQ6ZGBd6tsAONgWHoZRQdRlMHm5nS0jtyyJDIpxiFmGoMCPbla7ug/cPyDXvCiyZgXAmcTAL
 LHDwPhObufOUT1Vt7ooAi+/DShWC+LF03Nx4BeSiG1QKbsYUV/R/2kwOBjgiO5GnX0TaNuETgn5
 Dan1eZnDInLuJUfVpQzHeVTFP/3R9EJYcFYNays1v8VVc0n6lRDnm9Md+cfkfYexF8Iw=
X-Received: by 2002:a05:622a:110c:b0:4f4:b372:db38 with SMTP id
 d75a77b69052e-4ffb49228d5mr22508081cf.5.1767789977827; 
 Wed, 07 Jan 2026 04:46:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuq76ypjwiPaJO4Y8VhWJy6P9lceYSJblxYJEvU7RctuGjrhMp1z5PIJTROZtJnaK85GCmQA==
X-Received: by 2002:a05:622a:110c:b0:4f4:b372:db38 with SMTP id
 d75a77b69052e-4ffb49228d5mr22507821cf.5.1767789977325; 
 Wed, 07 Jan 2026 04:46:17 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a2bc7ffsm512039066b.26.2026.01.07.04.46.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jan 2026 04:46:16 -0800 (PST)
Message-ID: <6b874e4b-a906-4153-aba8-b0ab7a12d5c1@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 13:46:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: qcs8300: add Display Serial
 Interface device nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com
References: <20260104134442.732876-1-quic_amakhija@quicinc.com>
 <20260104134442.732876-5-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260104134442.732876-5-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LJhrgZW9 c=1 sm=1 tr=0 ts=695e559b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=iMXfbfRCx5d9ngtYL8YA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5NyBTYWx0ZWRfX2aNwWGtuzh/Z
 wLYNcUDWRQOfqJpEMuBEo9dFVid/u3K2/m3cFdeTskWw4NzwyGGrd+zGxyhw8tJNVABsOx7BCeu
 hQaLA4HrzC+PRL2Vdni3lg5GmBhwrV0mlohATjfrKTIe4ezNkYB7Ej4PHYVE1+6iYS0Fli+rLY3
 /wLtb/nYjZ5mjR2IrGQQn4xt4WPmtX0QzKDl+PrYQsp8Dp8bITj3im2DJOJUG3zOU26RY+nErIM
 +GcQkOenBkkri9UncrvNjaFmfwtuo4aWpi4bqIIClSlL7vXQ8CIu8up0IBL5xD4ojsjJKwWlxoc
 aYibqu/scEbUyjD7S1TZvbzPAQuZ3UtBtJsglrOdLRFi43LIyMPifTei5ebWTsiUl0Um225Cjus
 0JKdn/B82FzWZ5msyZyZtY/YvEw3xhEDf38cC0Pqdp4CQYdcauDCuvUxrAPqLSFVKl4oc6yb3jJ
 s1UfA4CTNZavwnXsqKw==
X-Proofpoint-GUID: 2pn76gUW4GR65ykbDyPZpy-UPiGdR-wr
X-Proofpoint-ORIG-GUID: 2pn76gUW4GR65ykbDyPZpy-UPiGdR-wr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070097
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

On 1/4/26 2:44 PM, Ayushi Makhija wrote:
> Add device tree nodes for the DSI0 controller with their corresponding
> PHY found on Qualcomm QCS8300 SoC.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 102 ++++++++++++++++++++++++++-
>  1 file changed, 101 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> index e44fd5c33816..052ccfa6a147 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
> +#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
>  #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,sa8775p-camcc.h>
> @@ -4858,9 +4859,18 @@ port@0 {
>  						reg = <0>;
>  
>  						dpu_intf0_out: endpoint {
> +
>  							remote-endpoint = <&mdss_dp0_in>;
>  						};
>  					};
> +
> +					port@1 {
> +						reg = <1>;
> +						dpu_intf1_out: endpoint {

A newline preceding a subnode definition would be neat (and matching
the existing context visible above..)

[...]

> +					port@0 {
> +						reg = <0>;
> +						mdss_dsi0_in: endpoint {
> +
> +							remote-endpoint = <&dpu_intf1_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						mdss_dsi0_out: endpoint {
> +						};
> +					};

Also in these 2 cases

In case you're going to send a v6, please take that into
consideration.

Konrad
