Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC9CCEC5B8
	for <lists+freedreno@lfdr.de>; Wed, 31 Dec 2025 18:19:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E1710E058;
	Wed, 31 Dec 2025 17:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MJMm3lvy";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SJqALZW9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1447210E12D
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 17:19:48 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BVGFJ5M3496559
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 17:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FsVwhGeSNZjfI/xypJprbyAZCILTaLME2r61MFMi/rc=; b=MJMm3lvy/Y3eQX81
 p8lLCK0eriJYaeMJ6JuMn/cjt07FjYOWk7wUlpbgdrZVZ/0dNvoxqBbBTuN7l5hW
 mtemvEHuwI/+iEq5whqBp4cOPxh735vyuvtI1YeOeccb5T3jDEM+cKxawQwcXSWj
 vs78HRATyEEzqVdgUZsBHNLOcPT1H2y1o/1/28mnPRBBJQ+lzBEiB35DfUex70qb
 SI38zYCmFz0wOU8y0EmUaNfE9KCmrsMChAM5QR4p3p1tqBRwphStt29mkAXtwI2O
 2Ol1TxcPwliGULd+EaWKVo3XSrQT/5JgYXydZAFfYBaasDNKq9CbkMuw2OGlJa97
 q6cKQg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd76n839s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 17:19:47 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-5dfaa434109so19055865137.0
 for <freedreno@lists.freedesktop.org>; Wed, 31 Dec 2025 09:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767201586; x=1767806386;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FsVwhGeSNZjfI/xypJprbyAZCILTaLME2r61MFMi/rc=;
 b=SJqALZW9USW0l2sR4/EBPaXj8EdGmA+N4D3Tbgq+uYvl6TitxAX32rIhYEhgTTF3uY
 IX3POqzGxRKV4pdO7NmOmOhSQ4k3z9VRfrCL3z2uyaNNpudEFiFRhsiGu19hO7PyHDx2
 uXYE6MLIkGVvTyNwbLLyyAmsb3BZxrfgXrNpL4dgibWpuM3uPPPGkgHlOISFIK0E8Ye4
 SCckBg7Bnmubw6ehOvHYF7XrLTpT9AckICRmqmB4IrvlFfhxDbQq/n83OEIMmMbl+Qu1
 v2idOY3166pKaHY3g5KU2EExZvecIVCJIVKARFn7gGwvETeagn9mmAFEESJNphCNCpZD
 6ocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767201586; x=1767806386;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FsVwhGeSNZjfI/xypJprbyAZCILTaLME2r61MFMi/rc=;
 b=ucI0IbfA7eu8BySfKaV/pFdA/2mVyzOWCnUN245o+lG23o+wTJ38MEo4X2AwdsBb25
 GN89H4/dOLOJEj37DIglrAS2Z/lsYmAKy90G/z5xr2tWkxIZTwAPEvHs8ul/ue22lYXF
 I5Fkazamphcb8jNnpQdlMSOMAeJDgmK338JHkZWEJsUo3heXoh8d7+A6xdtA40SAxGhn
 GKn6kkhew8BIgltwz2VhWwen3+2i6VsxHF0hDp7dI9Ecc2OFcD17EklMUNktjG97ItcO
 QZhfnSUxkXSb0DMPWafYoiqWEqOPLOwlyqzXVTY+2pVDAtAeLJb4uSItJVNRYV+a1TXu
 M2cQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvWza0Ej5hqX4ZimhVcT+k+ZOXxlICLOsIWQWgvlQgQ8GpuKtDzUd/U4KFd0N9RVQFoaf8DqrxVCs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySdO9vu6ctL4uFCE+TogB0Xp+eN+1Li2ZPFrhcWfAI9uLDsSwp
 g6kLSDHO0Bsi7cO9Wpp0yeh1MolpcQpWTZh1G6n5eHRD3KrIu0RtXmopWC+wTAhTd5U/4dOAexT
 8HnNbg8HqnuRJaWH33L7Luc8GBQ1sK/3DVF9/w4JMqa+Qag1T2hMAJC1nMf+sjjEfnDYB088=
