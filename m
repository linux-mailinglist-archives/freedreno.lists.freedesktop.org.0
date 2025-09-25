Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A540BBA1BAB
	for <lists+freedreno@lfdr.de>; Fri, 26 Sep 2025 00:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40F110E9BE;
	Thu, 25 Sep 2025 22:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kTArokZv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E57EC10E9BE
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 22:03:34 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIRF0w028176
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 22:03:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=kyKnwB1YFtbc3XyrNI6dEPy9
 Kx88yZomZncunczbfcQ=; b=kTArokZvPkyNBnSUBZNdORv/icUPiZZuXGXxnf+H
 +cf1y/O+bEQ7MfJL+EM7bI2KVC5tvKFLp98NMuW+ovWiwyf2vXV4cwHXyttrnnPA
 +zdRhNAlqrhb+uHCZpq6LJ7T23x0Gz0zj/3RONJP9LgRKR5CfSomzpohHjNB28Yy
 t91xz5SaYpIroEFvLcEkjU3JZzyazldEmmSMLItLhdNLELuicQKvNWhPwZP8BQqG
 bjdvoSBpt6CinR9ieuemi3IryPHLaheSfG2bB0Npwifm2ylGJgisTvN6NSQ+kwKj
 WUg+4kJcbgZFq8d6BGfJoSfAgwbEbB/UzmHwuNW5Ay4k6Q==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u0hfn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 22:03:34 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id
 46e09a7af769-7917aa53ffaso1511399a34.2
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 15:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758837813; x=1759442613;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kyKnwB1YFtbc3XyrNI6dEPy9Kx88yZomZncunczbfcQ=;
 b=NJ/UniWQoelt93pHBbBa/PdBxr9+KpHQC0zo4fpwP+Kgyn+WnmKnWA6BKtOcOSXICW
 NPwhGBieeHM3XzZqnYXRin0KWBcLBdD0P6z84bEf2FXB/Z0HEXV1IDwYwLKSPaCsofdy
 mqyXc4pS8uXRVFEkWrTSujhyyU5aMrScGsfoeRW8J52VgCAvpDgeNXbO0Ys84Gri+iTZ
 pm2rSSeO3hbSapF7yyGWoedteqkmOTyaF3EKvkUsvMP+5ZqbojpiT291PAkP1wSUk7/r
 QLXjZJgY/3Su0N2fuz0LRz6jmNtzgPqbTMd15pl2VeSkD/v1uDUYml1Ah0xnKyYMEVfq
 VtfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXykfE7R8PvCGv7F7R++7MDyqxeckcRcMHtPI+/j4RAvbbU1DAF6BB1gThsanG8gfQZai+NB3Zgt7Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpXrAIWJS1D65MZRPwYX94lEAH4k5SIVW+KHlLMPnQ049v+dfg
 U7nTJ27RtEyVgPQn2qMSoycibI6kiqZyoLlJHotI3LNDGjYzEZbE19S0+DryAQDThyCiTswvWnp
 zkoKBeVC131RV+71lKFV9OaEChTRpNPvHk7ncwbVTZltLRSalYGYoFdB+TJEDDMeCHngQmw8=
X-Gm-Gg: ASbGncu3XFetL8SabLXwODoyAtEonUftMv/XCXDyNmtLcqR3X5c7Hg0Z6jU8S+6X+4Z
 KXZO9q35ydd6lj+CX3dQYe6bOS4Nqj2fPfVnEmgEiCBUjsuqem701tjOmdBrnorfq/R3zm+OS62
 HKuA7o3uzkAEmeN+ZaP4e1QQn/4Hzat5SJnsLUrgjQZ1HwvE4Zj/tVI+NkT8L5SToI2HUiGFELR
 16ZwWbMPyvkOtRjfrOho58v3ID6moKek8Ox/D+m4TAh/PfXZFat4/fAABQEMbMiWPDIi04Tu0FV
 2co8huZ+RNG7T61cq8Pi18Nl8Eeg8ZCUwWzzWMVL5VhMdAKM3auqZEVrFZKk/ou/WOasrS/9Dam
 HiNOz7amv7eJIlFfT1qnkgUlld0L9IaEad6PA9vjGrUwSM+5aLQxy
X-Received: by 2002:a05:6830:82d8:b0:745:5123:c53c with SMTP id
 46e09a7af769-7a06016b533mr2209252a34.32.1758837813277; 
 Thu, 25 Sep 2025 15:03:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMVYQTpwJaNnmccgTZ5npi/eB9adT6V58QHAXjqd3PsqhBbecByebxJS7dc9agoabjKnHZVg==
X-Received: by 2002:a05:6830:82d8:b0:745:5123:c53c with SMTP id
 46e09a7af769-7a06016b533mr2209227a34.32.1758837812878; 
 Thu, 25 Sep 2025 15:03:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58313430be5sm1171344e87.28.2025.09.25.15.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 15:03:31 -0700 (PDT)
Date: Fri, 26 Sep 2025 01:03:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com, quic_jesszhan@quicinc.com
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcs8300-ride: add anx7625 DSI to
 DP bridge node
Message-ID: <oim2rkt3xczehmgg3sszmgobrqs3ov4rxockseqgddzlts6paz@ztyakecujcsr>
References: <20250925053602.4105329-1-quic_amakhija@quicinc.com>
 <20250925053602.4105329-4-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925053602.4105329-4-quic_amakhija@quicinc.com>
X-Proofpoint-ORIG-GUID: QC8PoQQIaFjE9AkOkAnjexJZWn-OZEMF
X-Proofpoint-GUID: QC8PoQQIaFjE9AkOkAnjexJZWn-OZEMF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX+QW9FLQC9RXg
 olHcuYIr909SMwMN8XNcHBfhmIVMmd4vUsPufHJbRCA1BJ4605uaSgEM3KbjxgLNxZNqS9BYUah
 JOp3AvkJKZFenVLA19fevOai9Ld2cne2U0TP8Zt3rXHseioapffF/mbe4nANEjeKMLkVgYsCZuA
 oY/GQepL7Ac5uRQPDxkuFF1Yc5RYDMDYXh13swUZBd5uH0vB3DH76mNWrkqBXUzU4LPiYVns6AT
 VXA1cdkFQZ61CNIqQkwcKk4smnCodaWlMv8VkYYj5FJXY0elMB6MhLD0TaYzKR7iN//wuXm6NQ1
 kk3FmkLvZjLJTbrU2rw/uK99iyS8+zZbkEs6ZP9EA38tMHfR2X3a/lYO6sTR1ka5sne8ANsd4JE
 xXBtjI7xVGILoXEKPygvmf6S0qMikA==
X-Authority-Analysis: v=2.4 cv=ZsHg6t7G c=1 sm=1 tr=0 ts=68d5bc36 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=En4R4P6zDXfLUnqyaIQA:9
 a=CjuIK1q_8ugA:10 a=Z1Yy7GAxqfX1iEi80vsk:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

On Thu, Sep 25, 2025 at 11:06:02AM +0530, Ayushi Makhija wrote:
> Add anx7625 DSI to DP bridge device node.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 170 ++++++++++++++++++++++
>  1 file changed, 170 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
