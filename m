Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA15CEB806
	for <lists+freedreno@lfdr.de>; Wed, 31 Dec 2025 09:03:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7F810E257;
	Wed, 31 Dec 2025 08:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="L+oINOzp";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DO9cCQxM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 008D610E02F
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 08:03:08 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BV78RI12733191
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 08:03:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fh/MItMWgc8x1Q5KpVTGvJw3PycObVXciZM+DpfaQgk=; b=L+oINOzpIRCZOcl+
 3bfFW00LCSTog+3N1QYsMa+uOF63Z7XrDx090enhKEIdaU8A8cQEvvl7b6hnc3Hz
 PRLs44IHRCv8Ty5HjsHbWh1BkuYZWaIbiaQJyPvY06irLVLDLzrdDR7X9/MjWCXf
 U0DFR6ZxQ/K/kjRGxbfS8CP9JyGQPoZdz9ALojYVtZaJ4FBpIBibkAX8zjuMTITn
 ce/IWvZ4aJD2OGWsMg1Aq5PMn6iadzPsNXs1GxfI8BeoA3exdSsligQA5Mo3BrW7
 mCkX3g/y4Hd+lyozgHBL2bauGCKuPzRXcUXOKE1gXo4lhSAgeyn82I+PYqdRLPtl
 GuHkzA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcy6ag392-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 08:03:07 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7c240728e2aso22324878b3a.3
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 00:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767168187; x=1767772987;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fh/MItMWgc8x1Q5KpVTGvJw3PycObVXciZM+DpfaQgk=;
 b=DO9cCQxMEKFEkMletiAE9IwpmVAP6ufXyu2kbklIsjycB5ixmz3Jq/ZS2HR99biMEG
 mjxNPKvFVBQ4JBvCjpWuWiQ+BWFJ1oRj8GLAiW7zQIcB6dCa41cPWClsRCVnEuiNbHOV
 MxkiG12x6OWx8ucp2buFOGTSiQpfBlllnU+aqDu1keeNzwvFmndAcPVeFq4jRYont46A
 r/GiE8ttzcDvoveLPQy50parTKDuUxf8VmLG6VUFVGSYXYMo7/JhXD3O/0W37ADsBw30
 WjUYsVjT3Akvrp4KyqferiV0ia0qiYmBmhZugFHIzphO3aPNn7ZR3jECPrbXzb0gBOLf
 BOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767168187; x=1767772987;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fh/MItMWgc8x1Q5KpVTGvJw3PycObVXciZM+DpfaQgk=;
 b=jCnMNSte6w8qRLOTghLmUFz30/CofcOW9r6LAQo2hNrTGt7eqRSCuXsdIyiNWPNPFh
 t7Z9pLKBRIJj1ueD3Ur+LgFPOUifegJ8Mm/AFSAnZERc0FJOPqr1qryKDXlqE2wYnM4i
 vn6BpmjOcC6vLUQsa/Oyz0WIfSvCZ+Ks4UfqCA/HECn1Z6bQqjDpsOmuKPT4ejusqo4+
 5IzMlX30iCqUz7NJI70nValNpMAxcjtlKBMrz3OYgyheG2V/g76phedoXNNsAzJAgfRt
 XqyFpG37LSyAotPhtkeqvF8+N8UIWwtke++xQD+9P674UikFqV+vku8DnapG6HK+awCX
 GVDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPTYKQ9n4IyAo3+gRaLK74ZTvIyR4eLd/7J/LscjdZtU/gqPbUcS1C4RgiTQwav4FNiKVXu58wlrE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzn0nUMWIt3UDdmXzZmitrJXLJclMh/WJWljT0E76vhbBnY3q/w
 +jbkXS2eRG84zonvGHYlVhYOGzLNCIVRnYVl2U2fKaPCR4lXpFHZy3dote0qfH2MbEvdxD4BYL/
 P6KhoUF1Nhv+HqR4xdRQhmSVsGx4390VF9sjHPtHBWKRE6Zv9rbTO8l9LMlkAdlELWO/ND9E=
X-Gm-Gg: AY/fxX4Lks0nkWjY+MJhg5dIDo86wYam7Hcb+Ax8ZVztSsi2zLlI6OZlRwJ+TCoLuPc
 uNDClqvDEIrjpxEq0vZh6X8kjp2NCpR1MlpqJTambOdMgbuvwx7xVnTGaU+f+feNoPV6XD3k2uH
 EWlWpOxTISa/Ygj9ENDSodAXdB7y7AUSth/X/iINp2ozGHPqLoG/rLOXBwPI7MINvr9dpzfYPTK
 fBij/d2N2UeB+yFAyl/FiIYMmm7ZrFa7dF+0WcaSM4J1aqASvQJhmZBaxT7HuIq7YLWb/kZzrpq
 XBtJEy/v9IrQGymFNAJ/JyTXnpsoD6X9Y1eQW5FcBmf3Hmqst09W2QckKWA415bgM+w2DVMF0E0
 KQjzz8pUqUmRscdOGn+680hGb5nZsCnJ9Jg==