X-Gm-Gg: AY/fxX4X6qz4Sr3pGBylEqZDc5k1lfDBD0qsYLmMkpGmCPfi9lSlKoPApjAAXxnVbx0
 4nKcO6EaooS0lI4mVG5NtJ3aPkzCqYHcPFOiIXetXCzjmJ6Rkv9ENw2v8/8/Sbv/sqn2YMDc82e
 Cur6f4cEaUpcFJi9uk55pVrFej+oxhchlszmSkpG9X00iIt/CXRj7NHA4ouqK1aHTlFahpvYeFd
 jQqKGKMnFBVV3R2P7ucUOgGLl9TkWHviDtVpiiNX0x7xtGYAqjSoeiEaA36J+uRjxxDey0dzt4r
 cbvTXbC4rIjMx7FxZEvZ+b1JUkbJgZM9oiBn95FDqX99USq46xCULQvMM/5MnMbtZc9yv2CQF3X
 3DtuM6xxoeFlyczi2Nu3qezBfpvWgbWbsqWTGf0djA1dO2HMmYGxyLhtQmmZwuz6WCKWJfNXOFC
 D+JlVgCoSrcdRw8xMwdDTYJOM=
X-Received: by 2002:a05:6102:6441:b0:5dd:37a3:c389 with SMTP id
 ada2fe7eead31-5eb0237d5c0mr15223337137.2.1767201586378; 
 Wed, 31 Dec 2025 09:19:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGx3T6dkQkJD7EfRSRFNeeLsOEG0OrMkSaoi/pwalLJ0EQtX2UMRuBKbYrQVKniuFZcoxPG6A==
X-Received: by 2002:a05:6102:6441:b0:5dd:37a3:c389 with SMTP id
 ada2fe7eead31-5eb0237d5c0mr15223311137.2.1767201585958; 
 Wed, 31 Dec 2025 09:19:45 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812267b184sm98222551fa.43.2025.12.31.09.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 09:19:45 -0800 (PST)
Date: Wed, 31 Dec 2025 19:19:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
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
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 7/8] arm64: dts: qcom: talos: Add GPU cooling
Message-ID: <gwrg55ytewfhlz7w23yl5ac2sjic5uise3cv7jnmuahnolompj@jl7ufr76wokb>
References: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
 <20251231-qcs615-spin-2-v6-7-da87debf6883@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251231-qcs615-spin-2-v6-7-da87debf6883@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDE1MSBTYWx0ZWRfXwUKQR5bqACwo
 OniQc6UHTlGC5BNiLGoCY4e30i0RC4XsUmqXXMSHvCcquhg0aNFL+rwuMXBbx80OlZ/jhnJELhP
 BlWelOwfc3hD5vGIqsBcfQ7E5KEs69NWOweRfdabYb1DTRHXUx58vVFTZziBuejK9wJJnyTCY5v
 Bdr9MYBL7WVUynidwjYy+PFvi20hkEJfO2UsHxk5K3E6JHFVFhhdlbWWKJu7m7W/SheaJBmaboD
 GA4v7snwNMquLuYPLOo3R1h6QC+9uA69Qe3uSTmX0Av1IDJL3Cz/dC2uSSChCmEQNri51oMzmLX
 2Dk5M5Od8I0NBJzq8vod6GYTpXAwn0w90NzJLMaf7iOIuegFE5Jxz5vZMwsNUhs8wPWHZuU4FHZ
 u4ih6TqkITAnkFh9tL0yDF+QsyBuzx5hfGBqxwFD45+SdMsdF3niSTgIjdXB2GX3D1k9lfqzSae
 au8EnhhiCw+xnvFEq6A==
X-Proofpoint-ORIG-GUID: ZwgAN_N4XFLJeeTsS6FJR4OpyyUcEV49
X-Authority-Analysis: v=2.4 cv=TdmbdBQh c=1 sm=1 tr=0 ts=69555b33 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=UQAiW8fk4jwks4S4FoYA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: ZwgAN_N4XFLJeeTsS6FJR4OpyyUcEV49
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_05,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512310151
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

On Wed, Dec 31, 2025 at 02:15:28PM +0530, Akhil P Oommen wrote:
> From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when it
> reaches high temperatures.
> 
> Set up GPU cooling by throttling the GPU speed when it reaches 105°C.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