X-Received: by 2002:a05:6a20:394a:b0:34f:c83b:b3ea with SMTP id
 adf61e73a8af0-376a88c8e9amr33020886637.18.1767168186755; 
 Wed, 31 Dec 2025 00:03:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRZbftv+BVOvEqHmgpz0Oia3X5rph07ga3tX7rOs+vckFH90okaAgJTuMUkWED5kuM0mO2gw==
X-Received: by 2002:a05:6a20:394a:b0:34f:c83b:b3ea with SMTP id
 adf61e73a8af0-376a88c8e9amr33020860637.18.1767168186234; 
 Wed, 31 Dec 2025 00:03:06 -0800 (PST)
Received: from [192.168.1.8] ([106.222.228.197])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1e79620bd3sm29395354a12.4.2025.12.31.00.02.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Dec 2025 00:03:05 -0800 (PST)
Message-ID: <976006d5-e674-4fe7-9578-a46f6c325585@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 13:32:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/8] arm64: dts: qcom: qcs615-ride: Enable Adreno 612
 GPU
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
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
 Jie Zhang <jie.zhang@oss.qualcomm.com>, Jie Zhang <quic_jiezh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
 <20251226-qcs615-spin-2-v5-8-354d86460ccb@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251226-qcs615-spin-2-v5-8-354d86460ccb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ivY5XiWs8zOUQbbuER6OhLQBtmr49Qjw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA2OCBTYWx0ZWRfXzEFvgGTwEooL
 e0ijKBQug7Hh/qGdUy7qKfI2pDqTvlwyR1VGk4GlyoOzTuVAsXNA5Pv/0vPNxbXw6g0dNjqpleN
 +97TPoM3TLwzA8q/PvHMa8ghOb2fUmHLD7RCA340YD7FiubBR6XDAuBp3PmEjXco3jlQVZnfVYU
 A2vYvw+i4YuMrxWImmjLLpeiP2GqCy36hnCa0TwNvyNM6G/Sx8X/81BVfUDf4SY6DKDb3H+qUP0
 hi8Gq15VwneSiCietMqY5bh7QP7nnEG+eGKobruszjTZdCD7B5JMyxdzYiTyLMRx+XG/aParw7M
 W0najavwMg5d403l7TMjZi794Bqv1IQTTbG/jF5Sw+jKit3fkUmjLfbMSz6e39BzT0hOPzR5n06
 4rE48Q4nOuZXYBbuwK1GJHSy+h+lp2ga3anFZufD8daEdW9iZag2oh2Q66l4pYEfo3v9rSDp+W/
 DAOBQKgP0xcAP6r3ikg==
X-Proofpoint-GUID: ivY5XiWs8zOUQbbuER6OhLQBtmr49Qjw
X-Authority-Analysis: v=2.4 cv=J9GnLQnS c=1 sm=1 tr=0 ts=6954d8bb cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=BOTrZCw/7mKnJJrTL4lQtw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=nYU5dbzxO8IYIpRpci8A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310068
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

On 12/26/2025 11:59 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Enable GPU for qcs615-ride platform and provide path for zap
> shader.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 8 ++++++++
>  arch/arm64/boot/dts/qcom/talos.dtsi      | 2 +-
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index be67eb173046f9e4ac58157f282c3af41e53d374..33e33aa54691d38f96e5c76596719691e2596eb5 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -358,6 +358,14 @@ vreg_l17a: ldo17 {
>  	};
>  };
>  
> +&gpu {
> +	status = "okay";
> +};
> +
> +&gpu_zap_shader {
> +	firmware-name = "qcom/qcs615/a612_zap.mbn";
> +};
> +
>  &i2c2 {
>  	clock-frequency = <400000>;
>  	status = "okay";
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index 7c2866122f9a13b8572fd9e6fa9d336176765000..606f5e234e4a02caaa03f1084336e137768dba1f 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -1902,7 +1902,7 @@ opp-435000000 {
>  
>  		gmu: gmu@506a000 {
>  			compatible = "qcom,adreno-rgmu-612.0", "qcom,adreno-rgmu";
> -			reg = <0x0 0x0506a000 0x0 0x34000>;
> +			reg = <0x0 0x0506d000 0x0 0x2c000>;
>  
>  			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
>  				 <&gpucc GPU_CC_CXO_CLK>,
> 

A case of fixup gone bad. This chunk should be in patch#6.

-Akhil.
